import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { verifyGroupFormSchema } from '@/config/validation-schema';
import { canVerifyGroup, verifyGroup, fetchGroup } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * @openapi
 * /api/groups/{groupId}/verify:
 *   post:
 *     summary: Verify a group
 *     description: |
 *       Allows authenticated users to verify a group's information.
 *       Rate limited to once per 30 days per group (global cooldown, not per-user).
 *       Verification confirms: 1) group website/contact is valid, 2) group is active, 3) information is accurate.
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
 *             properties:
 *               notes:
 *                 type: string
 *                 description: Optional notes about what was verified
 *     responses:
 *       200:
 *         description: Group verified successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 nextVerificationDate:
 *                   type: string
 *                   format: date-time
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
 *       404:
 *         description: Group not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       429:
 *         description: Rate limit - group was verified within last 30 days (by any user)
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

    const body = await request.json();

    // Validate input
    try {
      await verifyGroupFormSchema.validate({ groupId, ...body });
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

    // Check if group can be verified (30-day global cooldown)
    const canVerify = await canVerifyGroup(groupId);
    if (!canVerify) {
      return NextResponse.json(
        { error: 'This group was recently verified. Groups can only be verified once every 30 days.' },
        { status: 429 }
      );
    }

    // Add verification record
    await verifyGroup(session.user.id, groupId, body.notes || undefined);

    // Calculate next verification date (30 days from now)
    const nextVerificationDate = new Date();
    nextVerificationDate.setDate(nextVerificationDate.getDate() + 30);

    return NextResponse.json({
      message: 'Group verified successfully. Thank you for contributing!',
      nextVerificationDate: nextVerificationDate.toISOString(),
    });
  } catch (error) {
    console.error('Error verifying group:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while verifying group') },
      { status: 500 }
    );
  }
}
