import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, approveClaim } from '@/db';
import { generateErrorMessage } from '@/utils';
import { NotFoundError } from '@/utils/errors';

type RouteParams = {
  params: Promise<{ claimId: string }>;
};

/**
 * @openapi
 * /api/admin/claims/{claimId}/approve:
 *   put:
 *     summary: Approve a group claim request
 *     description: |
 *       Approves a pending group claim request.
 *       - Updates claim status to 'approved'
 *       - Adds user as group admin
 *       - Sets groups.claimedBy and groups.claimedAt
 *       - Adds user to group (users.groupId)
 *       - Sends approval email to claimer
 *       Requires global admin privileges.
 *     tags:
 *       - Admin
 *       - Claims
 *     security:
 *       - session: []
 *     parameters:
 *       - in: path
 *         name: claimId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *     responses:
 *       200:
 *         description: Claim approved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
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
 *       404:
 *         description: Claim not found
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
export async function PUT(_: NextRequest, { params }: RouteParams) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Missing permission. Global admin access required.' }, { status: 403 });
  }

  try {
    const { claimId } = await params;

    // Approve the claim (handles all database updates)
    // Will throw Error('Claim not found') if claim doesn't exist
    await approveClaim(claimId, session.user.id);

    // TODO: Phase 5 - Send approval email to claimer
    // const claim = await getGroupClaim(claimId);
    // const user = await fetchUser(claim.userId);
    // const group = await fetchGroup(claim.groupId);
    // await sendClaimApprovedEmail(user.email, group.name, group.id);

    return NextResponse.json({
      message: 'Claim approved successfully. User has been added as group admin.',
    });
  } catch (error) {
    console.error('Error approving claim:', error);

    // Handle not found error
    if (error instanceof NotFoundError) {
      return NextResponse.json({ error: error.message }, { status: 404 });
    }

    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while approving claim') },
      { status: 500 }
    );
  }
}
