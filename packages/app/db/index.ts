import { and, count, eq, ilike, inArray, ne, notExists, or, SQLWrapper } from 'drizzle-orm';
import { drizzle, PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

import ENV from '@/config/environment';
import { GroupSearchParams, SearchParams } from '@/config/validation-schema';
import * as schema from '@/db/schema';
import { Group, UserProfile } from '@/types/model';
import { GroupProfile, UserSession } from '../types/model';

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

export async function fetchUsers() {
  return await db.select().from(schema.users);
}

export async function searchUsers(options: SearchParams) {
  const { pageSize = 20, offset = 0, searchTerm } = options;
  const orFilters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    orFilters.push(ilike(schema.users.name, `%${searchTerm}%`));
    orFilters.push(ilike(schema.users.nickname, `%${searchTerm}%`));
  }

  return await db.query.users.findMany({
    limit: pageSize,
    offset,
    where: orFilters.length ? or(...orFilters) : undefined,
  });
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

export async function fetchUserProfile(userId: string): Promise<UserProfile | undefined> {
  const result = await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.id, userId),
    with: {
      links: true,
      group: true,
    },
  });
  if (!result) return undefined;
  // Have to do this because the result is not typed as Profile due to the 'with' clause
  const { links, group, ...user } = result as schema.SelectUser & {
    links: schema.SelectLink[];
    group: schema.SelectGroup;
  };
  return { user, links, group };
}

export async function countUsers() {
  const result = await db.select({ count: count() }).from(schema.users);
  return result.length ? result[0].count : null;
}

export async function fetchGroups() {
  return await db.select().from(schema.users);
}

export async function searchGroups(options: GroupSearchParams): Promise<Group[]> {
  const { pageSize = 20, offset = 0, searchTerm, city, country, verified } = options;

  const filters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) filters.push(ilike(schema.groups.name, `%${searchTerm}%`));
  if (city) filters.push(eq(schema.groups.city, city));
  if (country) filters.push(eq(schema.groups.country, country));
  if (typeof verified === 'boolean') filters.push(eq(schema.groups.verified, verified));

  return await db.query.groups.findMany({
    limit: pageSize,
    offset,
    where: filters.length ? and(...filters) : undefined,
  });
}

export async function countGroups() {
  const result = await db.select({ count: count() }).from(schema.groups);
  return result.length ? result[0].count : null;
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
            .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId))),
        ),
      ),
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

export async function fetchGroup(groupId: string): Promise<schema.SelectGroup | undefined> {
  return db.query.groups.findFirst({
    where: (groups, { eq }) => eq(groups.id, groupId),
  });
}

export async function fetchGroupProfile(groupId: string): Promise<GroupProfile | undefined> {
  const group = await db.select().from(schema.groups).where(eq(schema.groups.id, groupId));
  const links = await db.select().from(schema.links).where(eq(schema.links.ownerId, groupId));
  const adminIds = await fetchGroupAdminIds(groupId);
  if (group.length == 0) throw new Error('Group not found');
  return { group: group[0], links, adminIds };
}

export async function fetchGroupMembers(groupId: string): Promise<schema.SelectUser[]> {
  return await db
    .select()
    .from(schema.users)
    .where(and(eq(schema.users.groupId, groupId)));
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
  await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.groupId, groupId));
  await db.delete(schema.groupAdmins).where(eq(schema.groupAdmins.groupId, groupId));
  await db.delete(schema.links).where(eq(schema.links.ownerId, groupId));
  await db.delete(schema.groups).where(eq(schema.groups.id, groupId));
}

export async function removeGroupMember(memberId: string) {
  await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.id, memberId));
}

export async function addLink(link: schema.InsertLink) {
  const links = await db.insert(schema.links).values(link).returning();
  return links.length ? links[0] : undefined;
}

export async function createLinks(links: schema.InsertLink[]) {
  return await db.insert(schema.links).values(links).returning();
}

export async function removeLinks(linkIds: number[]) {
  return await db.delete(schema.links).where(inArray(schema.links.id, linkIds));
}

export async function updateLink(link: Omit<schema.InsertLink, 'id'> & { id: number }) {
  return await db.update(schema.links).set(link).where(eq(schema.links.id, link.id));
}

export async function removeLink(linkId: number) {
  await db.delete(schema.links).where(eq(schema.links.id, linkId));
}

export async function fetchUserLinks(userId: string) {
  return await db.select().from(schema.links).where(eq(schema.links.ownerId, userId));
}

export async function updateUser(user: Omit<schema.InsertUser, 'walletAddress'>) {
  const users = await db.update(schema.users).set(user).where(eq(schema.users.id, user.id)).returning();
  return users.length ? users[0] : undefined;
}

export async function updateGroup(group: Partial<schema.InsertGroup> & { id: string }) {
  const groups = await db.update(schema.groups).set(group).where(eq(schema.groups.id, group.id)).returning();
  return groups.length ? groups[0] : undefined;
}

export async function addGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db.insert(schema.groupAdmins).values(entry);
}

export async function fetchGroupAdminIds(groupId: string): Promise<string[]> {
  const result = await db
    .select({ id: schema.groupAdmins.userId })
    .from(schema.groupAdmins)
    .where(eq(schema.groupAdmins.groupId, groupId));
  return result.map((entry) => entry.id);
}

export async function removeGroupAdmin(groupId: string, adminId: string) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, adminId)));
}
