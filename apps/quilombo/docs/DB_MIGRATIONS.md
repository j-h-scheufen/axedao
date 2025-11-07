# Database Migrations: Staging & Production Setup

This document explains the two-environment migration setup for safely deploying database changes.

## Overview

Your project now has **two separate migration workflows**:

1. **Staging Workflow** (`.github/workflows/db-migrate-staging.yml`)
   - Triggers on push to `develop` branch
   - Runs migrations on **staging database**
   - Uses `STAGING_DATABASE_URL` secret
   - Script: `pnpm migrate:staging`

2. **Production Workflow** (`.github/workflows/db-migrate-production.yml`)
   - Triggers on push to `main` branch
   - Runs migrations on **production database**
   - Uses `PRODUCTION_DATABASE_URL` secret
   - Script: `pnpm migrate:production`
   - Triggers Vercel deployment after success

## Why Two Workflows?

Having separate workflows solves a critical problem: **migration ordering conflicts**.

### The Problem Without Staging Workflow

```
Feature branch (migration #22)
         ↓
    Manual test on staging
         ↓
Main branch (also migration #22) ← CONFLICT!
```

### The Solution With Staging Workflow

```
Feature branch (migration #22)
         ↓
develop branch → Auto-migrate staging DB (#22)
         ↓
main branch → Auto-migrate production DB (#22)
```

Benefits:
- ✅ **No conflicts** - Migrations are numbered and applied in the same order
- ✅ **Safe testing** - Test migrations in staging before production
- ✅ **Automatic** - No manual migration steps
- ✅ **Can manually trigger** - Test staging workflow from feature branches

## Development Workflow

### 1. Create Feature with DB Changes

```bash
# Create feature branch from develop
git checkout develop
git pull
git checkout -b feature/add-new-table

# Make schema changes
vim db/schema.ts

# Generate migration
pnpm db:generate

# Commit and push
git add db/migrations db/schema.ts
git commit -m "feat: add new table for feature X"
git push origin feature/add-new-table
```

### 2. Merge to Develop (Staging)

```bash
# Create PR: feature/add-new-table → develop
# After PR approval and merge:
```

**What happens automatically:**
1. GitHub Actions detects DB changes on `develop` branch
2. Runs `.github/workflows/db-migrate-staging.yml`
3. Connects to **staging database**
4. Runs migration using `scripts/db-migrate-staging.ts`
5. Migration shows in GitHub Actions logs
6. Staging database updated ✅

### 3. Test in Staging

- Test your feature with the staging database
- Verify migration worked correctly
- Confirm no data issues

### 4. Merge to Main (Production)

```bash
# Create PR: develop → main
# After PR approval and merge:
```

**What happens automatically:**
1. GitHub Actions detects DB changes on `main` branch
2. Runs `.github/workflows/db-migrate-production.yml`
3. Connects to **production database**
4. Runs migration using `scripts/db-migrate-production.ts`
5. If successful: Triggers Vercel deployment
6. If failed: Blocks deployment, shows rollback instructions
7. Production database updated ✅

## Required GitHub Secrets

Go to: **Repository → Settings → Secrets and variables → Actions**

Add these secrets:

| Secret Name | Used By | Value |
|------------|---------|-------|
| `STAGING_DATABASE_URL` | Staging workflow | Supabase staging DB connection string |
| `PRODUCTION_DATABASE_URL` | Production workflow | Supabase production DB connection string |
| `VERCEL_DEPLOY_HOOK_URL` | Production workflow | Vercel deploy hook URL (optional) |

### Connection String Format

Use the **transaction pooler** URL for reliability:

```
postgresql://postgres.[PROJECT-REF]:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:5432/postgres?options=-csearch_path%3D%24user,public,extensions,gis
```

Get this from: **Supabase Project → Settings → Database → Connection string → Transaction pooler**

## Manual Testing (Optional)

You can manually trigger the staging workflow to test migrations from any branch:

1. Go to **GitHub → Actions → Staging Database Migration**
2. Click **"Run workflow"**
3. Select your feature branch
4. Click **"Run workflow"**

