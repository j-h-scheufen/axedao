/**
 * GROUP CLAIMS QUERIES
 * Group ownership claiming workflow with admin approval
 */

import { eq } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { db } from '@/db';
import { NotFoundError } from '@/utils/errors';
import { addGroupAdmin } from './groups';

/**
 * Checks if a group is claimable (claimedBy IS NULL AND no admins exist).
 *
 * @param groupId - ID of the group to check
 * @returns True if group is claimable, false otherwise
 */
export async function isGroupClaimable(groupId: string): Promise<boolean> {
  // Single query with left join to check both conditions at once
  const result = await db
    .select({
      claimedBy: schema.groups.claimedBy,
      adminUserId: schema.groupAdmins.userId,
    })
    .from(schema.groups)
    .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
    .where(eq(schema.groups.id, groupId))
    .limit(1);

  // If no group found, not claimable
  if (result.length === 0) {
    return false;
  }

  const { claimedBy, adminUserId } = result[0];

  // Group is claimable only if claimedBy IS NULL AND no admins exist
  return claimedBy === null && adminUserId === null;
}

/**
 * Creates a new group claim request.
 *
 * @param userId - ID of the user claiming the group
 * @param groupId - ID of the group being claimed
 * @param message - User's explanation for why they should be admin
 * @returns The created claim ID
 */
export async function createGroupClaim(userId: string, groupId: string, message: string): Promise<string> {
  const result = await db
    .insert(schema.groupClaims)
    .values({
      userId,
      groupId,
      userMessage: message,
      status: 'pending',
      requestedAt: new Date(),
    })
    .returning({ id: schema.groupClaims.id });

  return result[0].id;
}

/**
 * Fetches all pending group claims for admin review.
 *
 * @returns Array of pending claims with group and user info
 */
export async function getPendingClaims(): Promise<
  Array<schema.SelectGroupClaim & { group: schema.SelectGroup | null; user: schema.SelectUser | null }>
> {
  const results = await db
    .select({
      id: schema.groupClaims.id,
      groupId: schema.groupClaims.groupId,
      userId: schema.groupClaims.userId,
      status: schema.groupClaims.status,
      requestedAt: schema.groupClaims.requestedAt,
      processedAt: schema.groupClaims.processedAt,
      processedBy: schema.groupClaims.processedBy,
      userMessage: schema.groupClaims.userMessage,
      adminNotes: schema.groupClaims.adminNotes,
      group: schema.groups,
      user: schema.users,
    })
    .from(schema.groupClaims)
    .leftJoin(schema.groups, eq(schema.groupClaims.groupId, schema.groups.id))
    .leftJoin(schema.users, eq(schema.groupClaims.userId, schema.users.id))
    .where(eq(schema.groupClaims.status, 'pending'))
    .orderBy(schema.groupClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    groupId: r.groupId,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    group: r.group,
    user: r.user,
  }));
}

/**
 * Fetches a single claim by ID.
 *
 * @param claimId - ID of the claim to fetch
 * @returns The claim or null if not found
 */
export async function getGroupClaim(claimId: string): Promise<schema.SelectGroupClaim | null> {
  const claim = await db.query.groupClaims.findFirst({
    where: eq(schema.groupClaims.id, claimId),
  });

  return claim || null;
}

/**
 * Approves a group claim: marks it approved, adds user as admin, sets claimedBy/At.
 *
 * @param claimId - ID of the claim to approve
 * @param adminId - ID of the admin approving the claim
 * @throws NotFoundError if claim not found
 */
export async function approveClaim(claimId: string, adminId: string): Promise<void> {
  // Get the claim details
  const claim = await getGroupClaim(claimId);

  if (!claim) {
    throw new NotFoundError('Claim', claimId);
  }

  // Update claim status
  await db
    .update(schema.groupClaims)
    .set({
      status: 'approved',
      processedAt: new Date(),
      processedBy: adminId,
    })
    .where(eq(schema.groupClaims.id, claimId));

  // Add user as group admin
  await addGroupAdmin({ groupId: claim.groupId, userId: claim.userId });

  // Update group's claimedBy and claimedAt
  await db
    .update(schema.groups)
    .set({
      claimedBy: claim.userId,
      claimedAt: new Date(),
    })
    .where(eq(schema.groups.id, claim.groupId));

  // Add user to the group
  await db.update(schema.users).set({ groupId: claim.groupId }).where(eq(schema.users.id, claim.userId));
}

/**
 * Rejects a group claim with admin notes.
 *
 * @param claimId - ID of the claim to reject
 * @param adminId - ID of the admin rejecting the claim
 * @param notes - Admin's reason for rejection
 * @throws NotFoundError if claim not found
 */
export async function rejectClaim(claimId: string, adminId: string, notes: string): Promise<void> {
  // Get the claim details
  const claim = await db.query.groupClaims.findFirst({
    where: eq(schema.groupClaims.id, claimId),
  });

  if (!claim) {
    throw new NotFoundError('Claim', claimId);
  }

  await db
    .update(schema.groupClaims)
    .set({
      status: 'rejected',
      processedAt: new Date(),
      processedBy: adminId,
      adminNotes: notes,
    })
    .where(eq(schema.groupClaims.id, claimId));
}

/**
 * Fetches all claims for a specific group (for history/audit).
 *
 * @param groupId - ID of the group
 * @returns Array of all claims for this group
 */
export async function getGroupClaims(
  groupId: string
): Promise<Array<schema.SelectGroupClaim & { user: schema.SelectUser | null }>> {
  const results = await db
    .select({
      id: schema.groupClaims.id,
      groupId: schema.groupClaims.groupId,
      userId: schema.groupClaims.userId,
      status: schema.groupClaims.status,
      requestedAt: schema.groupClaims.requestedAt,
      processedAt: schema.groupClaims.processedAt,
      processedBy: schema.groupClaims.processedBy,
      userMessage: schema.groupClaims.userMessage,
      adminNotes: schema.groupClaims.adminNotes,
      user: schema.users,
    })
    .from(schema.groupClaims)
    .leftJoin(schema.users, eq(schema.groupClaims.userId, schema.users.id))
    .where(eq(schema.groupClaims.groupId, groupId))
    .orderBy(schema.groupClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    groupId: r.groupId,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    user: r.user,
  }));
}
