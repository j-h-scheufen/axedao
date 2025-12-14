import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, rejectPersonClaim, fetchUser, fetchPersonProfile, getPersonClaim } from '@/db';
import { getEmailProvider } from '@/utils/email';
import { generateErrorMessage } from '@/utils';
import { NotFoundError } from '@/utils/errors';

type RouteParams = {
  params: Promise<{ claimId: string }>;
};

/**
 * @openapi
 * /api/admin/claims/persons/{claimId}/reject:
 *   put:
 *     summary: Reject a person profile claim request
 *     description: |
 *       Rejects a pending person profile claim request.
 *       - Updates claim status to 'rejected'
 *       - Records admin notes
 *       - Sends rejection email to claimer with reason
 *       Requires global admin privileges.
 *     tags:
 *       - Admin
 *       - Person Claims
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
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - notes
 *             properties:
 *               notes:
 *                 type: string
 *                 description: Reason for rejection (sent to claimer)
 *     responses:
 *       200:
 *         description: Claim rejected successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Invalid input - notes required
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
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
    const body = await request.json();

    // Validate notes are provided
    if (!body.notes || typeof body.notes !== 'string' || body.notes.trim().length === 0) {
      return NextResponse.json({ error: 'Rejection notes are required' }, { status: 400 });
    }

    // Fetch claim details before rejecting (for email)
    const claim = await getPersonClaim(claimId);
    if (!claim) {
      return NextResponse.json({ error: 'Claim not found' }, { status: 404 });
    }

    // Fetch user and profile details for email
    const user = await fetchUser(claim.userId);
    const profile = await fetchPersonProfile(claim.personProfileId);

    if (!user || !profile) {
      return NextResponse.json({ error: 'User or profile not found' }, { status: 404 });
    }

    // Reject the claim
    await rejectPersonClaim(claimId, session.user.id, body.notes);

    // Send rejection email to claimer
    if (user.email) {
      try {
        const emailProvider = getEmailProvider();
        const profileDisplayName = profile.apelido || profile.name || 'the genealogy profile';
        await emailProvider.sendPersonClaimRejectedEmail(
          user.email,
          profileDisplayName,
          user.name || user.email,
          body.notes
        );
      } catch (emailError) {
        console.error('Failed to send rejection email:', emailError);
        // Don't fail the request if email fails
      }
    }

    return NextResponse.json({
      message: 'Claim rejected successfully.',
    });
  } catch (error) {
    console.error('Error rejecting person claim:', error);

    // Handle not found error
    if (error instanceof NotFoundError) {
      return NextResponse.json({ error: error.message }, { status: 404 });
    }

    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while rejecting claim') },
      { status: 500 }
    );
  }
}
