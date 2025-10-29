import { NextResponse } from 'next/server';
import { eq, and, isNull } from 'drizzle-orm';

import { db } from '@/db';
import { users, verificationTokens } from '@/db/schema';
import { hashToken } from '@/utils/auth/tokens';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { token } = body;

    if (!token) {
      return NextResponse.json({ error: 'Token is required' }, { status: 400 });
    }

    // Hash the provided token
    const tokenHash = hashToken(token);

    // Find the token in database
    const tokenRecord = await db.query.verificationTokens.findFirst({
      where: and(
        eq(verificationTokens.tokenHash, tokenHash),
        eq(verificationTokens.type, 'email_verification'),
        isNull(verificationTokens.consumedAt)
      ),
    });

    if (!tokenRecord) {
      return NextResponse.json({ error: 'Invalid or expired verification link' }, { status: 400 });
    }

    // Check if token is expired
    if (new Date() > tokenRecord.expiresAt) {
      return NextResponse.json({ error: 'Invalid or expired verification link' }, { status: 400 });
    }

    // Check if token was already consumed
    if (tokenRecord.consumedAt) {
      return NextResponse.json({ error: 'This verification link has already been used' }, { status: 410 });
    }

    // Update user account status and set email verified timestamp
    await db
      .update(users)
      .set({
        accountStatus: 'active',
        emailVerifiedAt: new Date(),
      })
      .where(eq(users.id, tokenRecord.userId));

    // Mark token as consumed
    await db
      .update(verificationTokens)
      .set({ consumedAt: new Date() })
      .where(eq(verificationTokens.id, tokenRecord.id));

    return NextResponse.json(
      {
        message: 'Email verified successfully',
        userId: tokenRecord.userId,
      },
      { status: 200 }
    );
  } catch (error) {
    console.error('Email verification error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred during email verification',
      },
      { status: 500 }
    );
  }
}
