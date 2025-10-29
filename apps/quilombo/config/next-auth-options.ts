import type { AuthOptions, RequestInternal } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import GoogleProvider from 'next-auth/providers/google';
import { cookies } from 'next/headers';
import { SiweMessage } from 'siwe';
import { v4 as uuidv4 } from 'uuid';
import { sql, eq, and } from 'drizzle-orm';

import { PATHS, AUTH_ERRORS, accountStatuses } from '@/config/constants';
import ENV from '@/config/environment';
import { db, fetchSessionData, insertUser } from '@/db';
import { users, oauthAccounts } from '@/db/schema';
import { verifyPassword } from '@/utils/auth/password';
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
          let user = await fetchSessionData(siwe.address);

          if (!user) {
            // First-time wallet user - require email
            if (!credentials.email) {
              throw new Error(AUTH_ERRORS.EMAIL_REQUIRED);
            }

            // Check if user with this email already exists (case-insensitive)
            const existingUser = await db.query.users.findFirst({
              where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`,
            });

            if (existingUser) {
              // Link wallet to existing email account
              // This handles cases where:
              // 1. User signed up with email/pwd but never verified → wallet login activates account
              // 2. User has active email/pwd account → adds wallet as additional auth method
              await db
                .update(users)
                .set({
                  walletAddress: siwe.address,
                  accountStatus: accountStatuses[1], // 'active' - Activate if pending
                  emailVerifiedAt: new Date(), // Mark email verified (Human Wallet verified it)
                })
                .where(eq(users.id, existingUser.id));

              user = {
                id: existingUser.id,
                walletAddress: siwe.address,
                isGlobalAdmin: existingUser.isGlobalAdmin || false,
              } as UserSession;
            } else {
              // Create new user with wallet + email
              const { id, walletAddress, isGlobalAdmin } = await insertUser({
                id: uuidv4(),
                walletAddress: siwe.address,
                email: credentials.email.toLowerCase(),
                accountStatus: accountStatuses[1], // 'active'
                emailVerifiedAt: new Date(), // Wallet signature proves ownership
              });
              user = { id, walletAddress, isGlobalAdmin: isGlobalAdmin || false } as UserSession;
            }
          }
          return user;
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
    clientId: process.env.GOOGLE_CLIENT_ID!,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
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
          // Check if oauth account already exists
          const existingOAuth = await db.query.oauthAccounts.findFirst({
            where: and(
              eq(oauthAccounts.provider, 'google'),
              eq(oauthAccounts.providerUserId, account.providerAccountId)
            ),
          });

          if (existingOAuth) {
            // OAuth account already linked, fetch user for session
            const existingUser = await db.query.users.findFirst({
              where: eq(users.id, existingOAuth.userId),
            });

            if (existingUser) {
              user.id = existingUser.id;
              return true;
            }
          }

          // Check if user exists by email
          const existingUser = await db.query.users.findFirst({
            where: sql`LOWER(${users.email}) = LOWER(${email})`,
          });

          if (existingUser) {
            // User exists with this email but no Google OAuth linked
            // Check if this is intentional linking from Settings
            const cookieStore = await cookies();
            const isLinking = cookieStore.get('quilombo_google_linking')?.value === 'true';

            if (!isLinking) {
              // This is sign-up attempt with existing email - prevent auto-linking
              // Generic error to prevent user enumeration
              throw new Error(AUTH_ERRORS.ACCOUNT_EXISTS);
            }

            // This is intentional linking from Settings - allow it
            // Clear the linking cookie
            cookieStore.delete('quilombo_google_linking');

            // Link OAuth account to existing user
            await db.insert(oauthAccounts).values({
              userId: existingUser.id,
              provider: 'google',
              providerUserId: account.providerAccountId,
              providerEmail: email,
            });

            user.id = existingUser.id;
            return true;
          }

          // No existing user - create new account
          const newUser = await insertUser({
            id: uuidv4(),
            email,
            accountStatus: accountStatuses[1], // 'active'
            emailVerifiedAt: new Date(), // Google pre-verifies emails
          });

          // Link OAuth account to new user
          await db.insert(oauthAccounts).values({
            userId: newUser.id,
            provider: 'google',
            providerUserId: account.providerAccountId,
            providerEmail: email,
          });

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
