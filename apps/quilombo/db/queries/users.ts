/**
 * USER QUERIES
 * User management and authentication
 */

import { and, eq, ilike, inArray, isNotNull, or, sql, type SQLWrapper } from 'drizzle-orm';

import type { UserSearchParamsWithFilters } from '@/config/validation-schema';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import * as schema from '@/db/schema';
import { db } from '@/db';
import type { UserSession } from '@/types/model';

/**
 * Checks if a user is a global administrator.
 *
 * @param userId - ID of the user to check
 * @returns True if user is global admin, false otherwise
 */
export async function isGlobalAdmin(userId: string) {
  const res = await db.query.users.findFirst({
    where: eq(schema.users.id, userId),
    columns: { isGlobalAdmin: true },
  });
  return res?.isGlobalAdmin;
}

/**
 * Searches users with optional filters and pagination.
 *
 * @param options - Search parameters including searchTerm, filters, pagination
 * @returns Paginated list of users with total count
 */
export async function searchUsers(
  options: UserSearchParamsWithFilters
): Promise<{ rows: schema.SelectUser[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, filters } = options;
  const { hasWallet, titles } = filters || {};
  const orFilters: (SQLWrapper | undefined)[] = [];
  const andFilters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    orFilters.push(ilike(schema.users.name, `%${searchTerm}%`));
    orFilters.push(ilike(schema.users.nickname, `%${searchTerm}%`));
  }

  if (hasWallet) {
    andFilters.push(isNotNull(schema.users.walletAddress));
  }

  if (titles && titles.length > 0) {
    // Filter out undefined values and ensure we have a valid array
    const validTitles = titles.filter((t): t is NonNullable<typeof t> => t !== undefined);
    if (validTitles.length > 0) {
      andFilters.push(inArray(schema.users.title, validTitles));
    }
  }

  // Combine filters: (searchTerm filters) AND (hasWallet filter) AND (titles filter)
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

/**
 * Fetches session data for a user by wallet address.
 * Used during SIWE authentication flow.
 *
 * @param walletAddress - Ethereum wallet address
 * @returns User session data or undefined if not found
 */
export async function fetchSessionData(walletAddress: string): Promise<UserSession | undefined> {
  if (!walletAddress) return undefined;
  return await db.query.users.findFirst({
    where: (users, { eq }) => eq(users.walletAddress, walletAddress),
    columns: { id: true, walletAddress: true, isGlobalAdmin: true },
  });
}

/**
 * Fetches a single user by ID.
 *
 * @param userId - ID of the user to fetch
 * @returns User record or undefined if not found
 */
export async function fetchUser(userId: string): Promise<schema.SelectUser | undefined> {
  return db.query.users.findFirst({
    where: (users, { eq }) => eq(users.id, userId),
  });
}

/**
 * Creates a new user record.
 *
 * @param userValues - User data to insert
 * @returns The created user record
 */
export async function insertUser(userValues: schema.InsertUser) {
  const rows = await db.insert(schema.users).values(userValues).returning();
  return rows[0];
}

/**
 * Updates an existing user record.
 *
 * @param user - User data to update (excluding walletAddress and updatedAt)
 * @returns Updated user record or undefined if not found
 */
export async function updateUser(user: Omit<schema.InsertUser, 'walletAddress' | 'updatedAt'>) {
  const users = await db.update(schema.users).set(user).where(eq(schema.users.id, user.id)).returning();
  return users.length ? users[0] : undefined;
}

/**
 * Searches users by their wallet addresses.
 * Used for bulk lookups in Web3 integrations.
 *
 * @param addresses - Array of wallet addresses to search for
 * @returns List of matching users
 */
export async function searchUsersByAddresses(addresses: string[]) {
  return await db.query.users.findMany({
    where: (users) => inArray(users.walletAddress, addresses),
    orderBy: (users, { asc }) => [asc(users.id)],
  });
}
