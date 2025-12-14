/**
 * GROUP QUERIES
 * Group CRUD operations and membership management
 */

import { and, count, eq, ilike, sql, type SQLWrapper } from 'drizzle-orm';

import type { GroupSearchParamsWithFilters } from '@/config/validation-schema';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import * as schema from '@/db/schema';
import { groupProfiles, statements } from '@/db/schema/genealogy';
import { db } from '@/db';
import type { Group } from '@/types/model';
import { applyUserPrivacyFilter } from '@/utils';

/**
 * Searches groups with optional filters and pagination.
 * Includes country codes.
 *
 * @param options - Search parameters including searchTerm, filters, pagination
 * @returns Paginated list of groups with total count
 */
export async function searchGroups(
  options: GroupSearchParamsWithFilters
): Promise<{ rows: Group[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, filters } = options;
  const { countryCodes, styles } = filters || {};

  const sqlFilters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) sqlFilters.push(ilike(schema.groups.name, `%${searchTerm}%`));

  // Filter by country codes
  if (countryCodes && countryCodes.length > 0) {
    // Normalize country codes to lowercase for case-insensitive matching
    const normalizedCountryCodes = countryCodes.filter((c): c is string => !!c).map((c) => c.toLowerCase());
    if (normalizedCountryCodes.length > 0) {
      sqlFilters.push(sql`EXISTS (
        SELECT 1 FROM ${schema.groupLocations}
        WHERE ${schema.groupLocations.groupId} = ${schema.groups.id}
          AND ${schema.groupLocations.countryCode} IN ${normalizedCountryCodes}
      )`);
    }
  }

  // Filter by styles
  if (styles && styles.length > 0) {
    sqlFilters.push(sql`${schema.groups.style} IN ${styles}`);
  }

  const results = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      // Identity fields from genealogy (source of truth)
      name: groupProfiles.name,
      description: groupProfiles.descriptionEn,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      // Operational fields from public.groups
      links: schema.groups.links, // SocialLinks (ephemeral contact/social info)
      email: schema.groups.email,
      banner: schema.groups.banner,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      profileId: schema.groups.profileId,

      // Compute adminCount
      adminCount: sql<number>`(
        SELECT COUNT(*)
        FROM ${schema.groupAdmins}
        WHERE ${schema.groupAdmins.groupId} = ${schema.groups.id}
      )`.as('admin_count'),

      // Compute countryCodes using JOIN + GROUP BY (correlated subquery doesn't work in Drizzle)
      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
    })
    .from(schema.groups)
    .innerJoin(groupProfiles, eq(schema.groups.profileId, groupProfiles.id))
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(sqlFilters.length ? and(...sqlFilters) : undefined)
    .groupBy(schema.groups.id, groupProfiles.id)
    .limit(pageSize)
    .offset(offset);

  // Ensure adminCount is a number
  const rows = results.map((row) => ({
    ...row,
    adminCount: Number(row.adminCount),
    countryCodes: row.countryCodes || [], // Ensure array even if null
  })) as Group[];

  // Calculate totalCount separately since window function doesn't work with GROUP BY + LEFT JOIN
  // The window function would count joined rows (20) instead of groups (10) with multiple locations
  // This requires a second query, but it's simpler and more maintainable than alternatives
  let totalCount = 0;
  if (sqlFilters.length > 0) {
    const countResult = await db
      .select({ count: count() })
      .from(schema.groups)
      .where(and(...sqlFilters));
    totalCount = Number(countResult[0]?.count || 0);
  } else {
    // No filters - count all groups
    const countResult = await db.select({ count: count() }).from(schema.groups);
    totalCount = Number(countResult[0]?.count || 0);
  }

  return {
    rows,
    totalCount,
  };
}

/**
 * Efficiently fetch a single group and its countryCodes using a single query with aggregation.
 * Identity data (name, description, style, logo, links) is pulled from genealogy.group_profiles
 * as the source of truth. All groups must have a linked genealogy profile.
 *
 * @param groupId - ID of the group to fetch
 * @returns Group with country codes or undefined if not found
 */
