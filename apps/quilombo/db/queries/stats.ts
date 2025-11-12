/**
 * STATISTICS QUERIES
 * Public statistics for homepage and dashboards
 */

import { count, countDistinct, eq, gte } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { db } from '@/db/connection';

export interface PublicStats {
  activeUsers: number;
  verifiedGroups: number;
  unverifiedGroups: number;
  upcomingEvents: number;
}

/**
 * Fetches public statistics for display on the homepage.
 *
 * @returns Object containing counts of active users, verified/unverified groups, and upcoming events
 */
export async function fetchPublicStats(): Promise<PublicStats> {
  const now = new Date();

  // Count active users
  const activeUsersResult = await db
    .select({ value: count() })
    .from(schema.users)
    .where(eq(schema.users.accountStatus, 'active'));

  // Count verified groups (count distinct groups that have at least one verification)
  const verifiedGroupsResult = await db
    .select({ value: countDistinct(schema.groupVerifications.groupId) })
    .from(schema.groupVerifications);

  // Count total groups
  const totalGroupsResult = await db.select({ value: count() }).from(schema.groups);

  // Calculate unverified groups (total groups minus verified groups)
  const verifiedCount = verifiedGroupsResult[0]?.value ?? 0;
  const totalCount = totalGroupsResult[0]?.value ?? 0;
  const unverifiedCount = totalCount - verifiedCount;

  // Count upcoming events (start date >= now)
  const upcomingEventsResult = await db
    .select({ value: count() })
    .from(schema.events)
    .where(gte(schema.events.start, now));

  return {
    activeUsers: activeUsersResult[0]?.value ?? 0,
    verifiedGroups: verifiedCount,
    unverifiedGroups: unverifiedCount,
    upcomingEvents: upcomingEventsResult[0]?.value ?? 0,
  };
}
