import {
  and,
  count,
  eq,
  gte,
  ilike,
  inArray,
  lte,
  ne,
  notExists,
  or,
  sql,
  type SQLWrapper,
  lt,
  isNotNull,
  isNull,
} from 'drizzle-orm';
import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';

import ENV from '@/config/environment';
import type { GroupSearchParams, UserSearchParams } from '@/config/validation-schema';
import * as schema from '@/db/schema';
import type { Group, UserSession, InvitationType } from '@/types/model';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { createDatabaseConnection } from './connection';

/**
 * NOTE: All DB functions in this file can only be run server-side. If you need to retrieve DB data from a client
 * component, use the API route handlers provide access to the DB.
 */

// Create database connection using centralized factory
const { client: postgresClient, db: drizzleClient } = createDatabaseConnection(ENV.databaseUrl);

export const client = postgresClient;
declare global {
  var database: PostgresJsDatabase<typeof schema> | undefined;
}
export const db = global.database || drizzleClient;
if (process.env.NODE_ENV !== 'production') global.database = db;

////////////////////////////////////////////////////////////////////

export async function isGlobalAdmin(userId: string) {
  const res = await db.query.users.findFirst({
    where: eq(schema.users.id, userId),
    columns: { isGlobalAdmin: true },
  });
  return res?.isGlobalAdmin;
}

export async function searchUsers(
  options: UserSearchParams
): Promise<{ rows: schema.SelectUser[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, hasWallet } = options;
  const orFilters: (SQLWrapper | undefined)[] = [];
  const andFilters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    orFilters.push(ilike(schema.users.name, `%${searchTerm}%`));
    orFilters.push(ilike(schema.users.nickname, `%${searchTerm}%`));
  }

  if (hasWallet) {
    andFilters.push(isNotNull(schema.users.walletAddress));
  }

  // Combine filters: (searchTerm filters) AND (hasWallet filter)
  const whereClause = and(orFilters.length ? or(...orFilters) : undefined, ...andFilters);

  const rawResults = await db
    .select({
      record: schema.users,
      groupName: schema.groups.name,
      count: sql<number>`count(*) over()`,
    })
    .from(schema.users)
    .leftJoin(schema.groups, eq(schema.users.groupId, schema.groups.id))
    .where(whereClause)
    .limit(pageSize)
    .offset(offset);

  const mappedResult = {
    records: rawResults.map((result) => ({
      ...result.record,
      groupName: result.groupName ?? undefined,
    })),
    count: rawResults.length > 0 ? rawResults[0].count : 0,
  };

  return {
    rows: mappedResult.records,
    totalCount: mappedResult.count,
  };
}

export async function fetchSessionData(walletAddress: string): Promise<UserSession | undefined> {
  if (!walletAddress) return undefined;
  return await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.walletAddress, walletAddress),
    columns: { id: true, walletAddress: true, isGlobalAdmin: true },
  });
}

export async function fetchUser(userId: string): Promise<schema.SelectUser | undefined> {
  return db.query.users.findFirst({
    where: (users, { eq }) => eq(users.id, userId),
  });
}

/**
 *
 */
export async function searchGroups(options: GroupSearchParams): Promise<{ rows: Group[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, verified } = options;

  const filters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) filters.push(ilike(schema.groups.name, `%${searchTerm}%`));
  if (typeof verified === 'boolean') filters.push(eq(schema.groups.verified, verified));

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
      verified: schema.groups.verified,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,

      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
      count: sql<number>`count(*) over()`,
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(filters.length ? and(...filters) : undefined)
    .groupBy(schema.groups.id)
    .limit(pageSize)
    .offset(offset);

  return {
    rows: results,
    totalCount: results.length > 0 ? results[0].count : 0,
  };
}

