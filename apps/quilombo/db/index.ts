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
} from 'drizzle-orm';
import { drizzle, type PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

import ENV from '@/config/environment';
import type { GroupSearchParams, SearchParams } from '@/config/validation-schema';
import * as schema from '@/db/schema';
import type { Group, UserSession } from '@/types/model';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';

/**
 * NOTE: All DB functions in this file can only be run server-side. If you need to retrieve DB data from a client
 * component, use the API route handlers provide access to the DB.
 */

// Disable prefetch as it is not supported for "Transaction" pool mode
// The below setup is based on: https://github.com/orgs/supabase/discussions/21789
// due to CONNECT_TIMEOUT issues with Supabase.
export const client = postgres(ENV.databaseUrl, { prepare: false });
export const drizzleClient = drizzle(client, { schema, logger: false });
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

export async function searchUsers(options: SearchParams): Promise<{ rows: schema.SelectUser[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm } = options;
  const orFilters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    orFilters.push(ilike(schema.users.name, `%${searchTerm}%`));
    orFilters.push(ilike(schema.users.nickname, `%${searchTerm}%`));
  }

  const rawResults = await db
    .select({ record: schema.users, count: sql<number>`count(*) over()` })
    .from(schema.users)
    .where(orFilters.length ? or(...orFilters) : undefined)
    .limit(pageSize)
    .offset(offset);

  const mappedResult = {
    records: rawResults.map((result) => result.record),
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
  const rows = await db
    .insert(schema.users)
    .values(userValues)
    .returning({ id: schema.users.id, createdAt: schema.users.createdAt, updatedAt: schema.users.updatedAt });
  const user = { ...userValues, ...rows[0] };
  return user;
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
    filters.push(ilike(schema.events.name, `%${searchTerm}%`));
    filters.push(ilike(schema.events.description, `%${searchTerm}%`));
    filters.push(ilike(schema.events.url, `%${searchTerm}%`));
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

  const mappedResult = {
    records: results.map((result) => result.record),
    count: results.length > 0 ? results[0].count : 0,
  };

  return {
    rows: mappedResult.records,
    totalCount: mappedResult.count,
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
