import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';
import { ValidationError } from 'yup';

import { getBaseUrl } from '@/config/environment';
import { nextAuthOptions } from '@/config/next-auth-options';
import { invitationSchema } from '@/config/validation-schema';
import { createInvitation, fetchUser } from '@/db';
import { getUserDisplayName } from '@/utils';
import { sendInvitationEmail } from '@/utils/email';

/**
 * @openapi
 * /api/invitations:
 *   post:
 *     summary: Create a new invitation
 *     description: |
 *       Creates an invitation code for inviting new users.
 *       Supports two types:
 *       - email_bound: Single-use, 30-day expiry, tied to specific email
 *       - open: Multi-use, 72-hour expiry, QR code for in-person events
 *     tags:
 *       - Invitations
 *     security:
 *       - session: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - type
 *             properties:
 *               type:
 *                 type: string
 *                 enum: [email_bound, open]
 *                 description: Type of invitation
 *               invitedEmail:
 *                 type: string
 *                 format: email
 *                 description: Required for email_bound type, ignored for open type
 *               sendEmail:
 *                 type: boolean
 *                 default: false
 *                 description: Only for email_bound - whether to send invitation email via Mailjet
 *     responses:
 *       201:
 *         description: Invitation created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 code:
 *                   type: string
 *                   format: uuid
 *                   description: Invitation code (UUID)
 *                 type:
 *                   type: string
 *                   enum: [email_bound, open]
 *                 invitedEmail:
 *                   type: string
 *                   format: email
 *                   description: Only present for email_bound type
 *                 expiresAt:
 *                   type: string
 *                   format: date-time
 *                 inviteLink:
 *                   type: string
 *                   format: uri
 *                   description: Full signup URL with invitation code
 *       400:
 *         description: Validation error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized - no active session
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
    // TODO: TEMPORARY INVITE-ONLY - Require authentication
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();

    // Validate request body
    const validatedData = await invitationSchema.validate(body, { abortEarly: true });

    // Create invitation in database
    const invitation = await createInvitation(session.user.id, validatedData.type, validatedData.invitedEmail);

    // Build invite link
    const baseUrl = getBaseUrl();
    let inviteLink = `${baseUrl}/auth/signup?code=${invitation.code}`;
    if (validatedData.type === 'email_bound' && validatedData.invitedEmail) {
      inviteLink += `&email=${encodeURIComponent(validatedData.invitedEmail)}`;
    }

    // Send email if requested (email_bound only)
    if (validatedData.type === 'email_bound' && validatedData.sendEmail && validatedData.invitedEmail) {
      try {
        // Fetch full user object for display name
        const inviter = await fetchUser(session.user.id);
        const inviterName = getUserDisplayName(inviter);
        await sendInvitationEmail(validatedData.invitedEmail, invitation.code, inviterName);
      } catch (emailError) {
        console.error('Failed to send invitation email:', emailError);
        // Don't fail the request if email fails - user still gets the link
      }
    }

    return NextResponse.json(
      {
        code: invitation.code,
        type: invitation.type,
        ...(invitation.invitedEmail && { invitedEmail: invitation.invitedEmail }),
        expiresAt: invitation.expiresAt.toISOString(),
        inviteLink,
      },
      { status: 201 }
    );
  } catch (error: unknown) {
    // Yup validation errors
    if (error instanceof ValidationError) {
      return NextResponse.json({ error: error.errors[0] || 'Validation failed' }, { status: 400 });
    }

    console.error('Failed to create invitation:', error);
    return NextResponse.json({ error: 'Failed to create invitation' }, { status: 500 });
  }
}
