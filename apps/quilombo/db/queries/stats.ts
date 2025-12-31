/**
 * STATISTICS QUERIES
 * Public statistics for homepage and dashboards
 */

import { count, countDistinct, eq, gte } from 'drizzle-orm';

import * as schema from '@/db/schema';
import * as genealogySchema from '@/db/schema/genealogy';
import { db } from '@/db';

/**
 * Genealogy statistics - counts from the genealogy schema
 */
export interface GenealogyStats {
  groups: number;
  persons: number;
}

/**
 * Platform statistics - counts from the public schema
 */
export interface PlatformStats {
  users: number;
  managedGroups: number;
  upcomingEvents: number;
  groupLocations: number;
}

/**
 * Combined public statistics response
 */
export interface PublicStats {
  genealogy: GenealogyStats;
  platform: PlatformStats;
}

/**
 * Fetches public statistics for display on the homepage.
 *
 * @returns Object containing genealogy and platform statistics
 */
export async function fetchPublicStats(): Promise<PublicStats> {
  const now = new Date();

  // Genealogy stats
  const genealogyGroupsResult = await db.select({ value: count() }).from(genealogySchema.groupProfiles);

  const genealogyPersonsResult = await db.select({ value: count() }).from(genealogySchema.personProfiles);

  // Platform stats
  const activeUsersResult = await db
    .select({ value: count() })
    .from(schema.users)
    .where(eq(schema.users.accountStatus, 'active'));

  // Count groups with at least one admin (managed groups)
  const managedGroupsResult = await db
    .select({ value: countDistinct(schema.groupAdmins.groupId) })
    .from(schema.groupAdmins);

  // Count upcoming events (start date >= now)
  const upcomingEventsResult = await db
    .select({ value: count() })
    .from(schema.events)
    .where(gte(schema.events.start, now));

  // Count group locations
  const groupLocationsResult = await db.select({ value: count() }).from(schema.groupLocations);

  return {
    genealogy: {
      groups: genealogyGroupsResult[0]?.value ?? 0,
      persons: genealogyPersonsResult[0]?.value ?? 0,
    },
    platform: {
      users: activeUsersResult[0]?.value ?? 0,
      managedGroups: managedGroupsResult[0]?.value ?? 0,
      upcomingEvents: upcomingEventsResult[0]?.value ?? 0,
      groupLocations: groupLocationsResult[0]?.value ?? 0,
    },
  };
}
