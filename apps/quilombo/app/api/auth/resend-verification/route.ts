import { NextResponse } from 'next/server';
import { sql, eq, and, isNull } from 'drizzle-orm';
import { ValidationError } from 'yup';

import { db } from '@/db';
import { users, verificationTokens } from '@/db/schema';
import { generateToken, hashToken } from '@/utils/auth/tokens';
import { getEmailProvider } from '@/utils/email';
import { forgotPasswordSchema } from '@/config/validation-schema';
import { rateLimit, getClientIp } from '@/utils/rate-limit';

export async function POST(request: Request) {
  // Rate limiting: 3 requests per 15 minutes per IP
  const clientIp = getClientIp(request);
  const rateLimitResult = rateLimit(clientIp, { maxRequests: 3, windowMs: 15 * 60 * 1000 });

  if (!rateLimitResult.allowed) {
    const retryAfterMs = rateLimitResult.retryAfter ?? 0;
    return NextResponse.json(
      {
        error: `Too many verification email requests. Please try again in ${Math.ceil(retryAfterMs / 60000)} minutes.`,
      },
      {
        status: 429,
        headers: {
          'Retry-After': Math.ceil(retryAfterMs / 1000).toString(),
        },
      }
    );
  }

  try {
    const body = await request.json();

    // Validate input
    const validated = await forgotPasswordSchema.validate(body, { abortEarly: false });
    const { email } = validated;

    // Find user by email (case-insensitive)
    const user = await db.query.users.findFirst({
      where: sql`LOWER(${users.email}) = LOWER(${email})`,
    });

    // Always return 204 to prevent user enumeration
    if (!user) {
      return new NextResponse(null, { status: 204 });
    }

    // If user is already verified, silently succeed
    if (user.emailVerifiedAt) {
      return new NextResponse(null, { status: 204 });
    }

    // Delete any existing unconsumed email verification tokens for this user
    await db
      .delete(verificationTokens)
      .where(
        and(
          eq(verificationTokens.userId, user.id),
          eq(verificationTokens.type, 'email_verification'),
          isNull(verificationTokens.consumedAt)
        )
      );

    // Generate new verification token
    const token = generateToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000); // 30 minutes

    // Store token
    await db.insert(verificationTokens).values({
      userId: user.id,
      tokenHash,
      type: 'email_verification',
      expiresAt,
    });

    // Send verification email
    const emailProvider = getEmailProvider();
    await emailProvider.sendVerificationEmail(email.toLowerCase(), token, user.name || undefined);

    return new NextResponse(null, { status: 204 });
  } catch (error: unknown) {
    // Yup validation errors
    if (error instanceof ValidationError) {
      return NextResponse.json(
        {
          error: error.errors[0] || 'Invalid input',
        },
        { status: 400 }
      );
    }

    console.error('Resend verification error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred',
      },
      { status: 500 }
    );
  }
}