export async function fetchGroup(groupId: string): Promise<Group | undefined> {
  const result = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      // Identity fields from genealogy (source of truth)
      name: groupProfiles.name,
      description: groupProfiles.descriptionEn,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      // Operational fields from public.groups
      links: schema.groups.links, // SocialLinks (ephemeral contact/social info)
      email: schema.groups.email,
      banner: schema.groups.banner,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      profileId: schema.groups.profileId,

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
    .innerJoin(groupProfiles, eq(schema.groups.profileId, groupProfiles.id))
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(eq(schema.groups.id, groupId))
    .groupBy(schema.groups.id, groupProfiles.id)
    .limit(1);

  if (!result[0]) return undefined;

  // Ensure adminCount is a number
  const group = result[0];
  return {
    ...group,
    adminCount: Number(group.adminCount),
  } as Group;
}

/**
 * Checks if a user is a member of a group via genealogy relationship.
 * Membership is defined by a `member_of` statement from user's person profile to the group's profile.
 *
 * @param groupId - ID of the public.groups entry
 * @param userId - ID of the user
 * @returns True if user has a member_of relationship to the group
 */
export async function isGroupMember(groupId: string, userId: string): Promise<boolean> {
  // Get user's genealogy profileId and group's genealogy profileId
  const user = await db
    .select({ profileId: schema.users.profileId })
    .from(schema.users)
    .where(eq(schema.users.id, userId))
    .limit(1);

  const group = await db
    .select({ profileId: schema.groups.profileId })
    .from(schema.groups)
    .where(eq(schema.groups.id, groupId))
    .limit(1);

  if (!user[0]?.profileId || !group[0]?.profileId) {
    return false;
  }

  // Check for member_of statement
  const membership = await db
    .select({ id: statements.id })
    .from(statements)
    .where(
      and(
        eq(statements.subjectType, 'person'),
        eq(statements.subjectId, user[0].profileId),
        eq(statements.predicate, 'member_of'),
        eq(statements.objectType, 'group'),
        eq(statements.objectId, group[0].profileId)
      )
    )
    .limit(1);

  return membership.length > 0;
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
 * Checks if a user is authorized to manage a group (edit, delete, manage locations).
 * Authorization rules:
 * - User is a group admin, OR
 * - User is a global admin AND group has no admins (unmanaged)
 *
 * Note: Always fetches current user state from DB to avoid stale session data.
 *
 * @param groupId - ID of the group
 * @param userId - ID of the user
 * @returns True if user is authorized to manage the group
 */
export async function canUserManageGroup(groupId: string, userId: string): Promise<boolean> {
  // First check if user is a group admin (quick check)
  const isAdmin = await isGroupAdmin(groupId, userId);
  if (isAdmin) return true;

  // If not group admin, check if global admin on unmanaged group
  // Note: Fetch from DB to ensure we have current permissions, not stale session data
  const user = await db
    .select({ isGlobalAdmin: schema.users.isGlobalAdmin })
    .from(schema.users)
    .where(eq(schema.users.id, userId))
    .limit(1);

  if (!user[0]?.isGlobalAdmin) return false;

  const group = await fetchGroup(groupId);
  return group?.adminCount === 0;
}

/**
 * Fetches all members of a group via genealogy relationships.
 * Members are users whose person profile has a `member_of` statement to the group's profile.
 *
 * @param groupId - ID of the public.groups entry
 * @returns List of users who are members of the group
 */
export async function fetchGroupMembers(groupId: string): Promise<schema.SelectUser[]> {
  // Get group's genealogy profileId
  const group = await db
    .select({ profileId: schema.groups.profileId })
    .from(schema.groups)
    .where(eq(schema.groups.id, groupId))
    .limit(1);

  if (!group[0]?.profileId) {
    return [];
  }

  // Find all person profiles with member_of relationship to this group profile
  // Then join to users who have claimed those person profiles
  const members = await db
    .select({
      id: schema.users.id,
      createdAt: schema.users.createdAt,
      updatedAt: schema.users.updatedAt,
      name: schema.users.name,
      nickname: schema.users.nickname,
      title: schema.users.title,
      avatar: schema.users.avatar,
      email: schema.users.email,
      phone: schema.users.phone,
      walletAddress: schema.users.walletAddress,
      passwordHash: schema.users.passwordHash,
      emailVerifiedAt: schema.users.emailVerifiedAt,
      accountStatus: schema.users.accountStatus,
      isGlobalAdmin: schema.users.isGlobalAdmin,
      links: schema.users.links,
      hideEmail: schema.users.hideEmail,
      invitedBy: schema.users.invitedBy,
      profileId: schema.users.profileId,
    })
    .from(statements)
    .innerJoin(schema.users, eq(schema.users.profileId, statements.subjectId))
    .where(
      and(
        eq(statements.subjectType, 'person'),
        eq(statements.predicate, 'member_of'),
        eq(statements.objectType, 'group'),
        eq(statements.objectId, group[0].profileId)
      )
    );

  return members;
}

/**
 * Fetches group members with privacy filters applied.
 * Use this for public-facing endpoints. For internal operations, use fetchGroupMembers().
 *
 * @param groupId - ID of the group
 * @returns List of group members with privacy filters applied
 */
export async function fetchPublicGroupMembers(groupId: string): Promise<schema.SelectUser[]> {
  const members = await fetchGroupMembers(groupId);
  return applyUserPrivacyFilter(members);
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
 * Finds the public.groups entry that references a genealogy profile.
 *
 * @param profileId - ID of the genealogy group profile
 * @returns The group ID or null if no groups entry references this profile
 */
export async function findGroupByProfileId(profileId: string): Promise<string | null> {
  const result = await db
    .select({ id: schema.groups.id })
    .from(schema.groups)
    .where(eq(schema.groups.profileId, profileId))
    .limit(1);

  return result.length > 0 ? result[0].id : null;
}

/**
 * Checks if a user can manage a genealogy group profile.
 * A user can manage a genealogy profile if they are an admin of the public.groups entry
 * that references this profile.
 *
 * @param profileId - ID of the genealogy group profile
 * @param userId - ID of the user
 * @returns True if user is authorized to manage the genealogy profile
 */
export async function canUserManageGenealogyGroupProfile(profileId: string, userId: string): Promise<boolean> {
  const groupId = await findGroupByProfileId(profileId);
  if (!groupId) return false;

  return canUserManageGroup(groupId, userId);
}

/**
 * Fetches all groups where a user is an admin.
 * Used to display "Groups I Manage" section on user profile.
 *
 * @param userId - ID of the user
 * @returns List of groups where user is admin
 */
export async function fetchGroupsWhereUserIsAdmin(userId: string): Promise<Group[]> {
  const results = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      // Identity fields from genealogy (source of truth)
      name: groupProfiles.name,
      description: groupProfiles.descriptionEn,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      // Operational fields from public.groups
      links: schema.groups.links,
      email: schema.groups.email,
      banner: schema.groups.banner,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      profileId: schema.groups.profileId,
    })
    .from(schema.groupAdmins)
    .innerJoin(schema.groups, eq(schema.groupAdmins.groupId, schema.groups.id))
    .innerJoin(groupProfiles, eq(schema.groups.profileId, groupProfiles.id))
    .where(eq(schema.groupAdmins.userId, userId));

  return results as Group[];
}

