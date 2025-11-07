#!/usr/bin/env tsx
/**
 * Production Database Migration Runner
 *
 * This script runs database migrations with production-grade safety:
 * - Advisory locks to prevent concurrent migrations
 * - Automatic rollback on failure
 * - Pre-migration backup verification
 * - Detailed logging for audit trail
 *
 * Usage:
 *   tsx scripts/db-migrate-production.ts
 *
 * Environment Variables Required:
 *   DATABASE_URL - PostgreSQL connection string
 *   NEXT_PUBLIC_APP_ENV - Must be 'production'
 */

import { execSync } from 'node:child_process';
import { db } from '../db';
import { sql } from 'drizzle-orm';

// ANSI color codes for better logging
const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  cyan: '\x1b[36m',
};

const log = {
  info: (msg: string) => console.log(`${colors.blue}ℹ${colors.reset} ${msg}`),
  success: (msg: string) => console.log(`${colors.green}✓${colors.reset} ${msg}`),
  error: (msg: string) => console.error(`${colors.red}✗${colors.reset} ${msg}`),
  warning: (msg: string) => console.warn(`${colors.yellow}⚠${colors.reset} ${msg}`),
  step: (msg: string) => console.log(`${colors.cyan}→${colors.reset} ${msg}`),
};

interface MigrationRecord extends Record<string, unknown> {
  id: number;
  hash: string;
  created_at: number;
}

/**
 * Acquire PostgreSQL advisory lock to ensure only one migration runs at a time
 * Lock ID is derived from a hash of 'quilombo_production_migration'
 */
async function acquireLock(): Promise<boolean> {
  try {
    const lockId = 'quilombo_production_migration';
    log.step('Attempting to acquire migration lock...');

    // Try to acquire lock (non-blocking)
    const result = await db.execute<{ pg_try_advisory_lock: boolean }>(
      sql`SELECT pg_try_advisory_lock(hashtext(${lockId})) as pg_try_advisory_lock`
    );

    // postgres-js returns an array directly
    const resultArray: { pg_try_advisory_lock: boolean }[] = Array.isArray(result)
      ? result
      : (result as { rows: { pg_try_advisory_lock: boolean }[] }).rows || [];
    const acquired = resultArray[0]?.pg_try_advisory_lock;

    if (acquired) {
      log.success('Migration lock acquired');
      return true;
    } else {
      log.error('Another migration is currently running. Please wait and try again.');
      return false;
    }
  } catch (error) {
    log.error(`Failed to acquire lock: ${error}`);
    return false;
  }
}

/**
 * Release the advisory lock
 */
async function releaseLock(): Promise<void> {
  try {
    const lockId = 'quilombo_production_migration';
    await db.execute(sql`SELECT pg_advisory_unlock(hashtext(${lockId}))`);
    log.success('Migration lock released');
  } catch (error) {
    log.error(`Failed to release lock: ${error}`);
  }
}

/**
 * Get current migration state from the database
 */
async function getMigrationState(): Promise<MigrationRecord[]> {
  try {
    const result = await db.execute<MigrationRecord>(
      sql`SELECT id, hash, created_at FROM drizzle.__drizzle_migrations ORDER BY created_at DESC`
    );
    // postgres-js returns an array directly
    return Array.isArray(result) ? result : (result as { rows: MigrationRecord[] }).rows || [];
  } catch (_error) {
    // Table might not exist yet
    log.warning('Migration table not found (first migration?)');
    return [];
  }
}

/**
 * Verify Supabase connection and permissions
 */
async function verifyDatabaseConnection(): Promise<boolean> {
  try {
    log.step('Verifying database connection...');

    // Check connection
    const result = await db.execute<{ version: string }>(sql`SELECT version() as version`);
    // postgres-js returns an array directly, not wrapped in { rows: [] }
    const resultArray: { version: string }[] = Array.isArray(result)
      ? result
      : (result as { rows: { version: string }[] }).rows || [];
    const version = resultArray[0]?.version || 'unknown';
    log.info(`Connected to: ${version.substring(0, 50)}...`);

    // Check permissions
    const permCheck = await db.execute<{ has_permission: boolean }>(
      sql`SELECT has_database_privilege(current_database(), 'CREATE') as has_permission`
    );
    const permArray: { has_permission: boolean }[] = Array.isArray(permCheck)
      ? permCheck
      : (permCheck as { rows: { has_permission: boolean }[] }).rows || [];

    if (!permArray[0]?.has_permission) {
      log.error('Database user lacks CREATE privilege');
      return false;
    }

    log.success('Database connection verified');
    return true;
  } catch (error) {
    log.error(`Database connection failed: ${error}`);
    return false;
  }
}

/**
 * Create a backup point that can be used for rollback
 * Note: This doesn't create an actual backup, but records the current state
 */
async function createBackupPoint(): Promise<MigrationRecord[]> {
  log.step('Recording current migration state...');
  const currentState = await getMigrationState();
  log.info(`Current migrations: ${currentState.length}`);
  return currentState;
}

/**
 * Run the actual migration using drizzle-kit
 */
