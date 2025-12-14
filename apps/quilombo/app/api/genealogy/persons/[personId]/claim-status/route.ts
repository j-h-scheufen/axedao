import { type NextRequest, NextResponse } from 'next/server';

import { fetchPersonProfile, getPersonProfileClaimStatus } from '@/db';
import { generateErrorMessage } from '@/utils';

type RouteParams = {
  params: Promise<{ personId: string }>;
};

/**
 * @openapi
 * /api/genealogy/persons/{personId}/claim-status:
 *   get:
 *     summary: Get the claim status of a person profile
 *     description: |
 *       Returns whether a person profile is claimable and the reason if not.
 *       Does not require authentication.
 *     tags:
 *       - Genealogy
 *       - Claims
 *     parameters:
 *       - in: path
 *         name: personId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *     responses:
 *       200:
 *         description: Claim status information
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 isClaimable:
 *                   type: boolean
 *                 reason:
 *                   type: string
 *                   enum: [not_found, deceased, already_claimed, claimable]
 *       404:
 *         description: Profile not found
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
export async function GET(_: NextRequest, { params }: RouteParams) {
  try {
    const { personId } = await params;

    // Check if profile exists
    const profile = await fetchPersonProfile(personId);
    if (!profile) {
      return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
    }

    // Get detailed claim status
    const claimStatus = await getPersonProfileClaimStatus(personId);

    return NextResponse.json({
      isClaimable: claimStatus.isClaimable,
      reason: claimStatus.reason,
    });
  } catch (error) {
    console.error('Error fetching claim status:', error);
    return NextResponse.json({ error: generateErrorMessage(error, 'An unexpected error occurred') }, { status: 500 });
  }
}