⚠️ **Important:** This runs against the **staging database**, not production!

## Local Testing

### Test Staging Migration Locally

```bash
cd apps/quilombo

# Set staging environment variables
export DATABASE_URL="your-staging-database-url"
export NEXT_PUBLIC_APP_ENV="staging"
export NEXT_PUBLIC_WALLET_ENV="staging"
export NEXT_PUBLIC_CHAIN_ENV="development"

# Run staging migration
pnpm migrate:staging
```

### Test Production Migration Locally

```bash
cd apps/quilombo

# Set production environment variables
export DATABASE_URL="your-production-database-url"
export NEXT_PUBLIC_APP_ENV="production"
export NEXT_PUBLIC_WALLET_ENV="production"
export NEXT_PUBLIC_CHAIN_ENV="development"

# Run production migration
pnpm migrate:production
```

## Scripts Reference

| Script | Environment | Description |
|--------|-------------|-------------|
| `pnpm db:generate` | Local | Generate migration from schema changes |
| `pnpm db:migrate` | Local | Run migrations locally (development DB) |
| `pnpm migrate:staging` | Staging | Run migrations on staging database |
| `pnpm migrate:production` | Production | Run migrations on production database |

## Troubleshooting

### Migration Fails in Staging

1. Check GitHub Actions logs for error details
2. Fix the migration or schema in your feature branch
3. Push changes - workflow runs again automatically
4. Do NOT merge to main until staging migration succeeds

### Migration Fails in Production

1. **DO NOT PANIC** - Deployment is blocked automatically
2. Check GitHub Actions logs for rollback instructions
3. Connect to production database (Supabase SQL Editor)
4. Follow rollback SQL provided in logs
5. Fix the migration in a new branch
6. Test in staging first
7. Merge fix to main when staging succeeds

### "Another migration is currently running"

One of these situations:
- Someone else triggered a migration
- Previous migration didn't release lock

**Solution:**
```sql
-- In Supabase SQL Editor (for affected environment)
SELECT pg_advisory_unlock_all();
```

Then re-run the workflow.

### Different Migration Numbers in Staging vs Production

**This should never happen** with the two-workflow setup! If it does:

1. Check which environment is behind
2. Identify missing migrations
3. Create a migration plan to sync them
4. Contact team lead before proceeding

## Best Practices

1. ✅ **Always test in staging first** - Never push directly to main with DB changes
2. ✅ **One migration per feature** - Keep migrations focused and small
3. ✅ **Document complex migrations** - Add comments explaining what and why
4. ✅ **Watch the workflow logs** - Verify migration succeeded after merging
5. ✅ **Nullable columns first** - Add new columns as nullable, populate data, then add NOT NULL constraint in separate migration
6. ❌ **Never edit applied migrations** - Create a new migration to fix issues
7. ❌ **Never skip staging** - Even for "small" changes

## Safety Features

Both workflows include:
- ✅ **Advisory locks** - Prevents concurrent migrations
- ✅ **Pre-migration state tracking** - Records current state before changes
- ✅ **Automatic verification** - Confirms migrations applied correctly
- ✅ **Rollback instructions** - Provides detailed recovery steps on failure
- ✅ **Deployment blocking** - Stops Vercel deploy if migration fails (production only)
- ✅ **Detailed logging** - Full audit trail in GitHub Actions
- ✅ **Minimal dependencies** - Uses `db/connection.ts` to avoid loading full app configuration

## Related Documentation

- [Full Migration Documentation](./DB_MIGRATIONS_PRODUCTION.md) - Detailed technical guide
- [Setup Checklist](./MIGRATION_SETUP_CHECKLIST.md) - Initial setup steps
- [Drizzle ORM Docs](https://orm.drizzle.team/) - Schema and migration syntax

## Questions?

- Check GitHub Actions logs first
- Review [Troubleshooting Guide](./DB_MIGRATIONS_PRODUCTION.md#troubleshooting)
- Contact team lead if unsure about rollback
