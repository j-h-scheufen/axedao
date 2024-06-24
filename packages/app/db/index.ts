import { and, count, eq, ilike } from 'drizzle-orm';
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

import ENV from '@/config/environment';
import * as schema from '@/db/schema';
import { GroupProfile, UserProfile } from '../types/model';

/**
 * NOTE: All DB functions in this file can only be run server-side. If you need to retrieve DB data from a client
 * component, use the api/ route handlers which wrap the DB calls.
 */

// TODO: error handling and safety checks (e.g. to make sure a group admin cannot remove themselves) are missing!

// Disable prefetch as it is not supported for "Transaction" pool mode
export const client = postgres(ENV.databaseUrl, { prepare: false });
export const db = drizzle(client, { schema });

export async function fetchUsers(
  limit: number = 20,
  offset: number = 0,
  searchTerm?: string,
  searchBy?: 'name' | 'nickname',
) {
  const baseQuery = db.select().from(schema.users);
  if (!searchTerm) return await baseQuery.limit(limit).offset(offset);
  return await baseQuery
    .where(ilike(schema.users[searchBy || 'name'], `%${searchTerm}%`))
    .limit(limit)
    .offset(offset);
}

export async function countUsers() {
  const result = await db.select({ count: count() }).from(schema.users);
  return result.length ? result[0].count : null;
}

export async function fetchGroups(limit: number = 20, offset: number = 0, searchTerm?: string) {
  if (searchTerm) {
    return await db
      .select()
      .from(schema.groups)
      .where(ilike(schema.groups.name, `%${searchTerm}%`))
      .limit(limit)
      .offset(offset);
  }
  return await db.select().from(schema.groups).limit(limit).offset(offset);
}

export async function countGroups() {
  const result = await db.select({ count: count() }).from(schema.groups);
  return result.length ? result[0].count : null;
}

export async function isGroupAdmin(groupId: string, userId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId)));
  return result.length > 0 && result[0].value > 0;
}

export async function fetchUserProfile(userId: string): Promise<UserProfile> {
  const user = await db.select().from(schema.users).where(eq(schema.users.id, userId));
  const links = await db.select().from(schema.links).where(eq(schema.links.ownerId, userId));
  if (user.length == 0) throw new Error('User not found');
  return { ...user[0], links };
}

export async function fetchUserProfileByEmail(email: string): Promise<UserProfile | undefined> {
  const users = await db.select().from(schema.users).where(eq(schema.users.email, email));
  const user = users.length ? users[0] : null;
  if (!user) {
    return undefined;
  }
  const links = await db.select().from(schema.links).where(eq(schema.links.ownerId, user.id));
  return { ...user, links };
}

export async function fetchUserIdFromEmail(email: string): Promise<string | undefined> {
  const users = await db.select({ id: schema.users.id }).from(schema.users).where(eq(schema.users.email, email));
  if (users.length === 0) return undefined;
  return users[0].id;
}

export async function fetchGroupProfile(groupId: string): Promise<GroupProfile> {
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
    .where(
      and(eq(schema.users.group_id, groupId), searchTerm ? ilike(schema.users.name, `%${searchTerm}%`) : undefined),
    )
    .limit(limit)
    .offset(offset);
}

export async function insertUser(user: schema.InsertUser) {
  await db.insert(schema.users).values(user);
}

export async function insertGroup(group: schema.InsertGroup) {
  const groups = await db.insert(schema.groups).values(group).returning();
  return groups.length ? groups[0] : undefined;
}

export async function deleteGroup(groupId: string) {
  // TODO delete group associations
  await db.update(schema.users).set({ group_id: null }).where(eq(schema.users.group_id, groupId));
  await db.delete(schema.groupAdmins).where(eq(schema.groupAdmins.groupId, groupId));
  await db.delete(schema.links).where(eq(schema.links.ownerId, groupId));
  await db.delete(schema.groups).where(eq(schema.groups.id, groupId));
}

export async function addLink(link: schema.InsertLink) {
  const links = await db.insert(schema.links).values(link).returning();
  return links.length ? links[0] : undefined;
}

export async function updateLink(link: schema.InsertLink & { id: number }) {
  await db.update(schema.links).set(link).where(eq(schema.links.id, link.id));
}

export async function removeLink(linkId: number) {
  await db.delete(schema.links).where(eq(schema.links.id, linkId));
}

export async function fetchUserLinks(userId: string) {
  return await db.select().from(schema.links).where(eq(schema.links.ownerId, userId));
}

export async function updateUser(user: Omit<schema.InsertUser, 'email'>) {
  const users = await db.update(schema.users).set(user).where(eq(schema.users.id, user.id)).returning();
  return users.length ? users[0] : undefined;
}

export async function updateGroup(group: schema.InsertGroup) {
  const groups = await db.update(schema.groups).set(group).where(eq(schema.groups.id, group.id));
  return groups.length ? groups[0] : undefined;
}

export async function addGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db.insert(schema.groupAdmins).values(entry);
}

export async function fetchGroupAdmins(groupId: string, limit: number = 20, offset: number = 0) {
  return await db
    .select({
      id: schema.users.id,
      name: schema.users.name,
      nickname: schema.users.nickname,
      email: schema.users.email,
      avatar: schema.users.avatar,
      title: schema.users.title,
      createdAt: schema.users.createdAt,
      group_id: schema.users.group_id,
    })
    .from(schema.groupAdmins)
    .innerJoin(schema.users, eq(schema.groupAdmins.userId, schema.users.id))
    .where(eq(schema.groupAdmins.groupId, groupId))
    .limit(limit)
    .offset(offset);
}

export async function removeGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, entry.groupId), eq(schema.groupAdmins.userId, entry.userId)));
}
