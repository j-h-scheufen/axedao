# Database Migrations with Atlas

This document explains the Atlas-based migration setup for safely deploying database changes to staging and production.

## Overview

Database migrations are managed using **Atlas**, a modern schema migration tool that works with Drizzle ORM schemas.

**Two separate migration workflows:**

1. **Staging Workflow** (`.github/workflows/db-migrate-staging.yml`)
   - Triggers on push to `develop` branch
   - Runs migrations on **staging database**
   - Uses `STAGING_DATABASE_URL` secret
   - Command: `atlas migrate apply --env staging`

2. **Production Workflow** (`.github/workflows/db-migrate-production.yml`)
   - Triggers on push to `main` branch
   - Runs migrations on **production database**
   - Uses `PRODUCTION_DATABASE_URL` secret
   - Command: `atlas migrate apply --env production`
   - Vercel auto-deploys via Git integration after workflow succeeds

## Why Two Workflows?

Having separate workflows solves a critical problem: **migration ordering conflicts**.

### The Problem Without Staging Workflow

```
Feature branch (migration #2)
         ↓
    Manual test on staging
         ↓
Main branch (also migration #2) ← CONFLICT!
```

### The Solution With Staging Workflow

```
Feature branch (migration #2)
         ↓
develop branch → Auto-migrate staging DB (#2)
         ↓
main branch → Auto-migrate production DB (#2)
```

Benefits:
- ✅ **No conflicts** - Migrations are timestamped and applied in order
- ✅ **Safe testing** - Test migrations in staging before production
- ✅ **Automatic** - No manual migration steps
- ✅ **Declarative** - Schema is source of truth (Drizzle ORM)
- ✅ **Linting** - Atlas validates migrations for safety issues

## Development Workflow

### 1. Create Feature with DB Changes

```bash
# Create feature branch from develop
git checkout develop
git pull
git checkout -b feature/add-new-table

# Make schema changes in db/schema.ts
vim db/schema.ts

# Generate migration
pnpm db:atlas:diff add_new_table

# Review the generated migration
cat db/atlas/migrations/<timestamp>_add_new_table.sql

# Test migration locally
pnpm db:local:reset  # Fresh DB with all migrations

# Commit and push
git add db/atlas/migrations db/schema.ts
git commit -m "feat: add new table for feature X"
git push origin feature/add-new-table
```

### 2. Merge to Develop (Staging)

```bash
# Create PR: feature/add-new-table → develop
# After PR approval and merge:
```

**What happens automatically:**
1. GitHub Actions detects push to `develop` branch
2. Runs `.github/workflows/db-migrate-staging.yml`
3. Connects to **staging database**
4. Runs `atlas migrate apply --env staging`
5. Migration shows in GitHub Actions logs
6. Staging database updated ✅

### 3. Test in Staging

- Test your feature with the staging database
- Verify migration worked correctly
- Confirm no data issues
- Check Atlas linting warnings (if any)

### 4. Merge to Main (Production)

```bash
# Create PR: develop → main
# After PR approval and merge:
```

**What happens automatically:**
1. GitHub Actions detects push to `main` branch
2. Runs `.github/workflows/db-migrate-production.yml`
3. Connects to **production database**
4. Runs `atlas migrate apply --env production` with strict linting
5. If successful: Triggers Vercel deployment
6. If failed: Blocks deployment, shows error details
7. Production database updated ✅

## Required GitHub Secrets

Go to: **Repository → Settings → Secrets and variables → Actions**

Add these secrets:

| Secret Name | Used By | Value |
|------------|---------|-------|
| `STAGING_DATABASE_URL` | Staging workflow | Supabase staging DB connection string |
| `PRODUCTION_DATABASE_URL` | Production workflow | Supabase production DB connection string |
| `ATLAS_CLOUD_TOKEN` | Both workflows | Atlas Cloud token (optional, for remote state) |

### Connection String Format

Use the **transaction pooler** URL for reliability:

```
postgresql://postgres.[PROJECT-REF]:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:5432/postgres
```

Get this from: **Supabase Project → Settings → Database → Connection string → Transaction pooler**

## Local Development

### Generate a New Migration

```bash
# Make changes to db/schema.ts
vim db/schema.ts

# Generate migration with descriptive name
pnpm db:atlas:diff add_user_avatar

# Migration created at: db/atlas/migrations/<timestamp>_add_user_avatar.sql
```

### Test Migrations Locally

```bash
# Reset local DB and apply all migrations
pnpm db:local:reset

# Or manually:
docker compose down -v
docker compose up -d
sleep 5
pnpm db:atlas:apply
```

### Preview Migration Plan

```bash
# See what would be applied without executing
pnpm db:atlas:preview
```

### Validate Migrations

