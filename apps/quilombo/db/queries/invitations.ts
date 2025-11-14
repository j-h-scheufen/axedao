/**
 * INVITATION QUERIES
 * Invitation system (email-bound and open QR code invitations)
 */

import { and, eq, gte, lt } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { db } from '@/db';
import type { InvitationType } from '@/types/model';

/**
 * Creates a new invitation.
 * - For email_bound: Replaces any existing pending invites for the same email
 * - For open: Invalidates user's existing active open invite first
 *
 * @param createdBy - User ID creating the invitation
 * @param type - Invitation type ('email_bound' or 'open')
 * @param invitedEmail - Required for email_bound, null for open
 * @returns The created invitation
 */
export async function createInvitation(
  createdBy: string,
  type: InvitationType,
  invitedEmail?: string
): Promise<schema.SelectInvitation> {
  // Calculate expiry based on type
  const expiresAt = new Date();
  if (type === 'email_bound') {
    expiresAt.setDate(expiresAt.getDate() + 30); // 30 days for email-bound
  } else {
    expiresAt.setHours(expiresAt.getHours() + 72); // 72 hours for open
  }

  // Type-specific pre-creation logic
  if (type === 'email_bound' && invitedEmail) {
    // Replace any existing pending email-bound invites for the same email
    await db
      .update(schema.invitations)
      .set({ status: 'expired' })
      .where(
        and(
          eq(schema.invitations.type, 'email_bound'),
          eq(schema.invitations.invitedEmail, invitedEmail.toLowerCase()),
          eq(schema.invitations.status, 'pending')
        )
      );
  } else if (type === 'open') {
    // Invalidate user's existing active open invites
    await invalidateUserOpenInvites(createdBy);
  }

  // Create the new invitation
  const invitations = await db
    .insert(schema.invitations)
    .values({
      createdBy,
      type,
      invitedEmail: invitedEmail?.toLowerCase() || null,
      expiresAt,
      status: 'pending',
    })
    .returning();

  if (!invitations.length) {
    throw new Error('Failed to create invitation');
  }

  return invitations[0];
}

/**
 * Marks all pending open invites for a user as expired.
 * Used when generating a new open invite (QR code).
 *
 * @param userId - ID of the user whose open invites should be invalidated
 */
export async function invalidateUserOpenInvites(userId: string): Promise<void> {
  await db
    .update(schema.invitations)
    .set({ status: 'expired' })
    .where(
      and(
        eq(schema.invitations.createdBy, userId),
        eq(schema.invitations.type, 'open'),
        eq(schema.invitations.status, 'pending')
      )
    );
}

/**
 * Finds a valid (pending, non-expired) invitation by code.
 * - For email_bound: Validates both code and email match
 * - For open: Only validates code
 *
 * @param code - Invitation code (UUID)
 * @param email - Optional email (required for email_bound validation)
 * @returns The invitation if valid, null otherwise
 */
export async function findValidInvitation(code: string, email?: string): Promise<schema.SelectInvitation | null> {
  const invitation = await db.query.invitations.findFirst({
    where: and(
      eq(schema.invitations.code, code),
      eq(schema.invitations.status, 'pending'),
      gte(schema.invitations.expiresAt, new Date())
    ),
  });

  if (!invitation) return null;

  // For email_bound invitations, validate email match
  if (invitation.type === 'email_bound') {
    if (!email || invitation.invitedEmail !== email.toLowerCase()) {
      return null;
    }
  }

  return invitation;
}

/**
 * Gets the user's currently active open invite (if any).
 *
 * @param userId - ID of the user
 * @returns Active open invitation or undefined if none exists
 */
export async function getUserActiveOpenInvite(userId: string): Promise<schema.SelectInvitation | undefined> {
  return await db.query.invitations.findFirst({
    where: and(
      eq(schema.invitations.createdBy, userId),
      eq(schema.invitations.type, 'open'),
      eq(schema.invitations.status, 'pending'),
      gte(schema.invitations.expiresAt, new Date())
    ),
  });
}

/**
 * Marks an email-bound invitation as accepted (single-use).
 * Only called for email_bound invitations, not open.
 *
 * @param code - Invitation code
 * @param acceptedBy - User ID of the person accepting the invitation
 */
export async function markInvitationAccepted(code: string, acceptedBy: string): Promise<void> {
  await db
    .update(schema.invitations)
    .set({
      status: 'accepted',
      acceptedAt: new Date(),
      acceptedBy,
    })
    .where(eq(schema.invitations.code, code));
}

/**
 * Cron job: Marks expired invitations as expired.
 * Should be run periodically to clean up old invites.
 */
export async function expireOldInvitations(): Promise<void> {
  await db
    .update(schema.invitations)
    .set({ status: 'expired' })
    .where(and(eq(schema.invitations.status, 'pending'), lt(schema.invitations.expiresAt, new Date())));
}