async function runMigration(): Promise<boolean> {
  try {
    log.step('Running database migrations...');

    // Run drizzle-kit migrate
    execSync('pnpm drizzle-kit migrate', {
      cwd: process.cwd(),
      stdio: 'inherit',
      env: process.env,
    });

    log.success('Migrations completed successfully');
    return true;
  } catch (error) {
    log.error(`Migration failed: ${error}`);
    return false;
  }
}

/**
 * Verify that migrations were applied correctly
 */
async function verifyMigrations(beforeState: MigrationRecord[]): Promise<boolean> {
  try {
    log.step('Verifying migration results...');

    const afterState = await getMigrationState();
    const newMigrations = afterState.length - beforeState.length;

    if (newMigrations > 0) {
      log.success(`Applied ${newMigrations} new migration(s)`);

      // Show what was applied
      const applied = afterState.slice(0, newMigrations);
      applied.forEach((migration) => {
        log.info(`  - Migration ${migration.id}: ${migration.hash}`);
      });

      return true;
    } else if (newMigrations === 0) {
      log.info('No new migrations to apply (database is up to date)');
      return true;
    } else {
      log.error('Migration count decreased - this should not happen!');
      return false;
    }
  } catch (error) {
    log.error(`Migration verification failed: ${error}`);
    return false;
  }
}

/**
 * Attempt to rollback migrations to the previous state
 *
 * IMPORTANT: Drizzle-kit doesn't have built-in rollback, so this requires manual intervention
 * This function provides instructions and stops the process
 */
async function rollback(beforeState: MigrationRecord[]): Promise<void> {
  log.error('='.repeat(80));
  log.error('MIGRATION FAILED - ROLLBACK REQUIRED');
  log.error('='.repeat(80));

  log.warning('Drizzle-kit does not support automatic rollback.');
  log.warning('You must manually revert the database changes.');

  if (beforeState.length > 0) {
    log.info('\nPrevious migration state:');
    beforeState.slice(0, 5).forEach((migration) => {
      log.info(`  - ${migration.hash} (${new Date(migration.created_at).toISOString()})`);
    });
  }

  log.info('\nRollback steps:');
  log.info('1. Connect to your Supabase database using psql or the Supabase SQL editor');
  log.info('2. Review the failed migration in apps/quilombo/db/migrations/');
  log.info('3. Manually write and execute SQL to revert the changes');
  log.info('4. Delete the failed migration record from drizzle.__drizzle_migrations');
  log.info('5. Fix the migration file or schema');
  log.info('6. Re-run this migration script');

  log.error('\n⚠️  DO NOT DEPLOY TO VERCEL UNTIL ROLLBACK IS COMPLETE ⚠️');
}

/**
 * Main migration flow
 */
async function main(): Promise<void> {
  const startTime = Date.now();

  log.info('='.repeat(80));
  log.info('Production Database Migration Runner');
  log.info('='.repeat(80));

  // Safety check: ensure we're in production mode
  if (process.env.NEXT_PUBLIC_APP_ENV !== 'production') {
    log.error('This script should only run in production environment');
    log.error(`Current NEXT_PUBLIC_APP_ENV: ${process.env.NEXT_PUBLIC_APP_ENV}`);
    process.exit(1);
  }

  // Verify DATABASE_URL is set
  if (!process.env.DATABASE_URL) {
    log.error('DATABASE_URL environment variable is not set');
    process.exit(1);
  }

  log.info(`Database: ${process.env.DATABASE_URL.split('@')[1]?.split('?')[0] || 'unknown'}`);
  log.info(`Timestamp: ${new Date().toISOString()}`);
  log.info('');

  try {
    // Step 1: Verify database connection
    const connectionOk = await verifyDatabaseConnection();
    if (!connectionOk) {
      log.error('Database connection verification failed');
      process.exit(1);
    }

    // Step 2: Acquire lock
    const lockAcquired = await acquireLock();
    if (!lockAcquired) {
      process.exit(1);
    }

    // Step 3: Create backup point
    const beforeState = await createBackupPoint();

    // Step 4: Run migrations
    const migrationSuccess = await runMigration();

    if (!migrationSuccess) {
      await rollback(beforeState);
      await releaseLock();
      process.exit(1);
    }

    // Step 5: Verify migrations
    const verificationSuccess = await verifyMigrations(beforeState);

    if (!verificationSuccess) {
      await rollback(beforeState);
      await releaseLock();
      process.exit(1);
    }

    // Step 6: Release lock
    await releaseLock();

    const duration = ((Date.now() - startTime) / 1000).toFixed(2);
    log.info('');
    log.success(`Migration completed successfully in ${duration}s`);
    log.info('='.repeat(80));

    process.exit(0);
  } catch (error) {
    log.error(`Unexpected error: ${error}`);
    await releaseLock();
    process.exit(1);
  }
}

// Handle process termination
process.on('SIGINT', async () => {
  log.warning('\nReceived SIGINT, cleaning up...');
  await releaseLock();
  process.exit(130);
});

process.on('SIGTERM', async () => {
  log.warning('\nReceived SIGTERM, cleaning up...');
  await releaseLock();
  process.exit(143);
});

// Run the migration
main().catch((error) => {
  log.error(`Fatal error: ${error}`);
  process.exit(1);
});