```bash
# Check migrations for safety issues
pnpm db:atlas:lint

# Check migration status
pnpm db:atlas:status
```

## Atlas Configuration

Atlas is configured in `atlas.hcl` with three environments:

- **local**: Points to local Docker PostgreSQL database
- **staging**: Uses `STAGING_DATABASE_URL` environment variable
- **production**: Uses `PRODUCTION_DATABASE_URL` with strict linting

The schema source is generated from Drizzle ORM via `db/atlas/export-with-extensions.sh`, which combines:
- PostGIS extension setup
- Drizzle-generated schema from `db/schema.ts`

## Scripts Reference

| Script | Environment | Description |
|--------|-------------|-------------|
| `pnpm db:atlas:diff <name>` | Local | Generate migration from schema changes |
| `pnpm db:atlas:apply` | Local | Apply pending migrations |
| `pnpm db:atlas:preview` | Local | Preview migration plan (dry-run) |
| `pnpm db:atlas:lint` | Local | Validate migrations for safety issues |
| `pnpm db:atlas:status` | Local | Show migration status |
| `pnpm db:atlas:validate` | Local | Validate migration directory integrity |
| `pnpm db:local:reset` | Local | Reset local DB and apply all migrations |

## Migration Safety Features

Atlas includes built-in linting to detect:

- **Destructive operations** - DROP TABLE, DROP COLUMN, etc.
- **Data-dependent changes** - Adding NOT NULL to nullable columns
- **Backward incompatible changes** - Renaming columns, changing types

Linting is **advisory** in staging (warnings) but **enforced** in production (errors).

## Troubleshooting

### Migration Fails in Staging

1. Check GitHub Actions logs for error details
2. Fix the migration or schema in your feature branch
3. Generate a new migration if needed
4. Push changes - workflow runs again automatically
5. Do NOT merge to main until staging migration succeeds

### Migration Fails in Production

1. **DO NOT PANIC** - Deployment is blocked automatically
2. Check GitHub Actions logs for error details
3. If data loss occurred, restore from Supabase backup
4. Create a rollback migration (reverse the changes)
5. Test rollback in staging first
6. Merge rollback to main when staging succeeds

### Lint Errors in Production

If Atlas detects destructive changes:

1. Review the linting error in GitHub Actions logs
2. Determine if the change is intentional and safe
3. Options:
   - **Preferred**: Modify migration to be safer (e.g., nullable first)
   - **If necessary**: Add `--allow-dirty` flag in workflow (requires team approval)

### PostGIS Extension Issues

If migrations fail with "type geometry does not exist":

1. Verify `db/atlas/export-with-extensions.sh` is executable
2. Check that PostGIS is in the baseline migration
3. Ensure dev database URL uses PostGIS image

### Migration Already Applied

Atlas tracks applied migrations. If you get "already applied":

1. Check `pnpm db:atlas:status` to see current state
2. Verify you're on the correct database URL
3. If needed, use `--baseline` flag to skip existing migrations

## Best Practices

1. ✅ **Always test in staging first** - Never push directly to main with DB changes
2. ✅ **Descriptive migration names** - Use clear names like `add_user_avatar` not `migration1`
3. ✅ **Review generated SQL** - Always inspect the migration file before committing
4. ✅ **One migration per feature** - Keep migrations focused and atomic
5. ✅ **Safe schema changes** - Add columns as nullable first, backfill data, then add constraint
6. ✅ **Watch the workflow logs** - Verify migration succeeded after merging
7. ❌ **Never edit applied migrations** - Create a new migration to fix issues
8. ❌ **Never skip staging** - Even for "small" changes
9. ❌ **Never manually modify production DB** - All changes must go through migrations

## PostGIS Considerations

This project uses PostGIS for geospatial data. Key points:

- PostGIS extension is enabled in the **baseline migration**
- New databases are automatically set up with PostGIS
- Geometry types are available in all schemas
- Dev database uses `docker://postgis/17-3.5/dev` for validation

## Migration File Structure

```
db/atlas/
├── migrations/
│   ├── 20251120135529_baseline.sql          # Initial schema
│   ├── 20251120151443_add_group_id_index.sql # Incremental changes
│   └── atlas.sum                              # Checksum file
├── schema.sql                                 # Extension definitions
└── export-with-extensions.sh                 # Schema export wrapper
```

## Related Documentation

- [Atlas Documentation](https://atlasgo.io/docs) - Official Atlas docs
- [Drizzle ORM Docs](https://orm.drizzle.team/) - Schema syntax reference
- [PostGIS Documentation](https://postgis.net/documentation/) - Geospatial functions

## Questions?

- Check GitHub Actions logs first
- Run `pnpm db:atlas:status` to see current state
- Use `pnpm db:atlas:lint` to validate migrations locally
- Review Atlas docs at https://atlasgo.io
