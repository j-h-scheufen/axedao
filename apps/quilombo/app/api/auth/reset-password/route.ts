import { NextResponse } from 'next/server';
import { eq, and, isNull } from 'drizzle-orm';
import { ValidationError } from 'yup';

import { db } from '@/db';
import { users, verificationTokens } from '@/db/schema';
import { hashPassword } from '@/utils/auth/password';
import { hashToken } from '@/utils/auth/tokens';
import { resetPasswordSchema } from '@/config/validation-schema';
import { rateLimit, getClientIp } from '@/utils/rate-limit';

export async function POST(request: Request) {
  // Rate limiting: 5 requests per hour per IP
  const clientIp = getClientIp(request);
  const rateLimitResult = rateLimit(clientIp, { maxRequests: 5, windowMs: 60 * 60 * 1000 });

  if (!rateLimitResult.allowed) {
    const retryAfterMs = rateLimitResult.retryAfter ?? 0;
    return NextResponse.json(
      {
        error: `Too many password reset attempts. Please try again in ${Math.ceil(retryAfterMs / 60000)} minutes.`,
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
    const validated = await resetPasswordSchema.validate(body, { abortEarly: false });
    const { token, newPassword } = validated;

    // Hash the provided token
    const tokenHash = hashToken(token);

    // Find the token in database
    const tokenRecord = await db.query.verificationTokens.findFirst({
      where: and(
        eq(verificationTokens.tokenHash, tokenHash),
        eq(verificationTokens.type, 'password_reset'),
        isNull(verificationTokens.consumedAt)
      ),
    });

    if (!tokenRecord) {
      return NextResponse.json({ error: 'Invalid or expired reset link' }, { status: 400 });
    }

    // Check if token is expired
    if (new Date() > tokenRecord.expiresAt) {
      return NextResponse.json({ error: 'Invalid or expired reset link' }, { status: 400 });
    }

    // Hash new password
    const passwordHash = await hashPassword(newPassword);

    // Update user password (sets it even if previously null for Google/wallet users)
    await db.update(users).set({ passwordHash }).where(eq(users.id, tokenRecord.userId));

    // Mark token as consumed
    await db
      .update(verificationTokens)
      .set({ consumedAt: new Date() })
      .where(eq(verificationTokens.id, tokenRecord.id));

    return NextResponse.json(
      {
        message: 'Password updated successfully',
      },
      { status: 200 }
    );
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

    console.error('Reset password error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred during password reset',
      },
      { status: 500 }
    );
  }
}
