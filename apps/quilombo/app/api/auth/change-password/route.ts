import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { eq } from 'drizzle-orm';

import { nextAuthOptions } from '@/config/next-auth-options';
import { db } from '@/db';
import { users } from '@/db/schema';
import { hashPassword, verifyPassword } from '@/utils/auth/password';
import { changePasswordSchema } from '@/config/validation-schema';

/**
 * @openapi
 * /api/auth/change-password:
 *   post:
 *     summary: Change user password
 *     description: Allows authenticated users to change their password
 *     tags:
 *       - Authentication
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - currentPassword
 *               - newPassword
 *               - confirmPassword
 *             properties:
 *               currentPassword:
 *                 type: string
 *                 description: Current password (required if user has password set)
 *               newPassword:
 *                 type: string
 *                 description: New password (min 12 chars, uppercase, lowercase, number, special char)
 *               confirmPassword:
 *                 type: string
 *                 description: Must match newPassword
 *     responses:
 *       200:
 *         description: Password changed successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or incorrect current password
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */
export async function POST(request: Request) {
  try {
    const session = await getServerSession(nextAuthOptions);

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();

    // Validate input
    const validated = await changePasswordSchema.validate(body, { abortEarly: false });
    const { currentPassword, newPassword } = validated;

    // Fetch user
    const user = await db.query.users.findFirst({
      where: eq(users.id, session.user.id),
    });

    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // If user has a password, verify current password
    if (user.passwordHash) {
      const isValidPassword = await verifyPassword(currentPassword, user.passwordHash);
      if (!isValidPassword) {
        return NextResponse.json({ error: 'Current password is incorrect' }, { status: 400 });
      }
    }

    // Hash new password
    const passwordHash = await hashPassword(newPassword);

    console.log('Updating password for user:', session.user.id);
    console.log('New password hash:', passwordHash);

    // Update user password
    const result = await db.update(users).set({ passwordHash }).where(eq(users.id, session.user.id)).returning();

    console.log('Update result:', result);

    if (!result.length) {
      console.error('No user was updated');
      return NextResponse.json({ error: 'Failed to update password' }, { status: 500 });
    }

    return NextResponse.json(
      {
        message: 'Password changed successfully',
      },
      { status: 200 }
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

    console.error('Change password error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred while changing password',
      },
      { status: 500 }
    );
  }
}