/**
 * Efficiently fetch a single group and its countryCodes using a single query with aggregation.
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
      verified: schema.groups.verified,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,

      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(eq(schema.groups.id, groupId))
    .groupBy(schema.groups.id)
    .limit(1);

  return result[0] as Group | undefined;
}

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

export async function isGroupAdmin(groupId: string, userId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId)));
  return result.length > 0 && result[0].value > 0;
}

export async function fetchGroupMembers(groupId: string): Promise<schema.SelectUser[]> {
  return await db
    .select()
    .from(schema.users)
    .where(and(eq(schema.users.groupId, groupId)));
}

export async function fetchGroupAdminIds(groupId: string): Promise<string[]> {
  const result = await db
    .select({ id: schema.groupAdmins.userId })
    .from(schema.groupAdmins)
    .where(eq(schema.groupAdmins.groupId, groupId));
  return result.map((entry) => entry.id);
}

export async function insertUser(userValues: schema.InsertUser) {
  const rows = await db.insert(schema.users).values(userValues).returning();
  return rows[0];
}

export async function insertGroup(group: schema.InsertGroup): Promise<Group | undefined> {
  await db.insert(schema.groups).values(group);
  return fetchGroup(group.id);
}

export async function deleteGroup(groupId: string) {
  await db.delete(schema.groups).where(eq(schema.groups.id, groupId));
}

export async function removeGroupMember(memberId: string) {
  await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.id, memberId));
}

export async function updateUser(user: Omit<schema.InsertUser, 'walletAddress' | 'updatedAt'>) {
  const users = await db.update(schema.users).set(user).where(eq(schema.users.id, user.id)).returning();
  return users.length ? users[0] : undefined;
}

export async function updateGroup(group: Partial<schema.InsertGroup> & { id: string }) {
  const groups = await db.update(schema.groups).set(group).where(eq(schema.groups.id, group.id)).returning();
  return groups.length ? groups[0] : undefined;
}

export async function addGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db.insert(schema.groupAdmins).values(entry).onConflictDoNothing(); // Ignore if already exists
}

export async function removeGroupAdmin(groupId: string, adminId: string) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, adminId)));
}

export async function searchUsersByAddresses(addresses: string[]) {
  return await db.query.users.findMany({
    where: (users) => inArray(users.walletAddress, addresses),
    orderBy: (users, { asc }) => [asc(users.id)],
  });
}

/**
 * GROUP LOCATIONS
 */
export async function fetchGroupLocations(groupId: string): Promise<schema.SelectGroupLocation[]> {
  return await db.query.groupLocations.findMany({
    where: (locations, { eq }) => eq(locations.groupId, groupId),
    orderBy: (locations, { asc }) => [asc(locations.name)],
  });
}

export async function fetchGroupLocation(locationId: string): Promise<schema.SelectGroupLocation | undefined> {
  return await db.query.groupLocations.findFirst({
    where: (locations, { eq }) => eq(locations.id, locationId),
  });
}

export async function insertGroupLocation(location: schema.InsertGroupLocation): Promise<schema.SelectGroupLocation> {
  const locations = await db.insert(schema.groupLocations).values(location).returning();
  if (!locations.length) {
    throw new Error('Failed to insert group location');
  }
  return locations[0];
}

export async function updateGroupLocation(
  locationId: string,
  updates: Partial<schema.InsertGroupLocation>
): Promise<schema.SelectGroupLocation | undefined> {
  const locations = await db
    .update(schema.groupLocations)
    .set(updates)
    .where(eq(schema.groupLocations.id, locationId))
    .returning();
  return locations.length ? locations[0] : undefined;
}

export async function deleteGroupLocation(locationId: string): Promise<void> {
  await db.delete(schema.groupLocations).where(eq(schema.groupLocations.id, locationId));
}

export async function isLocationInGroup(locationId: string, groupId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.groupLocations)
    .where(and(eq(schema.groupLocations.id, locationId), eq(schema.groupLocations.groupId, groupId)));
  return result.length > 0 && result[0].value > 0;
}

export async function fetchAllGroupLocationsWithGroups(): Promise<
  Array<schema.SelectGroupLocation & { group: schema.SelectGroup }>
> {
  return await db
    .select({
      id: schema.groupLocations.id,
      groupId: schema.groupLocations.groupId,
      name: schema.groupLocations.name,
      description: schema.groupLocations.description,
      feature: schema.groupLocations.feature,
      location: schema.groupLocations.location,
      countryCode: schema.groupLocations.countryCode,
      group: {
        id: schema.groups.id,
        createdAt: schema.groups.createdAt,
        updatedAt: schema.groups.updatedAt,
        name: schema.groups.name,
        description: schema.groups.description,
        style: schema.groups.style,
        email: schema.groups.email,
        logo: schema.groups.logo,
        banner: schema.groups.banner,
        leader: schema.groups.leader,
        founder: schema.groups.founder,
        verified: schema.groups.verified,
        links: schema.groups.links,
        createdBy: schema.groups.createdBy,
        claimedBy: schema.groups.claimedBy,
        claimedAt: schema.groups.claimedAt,
      },
    })
    .from(schema.groupLocations)
    .innerJoin(schema.groups, eq(schema.groupLocations.groupId, schema.groups.id));
}

