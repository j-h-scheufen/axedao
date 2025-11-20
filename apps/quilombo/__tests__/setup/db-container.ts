/**
 * Test database setup using Testcontainers
 * Spins up a real PostgreSQL container with PostGIS for integration tests
 */

import { PostgreSqlContainer, type StartedPostgreSqlContainer } from '@testcontainers/postgresql';
import { drizzle, type PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import { migrate } from 'drizzle-orm/postgres-js/migrator';
import postgres from 'postgres';
import * as schema from '@/db/schema';

let container: StartedPostgreSqlContainer | null = null;
let db: PostgresJsDatabase<typeof schema> | null = null;
let client: ReturnType<typeof postgres> | null = null;

/**
 * Sets up a PostgreSQL test database with PostGIS extension
 * - Starts Docker container with postgis/postgis:16-3.4 image
 * - Runs all Drizzle migrations
 * - Returns database instance for queries
 */
export async function setupTestDatabase() {
  if (container && db) {
    return { db, container };
  }

  // Start PostgreSQL container with PostGIS extension
  container = await new PostgreSqlContainer('postgis/postgis:16-3.4')
    .withExposedPorts(5432)
    .withStartupTimeout(120_000) // 2 minutes for container startup
    .start();

  const connectionString = container.getConnectionUri();

  // Create database client and Drizzle instance
  client = postgres(connectionString, { max: 1 }); // Single connection for tests
  db = drizzle(client, { schema });

  // Set global database instance so query functions use Testcontainers DB
  // Tests run sequentially (fileParallelism: false) to avoid conflicts
  global.database = db;

  // Run migrations to set up schema
  await migrate(db, { migrationsFolder: './db/migrations' });

  return { db, container };
}

/**
 * Tears down the test database
 * - Closes database connections
 * - Stops and removes Docker container
 */
export async function teardownTestDatabase() {
  if (client) {
    await client.end();
    client = null;
  }

  if (container) {
    await container.stop();
    container = null;
  }

  db = null;
  global.database = undefined;
}

/**
 * Clears all data from test database tables
 * Useful for resetting state between tests
 * Uses TRUNCATE CASCADE to handle foreign key constraints
 */
export async function clearTestDatabase() {
  if (!db) {
    throw new Error('Database not initialized. Call setupTestDatabase() first.');
  }

  // Truncate all tables in reverse dependency order
  // CASCADE automatically truncates dependent tables
  await db.execute(`
    TRUNCATE TABLE
      group_verifications,
      group_claims,
      group_admins,
      group_locations,
      groups,
      verification_tokens,
      oauth_accounts,
      users,
      events,
      invitations
    CASCADE
  `);
}

/**
 * Gets the current database instance
 * Throws if database hasn't been set up
 */
export function getTestDatabase() {
  if (!db) {
    throw new Error('Database not initialized. Call setupTestDatabase() first.');
  }
  return db;
}
