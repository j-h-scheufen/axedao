import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { claimGroupFormSchema } from '@/config/validation-schema';
import { createGroupClaim, fetchGroup, isGroupClaimable } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * @openapi
 * /api/groups/{groupId}/claim:
 *   post:
 *     summary: Submit a claim request for a group
 *     description: |
 *       Allows authenticated users to request admin access to a group.
 *       The claim is created with 'pending' status and must be approved by a global admin.
 *       Email notification is sent to support@quilombo.net.
 *     tags:
 *       - Groups
 *     security:
 *       - session: []
 *     parameters:
 *       - in: path
 *         name: groupId
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
 *                 description: |
 *                   Explanation of why the user should be admin of this group.
 *                   Should include: relationship to group, who leads it, other organizers, contact info.
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
 *         description: Group is not claimable (already claimed or has admins)
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       404:
 *         description: Group not found
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
export async function POST(request: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = await params;

    // Check if group exists
    const group = await fetchGroup(groupId);
    if (!group) {
      return NextResponse.json({ error: 'Group not found' }, { status: 404 });
    }

    // Check if group is claimable (claimedBy IS NULL AND no admins exist)
    const claimable = await isGroupClaimable(groupId);
    if (!claimable) {
      return NextResponse.json(
        {
          error: 'This group is not claimable. It may already be claimed or have existing admins.',
        },
        { status: 403 }
      );
    }

    const body = await request.json();

    // Validate input
    let userMessage: string;
    try {
      const validated = await claimGroupFormSchema.validate({ groupId, ...body });
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
    const claimId = await createGroupClaim(session.user.id, groupId, userMessage);

    // TODO: Phase 5 - Send email notification to support@quilombo.net
    // await sendClaimSubmittedEmail('support@quilombo.net', {
    //   claimId,
    //   groupId,
    //   groupName: group.name,
    //   userId: session.user.id,
    //   userEmail: session.user.email,
    //   userMessage,
    // });

    return NextResponse.json({
      claimId,
      message: 'Claim submitted successfully! We will review your request and contact you via email.',
    });
  } catch (error) {
    console.error('Error submitting claim:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while submitting claim') },
      { status: 500 }
    );
  }
}