/**
 * EVENTS
 */
export async function searchEvents(options: {
  pageSize?: number;
  offset?: number;
  searchTerm?: string;
  type?: string;
  countryCode?: string;
  groupId?: string;
  userId?: string;
  startDate?: Date;
  endDate?: Date;
  showActiveOnly?: boolean; // New parameter to show only active/upcoming events
}): Promise<{ rows: schema.SelectEvent[]; totalCount: number }> {
  const {
    pageSize = QUERY_DEFAULT_PAGE_SIZE,
    offset = 0,
    searchTerm,
    type,
    countryCode,
    groupId,
    userId,
    startDate,
    endDate,
    showActiveOnly = false,
  } = options;

  const filters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    // Group search filters with OR logic - event can match in any of these fields
    const searchFilters = [
      ilike(schema.events.name, `%${searchTerm}%`),
      ilike(schema.events.description, `%${searchTerm}%`),
    ];
    filters.push(or(...searchFilters));
  }

  if (type) filters.push(eq(schema.events.type, type as any));
  if (countryCode) filters.push(eq(schema.events.countryCode, countryCode));

  // Handle date filtering
  if (showActiveOnly) {
    // Show events that are either:
    // 1. Starting in the future (start >= now)
    // 2. Currently ongoing multi-day events (start < now AND end IS NOT NULL AND end >= now)
    const now = new Date();
    filters.push(
      or(
        gte(schema.events.start, now), // Future events
        and(
          lt(schema.events.start, now), // Started in the past
          isNotNull(schema.events.end), // Has an end date (multi-day event)
          gte(schema.events.end, now) // End date is in the future
        )
      )
    );
  } else {
    // Use explicit start/end date filters if provided
    if (startDate) filters.push(gte(schema.events.start, startDate));
    if (endDate) filters.push(lte(schema.events.end, endDate));
  }

  if (groupId) {
    filters.push(sql`${schema.events.associatedGroups} @> ${[groupId]}`);
  }

  if (userId) {
    filters.push(sql`${schema.events.associatedUsers} @> ${[userId]}`);
  }

  const results = await db
    .select({
      record: schema.events,
      count: sql<number>`count(*) over()`,
    })
    .from(schema.events)
    .where(filters.length ? and(...filters) : undefined)
    .orderBy(schema.events.start)
    .limit(pageSize)
    .offset(offset);

  return {
    rows: results.map((r) => r.record),
    totalCount: results[0]?.count || 0,
  };
}

export async function fetchEvent(eventId: string): Promise<schema.SelectEvent | undefined> {
  return await db.query.events.findFirst({
    where: (events, { eq }) => eq(events.id, eventId),
  });
}

export async function insertEvent(event: schema.InsertEvent): Promise<schema.SelectEvent> {
  const events = await db.insert(schema.events).values(event).returning();
  if (!events.length) {
    throw new Error('Failed to insert event');
  }
  return events[0];
}

export async function updateEvent(
  eventId: string,
  updates: Partial<schema.InsertEvent>
): Promise<schema.SelectEvent | undefined> {
  const events = await db.update(schema.events).set(updates).where(eq(schema.events.id, eventId)).returning();
  return events.length ? events[0] : undefined;
}

export async function deleteEvent(eventId: string): Promise<void> {
  await db.delete(schema.events).where(eq(schema.events.id, eventId));
}

export async function isEventCreator(eventId: string, userId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.events)
    .where(and(eq(schema.events.id, eventId), eq(schema.events.creatorId, userId)));
  return result.length > 0 && result[0].value > 0;
}

/**
 * STATISTICS
 * Public statistics for display on the homepage.
 * Returns aggregated counts that are safe to expose publicly.
 */
export interface PublicStats {
  activeUsers: number;
  verifiedGroups: number;
  unverifiedGroups: number;
  upcomingEvents: number;
}

/**
 * Fetches public statistics for homepage display
 * - Active users: users with 'active' account status
 * - Verified/unverified groups: based on 'verified' boolean field
 * - Upcoming events: events with start date >= now
 * @returns Public statistics object
 */
