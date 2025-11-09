import { NextResponse } from 'next/server';
import { sql } from 'drizzle-orm';
import { v4 as uuidv4 } from 'uuid';

import { db, findValidInvitation, markInvitationAccepted } from '@/db';
import { users, verificationTokens } from '@/db/schema';
import { hashPassword } from '@/utils/auth/password';
import { generateToken, hashToken } from '@/utils/auth/tokens';
import { getEmailProvider } from '@/utils/email';
import { signupSchema } from '@/config/validation-schema';
import { rateLimit, getClientIp } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/auth/signup:
 *   post:
 *     summary: Create a new user account
 *     description: |
 *       Creates a new user account with email/password authentication.
 *       Requires a valid invitation code (invite-only mode).
 *       Sends verification email after account creation.
 *     tags:
 *       - Authentication
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - email
 *               - password
 *               - invitationCode
 *             properties:
 *               email:
 *                 type: string
 *                 format: email
 *               password:
 *                 type: string
 *                 minLength: 8
 *               invitationCode:
 *                 type: string
 *                 format: uuid
 *                 description: Required invitation code
 *     responses:
 *       201:
 *         description: Account created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or invalid invitation
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       500:
 *         description: Server error
 */
export async function POST(request: Request) {
  // Rate limiting: 5 signups per hour per IP
  const clientIp = getClientIp(request);
  const rateLimitResult = rateLimit(clientIp, { maxRequests: 5, windowMs: 60 * 60 * 1000 });

  if (!rateLimitResult.allowed) {
    return NextResponse.json(
      {
        error: `Too many signup attempts. Please try again in ${Math.ceil(rateLimitResult.retryAfter! / 60000)} minutes.`,
      },
      {
        status: 429,
        headers: {
          'Retry-After': Math.ceil(rateLimitResult.retryAfter! / 1000).toString(),
        },
      }
    );
  }

  try {
    const body = await request.json();

    // Validate input
    const validated = await signupSchema.validate(body, { abortEarly: false });
    const { email, password, invitationCode } = validated;

    // TODO: TEMPORARY INVITE-ONLY - Require invitation code
    if (!invitationCode) {
      return NextResponse.json({ error: 'Invitation code is required' }, { status: 400 });
    }

    // Validate invitation
    const invitation = await findValidInvitation(invitationCode, email);
    if (!invitation) {
      return NextResponse.json(
        { error: 'Invalid or expired invitation code. Please request a new invitation.' },
        { status: 400 }
      );
    }

    // Check if user already exists (case-insensitive)
    const existingUser = await db.query.users.findFirst({
      where: sql`LOWER(${users.email}) = LOWER(${email})`,
    });

    if (existingUser) {
      // Generic error to prevent user enumeration
      return NextResponse.json(
        {
          error:
            'Unable to create account. If you already have an account, please sign in or use the forgot password link.',
        },
        { status: 400 }
      );
    }

    // Hash password
    const passwordHash = await hashPassword(password);

    // Create user with pending verification status
    const userId = uuidv4();
    await db.insert(users).values({
      id: userId,
      email: email.toLowerCase(),
      passwordHash,
      accountStatus: 'pending_verification',
    });

    // Generate verification token
    const token = generateToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000); // 30 minutes

    // Store token
    await db.insert(verificationTokens).values({
      userId,
      tokenHash,
      type: 'email_verification',
      expiresAt,
    });

    // Send verification email
    const emailProvider = getEmailProvider();
    await emailProvider.sendVerificationEmail(email.toLowerCase(), token);

    // Mark invitation as accepted (only for email_bound, open invites remain pending)
    if (invitation.type === 'email_bound') {
      await markInvitationAccepted(invitationCode, userId);
    }

    return NextResponse.json(
      {
        message: 'Account created. Check your email to verify.',
      },
      { status: 201 }
    );
  } catch (error: any) {
    // Yup validation errors
    if (error.name === 'ValidationError') {
      return NextResponse.json(
        {
          error: error.errors?.[0] || 'Invalid input',
        },
        { status: 400 }
      );
    }

    console.error('Signup error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred during signup',
      },
      { status: 500 }
    );
  }
}
