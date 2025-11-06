import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { cookies } from 'next/headers';
import { eq, and, sql } from 'drizzle-orm';

import { AUTH_COOKIES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { db } from '@/db';
import { users, oauthAccounts } from '@/db/schema';

/**
 * @openapi
 * /api/auth/oauth-link:
 *   get:
 *     summary: Retrieve pending OAuth account link data
 *     description: Fetches OAuth data stored in secure cookie for email mismatch confirmation
 *     tags:
 *       - Authentication
 *     responses:
 *       200:
 *         description: Pending link data retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 currentEmail:
 *                   type: string
 *                 newEmail:
 *                   type: string
 *                 provider:
 *                   type: string
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: No pending link data found
 *       500:
 *         description: Internal server error
 */
export async function GET() {
  try {
    const session = await getServerSession(nextAuthOptions);

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const cookieStore = await cookies();
    const pendingLinkCookie = cookieStore.get(AUTH_COOKIES.PENDING_OAUTH_LINK)?.value;

    if (!pendingLinkCookie) {
      return NextResponse.json({ error: 'No pending link data found' }, { status: 404 });
    }

    const linkData = JSON.parse(pendingLinkCookie);

    // Only return the data needed for the confirmation modal
    return NextResponse.json({
      currentEmail: linkData.currentEmail,
      newEmail: linkData.email,
      provider: linkData.provider || 'google', // Default to google for backwards compatibility
    });
  } catch (error) {
    console.error('Error fetching pending OAuth link:', error);
    return NextResponse.json({ error: 'Failed to fetch pending link data' }, { status: 500 });
  }
}

/**
 * @openapi
 * /api/auth/oauth-link:
 *   post:
 *     summary: Confirm and complete OAuth account linking with email update
 *     description: Uses stored OAuth data to complete account linking after user confirmation
 *     tags:
 *       - Authentication
 *     responses:
 *       200:
 *         description: OAuth account linked and email updated successfully
 *       401:
 *         description: Unauthorized or missing session
 *       400:
 *         description: Missing or invalid pending link data
 *       500:
 *         description: Internal server error
 */
export async function POST() {
  try {
    const session = await getServerSession(nextAuthOptions);

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    // Retrieve pending link data from cookie
    const cookieStore = await cookies();
    const pendingLinkCookie = cookieStore.get(AUTH_COOKIES.PENDING_OAUTH_LINK)?.value;

    if (!pendingLinkCookie) {
      return NextResponse.json({ error: 'No pending link data found' }, { status: 400 });
    }

    const linkData = JSON.parse(pendingLinkCookie);
    const { providerUserId, email, providerEmail, provider = 'google' } = linkData;

    if (!providerUserId || !email || !provider) {
      return NextResponse.json({ error: 'Invalid pending link data' }, { status: 400 });
    }

    // Verify current user
    const currentUser = await db.query.users.findFirst({
      where: eq(users.id, session.user.id),
    });

    if (!currentUser) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // CRITICAL: Re-validate that the email isn't taken by another user
    // This prevents race conditions and ensures data integrity
    const emailOwner = await db.query.users.findFirst({
      where: sql`LOWER(${users.email}) = LOWER(${email})`,
    });

    if (emailOwner && emailOwner.id !== currentUser.id) {
      return NextResponse.json({ error: 'This email address is already registered to another user.' }, { status: 409 });
    }

    // Re-validate that the OAuth account isn't already linked to another user
    const existingOAuthLink = await db.query.oauthAccounts.findFirst({
      where: and(eq(oauthAccounts.provider, provider), eq(oauthAccounts.providerUserId, providerUserId)),
    });

    if (existingOAuthLink && existingOAuthLink.userId !== currentUser.id) {
      return NextResponse.json({ error: 'This OAuth account is already linked to another user.' }, { status: 409 });
    }

    // Link OAuth account
    await db.insert(oauthAccounts).values({
      userId: currentUser.id,
      provider,
      providerUserId,
      providerEmail: providerEmail || email,
    });

    // Update user's primary email
    await db
      .update(users)
      .set({
        email: email.toLowerCase(),
        emailVerifiedAt: new Date(),
      })
      .where(eq(users.id, currentUser.id));

    // Clear the pending link cookie
    cookieStore.delete(AUTH_COOKIES.PENDING_OAUTH_LINK);

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Error confirming OAuth link:', error);
    return NextResponse.json({ error: 'Failed to complete OAuth account linking' }, { status: 500 });
  }
}

/**
 * @openapi
 * /api/auth/oauth-link:
 *   delete:
 *     summary: Cancel pending OAuth account link
 *     description: Clears the pending link cookie when user cancels email update
 *     tags:
 *       - Authentication
 *     responses:
 *       200:
 *         description: Pending link cancelled successfully
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */
export async function DELETE() {
  try {
    const session = await getServerSession(nextAuthOptions);

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const cookieStore = await cookies();
    cookieStore.delete(AUTH_COOKIES.PENDING_OAUTH_LINK);

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Error cancelling OAuth link:', error);
    return NextResponse.json({ error: 'Failed to cancel OAuth link' }, { status: 500 });
  }
}
