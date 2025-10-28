import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { eq } from 'drizzle-orm';

import { nextAuthOptions } from '@/config/next-auth-options';
import { db } from '@/db';
import { users, oauthAccounts } from '@/db/schema';

/**
 * @openapi
 * /api/auth/methods:
 *   get:
 *     summary: Get user's authentication methods
 *     description: Returns which authentication methods the user has configured
 *     tags:
 *       - Authentication
 *     responses:
 *       200:
 *         description: Authentication methods retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 hasPassword:
 *                   type: boolean
 *                 hasGoogle:
 *                   type: boolean
 *                 hasWallet:
 *                   type: boolean
 *                 googleEmail:
 *                   type: string
 *                 walletAddress:
 *                   type: string
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */
export async function GET() {
  try {
    const session = await getServerSession(nextAuthOptions);

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    // Fetch user data
    const user = await db.query.users.findFirst({
      where: eq(users.id, session.user.id),
    });

    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // Check for Google OAuth account
    const googleAccount = await db.query.oauthAccounts.findFirst({
      where: eq(oauthAccounts.userId, session.user.id),
    });

    // Determine contact email: users.email takes priority, fallback to Google email
    const notificationEmail = user.email || googleAccount?.providerEmail || null;

    return NextResponse.json({
      notificationEmail,
      hasPassword: !!user.passwordHash,
      hasGoogle: !!googleAccount,
      hasWallet: !!user.walletAddress,
      googleEmail: googleAccount?.providerEmail || undefined,
      walletAddress: user.walletAddress || undefined,
      userEmail: user.email || undefined,
    });
  } catch (error) {
    console.error('Error fetching auth methods:', error);
    return NextResponse.json({ error: 'Failed to fetch authentication methods' }, { status: 500 });
  }
}
