import { NextResponse } from 'next/server';
import { cookies } from 'next/headers';
import { SiweMessage } from 'siwe';
import { v4 as uuidv4 } from 'uuid';

import { AUTH_COOKIES, AUTH_ERRORS, accountStatuses } from '@/config/constants';
import { db, insertUser, findValidInvitation, markInvitationAccepted } from '@/db';
import { verificationTokens } from '@/db/schema';
import { generateToken, hashToken } from '@/utils/auth/tokens';
import { getEmailProvider } from '@/utils/email';

const nextAuthUrl = process.env.NEXTAUTH_URL || (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : null);

/**
 * @openapi
 * /api/auth/siwe-signup:
 *   post:
 *     summary: Register a new user with SIWE (Sign-In with Ethereum)
 *     description: |
 *       Creates a new user account using a signed SIWE message.
 *       Requires a valid invitation code (invite-only mode).
 *       If email is not from SDK (trusted), sends verification email.
 *     tags:
 *       - Authentication
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - message
 *               - signature
 *               - email
 *             properties:
 *               message:
 *                 type: string
 *                 description: JSON-stringified SIWE message
 *               signature:
 *                 type: string
 *                 description: Wallet signature of the SIWE message
 *               email:
 *                 type: string
 *                 format: email
 *               emailFromSdk:
 *                 type: boolean
 *                 description: Whether email was fetched from Human Wallet SDK (trusted)
 *               invitationCode:
 *                 type: string
 *                 format: uuid
 *                 description: Invitation code (can also be passed via cookie)
 *     responses:
 *       201:
 *         description: Account created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 success:
 *                   type: boolean
 *                 requiresVerification:
 *                   type: boolean
 *                   description: True if user needs to verify email before logging in
 *                 email:
 *                   type: string
 *                   description: Email address (for redirect to verification page)
 *       400:
 *         description: Validation error or invalid invitation
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                 code:
 *                   type: string
 *                   description: Error code for client handling
 *       401:
 *         description: Invalid SIWE signature
 *       500:
 *         description: Server error
 */
export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { message, signature, email, emailFromSdk } = body;

    if (!message || !signature || !email) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    // Verify SIWE signature
    const siwe = new SiweMessage(JSON.parse(message));

    if (!nextAuthUrl) {
      console.error('SIWE signup: NEXTAUTH_URL not configured');
      return NextResponse.json({ error: 'Server configuration error' }, { status: 500 });
    }

    const nextAuthHost = new URL(nextAuthUrl).host;
    const cookieStore = await cookies();
    const nonce = cookieStore.get('next-auth.csrf-token')?.value.split('|')[0];

    const verificationParams = { signature, domain: nextAuthHost, nonce };
    const result = await siwe.verify(verificationParams);

    if (!result.success) {
      console.error('SIWE signup: Invalid signature');
      return NextResponse.json({ error: 'Invalid signature' }, { status: 401 });
    }

    // Get invitation code from request body or cookie
    const invitationCode = body.invitationCode || cookieStore.get(AUTH_COOKIES.INVITATION_CODE)?.value;

    // TODO: TEMPORARY INVITE-ONLY - Require invitation for new users
    if (!invitationCode) {
      console.info('SIWE signup: New user without invitation code');
      return NextResponse.json(
        { error: 'An invitation is required to create an account', code: AUTH_ERRORS.INVITATION_REQUIRED },
        { status: 400 }
      );
    }

    // Validate invitation
    const invitation = await findValidInvitation(invitationCode, email);

    if (!invitation) {
      console.info('SIWE signup: Invalid or expired invitation');
      return NextResponse.json(
        { error: 'Invalid or expired invitation', code: AUTH_ERRORS.INVALID_INVITATION },
        { status: 400 }
      );
    }

    // For email-bound invitations, verify email matches
    if (invitation.type === 'email_bound' && invitation.invitedEmail !== email.toLowerCase()) {
      console.info('SIWE signup: Email does not match invitation');
      return NextResponse.json(
        { error: 'The invitation was sent to a different email address', code: AUTH_ERRORS.INVITATION_EMAIL_MISMATCH },
        { status: 400 }
      );
    }

    // Determine if email needs verification
    // Email is trusted ONLY if it came from Human Wallet SDK
    const emailIsTrusted = emailFromSdk === true || emailFromSdk === 'true';

    // Create user
    const { id } = await insertUser({
      id: uuidv4(),
      walletAddress: siwe.address,
      email: email.toLowerCase(),
      accountStatus: emailIsTrusted ? accountStatuses[1] : accountStatuses[0], // 'active' or 'pending_verification'
      emailVerifiedAt: emailIsTrusted ? new Date() : null,
      invitedBy: invitation.createdBy,
    });

    // Mark email-bound invitation as accepted
    if (invitation.type === 'email_bound') {
      await markInvitationAccepted(invitationCode, id);
    }

    // Clear invitation cookie after successful signup
    cookieStore.delete(AUTH_COOKIES.INVITATION_CODE);

    // If email needs verification, send verification email
    if (!emailIsTrusted) {
      const token = generateToken();
      const tokenHash = hashToken(token);
      const expiresAt = new Date(Date.now() + 30 * 60 * 1000); // 30 minutes

      await db.insert(verificationTokens).values({
        userId: id,
        tokenHash,
        type: 'email_verification',
        expiresAt,
      });

      const emailProvider = getEmailProvider();
      await emailProvider.sendVerificationEmail(email.toLowerCase(), token);

      console.info('SIWE signup: Account created, email verification required for', email);
      return NextResponse.json(
        {
          success: true,
          requiresVerification: true,
          email: email.toLowerCase(),
        },
        { status: 201 }
      );
    }

    // Send welcome email for verified users (email came from SDK)
    try {
      const emailProvider = getEmailProvider();
      await emailProvider.sendWelcomeEmail(email);
    } catch (emailError) {
      console.error('Failed to send welcome email:', emailError);
    }

    console.info('SIWE signup: Account created successfully for', email);
    return NextResponse.json(
      {
        success: true,
        requiresVerification: false,
      },
      { status: 201 }
    );
  } catch (error) {
    console.error('SIWE signup error:', error);
    return NextResponse.json({ error: 'An error occurred during signup' }, { status: 500 });
  }
}
