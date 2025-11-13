/**
 * Database connection factory for creating drizzle clients.
 *
 * This module provides a centralized way to create database connections
 * with consistent configuration. Use this in:
 * - Main application (db/index.ts)
 * - Database migration scripts
 * - Standalone CLI tools
 * - Any script that needs database access
 */

import { drizzle, type PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

import ENV from '@/config/environment';
import * as schema from './schema';

/**
 * Creates a database connection with standardized Supabase configuration.
 *
 * Configuration includes:
 * - `prepare: false` - Disable prefetch (not supported for "Transaction" pool mode)
 * - Based on: https://github.com/orgs/supabase/discussions/21789
 *
 * @param databaseUrl - PostgreSQL connection string (should use transaction pooler)
 * @param options - Optional configuration
 * @param options.logger - Enable drizzle query logging (default: false)
 * @returns Drizzle database instance and postgres client
 *
 * @example
 * ```ts
 * // In application code (using ENV)
 * import ENV from '@/config/environment';
 * const { db } = createDatabaseConnection(ENV.databaseUrl);
 *
 * // In migration scripts (using process.env)
 * const { db } = createDatabaseConnection(process.env.DATABASE_URL!);
 * ```
 */
export function createDatabaseConnection(
  databaseUrl: string,
  options?: { logger?: boolean }
): {
  client: postgres.Sql;
  db: PostgresJsDatabase<typeof schema>;
} {
  if (!databaseUrl) {
    throw new Error('Database URL is required');
  }

  const client = postgres(databaseUrl, { prepare: false });
  const db = drizzle(client, { schema, logger: options?.logger ?? false });

  return { client, db };
}

// Create database connection using centralized factory
const { client: postgresClient, db: drizzleClient } = createDatabaseConnection(ENV.databaseUrl);

export const client = postgresClient;

declare global {
  var database: PostgresJsDatabase<typeof schema> | undefined;
}

export const db = global.database || drizzleClient;
if (process.env.NODE_ENV !== 'production') global.database = db;
