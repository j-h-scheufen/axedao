# ⚠️ DEPRECATED: Drizzle Migrations

**This directory contains legacy Drizzle migrations that are no longer actively used.**

## Current Migration System

As of November 2025, this project uses **Atlas** for database migrations instead of Drizzle's migration system.

- **Active migrations**: Located in `db/atlas/migrations/`
- **Configuration**: `atlas.hcl` (quilombo root)
- **Why the change**: Atlas provides idempotent migrations, better safety checks, and more reliable production deployments

## What This Directory Contains

Historical Drizzle migrations (0000-0028) that were applied to the database before the Atlas transition. These files are kept for:

1. **Reference**: Understanding the database evolution history
2. **Rollback context**: If manual rollback is ever needed
3. **Documentation**: Schema changes made during Drizzle era

## Important Notes

- ❌ **Do NOT run these migrations** using `drizzle-kit migrate`
- ❌ **Do NOT add new migrations here** - use Atlas instead
- ✅ All schema changes should be made in `db/schema.ts` (Drizzle ORM)
- ✅ Generate new migrations using Atlas: `pnpm db:atlas:diff --env local`

## Migration History Cutoff

**Last Drizzle migration**: `0028_lowercase-country-code.sql`
**Atlas adoption**: After migration 0028 was applied to production
**Atlas baseline**: Established from schema state after migration 0028

## Future

This directory may be removed in a future cleanup once:
- All environments have migrated to Atlas
- Sufficient time has passed for historical reference needs
- No rollback scenarios require these files

## For Developers

If you need to make schema changes:

1. Edit `db/schema.ts` (Drizzle schema definition)
2. Generate migration: `pnpm db:atlas:diff --env local migration_name`
3. Review generated migration in `db/atlas/migrations/`
4. Apply locally: `pnpm db:atlas:apply --env local`
5. Commit the migration file to git

See `apps/quilombo/.claude/CLAUDE.md` for detailed Atlas workflow documentation.
