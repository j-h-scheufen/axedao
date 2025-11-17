/**
 * GROUP VERIFICATION QUERIES
 * Community-driven group verification system with 30-day cooldown
 */

import { and, count, eq, gte } from 'drizzle-orm';

import { GROUP_VERIFICATION_COOLDOWN_MS } from '@/config/constants';
import * as schema from '@/db/schema';
import { db } from '@/db';

/**
 * Checks if a group can be verified (hasn't been verified by ANY user in the cooldown period).
 * The cooldown is global per-group, not per-user.
 *
 * @param groupId - ID of the group to verify
 * @returns True if group can be verified, false if on cooldown
 */
export async function canVerifyGroup(groupId: string): Promise<boolean> {
  const cooldownCutoff = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS);

  // Check if ANY user has verified this group during the cooldown period
  const recentVerification = await db.query.groupVerifications.findFirst({
    where: and(
      eq(schema.groupVerifications.groupId, groupId),
      gte(schema.groupVerifications.verifiedAt, cooldownCutoff)
    ),
  });

  return !recentVerification;
}

/**
 * Records a group verification by a user.
 *
 * @param userId - ID of the user verifying the group
 * @param groupId - ID of the group being verified
 * @param notes - Optional notes about what was verified
 */
export async function verifyGroup(userId: string, groupId: string, notes?: string): Promise<void> {
  await db.insert(schema.groupVerifications).values({
    userId,
    groupId,
    notes: notes || null,
    verifiedAt: new Date(),
  });
}

/**
 * Fetches the complete verification history for a group.
 *
 * @param groupId - ID of the group
 * @returns Array of verification records with user info
 */
export async function getGroupVerificationHistory(
  groupId: string
): Promise<Array<schema.SelectGroupVerification & { user: schema.SelectUser | null }>> {
  const results = await db
    .select({
      id: schema.groupVerifications.id,
      groupId: schema.groupVerifications.groupId,
      userId: schema.groupVerifications.userId,
      verifiedAt: schema.groupVerifications.verifiedAt,
      notes: schema.groupVerifications.notes,
      user: schema.users,
    })
    .from(schema.groupVerifications)
    .leftJoin(schema.users, eq(schema.groupVerifications.userId, schema.users.id))
    .where(eq(schema.groupVerifications.groupId, groupId))
    .orderBy(schema.groupVerifications.verifiedAt);

  return results.map((r) => ({
    id: r.id,
    groupId: r.groupId,
    userId: r.userId,
    verifiedAt: r.verifiedAt,
    notes: r.notes,
    user: r.user,
  }));
}

/**
 * Counts how many times a user has verified groups (for gamification).
 *
 * @param userId - ID of the user
 * @returns Number of verifications performed by this user
 */
export async function getUserVerificationCount(userId: string): Promise<number> {
  const result = await db
    .select({ count: count() })
    .from(schema.groupVerifications)
    .where(eq(schema.groupVerifications.userId, userId));

  return result[0]?.count || 0;
}

/**
 * Gets the most recent verification for a group.
 * Replaces the removed lastVerifiedBy/lastVerifiedAt fields.
 *
 * @param groupId - ID of the group
 * @returns The latest verification record or null
 */
export async function getLatestGroupVerification(groupId: string): Promise<schema.SelectGroupVerification | null> {
  const result = await db.query.groupVerifications.findFirst({
    where: eq(schema.groupVerifications.groupId, groupId),
    orderBy: (verifications, { desc }) => [desc(verifications.verifiedAt)],
  });

  return result || null;
}
