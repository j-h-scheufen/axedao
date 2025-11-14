import { NextResponse } from 'next/server';
import { eq } from 'drizzle-orm';
import { ValidationError } from 'yup';

import { validateInvitationSchema } from '@/config/validation-schema';
import { findValidInvitation } from '@/db';
import { db } from '@/db';
import { users } from '@/db/schema';
import { getUserDisplayName } from '@/utils';

/**
 * @openapi
 * /api/invitations/validate:
 *   post:
 *     summary: Validate an invitation code
 *     description: |
 *       Validates an invitation code and returns invitation details.
 *       For email_bound invitations, validates both code and email match.
 *       For open invitations, only validates the code.
 *       Public endpoint - no authentication required.
 *     tags:
 *       - Invitations
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - code
 *             properties:
 *               code:
 *                 type: string
 *                 format: uuid
 *                 description: Invitation code to validate
 *               email:
 *                 type: string
 *                 format: email
 *                 description: Optional - only validated for email_bound invitations
 *     responses:
 *       200:
 *         description: Invitation validation result
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 valid:
 *                   type: boolean
 *                 type:
 *                   type: string
 *                   enum: [email_bound, open]
 *                 inviterName:
 *                   type: string
 *                   description: Display name of user who created invitation
 *                 expiresAt:
 *                   type: string
 *                   format: date-time
 *                 invitedEmail:
 *                   type: string
 *                   format: email
 *                   description: Only present for email_bound type
 *       400:
 *         description: Invalid or expired invitation
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
export async function POST(request: Request) {
  try {
    const body = await request.json();

    // Validate request body
    const validatedData = await validateInvitationSchema.validate(body, { abortEarly: true });

    // Find valid invitation
    const invitation = await findValidInvitation(validatedData.code, validatedData.email);

    if (!invitation) {
      // Generic error to prevent user enumeration
      return NextResponse.json({ error: 'Invalid or expired invitation' }, { status: 400 });
    }

    // Fetch inviter details
    const inviter = await db.query.users.findFirst({
      where: eq(users.id, invitation.createdBy),
    });

    const inviterName = getUserDisplayName(inviter);

    return NextResponse.json(
      {
        valid: true,
        type: invitation.type,
        inviterName,
        expiresAt: invitation.expiresAt.toISOString(),
        ...(invitation.invitedEmail && { invitedEmail: invitation.invitedEmail }),
      },
      { status: 200 }
    );
  } catch (error: unknown) {
    // Yup validation errors
    if (error instanceof ValidationError) {
      return NextResponse.json({ error: error.errors[0] || 'Validation failed' }, { status: 400 });
    }

    console.error('Failed to validate invitation:', error);
    return NextResponse.json({ error: 'Failed to validate invitation' }, { status: 500 });
  }
}
