import { drizzle } from 'drizzle-orm/postgres-js';
import { and, count, eq } from 'drizzle-orm';
import postgres from 'postgres';

import ENV from '@/config/environment';
import * as schema from '@/db/schema';
import { GroupProfile, UserProfile } from '../types/model';

// TODO: error handling and validity conditions (e.g. to make sure a group admin cannot remove themselves) are missing!

// Disable prefetch as it is not supported for "Transaction" pool mode
export const client = postgres(ENV.databaseUrl, { prepare: false });
export const db = drizzle(client, { schema });

export async function fetchUsers(limit: number = 20, offset: number = 0) {
  return await db.select().from(schema.users).limit(limit).offset(offset);
}

export async function fetchGroups(limit: number = 20, offset: number = 0) {
  return await db.select().from(schema.groups).limit(limit).offset(offset);
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

export async function fetchGroupProfile(groupId: string): Promise<GroupProfile> {
  const group = await db.select().from(schema.groups).where(eq(schema.groups.id, groupId));
  const links = await db.select().from(schema.links).where(eq(schema.links.ownerId, groupId));
  if (group.length == 0) throw new Error('Group not found');
  return { ...group[0], links };
}

export async function insertUser(user: schema.InsertUser) {
  await db.insert(schema.users).values(user);
}

export async function insertGroup(group: schema.InsertGroup) {
  await db.insert(schema.groups).values(group);
}

export async function addLink(link: schema.InsertLink) {
  db.insert(schema.links).values(link);
}

export async function removeLink(linkId: number) {
  db.delete(schema.links).where(eq(schema.links.id, linkId));
}

export async function updateUser(user: schema.InsertUser) {
  await db.update(schema.users).set(user).where(eq(schema.users.id, user.id));
}

export async function updateGroup(group: schema.InsertGroup) {
  await db.update(schema.groups).set(group).where(eq(schema.groups.id, group.id));
}

export async function addGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db.insert(schema.groupAdmins).values(entry);
}

export async function removeGroupAdmin(entry: schema.InsertGroupAdmin) {
  await db
    .delete(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.groupId, entry.groupId), eq(schema.groupAdmins.userId, entry.userId)));
}
