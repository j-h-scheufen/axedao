import type { Config } from 'drizzle-kit';
import { config } from 'dotenv';

// Load environment variables from .env and .env.local (local overrides .env)
// This allows drizzle-kit commands to work without manually exporting DATABASE_URL
config({ path: '.env', quiet: true });
config({ path: '.env.local', override: true, quiet: true });

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
