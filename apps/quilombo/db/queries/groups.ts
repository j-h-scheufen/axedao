/**
 * GROUP QUERIES
 * Group CRUD operations and membership management
 */

import { and, count, eq, ilike, ne, notExists, sql, type SQLWrapper } from 'drizzle-orm';

import type { GroupSearchParamsWithFilters } from '@/config/validation-schema';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import * as schema from '@/db/schema';
import { db } from '@/db';
import type { Group } from '@/types/model';

/**
 * Searches groups with optional filters and pagination.
 * Includes country codes and verification status.
 *
 * @param options - Search parameters including searchTerm, filters, pagination
 * @returns Paginated list of groups with total count
 */
export async function searchGroups(
  options: GroupSearchParamsWithFilters
): Promise<{ rows: Group[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, filters } = options;
  const { verified, countryCodes, styles } = filters || {};

  const sqlFilters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) sqlFilters.push(ilike(schema.groups.name, `%${searchTerm}%`));

  // Filter by verification status using subquery on group_verifications
  if (typeof verified === 'boolean') {
    if (verified) {
      // Show only verified groups (have at least one verification)
      sqlFilters.push(sql`EXISTS (
        SELECT 1 FROM ${schema.groupVerifications}
        WHERE ${schema.groupVerifications.groupId} = ${schema.groups.id}
      )`);
    } else {
      // Show only unverified groups (no verifications)
      sqlFilters.push(sql`NOT EXISTS (
        SELECT 1 FROM ${schema.groupVerifications}
        WHERE ${schema.groupVerifications.groupId} = ${schema.groups.id}
      )`);
    }
  }

  // Filter by country codes
  if (countryCodes && countryCodes.length > 0) {
    sqlFilters.push(sql`EXISTS (
      SELECT 1 FROM ${schema.groupLocations}
      WHERE ${schema.groupLocations.groupId} = ${schema.groups.id}
        AND ${schema.groupLocations.countryCode} IN ${countryCodes}
    )`);
  }

  // Filter by styles
  if (styles && styles.length > 0) {
    sqlFilters.push(sql`${schema.groups.style} IN ${styles}`);
  }

  const results = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      name: schema.groups.name,
      description: schema.groups.description,
      style: schema.groups.style,
      email: schema.groups.email,
      logo: schema.groups.logo,
      banner: schema.groups.banner,
      leader: schema.groups.leader,
      founder: schema.groups.founder,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,

      // Compute lastVerifiedAt (returns string ISO timestamp)
      lastVerifiedAt: sql<string | null>`(
        SELECT MAX(${schema.groupVerifications.verifiedAt})
        FROM ${schema.groupVerifications}
        WHERE ${schema.groupVerifications.groupId} = ${schema.groups.id}
      )`.as('last_verified_at'),

      // Compute adminCount
      adminCount: sql<number>`(
        SELECT COUNT(*)
        FROM ${schema.groupAdmins}
        WHERE ${schema.groupAdmins.groupId} = ${schema.groups.id}
      )`.as('admin_count'),

      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
      count: sql<number>`count(*) over()`,
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(sqlFilters.length ? and(...sqlFilters) : undefined)
    .groupBy(schema.groups.id)
    .limit(pageSize)
    .offset(offset);

  // Convert lastVerifiedAt strings to Date objects and ensure adminCount is a number
  const rows = results.map((row) => ({
    ...row,
    lastVerifiedAt: row.lastVerifiedAt ? new Date(row.lastVerifiedAt) : null,
    adminCount: Number(row.adminCount),
  })) as Group[];

  return {
    rows,
    totalCount: results.length > 0 ? results[0].count : 0,
  };
}

/**
 * Efficiently fetch a single group and its countryCodes using a single query with aggregation.
 *
 * @param groupId - ID of the group to fetch
 * @returns Group with country codes or undefined if not found
 */
export async function fetchGroup(groupId: string): Promise<Group | undefined> {
  const result = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      name: schema.groups.name,
      description: schema.groups.description,
      style: schema.groups.style,
      email: schema.groups.email,
      logo: schema.groups.logo,
      banner: schema.groups.banner,
      leader: schema.groups.leader,
      founder: schema.groups.founder,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,

      // Get most recent verification date (returns string ISO timestamp)
      lastVerifiedAt: sql<string | null>`
        (
          SELECT MAX(${schema.groupVerifications.verifiedAt})
          FROM ${schema.groupVerifications}
          WHERE ${schema.groupVerifications.groupId} = ${schema.groups.id}
        )
      `.as('last_verified_at'),

      // Get admin count
      adminCount: sql<number>`
        (
          SELECT COUNT(*)
          FROM ${schema.groupAdmins}
          WHERE ${schema.groupAdmins.groupId} = ${schema.groups.id}
        )
      `.as('admin_count'),

      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(eq(schema.groups.id, groupId))
    .groupBy(schema.groups.id)
    .limit(1);

  if (!result[0]) return undefined;

  // Convert lastVerifiedAt string to Date object and ensure adminCount is a number
  const group = result[0];
  return {
    ...group,
    lastVerifiedAt: group.lastVerifiedAt ? new Date(group.lastVerifiedAt) : null,
    adminCount: Number(group.adminCount),
  } as Group;
}