/**
 * Fetches all groups where a user is a member via genealogy statements.
 * Membership is defined by a `member_of` statement from user's person profile to the group's profile.
 *
 * @param userId - ID of the user
 * @returns List of groups where user has member_of relationship
 */
export async function fetchGroupMembershipsForUser(userId: string): Promise<Group[]> {
  // Get user's genealogy profileId
  const user = await db
    .select({ profileId: schema.users.profileId })
    .from(schema.users)
    .where(eq(schema.users.id, userId))
    .limit(1);

  if (!user[0]?.profileId) {
    return [];
  }

  // Find all groups the user's person profile is a member_of
  const results = await db
    .select({
      id: schema.groups.id,
      createdAt: schema.groups.createdAt,
      // Identity fields from genealogy (source of truth)
      name: groupProfiles.name,
      description: groupProfiles.descriptionEn,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      // Operational fields from public.groups
      links: schema.groups.links,
      email: schema.groups.email,
      banner: schema.groups.banner,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      profileId: schema.groups.profileId,
    })
    .from(statements)
    .innerJoin(groupProfiles, eq(statements.objectId, groupProfiles.id))
    .innerJoin(schema.groups, eq(schema.groups.profileId, groupProfiles.id))
    .where(
      and(
        eq(statements.subjectType, 'person'),
        eq(statements.subjectId, user[0].profileId),
        eq(statements.predicate, 'member_of'),
        eq(statements.objectType, 'group')
      )
    );

  return results as Group[];
}
