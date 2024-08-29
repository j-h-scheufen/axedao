import { and, count, eq, ilike, inArray, ne, notExists, SQLWrapper } from 'drizzle-orm';
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

import { Profile } from '@/app/dashboard/profile/types';
import ENV from '@/config/environment';
import * as schema from '@/db/schema';
import { GroupProfile, UserSession } from '../types/model';

/**
 * NOTE: All DB functions in this file can only be run server-side. If you need to retrieve DB data from a client
 * component, use the api/ route handlers which wrap the DB calls.
 */

// TODO: error handling and safety checks (e.g. to make sure a group admin cannot remove themselves) are missing!

// Disable prefetch as it is not supported for "Transaction" pool mode
export const client = postgres(ENV.databaseUrl, { prepare: false });
export const db = drizzle(client, { schema, logger: false });

export async function isGlobalAdmin(userId: string) {
  const res = await db.query.users.findFirst({
    where: eq(schema.users.id, userId),
    columns: { isGlobalAdmin: true },
  });
  return res?.isGlobalAdmin;
}

type FetchUsersOptions = {
  limit?: number;
  offset?: number;
  searchTerm?: string;
  searchBy?: 'name' | 'nickname';
};
export async function fetchUsers(
  options: FetchUsersOptions,
  // limit: number = 20,
  // offset: number = 0,
  // searchTerm?: string,
  // searchBy?: 'name' | 'nickname',
) {
  const { limit = 20, offset = 0, searchTerm, searchBy = 'name' } = options;
  console.log('Fetching users with options: ', options);
  const filters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) filters.push(ilike(schema.users[searchBy], `%${searchTerm}%`));
  return await db.query.users.findMany({
    limit,
    offset,
    where: filters.length ? and(...filters) : undefined,
  });
  // const baseQuery = db.select().from(schema.users);
  // if (!searchTerm) return await baseQuery.limit(limit).offset(offset);
  // return await baseQuery
  //   .where(ilike(schema.users[searchBy || 'name'], `%${searchTerm}%`))
  //   .limit(limit)
  //   .offset(offset);
}

export async function fetchSessionData(walletAddress: string): Promise<UserSession | undefined> {
  if (!walletAddress) return undefined;
  return await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.walletAddress, walletAddress),
    columns: { email: true, name: true, avatar: true, id: true, isGlobalAdmin: true, walletAddress: true },
  });
}

export async function fetchUserProfile(userId: string): Promise<Profile | undefined> {
  return (await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.id, userId),
    with: {
      links: true,
      group: true,
    },
  })) as Profile | undefined;
}

export async function fetchUserProfileByEmail(email: string): Promise<Profile | undefined> {
  return (await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.email, email),
    with: {
      links: true,
      group: true,
    },
  })) as Profile | undefined;
}

export async function countUsers() {
  const result = await db.select({ count: count() }).from(schema.users);
  return result.length ? result[0].count : null;
}

type FetchGroupsOptions = {
  limit: number;
  offset: number;
  searchTerm?: string;
  city?: string;
  country?: string;
  verified?: boolean;
};
export async function fetchGroups(options: FetchGroupsOptions) {
  const { limit = 20, offset = 0, searchTerm, city, country, verified } = options;

  const filters: (SQLWrapper | undefined)[] = [];
  if (searchTerm) filters.push(ilike(schema.groups.name, `%${searchTerm}%`));
  if (city) filters.push(eq(schema.groups.city, city));
  if (country) filters.push(eq(schema.groups.country, country));
  if (typeof verified === 'boolean') filters.push(eq(schema.groups.verified, verified));

  return await db.query.groups.findMany({
    limit,
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

export async function fetchUserIdFromEmail(email: string): Promise<string | undefined> {
  const users = await db.select({ id: schema.users.id }).from(schema.users).where(eq(schema.users.email, email));
  if (users.length === 0) return undefined;
  return users[0].id;
}

export async function fetchGroup(groupId: string) {
  return await db.query.groups.findFirst({
    where: (groups, { eq }) => eq(groups.id, groupId),
  });
}

export async function fetchGroupProfile(groupId: string): Promise<GroupProfile | undefined> {
  const group = await db.select().from(schema.groups).where(eq(schema.groups.id, groupId));
  const links = await db.select().from(schema.links).where(eq(schema.links.ownerId, groupId));
  if (group.length == 0) throw new Error('Group not found');
  return { ...group[0], links };
}

export async function fetchGroupIdFromName(name: string): Promise<string | undefined> {
  const groups = await db.select({ id: schema.groups.id }).from(schema.groups).where(eq(schema.groups.name, name));
  if (groups.length === 0) return undefined;
  return groups[0].id;
}

export async function fetchGroupMembers(groupId: string, limit: number = 20, offset: number = 0, searchTerm?: string) {
  return await db
    .select()
    .from(schema.users)
    .where(and(eq(schema.users.groupId, groupId), searchTerm ? ilike(schema.users.name, `%${searchTerm}%`) : undefined))
    .limit(limit)
    .offset(offset);
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

export async function updateUser(user: Omit<schema.InsertUser, 'email' | 'walletAddress'>) {
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

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export async function fetchGroupAdmins(groupId: string, limit: number = 20, offset: number = 0) {
  return await db.select().from(schema.groupAdmins);
  // .innerJoin(schema.users, eq(schema.groupAdmins.userId, schema.users.id))
  // .where(eq(schema.groupAdmins.groupId, groupId))
  // .limit(limit)
  // .offset(offset);
}

export async function removeGroupAdmin(groupId: string, adminId: string) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, adminId)));
}