export async function fetchPublicStats(): Promise<PublicStats> {
  const now = new Date();

  // Count active users
  const activeUsersResult = await db
    .select({ value: count() })
    .from(schema.users)
    .where(eq(schema.users.accountStatus, 'active'));

  // Count verified groups
  const verifiedGroupsResult = await db
    .select({ value: count() })
    .from(schema.groups)
    .where(eq(schema.groups.verified, true));

  // Count unverified groups
  const unverifiedGroupsResult = await db
    .select({ value: count() })
    .from(schema.groups)
    .where(eq(schema.groups.verified, false));

  // Count upcoming events (start date >= now)
  const upcomingEventsResult = await db
    .select({ value: count() })
    .from(schema.events)
    .where(gte(schema.events.start, now));

  return {
    activeUsers: activeUsersResult[0]?.value ?? 0,
    verifiedGroups: verifiedGroupsResult[0]?.value ?? 0,
    unverifiedGroups: unverifiedGroupsResult[0]?.value ?? 0,
    upcomingEvents: upcomingEventsResult[0]?.value ?? 0,
  };
}

/**
 * INVITATIONS
 * Invitation system allowing users to invite others via QR codes or email
 */

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

////////////////////////////////////////////////////////////////////
// GROUP REGISTRATION & CLAIMING
////////////////////////////////////////////////////////////////////

/**
 * Registers a new group (unclaimed) created by a user.
 * The user becomes the creator but is NOT added as an admin.
 * The group must be claimed before admins can be assigned.
 *
 * @param data - Group data including name, description, location, links, style
 * @param userId - ID of the user registering the group
 * @returns The created group ID
 */
export async function registerGroup(
  data: schema.InsertGroup & { countryCodes?: string[] },
  userId: string
): Promise<string> {
  const { countryCodes: _countryCodes, ...groupData } = data;

  const result = await db
    .insert(schema.groups)
    .values({
      ...groupData,
      createdBy: userId,
      claimedBy: null,
      claimedAt: null,
    })
    .returning({ id: schema.groups.id });

  return result[0].id;
}

/**
 * Fetches all unclaimed groups (groups with no claimedBy value).
 *
 * @returns Array of unclaimed groups
 */
export async function getUnclaimedGroups(): Promise<Group[]> {
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
      verified: schema.groups.verified,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(isNull(schema.groups.claimedBy))
    .groupBy(schema.groups.id);

  return results as Group[];
}

/**
 * Fetches all groups registered by a specific user.
 *
 * @param userId - ID of the user who registered the groups
 * @returns Array of groups created by this user
 */
export async function getUserRegisteredGroups(userId: string): Promise<Group[]> {
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
      verified: schema.groups.verified,
      links: schema.groups.links,
      createdBy: schema.groups.createdBy,
      claimedBy: schema.groups.claimedBy,
      claimedAt: schema.groups.claimedAt,
      countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
        'country_codes'
      ),
    })
    .from(schema.groups)
    .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
    .where(eq(schema.groups.createdBy, userId))
    .groupBy(schema.groups.id);

  return results as Group[];
}

/**
 * Checks if a user can verify a group (hasn't verified it in the last 30 days).
 *
 * @param userId - ID of the user attempting to verify
 * @param groupId - ID of the group to verify
 * @returns True if user can verify, false if on cooldown
 */
export async function canUserVerifyGroup(userId: string, groupId: string): Promise<boolean> {
  const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000);

  const recentVerification = await db.query.groupVerifications.findFirst({
    where: and(
      eq(schema.groupVerifications.userId, userId),
      eq(schema.groupVerifications.groupId, groupId),
      gte(schema.groupVerifications.verifiedAt, thirtyDaysAgo)
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
 * Approves a group claim: marks it approved, adds user as admin, sets claimedBy/At.
 *
 * @param claimId - ID of the claim to approve
 * @param adminId - ID of the admin approving the claim
 */
export async function approveClaim(claimId: string, adminId: string): Promise<void> {
  // Get the claim details
  const claim = await db.query.groupClaims.findFirst({
    where: eq(schema.groupClaims.id, claimId),
  });

  if (!claim) {
    throw new Error('Claim not found');
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
 */
export async function rejectClaim(claimId: string, adminId: string, notes: string): Promise<void> {
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
