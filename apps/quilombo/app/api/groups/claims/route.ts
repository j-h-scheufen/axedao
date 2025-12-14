import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { claimGroupFormSchema, registerGroupFormSchema } from '@/config/validation-schema';
import {
  createGenealogyGroupClaim,
  createNewGroupClaim,
  getUserGroupClaims,
  isGroupAdminClaimable,
  hasPendingGenealogyGroupClaim,
} from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/groups/claims:
 *   get:
 *     summary: Get user's group claims
 *     description: Returns all group claims submitted by the authenticated user.
 *     tags:
 *       - Groups
 *       - Claims
 *     security:
 *       - session: []
 *     responses:
 *       200:
 *         description: List of user's claims
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
 *                   status:
 *                     type: string
 *                     enum: [pending, approved, rejected]
 *                   requestedAt:
 *                     type: string
 *                     format: date-time
 *                   userMessage:
 *                     type: string
 *                   adminNotes:
 *                     type: string
 *                     nullable: true
 *       401:
 *         description: Unauthorized - user not authenticated
 *       500:
 *         description: Server error
 */
export async function GET() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const claims = await getUserGroupClaims(session.user.id);
    return NextResponse.json(claims);
  } catch (error) {
    console.error('Error fetching user claims:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while fetching claims') },
      { status: 500 }
    );
  }
}

/**
 * @openapi
 * /api/groups/claims:
 *   post:
 *     summary: Submit a group claim request
 *     description: |
 *       Submits a claim request. Two types are supported:
 *
 *       1. **genealogy_group**: Claim an existing genealogy group profile
 *          - Requires `profileId` and `userMessage`
 *          - Creates a claim that links to the genealogy profile
 *
 *       2. **new_group**: Register a new group not in genealogy
 *          - Requires `proposedName` and `userMessage`
 *          - Optional: `proposedStyle`, `website`
 *          - On approval, creates both genealogy profile AND groups entry
 *     tags:
 *       - Groups
 *       - Claims
 *     security:
 *       - session: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             oneOf:
 *               - type: object
 *                 required:
 *                   - type
 *                   - profileId
 *                   - userMessage
 *                 properties:
 *                   type:
 *                     type: string
 *                     enum: [genealogy_group]
 *                   profileId:
 *                     type: string
 *                     format: uuid
 *                   userMessage:
 *                     type: string
 *                     minLength: 20
 *               - type: object
 *                 required:
 *                   - type
 *                   - proposedName
 *                   - userMessage
 *                 properties:
 *                   type:
 *                     type: string
 *                     enum: [new_group]
 *                   proposedName:
 *                     type: string
 *                     minLength: 2
 *                   proposedStyle:
 *                     type: string
 *                     enum: [angola, regional, contemporanea, mixed]
 *                     nullable: true
 *                   website:
 *                     type: string
 *                     format: uri
 *                   userMessage:
 *                     type: string
 *                     minLength: 20
 *     responses:
 *       201:
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
 *         description: Invalid input or validation error
 *       401:
 *         description: Unauthorized - user not authenticated
 *       409:
 *         description: Conflict - group already claimed or pending claim exists
 *       500:
 *         description: Server error
 */
export async function POST(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const body = await request.json();
    const { type } = body;

    if (!type || !['genealogy_group', 'new_group'].includes(type)) {
      return NextResponse.json(
        { error: 'Invalid claim type. Must be "genealogy_group" or "new_group"' },
        { status: 400 }
      );
    }

    let claimId: string;

    if (type === 'genealogy_group') {
      // Validate genealogy group claim
      const { profileId } = body;
      if (!profileId) {
        return NextResponse.json({ error: 'profileId is required for genealogy group claims' }, { status: 400 });
      }

      // Validate userMessage
      try {
        await claimGroupFormSchema.validate({ userMessage: body.userMessage });
      } catch (validationError) {
        const error = validationError as { errors?: string[] };
        return NextResponse.json({ error: error.errors?.[0] || 'Validation failed' }, { status: 400 });
      }

      // Check if group is admin-claimable
      const isClaimable = await isGroupAdminClaimable(profileId);
      if (!isClaimable) {
        return NextResponse.json({ error: 'This group has already been claimed' }, { status: 409 });
      }

      // Check for existing pending claim
      const hasPending = await hasPendingGenealogyGroupClaim(session.user.id, profileId);
      if (hasPending) {
        return NextResponse.json({ error: 'You already have a pending claim for this group' }, { status: 409 });
      }

      claimId = await createGenealogyGroupClaim(session.user.id, profileId, body.userMessage);
    } else {
      // Validate new group registration
      try {
        await registerGroupFormSchema.validate({
          proposedName: body.proposedName,
          proposedStyle: body.proposedStyle,
          website: body.website,
          userMessage: body.userMessage,
        });
      } catch (validationError) {
        const error = validationError as { errors?: string[] };
        return NextResponse.json({ error: error.errors?.[0] || 'Validation failed' }, { status: 400 });
      }

      claimId = await createNewGroupClaim(session.user.id, {
        proposedName: body.proposedName,
        proposedStyle: body.proposedStyle || null,
        website: body.website,
        userMessage: body.userMessage,
      });
    }

    return NextResponse.json(
      {
        claimId,
        message: 'Claim submitted successfully. A global admin will review your request.',
      },
      { status: 201 }
    );
  } catch (error) {
    console.error('Error submitting claim:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while submitting claim') },
      { status: 500 }
    );
  }
}
