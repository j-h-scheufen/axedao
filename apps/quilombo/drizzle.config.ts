import type { Config } from 'drizzle-kit';

// Simple config for migrations - only needs DATABASE_URL
// Avoids loading full environment config with all its validations
const databaseUrl = process.env.DATABASE_URL;

if (!databaseUrl) {
  throw new Error('DATABASE_URL environment variable is required for drizzle-kit');
}

export default {
  schema: './db/schema.ts',
  out: './db/migrations',
  dialect: 'postgresql',
  dbCredentials: {
    url: databaseUrl,
  },
  extensionsFilters: ['postgis'],
  verbose: true,
  strict: true,
} satisfies Config;
