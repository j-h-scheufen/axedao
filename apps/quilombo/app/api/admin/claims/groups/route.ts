import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, getPendingGroupClaims } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/admin/claims/groups:
 *   get:
 *     summary: List all pending group claims
 *     description: |
 *       Returns all pending group claim requests (both genealogy group claims and new group registrations).
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
 *                   type:
 *                     type: string
 *                     enum: [genealogy_group, new_group]
 *                   profileId:
 *                     type: string
 *                     format: uuid
 *                     nullable: true
 *                   proposedName:
 *                     type: string
 *                     nullable: true
 *                   website:
 *                     type: string
 *                     nullable: true
 *                   userId:
 *                     type: string
 *                     format: uuid
 *                   user:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: string
 *                       name:
 *                         type: string
 *                       nickname:
 *                         type: string
 *                   groupProfile:
 *                     type: object
 *                     nullable: true
 *                     properties:
 *                       id:
 *                         type: string
 *                       name:
 *                         type: string
 *                       style:
 *                         type: string
 *                   requestedAt:
 *                     type: string
 *                     format: date-time
 *                   userMessage:
 *                     type: string
 *       401:
 *         description: Unauthorized - user not authenticated
 *       403:
 *         description: Forbidden - user is not a global admin
 *       500:
 *         description: Server error
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
    const pendingClaims = await getPendingGroupClaims();
    return NextResponse.json(pendingClaims);
  } catch (error) {
    console.error('Error fetching pending claims:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while fetching claims') },
      { status: 500 }
    );
  }
}
