import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, getPendingClaims } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/admin/claims:
 *   get:
 *     summary: List all pending group claims
 *     description: |
 *       Returns all pending group claim requests.
 *       Requires global admin privileges.
 *     tags:
 *       - Admin
 *       - Claims
 *     security:
 *       - session: []
 *     responses:
 *       200:
 *         description: List of pending claims
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: string
 *                     format: uuid
 *                   groupId:
 *                     type: string
 *                     format: uuid
 *                   groupName:
 *                     type: string
 *                   userId:
 *                     type: string
 *                     format: uuid
 *                   userEmail:
 *                     type: string
 *                   userName:
 *                     type: string
 *                   requestedAt:
 *                     type: string
 *                     format: date-time
 *                   userMessage:
 *                     type: string
 *       401:
 *         description: Unauthorized - user not authenticated
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       403:
 *         description: Forbidden - user is not a global admin
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       500:
 *         description: Server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */
export async function GET(_: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Missing permission. Global admin access required.' }, { status: 403 });
  }

  try {
    const pendingClaims = await getPendingClaims();

    // Transform data to flatten group and user info
    const transformedClaims = pendingClaims.map((claim) => ({
      id: claim.id,
      groupId: claim.groupId,
      groupName: claim.group?.name || 'Unknown Group',
      userId: claim.userId,
      userName: claim.user?.name || 'Unknown User',
      userEmail: claim.user?.email || '',
      requestedAt: claim.requestedAt,
      userMessage: claim.userMessage,
      status: claim.status,
    }));

    return NextResponse.json(transformedClaims);
  } catch (error) {
    console.error('Error fetching pending claims:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while fetching claims') },
      { status: 500 }
    );
  }
}
