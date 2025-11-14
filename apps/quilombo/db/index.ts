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
 */

import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';

import ENV from '@/config/environment';
import { createDatabaseConnection } from './connection';
import type * as schema from './schema';

// Create database connection using centralized factory
const { client: postgresClient, db: drizzleClient } = createDatabaseConnection(ENV.databaseUrl);

export const client = postgresClient;

declare global {
  var database: PostgresJsDatabase<typeof schema> | undefined;
}

export const db = global.database || drizzleClient;
if (process.env.NODE_ENV !== 'production') global.database = db;

// Domain modules
export * from './queries/users';
export * from './queries/groups';
export * from './queries/groupClaims';
export * from './queries/groupVerifications';
export * from './queries/groupLocations';
export * from './queries/events';
export * from './queries/invitations';
export * from './queries/stats';
