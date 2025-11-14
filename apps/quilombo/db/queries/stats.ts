/**
 * STATISTICS QUERIES
 * Public statistics for homepage and dashboards
 */

import { count, countDistinct, eq, gte } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { db } from '@/db';

export interface PublicStats {
  activeUsers: number;
  totalGroups: number;
  verifiedGroups: number;
  upcomingEvents: number;
}

/**
 * Fetches public statistics for display on the homepage.
 *
 * @returns Object containing counts of active users, total/verified groups, and upcoming events
 */
export async function fetchPublicStats(): Promise<PublicStats> {
  const now = new Date();

  // Count active users
  const activeUsersResult = await db
    .select({ value: count() })
    .from(schema.users)
    .where(eq(schema.users.accountStatus, 'active'));

  // Count total groups
  const totalGroupsResult = await db.select({ value: count() }).from(schema.groups);

  // Count verified groups (count distinct groups that have at least one verification)
  const verifiedGroupsResult = await db
    .select({ value: countDistinct(schema.groupVerifications.groupId) })
    .from(schema.groupVerifications);

  // Count upcoming events (start date >= now)
  const upcomingEventsResult = await db
    .select({ value: count() })
    .from(schema.events)
    .where(gte(schema.events.start, now));

  return {
    activeUsers: activeUsersResult[0]?.value ?? 0,
    totalGroups: totalGroupsResult[0]?.value ?? 0,
    verifiedGroups: verifiedGroupsResult[0]?.value ?? 0,
    upcomingEvents: upcomingEventsResult[0]?.value ?? 0,
  };
}
