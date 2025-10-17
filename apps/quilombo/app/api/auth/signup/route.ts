import { NextResponse } from 'next/server';
import { sql } from 'drizzle-orm';
import { v4 as uuidv4 } from 'uuid';

import { db } from '@/db';
import { users, verificationTokens } from '@/db/schema';
import { hashPassword } from '@/utils/auth/password';
import { generateToken, hashToken } from '@/utils/auth/tokens';
import { getEmailProvider } from '@/utils/email';
import { signupSchema } from '@/config/validation-schema';

export async function POST(request: Request) {
  try {
    const body = await request.json();

    // Validate input
    const validated = await signupSchema.validate(body, { abortEarly: false });
    const { email, password } = validated;

    // Check if user already exists (case-insensitive)
    const existingUser = await db.query.users.findFirst({
      where: sql`LOWER(${users.email}) = LOWER(${email})`,
    });

    if (existingUser) {
      return NextResponse.json({ error: 'An account with this email already exists' }, { status: 409 });
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