/**
 * Checks if a user is a regular member of a group (not leader or admin).
 *
 * @param groupId - ID of the group
 * @param userId - ID of the user
 * @returns True if user is a regular member (not leader/admin)
 */
export async function isGroupMember(groupId: string, userId: string): Promise<boolean> {
  const result = await db
    .select()
    .from(schema.users)
    .fullJoin(schema.groups, eq(schema.groups.id, groupId))
    .where(
      and(
        eq(schema.users.id, userId),
        eq(schema.users.groupId, groupId),
        ne(schema.groups.leader, userId),
        notExists(
          db
            .select()
            .from(schema.groupAdmins)
            .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId)))
        )
      )
    );
  return !!result.length;
}

/**
 * Checks if a user is an admin of a group.
 *
 * @param groupId - ID of the group
 * @param userId - ID of the user
 * @returns True if user is group admin
 */
export async function isGroupAdmin(groupId: string, userId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId)));
  return result.length > 0 && result[0].value > 0;
}

/**
 * Fetches all members of a group.
 *
 * @param groupId - ID of the group
 * @returns List of users in the group
 */
export async function fetchGroupMembers(groupId: string): Promise<schema.SelectUser[]> {
  return await db
    .select()
    .from(schema.users)
    .where(and(eq(schema.users.groupId, groupId)));
}

/**
 * Fetches IDs of all group admins.
 *
 * @param groupId - ID of the group
 * @returns Array of user IDs who are admins
 */
export async function fetchGroupAdminIds(groupId: string): Promise<string[]> {
  const result = await db
    .select({ id: schema.groupAdmins.userId })
    .from(schema.groupAdmins)
    .where(eq(schema.groupAdmins.groupId, groupId));
  return result.map((entry) => entry.id);
}

/**
 * Creates a new group.
 *
 * @param group - Group data to insert
 * @returns The created group or undefined if creation failed
 */
export async function insertGroup(group: schema.InsertGroup): Promise<Group | undefined> {
  await db.insert(schema.groups).values(group);
  return fetchGroup(group.id);
}

/**
 * Deletes a group and all related data (cascade).
 *
 * @param groupId - ID of the group to delete
 */
export async function deleteGroup(groupId: string) {
  await db.delete(schema.groups).where(eq(schema.groups.id, groupId));
}

/**
 * Removes a user from their group by setting groupId to null.
 *
 * @param memberId - ID of the user to remove from group
 */
export async function removeGroupMember(memberId: string) {
  await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.id, memberId));
}

/**
 * Updates an existing group.
 *
 * @param group - Partial group data to update (must include id)
 * @returns Updated group or undefined if not found
 */
export async function updateGroup(group: Partial<schema.InsertGroup> & { id: string }) {
  const groups = await db.update(schema.groups).set(group).where(eq(schema.groups.id, group.id)).returning();
  return groups.length ? groups[0] : undefined;
}

/**
 * Adds a user as a group admin.
 *
 * @param entry - Group admin entry (groupId, userId)
 */
export async function addGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db.insert(schema.groupAdmins).values(entry).onConflictDoNothing(); // Ignore if already exists
}

/**
 * Removes admin privileges from a user for a specific group.
 *
 * @param groupId - ID of the group
 * @param adminId - ID of the admin to remove
 */
export async function removeGroupAdmin(groupId: string, adminId: string) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, adminId)));
}

/**
 * Get distinct country codes from group locations.
 * Only returns countries that have at least one group.
 * Results are sorted alphabetically.
 *
 * @returns Array of ISO 3166-1 alpha-2 country codes
 */
export async function getDistinctCountryCodes(): Promise<string[]> {
  const results = await db
    .selectDistinct({ countryCode: schema.groupLocations.countryCode })
    .from(schema.groupLocations)
    .where(sql`${schema.groupLocations.countryCode} IS NOT NULL`)
    .orderBy(schema.groupLocations.countryCode);

  return results.map((r) => r.countryCode).filter(Boolean) as string[];
}
