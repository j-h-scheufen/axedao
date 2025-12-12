import type { AuthOptions, RequestInternal } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import GoogleProvider from 'next-auth/providers/google';
import { cookies } from 'next/headers';
import { SiweMessage } from 'siwe';
import { v4 as uuidv4 } from 'uuid';
import { sql, eq, and } from 'drizzle-orm';

import { PATHS, AUTH_ERRORS, AUTH_COOKIES, accountStatuses } from '@/config/constants';
import ENV from '@/config/environment';
import { db, fetchSessionData, insertUser, findValidInvitation, markInvitationAccepted } from '@/db';
import { users, oauthAccounts } from '@/db/schema';
import { verifyPassword } from '@/utils/auth/password';
import { getEmailProvider } from '@/utils/email';
import type { UserSession } from '@/types/model';

const nextAuthUrl = process.env.NEXTAUTH_URL || (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : null);

const providers = [
  // Method 1: Human Wallet (SIWE)
  CredentialsProvider({
    id: 'ethereum',
    name: 'Ethereum',
    credentials: {
      message: {
        label: 'Message',
        type: 'text',
        placeholder: '0x0',
      },
      signature: {
        label: 'Signature',
        type: 'text',
        placeholder: '0x0',
      },
      email: {
        label: 'Email',
        type: 'text',
        placeholder: 'email@example.com',
      },
      // TODO: TEMPORARY INVITE-ONLY - Track if email came from SDK (trusted) or manual entry
      emailFromSdk: {
        label: 'Email From SDK',
        type: 'text',
      },
    },

    // Note: 'req' is not used atm, but the nonce should come from its headers. See problem and workaround below
    async authorize(credentials, _req: RequestInternal['headers']) {
      if (!credentials) {
        return null;
      }
      try {
        const siwe = new SiweMessage(JSON.parse(credentials?.message || '{}'));

        if (!nextAuthUrl) {
          return null;
        }

        const nextAuthHost = new URL(nextAuthUrl).host;
        // nonce: await getCsrfToken({ req: { headers: req as NextRequest & NextApiRequest } }),
        // NOTE: This is a workaround to get the nonce directly from the cookie instead of the header
        // See: https://stackoverflow.com/questions/77074980/next-js-13-nextauth-sign-in-with-ethereum-csrf-token-mismatch-between-clien
        const nonce = (await cookies()).get('next-auth.csrf-token')?.value.split('|')[0];
        const verificationParams = { signature: credentials?.signature || '', domain: nextAuthHost, nonce };
        const result = await siwe.verify(verificationParams);

        if (result.success) {
          // Check if user exists by wallet address
          let user = await fetchSessionData(siwe.address);

          // If wallet is already linked to a user, verify email matches (if provided)
          // This prevents identity confusion when switching wallet providers
          if (user && credentials.email) {
            const existingUser = await db.query.users.findFirst({
              where: eq(users.id, user.id),
            });

            // Only allow login if emails match (case-insensitive)
            if (existingUser?.email && existingUser.email.toLowerCase() !== credentials.email.toLowerCase()) {
              console.warn(
                `Wallet ${siwe.address} is linked to ${existingUser.email} but login attempted with ${credentials.email}`
              );
              throw new Error(AUTH_ERRORS.REGISTRATION_FAILED);
            }
          }

          if (!user && credentials.email) {
            // Wallet not registered - check if email exists (for wallet linking to existing account)
            const existingUser = await db.query.users.findFirst({
              where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`,
            });

            if (existingUser) {
              // Link wallet to existing email account
              // NOTE: we completely trust the Wallet email provided and don't re-verify email ownership.
              // This means that instead of first linking the wallet via Settings before allowing to use it
              // for sign-in, we let the user sign-in and auto-link.
              // This handles cases where:
              // 1. User signed up with email/pwd but never verified → wallet login activates account
              // 2. User has active email/pwd account → adds wallet as additional auth method
              const wasInactive = existingUser.accountStatus === accountStatuses[0]; // pending_verification

              await db
                .update(users)
                .set({
                  walletAddress: siwe.address,
                  accountStatus: accountStatuses[1], // 'active' - Activate if pending
                  emailVerifiedAt: new Date(), // Mark email verified (Human Wallet verified it)
                })
                .where(eq(users.id, existingUser.id));

              // Send welcome email if account was just activated
              if (wasInactive) {
                try {
                  const emailProvider = getEmailProvider();
                  await emailProvider.sendWelcomeEmail(credentials.email);
                } catch (emailError) {
                  console.error('Failed to send welcome email:', emailError);
                }
              }

              user = {
                id: existingUser.id,
                walletAddress: siwe.address,
                isGlobalAdmin: existingUser.isGlobalAdmin || false,
              } as UserSession;
            }
            // If no existing user by email either, return null - client should use /api/auth/siwe-signup
          }

          // Return user if found (login success), or null if new user needs to signup via API
          return user || null;
        }

        return null;
      } catch (e) {
        console.error('SIWE auth error:', e);
        return null;
      }
    },
  }),

  // Method 2: Email/Password
  CredentialsProvider({
    id: 'email-password',
    name: 'Email',
    credentials: {
      email: {
        label: 'Email',
        type: 'text',
      },
      password: {
        label: 'Password',
        type: 'password',
      },
    },
    async authorize(credentials) {
      if (!credentials?.email || !credentials?.password) {
        return null;
      }

      try {
        // Find user by email (case-insensitive)
        const user = await db.query.users.findFirst({
          where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`,
        });

        if (!user || !user.passwordHash) {
          return null;
        }

        // Verify password
        const isValid = await verifyPassword(credentials.password, user.passwordHash);
        if (!isValid) {
          return null;
        }

        // Check if email verified
        if (user.accountStatus === accountStatuses[0]) {
          // 'pending_verification'
          throw new Error('EMAIL_NOT_VERIFIED');
        }

        return {
          id: user.id,
          walletAddress: user.walletAddress,
          isGlobalAdmin: user.isGlobalAdmin,
        } as UserSession;
      } catch (e) {
        console.error('Email/password auth error:', e);
        throw e;
      }
    },
  }),

  // Method 3: Google OAuth
  GoogleProvider({
    clientId: ENV.googleClientId,
    clientSecret: ENV.googleClientSecret,
  }),
];

export const nextAuthOptions: AuthOptions = {
  providers,
  pages: { signIn: PATHS.login },
  session: {
    strategy: 'jwt',
    maxAge: 5 * 24 * 60 * 60, // 5 days
  },
  secret: ENV.nextAuthSecret,
  callbacks: {
    async signIn({ user, account, profile }) {
      // Handle Google OAuth account linking
      if (account?.provider === 'google') {
        const email = profile?.email?.toLowerCase();
        if (!email) return false;

        try {
          // CRITICAL: Check if this is intentional linking from Settings FIRST
          // This must be done before any other logic to prevent account switching
          const cookieStore = await cookies();
          const isLinking = cookieStore.get(AUTH_COOKIES.GOOGLE_LINKING)?.value === 'true';
          const linkingUserId = cookieStore.get(AUTH_COOKIES.GOOGLE_LINKING_USER)?.value;

          // Check if oauth account already exists
          const existingOAuth = await db.query.oauthAccounts.findFirst({
            where: and(
              eq(oauthAccounts.provider, 'google'),
              eq(oauthAccounts.providerUserId, account.providerAccountId)
            ),
          });

          if (existingOAuth) {
            // If we're in linking mode and this OAuth belongs to another user, BLOCK IT
            if (isLinking && existingOAuth.userId !== linkingUserId) {
              cookieStore.delete(AUTH_COOKIES.GOOGLE_LINKING);
              cookieStore.delete(AUTH_COOKIES.GOOGLE_LINKING_USER);
              return `/settings?error=${encodeURIComponent('This Google account is already linked to another user.')}`;
            }

            // OAuth account already linked, fetch user for session (for regular login)
            const existingUser = await db.query.users.findFirst({
              where: eq(users.id, existingOAuth.userId),
            });

            if (existingUser) {
              user.id = existingUser.id;
              return true;
            }
          }

          if (isLinking) {
            cookieStore.delete(AUTH_COOKIES.GOOGLE_LINKING);
            cookieStore.delete(AUTH_COOKIES.GOOGLE_LINKING_USER);

            // When linking from Settings, ONLY link to the currently logged-in user
            if (linkingUserId) {
              const currentUser = await db.query.users.findFirst({
                where: eq(users.id, linkingUserId),
              });

              if (currentUser) {
                // Check if Google email is already used by another user as their primary email
                // NOTE: Currently users.email always matches the OAuth provider email for OAuth sign-ups,
                // since manual email changes are not supported. If we add manual email change functionality
                // in the future, we'll need to either unlink OAuth accounts or block email changes that
                // conflict with existing OAuth provider emails.
                const emailOwner = await db.query.users.findFirst({
                  where: sql`LOWER(${users.email}) = LOWER(${email})`,
                });

                if (emailOwner && emailOwner.id !== currentUser.id) {
                  // Google email belongs to different user - cannot link
                  return `/settings?error=${encodeURIComponent(
                    'This Google account email is already registered to another user. Please use a different Google account.'
                  )}`;
                }

                // Check if this Google OAuth is already linked to another user
                const existingOAuthLink = await db.query.oauthAccounts.findFirst({
                  where: and(
                    eq(oauthAccounts.provider, 'google'),
                    eq(oauthAccounts.providerUserId, account.providerAccountId)
                  ),
                });

                if (existingOAuthLink && existingOAuthLink.userId !== currentUser.id) {
                  // This Google account is already linked to a different user
                  return `/settings?error=${encodeURIComponent(
                    'This Google account is already linked to another user.'
                  )}`;
                }

                // Check for email mismatch between current user's email and Google email
                const emailMismatch = currentUser.email && currentUser.email.toLowerCase() !== email.toLowerCase();

                if (emailMismatch) {
                  // Store OAuth data in secure cookie for user confirmation
                  // This avoids exposing sensitive data in URL params and prevents double OAuth flow
                  cookieStore.set(
                    AUTH_COOKIES.PENDING_OAUTH_LINK,
                    JSON.stringify({
                      provider: 'google',
                      providerUserId: account.providerAccountId,
                      email: email,
                      providerEmail: profile?.email || email,
                      currentEmail: currentUser.email,
                    }),
                    {
                      httpOnly: true,
                      secure: process.env.NODE_ENV === 'production',
                      sameSite: 'lax',
                      maxAge: 300, // 5 minutes
                    }
                  );

                  // Redirect to settings to show confirmation modal
                  return '/settings?confirm_email_update=true';
                }

                // No email mismatch - link directly
                await db.insert(oauthAccounts).values({
                  userId: currentUser.id,
                  provider: 'google',
                  providerUserId: account.providerAccountId,
                  providerEmail: email,
                });

                user.id = currentUser.id;
                return true;
              }
            }

            // If we're in linking mode but didn't find a user to link to, block the flow
            // This prevents falling through to the auto-link logic below
            return `/settings?error=${encodeURIComponent('Unable to link Google account. Please try again.')}`;
          }

          // CRITICAL: If we reach here and isLinking is true, something went wrong
          // Block any auto-linking when in linking mode to prevent account switching
          if (isLinking) {
            return `/settings?error=${encodeURIComponent('Unable to link Google account. Please try again.')}`;
          }

          // Check if user exists by email (for login/signup flows, not linking)
          const existingUser = await db.query.users.findFirst({
            where: sql`LOWER(${users.email}) = LOWER(${email})`,
          });

          if (existingUser) {
            // User exists with this email but no Google OAuth linked
            // Auto-link Google OAuth to existing account and activate it
            // This handles cases where:
            // 1. User signed up with email/pwd but never verified → Google OAuth activates account
            // 2. User has active email/pwd account → adds Google OAuth as additional auth method

            const wasInactive = existingUser.accountStatus === accountStatuses[0]; // pending_verification

            // Update user: activate account and mark email as verified
            await db
              .update(users)
              .set({
                accountStatus: accountStatuses[1], // 'active' - Activate if pending
                emailVerifiedAt: new Date(), // Mark email verified (Google verified it)
              })
              .where(eq(users.id, existingUser.id));

            // Link OAuth account to existing user
            await db.insert(oauthAccounts).values({
              userId: existingUser.id,
              provider: 'google',
              providerUserId: account.providerAccountId,
              providerEmail: email,
            });

            // Send welcome email if account was just activated
            if (wasInactive) {
              try {
                const emailProvider = getEmailProvider();
                await emailProvider.sendWelcomeEmail(email);
              } catch (emailError) {
                console.error('Failed to send welcome email:', emailError);
              }
            }

            user.id = existingUser.id;
            return true;
          }

          // No existing user - create new account
          // TODO: TEMPORARY INVITE-ONLY - Require invitation for new users
          const invitationCode = cookieStore.get(AUTH_COOKIES.INVITATION_CODE)?.value;

          if (!invitationCode) {
            // No invitation code - redirect to signup with error
            return `/auth/signup?error=${encodeURIComponent('Invitation required to create an account')}`;
          }

          // Validate invitation
          const invitation = await findValidInvitation(invitationCode, email);

          if (!invitation) {
            return `/auth/signup?error=${encodeURIComponent('Invalid or expired invitation')}`;
          }

          // For email-bound invitations, verify email matches
          if (invitation.type === 'email_bound' && invitation.invitedEmail !== email) {
            return `/auth/signup?error=${encodeURIComponent(`This invitation was sent to ${invitation.invitedEmail}. Please use that email address.`)}`;
          }

          const newUser = await insertUser({
            id: uuidv4(),
            email,
            accountStatus: accountStatuses[1], // 'active'
            emailVerifiedAt: new Date(), // Google pre-verifies emails
            invitedBy: invitation.createdBy,
          });

          // Mark email-bound invitation as accepted
          if (invitation.type === 'email_bound') {
            await markInvitationAccepted(invitationCode, newUser.id);
          }

          // Clear invitation cookie after successful signup
          cookieStore.delete(AUTH_COOKIES.INVITATION_CODE);

          // Link OAuth account to new user
          await db.insert(oauthAccounts).values({
            userId: newUser.id,
            provider: 'google',
            providerUserId: account.providerAccountId,
            providerEmail: email,
          });

          // Send welcome email for new user
          try {
            const emailProvider = getEmailProvider();
            await emailProvider.sendWelcomeEmail(email);
          } catch (emailError) {
            console.error('Failed to send welcome email:', emailError);
          }

          // Update user object for session
          user.id = newUser.id;
          return true;
        } catch (error) {
          console.error('Google OAuth signIn error:', error);
          return false;
        }
      }

      return true;
    },
    async jwt({ token, user, account }) {
      // Initial sign in persists the UserSession in the token
      if (user) {
        // For Google OAuth, fetch full user session data
        if (account?.provider === 'google') {
          const dbUser = await db.query.users.findFirst({
            where: eq(users.id, user.id),
            columns: { id: true, walletAddress: true, isGlobalAdmin: true },
          });
          if (dbUser) {
            return {
              ...token,
              user: {
                id: dbUser.id,
                walletAddress: dbUser.walletAddress,
                isGlobalAdmin: dbUser.isGlobalAdmin,
              } as UserSession,
            };
          }
        }
        return { ...token, user };
      }
      return token;
    },
    async session({ session, token }) {
      // Forward properties to the client
      if (token.user) {
        session.user = { ...session.user, ...token.user };
      }
      return session;
    },
  },
};
