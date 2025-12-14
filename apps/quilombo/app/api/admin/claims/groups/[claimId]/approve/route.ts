import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, approveGroupClaim, getGroupClaimById, fetchUser } from '@/db';
import { getEmailProvider } from '@/utils/email';
import { generateErrorMessage } from '@/utils';
import { NotFoundError } from '@/utils/errors';

type RouteParams = {
  params: Promise<{ claimId: string }>;
};

/**
 * @openapi
 * /api/admin/claims/groups/{claimId}/approve:
 *   put:
 *     summary: Approve a group claim request
 *     description: |
 *       Approves a pending group claim request.
 *       For genealogy group claims: Creates public.groups entry linked to profile.
 *       For new group claims: Creates genealogy.group_profiles AND public.groups.
 *       Both cases: Add user as admin, set claimedBy/claimedAt, send approval email.
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
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               adminNotes:
 *                 type: string
 *                 description: Optional notes from admin
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
 *                 groupId:
 *                   type: string
 *                   format: uuid
 *                 profileId:
 *                   type: string
 *                   format: uuid
 *       401:
 *         description: Unauthorized - user not authenticated
 *       403:
 *         description: Forbidden - user is not a global admin
 *       404:
 *         description: Claim not found
 *       500:
 *         description: Server error
 */
export async function PUT(request: NextRequest, { params }: RouteParams) {
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
    const body = await request.json().catch(() => ({}));
    const adminNotes = body.adminNotes;

    // Fetch claim details before approving (for email)
    const claim = await getGroupClaimById(claimId);
    if (!claim) {
      return NextResponse.json({ error: 'Claim not found' }, { status: 404 });
    }

    // Fetch user details for email
    const user = await fetchUser(claim.userId);
    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // Approve the claim (handles all database updates)
    const { groupId, profileId } = await approveGroupClaim(claimId, session.user.id, adminNotes);

    // Get group name for email
    const groupName = claim.type === 'genealogy_group' ? claim.groupProfile?.name : claim.proposedName;

    // Send approval email to claimer
    if (user.email) {
      try {
        const emailProvider = getEmailProvider();
        await emailProvider.sendClaimApprovedEmail(
          user.email,
          groupName || 'Unknown',
          groupId,
          user.name || user.email
        );
      } catch (emailError) {
        console.error('Failed to send approval email:', emailError);
        // Don't fail the request if email fails
      }
    }

    return NextResponse.json({
      message: 'Claim approved successfully. User has been added as group admin.',
      groupId,
      profileId,
    });
  } catch (error) {
    console.error('Error approving claim:', error);

    if (error instanceof NotFoundError) {
      return NextResponse.json({ error: error.message }, { status: 404 });
    }

    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while approving claim') },
      { status: 500 }
    );
  }
}
