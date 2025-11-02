import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { eq } from 'drizzle-orm';

import { nextAuthOptions } from '@/config/next-auth-options';
import { linkWalletSchema } from '@/config/validation-schema';
import { db } from '@/db';
import { users } from '@/db/schema';

/**
 * @openapi
 * /api/auth/link-wallet:
 *   post:
 *     summary: Link wallet address to user account
 *     description: Associates a wallet address with the authenticated user's account
 *     tags:
 *       - Authentication
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - walletAddress
 *             properties:
 *               walletAddress:
 *                 type: string
 *                 description: Ethereum wallet address (0x prefixed)
 *     responses:
 *       200:
 *         description: Wallet linked successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or wallet already linked
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized
 *       409:
 *         description: Wallet address already in use
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
    const validated = await linkWalletSchema.validate(body, { abortEarly: false });
    const { walletAddress } = validated;

    // Check if user already has this wallet
    const currentUser = await db.query.users.findFirst({
      where: eq(users.id, session.user.id),
    });

    if (!currentUser) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    if (currentUser.walletAddress === walletAddress) {
      return NextResponse.json({ error: 'Wallet already linked to your account' }, { status: 400 });
    }

    // Check if wallet is already used by another user
    const existingWalletUser = await db.query.users.findFirst({
      where: eq(users.walletAddress, walletAddress),
    });

    if (existingWalletUser) {
      return NextResponse.json({ error: 'Wallet address already in use by another account' }, { status: 409 });
    }

    // Link wallet to user
    await db.update(users).set({ walletAddress }).where(eq(users.id, session.user.id));

    return NextResponse.json(
      {
        message: 'Wallet linked successfully',
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

    console.error('Link wallet error:', error);
    return NextResponse.json(
      {
        error: 'An error occurred while linking wallet',
      },
      { status: 500 }
    );
  }
}
