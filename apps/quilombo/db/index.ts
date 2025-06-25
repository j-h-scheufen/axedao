import { and, count, eq, ilike, inArray, ne, notExists, or, sql, type SQLWrapper } from 'drizzle-orm';
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
    count: rawResults[0].count,
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

export async function searchGroups(
  options: GroupSearchParams
): Promise<{ rows: schema.SelectGroup[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, verified } = options;

  const filters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) filters.push(ilike(schema.groups.name, `%${searchTerm}%`));
  if (typeof verified === 'boolean') filters.push(eq(schema.groups.verified, verified));

  const rawResults = await db
    .select({ record: schema.groups, count: sql<number>`count(*) over()` })
    .from(schema.groups)
    .where(filters.length ? or(...filters) : undefined)
    .limit(pageSize)
    .offset(offset);

  const mappedResult = {
    records: rawResults.map((result) => result.record),
    count: rawResults[0].count,
  };

  return {
    rows: mappedResult.records,
    totalCount: mappedResult.count,
  };
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

export async function fetchGroup(groupId: string): Promise<Group | undefined> {
  const result = await db.query.groups.findFirst({
    where: (groups, { eq }) => eq(groups.id, groupId),
  });
  return result
    ? {
        ...result,
        countryCodes: [], // TODO: add country codes from group locations
      }
    : undefined;
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

export async function insertGroup(group: schema.InsertGroup) {
  const groups = await db.insert(schema.groups).values(group).returning();
  return groups.length ? groups[0] : undefined;
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
