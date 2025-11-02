import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { eq, and } from 'drizzle-orm';

import { nextAuthOptions } from '@/config/next-auth-options';
import { removeMethodSchema } from '@/config/validation-schema';
import { db } from '@/db';
import { users, oauthAccounts } from '@/db/schema';

/**
 * @openapi
 * /api/auth/remove-method:
 *   post:
 *     summary: Remove authentication method
 *     description: Removes a specific authentication method from user's account. Users must have at least one auth method.
 *     tags:
 *       - Authentication
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - method
 *             properties:
 *               method:
 *                 type: string
 *                 enum: [password, google, wallet]
 *                 description: Authentication method to remove
 *     responses:
 *       200:
 *         description: Authentication method removed successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or cannot remove last auth method
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: User or auth method not found
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
    const validated = await removeMethodSchema.validate(body, { abortEarly: false });
    const { method } = validated;

    // Fetch user data
    const user = await db.query.users.findFirst({
      where: eq(users.id, session.user.id),
    });

    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // Check for Google OAuth account
    const googleAccount = await db.query.oauthAccounts.findFirst({
      where: and(eq(oauthAccounts.userId, session.user.id), eq(oauthAccounts.provider, 'google')),
    });

    // Count active auth methods
    const hasPassword = !!user.passwordHash;
    const hasGoogle = !!googleAccount;
    const hasWallet = !!user.walletAddress;
    const activeMethodsCount = [hasPassword, hasGoogle, hasWallet].filter(Boolean).length;

    // Prevent removing the last auth method
    if (activeMethodsCount <= 1) {
      return NextResponse.json(
        { error: 'Cannot remove your only authentication method. Add another method first.' },
        { status: 400 }
      );
    }

    // Remove the specified method
    switch (method) {
      case 'password':
        if (!hasPassword) {
          return NextResponse.json({ error: 'Password authentication not found' }, { status: 404 });
        }
        await db.update(users).set({ passwordHash: null }).where(eq(users.id, session.user.id));
        break;

      case 'google':
        if (!hasGoogle) {
          return NextResponse.json({ error: 'Google authentication not found' }, { status: 404 });
        }
        await db
          .delete(oauthAccounts)
          .where(and(eq(oauthAccounts.userId, session.user.id), eq(oauthAccounts.provider, 'google')));
        break;

      case 'wallet':
        if (!hasWallet) {
          return NextResponse.json({ error: 'Wallet authentication not found' }, { status: 404 });
        }
        await db.update(users).set({ walletAddress: null }).where(eq(users.id, session.user.id));
        break;

      default:
        return NextResponse.json({ error: 'Invalid authentication method' }, { status: 400 });
    }

    return NextResponse.json(
      {
        message: 'Authentication method removed successfully',
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

    console.error('Remove auth method error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred while removing authentication method',
      },
      { status: 500 }
    );
  }
}
