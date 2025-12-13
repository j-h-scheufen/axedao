import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { claimPersonFormSchema } from '@/config/validation-schema';
import {
  createPersonClaim,
  fetchPersonProfile,
  getPersonProfileClaimStatus,
  getUserPendingPersonClaim,
  fetchUser,
} from '@/db';
import { generateErrorMessage } from '@/utils';

type RouteParams = {
  params: Promise<{ personId: string }>;
};

/**
 * @openapi
 * /api/genealogy/persons/{personId}/claim:
 *   post:
 *     summary: Submit a claim request for a person profile
 *     description: |
 *       Allows authenticated users to claim a genealogy person profile as their own.
 *       The claim is created with 'pending' status and must be approved by a global admin.
 *     tags:
 *       - Genealogy
 *       - Claims
 *     security:
 *       - session: []
 *     parameters:
 *       - in: path
 *         name: personId
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
 *               - userMessage
 *             properties:
 *               userMessage:
 *                 type: string
 *                 minLength: 20
 *                 description: Explanation of why this is the user's profile.
 *     responses:
 *       200:
 *         description: Claim submitted successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 claimId:
 *                   type: string
 *                   format: uuid
 *                 message:
 *                   type: string
 *       400:
 *         description: Invalid input data
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
 *         description: Profile is not claimable
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       404:
 *         description: Profile not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       409:
 *         description: User already has a profile or pending claim
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
export async function POST(request: NextRequest, { params }: RouteParams) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { personId } = await params;

    // Check if user already has a profile linked
    const user = await fetchUser(session.user.id);
    if (user?.profileId) {
      return NextResponse.json(
        { error: 'You already have a genealogy profile linked to your account.' },
        { status: 409 }
      );
    }

    // Check if user has a pending claim
    const pendingClaim = await getUserPendingPersonClaim(session.user.id);
    if (pendingClaim) {
      return NextResponse.json(
        { error: 'You already have a pending claim. Please wait for it to be reviewed.' },
        { status: 409 }
      );
    }

    // Check if profile exists
    const profile = await fetchPersonProfile(personId);
    if (!profile) {
      return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
    }

    // Check if profile is claimable
    const claimStatus = await getPersonProfileClaimStatus(personId);
    if (!claimStatus.isClaimable) {
      let errorMessage = 'This profile is not claimable.';
      if (claimStatus.reason === 'deceased') {
        errorMessage = 'This is a historical profile and cannot be claimed.';
      } else if (claimStatus.reason === 'already_claimed') {
        errorMessage = 'This profile is already linked to another account.';
      }
      return NextResponse.json({ error: errorMessage }, { status: 403 });
    }

    const body = await request.json();

    // Validate input
    let userMessage: string;
    try {
      const validated = await claimPersonFormSchema.validate(body);
      userMessage = validated.userMessage;
    } catch (error) {
      console.error('Validation error:', error);
      const message =
        error && typeof error === 'object' && 'errors' in error && Array.isArray(error.errors)
          ? error.errors[0]
          : error instanceof Error
            ? error.message
            : 'Invalid input data';
      return NextResponse.json({ error: message }, { status: 400 });
    }

    // Create claim record
    const claimId = await createPersonClaim(session.user.id, personId, userMessage);

    return NextResponse.json({
      claimId,
      message: 'Claim submitted successfully! We will review your request and contact you via email.',
    });
  } catch (error) {
    console.error('Error submitting person profile claim:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while submitting claim') },
      { status: 500 }
    );
  }
}
