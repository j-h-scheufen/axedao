import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { getUserPendingPersonClaim } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/profile/person-claim:
 *   get:
 *     summary: Get the current user's pending person profile claim
 *     description: |
 *       Returns the current user's pending person profile claim if one exists.
 *       Requires authentication.
 *     tags:
 *       - Profile
 *       - Claims
 *     security:
 *       - session: []
 *     responses:
 *       200:
 *         description: Pending claim information or null if no pending claim
 *         content:
 *           application/json:
 *             schema:
 *               oneOf:
 *                 - type: object
 *                   properties:
 *                     id:
 *                       type: string
 *                       format: uuid
 *                     personProfileId:
 *                       type: string
 *                       format: uuid
 *                     profileApelido:
 *                       type: string
 *                     profileName:
 *                       type: string
 *                     profileTitle:
 *                       type: string
 *                     requestedAt:
 *                       type: string
 *                       format: date-time
 *                     status:
 *                       type: string
 *                       enum: [pending]
 *                 - type: 'null'
 *       401:
 *         description: Unauthorized - user not authenticated
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

  try {
    const pendingClaim = await getUserPendingPersonClaim(session.user.id);

    if (!pendingClaim) {
      return NextResponse.json(null);
    }

    // Transform to include profile details
    return NextResponse.json({
      id: pendingClaim.id,
      personProfileId: pendingClaim.personProfileId,
      profileApelido: pendingClaim.profile?.apelido || null,
      profileName: pendingClaim.profile?.name || null,
      profileTitle: pendingClaim.profile?.title || null,
      profilePortrait: pendingClaim.profile?.portrait || null,
      requestedAt: pendingClaim.requestedAt,
      status: pendingClaim.status,
    });
  } catch (error) {
    console.error('Error fetching user pending person claim:', error);
    return NextResponse.json({ error: generateErrorMessage(error, 'An unexpected error occurred') }, { status: 500 });
  }
}
