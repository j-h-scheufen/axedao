import { drizzle } from 'drizzle-orm/postgres-js';
import { and, eq } from 'drizzle-orm';
import postgres from 'postgres';

import ENV from '@/config/environment';
import * as schema from '@/db/schema';

// Disable prefetch as it is not supported for "Transaction" pool mode
export const client = postgres(ENV.databaseUrl, { prepare: false });
export const db = drizzle(client, { schema });

export async function fetchUsers() {
  return await db.select().from(schema.users);
}

export async function fetchGroups() {
  return await db.select().from(schema.groups);
}

export async function isGroupAdmin(groupId: string, userId: string): Promise<boolean> {
  const result = await db
    .select()
    .from(schema.groupAdmins)
    .where(and(eq(schema.groupAdmins.userId, userId), eq(schema.groupAdmins.groupId, groupId)));
  return result.length > 0;
}
