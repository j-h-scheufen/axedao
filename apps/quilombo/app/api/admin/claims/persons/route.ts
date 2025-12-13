import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, getPendingPersonClaims } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/admin/claims/persons:
 *   get:
 *     summary: List all pending person profile claims
 *     description: |
 *       Returns all pending person profile claim requests.
 *       Requires global admin privileges.
 *     tags:
 *       - Admin
 *       - Person Claims
 *     security:
 *       - session: []
 *     responses:
 *       200:
 *         description: List of pending person claims
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
 *                   personProfileId:
 *                     type: string
 *                     format: uuid
 *                   profileApelido:
 *                     type: string
 *                   profileName:
 *                     type: string
 *                   profileTitle:
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
 *                   status:
 *                     type: string
 *                     enum: [pending, approved, rejected]
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
    const pendingClaims = await getPendingPersonClaims();

    // Transform data to flatten profile and user info
    const transformedClaims = pendingClaims.map((claim) => ({
      id: claim.id,
      personProfileId: claim.personProfileId,
      profileApelido: claim.profile?.apelido || null,
      profileName: claim.profile?.name || null,
      profileTitle: claim.profile?.title || null,
      profilePortrait: claim.profile?.portrait || null,
      userId: claim.userId,
      userName: claim.user?.name || 'Unknown User',
      userEmail: claim.user?.email || '',
      requestedAt: claim.requestedAt,
      userMessage: claim.userMessage,
      status: claim.status,
    }));

    return NextResponse.json(transformedClaims);
  } catch (error) {
    console.error('Error fetching pending person claims:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while fetching claims') },
      { status: 500 }
    );
  }
}
