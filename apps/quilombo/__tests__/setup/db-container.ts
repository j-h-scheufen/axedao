/**
 * Test database setup using Testcontainers
 * Spins up a real PostgreSQL container with PostGIS for integration tests
 */

import { PostgreSqlContainer, type StartedPostgreSqlContainer } from '@testcontainers/postgresql';
import { drizzle, type PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as schema from '@/db/schema';
import { execSync } from 'node:child_process';

let container: StartedPostgreSqlContainer | null = null;
let db: PostgresJsDatabase<typeof schema> | null = null;
let client: ReturnType<typeof postgres> | null = null;

/**
 * Sets up a PostgreSQL test database with PostGIS extension
 * - Starts Docker container with postgis/postgis:17-3.5 image
 * - Applies all Atlas migrations
 * - Returns database instance for queries
 */
export async function setupTestDatabase() {
  if (container && db) {
    return { db, container };
  }

  // Start PostgreSQL container with PostGIS extension
  // Using same PostGIS version as Atlas dev database (see atlas.hcl)
  container = await new PostgreSqlContainer('postgis/postgis:17-3.5')
    .withExposedPorts(5432)
    .withStartupTimeout(120_000) // 2 minutes for container startup
    .start();

  const connectionString = container.getConnectionUri();

  // Set DATABASE_URL for this test file's container
  // db/index.ts will lazily initialize using this URL in test mode
  // This allows parallel test files to each have their own database
  // Disable SSL for test container (Atlas/postgres require sslmode to be explicit)
  const connectionStringWithSSL = `${connectionString}?sslmode=disable`;
  process.env.DATABASE_URL = connectionStringWithSSL;

  // Create database client and Drizzle instance for direct queries in tests
  client = postgres(connectionStringWithSSL, { max: 1 }); // Single connection for tests
  db = drizzle(client, { schema });

  // Apply Atlas migrations to set up schema
  // Atlas reads DATABASE_URL from environment (set above in atlas.hcl config)
  // Use --allow-dirty because PostGIS container has pre-existing schemas (tiger, topology, etc.)
  execSync('atlas migrate apply --env local --allow-dirty', {
    env: process.env,
    stdio: process.env.CI ? 'pipe' : 'inherit', // Suppress verbose output in CI
  });

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
