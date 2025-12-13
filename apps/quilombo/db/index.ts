/**
 * Database Query Layer
 *
 * This file re-exports all database query functions from domain-specific modules.
 * All DB functions can only be run server-side. If you need to retrieve DB data from
 * a client component, use the API route handlers.
 *
 * Modules:
 * - users: User management and authentication
 * - groups: Group CRUD and membership
 * - groupClaims: Group ownership claiming workflow
 * - groupVerifications: Group verification system
 * - groupLocations: Geographic locations for groups
 * - events: Event management
 * - invitations: Invitation system (email + QR codes)
 * - stats: Public statistics
 * - genealogy: Person/group profiles and lineage statements
 * - personClaims: Person profile claiming workflow
 */

import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import type postgres from 'postgres';

import ENV from '@/config/environment';
import { createDatabaseConnection } from './connection';
import type * as schema from './schema';

const isTestMode = process.env.NEXT_PUBLIC_APP_ENV === 'test';

// In test mode, delay connection creation to allow DATABASE_URL injection
// In production, create connection immediately (existing behavior)
let _client: postgres.Sql | null = null;
let _db: PostgresJsDatabase<typeof schema> | null = null;

function initializeConnection() {
  if (!_db) {
    // In test mode, read DATABASE_URL from process.env at access time (after Testcontainers sets it)
    // In production, use ENV.databaseUrl (validated at import time)
    const dbUrl = isTestMode && process.env.DATABASE_URL ? process.env.DATABASE_URL : ENV.databaseUrl;
    const connection = createDatabaseConnection(dbUrl);
    _client = connection.client;
    _db = connection.db;
  }
  return { client: _client, db: _db };
}

// Production: initialize immediately
if (!isTestMode) {
  initializeConnection();
}

// Export getters that initialize lazily in test mode
export const client: postgres.Sql = new Proxy({} as postgres.Sql, {
  get(_target, prop) {
    const { client } = initializeConnection();
    // biome-ignore lint/suspicious/noExplicitAny: Proxy pattern requires any for dynamic property access
    return (client as any)[prop];
  },
  apply(_target, _thisArg, args) {
    const { client } = initializeConnection();
    // biome-ignore lint/suspicious/noExplicitAny: Proxy pattern requires any for function application
    return (client as any)(...args);
  },
});

declare global {
  var database: PostgresJsDatabase<typeof schema> | undefined;
}

const getDb = (): PostgresJsDatabase<typeof schema> => {
  const { db } = initializeConnection();
  // biome-ignore lint/style/noNonNullAssertion: db is guaranteed to be initialized after initializeConnection()
  return global.database || db!;
};

// Create proxy for db to enable lazy initialization in test mode
export const db: PostgresJsDatabase<typeof schema> = new Proxy({} as PostgresJsDatabase<typeof schema>, {
  get(_target, prop) {
    const database = getDb();
    // biome-ignore lint/suspicious/noExplicitAny: Proxy pattern requires any for dynamic property access
    const value = (database as any)[prop];
    // Bind methods to the actual db instance
    return typeof value === 'function' ? value.bind(database) : value;
  },
});

if (process.env.NODE_ENV !== 'production' && !isTestMode) {
  // biome-ignore lint/style/noNonNullAssertion: _db is guaranteed to be initialized in production mode
  global.database = _db!;
}

// Domain modules
export * from './queries/users';
export * from './queries/groups';
export * from './queries/groupClaims';
export * from './queries/groupVerifications';
export * from './queries/groupLocations';
export * from './queries/events';
export * from './queries/invitations';
export * from './queries/stats';
export * from './queries/genealogy';
export * from './queries/personClaims';

// Schema exports (for types and table references)
export * from './schema';
export * from './schema/genealogy';
