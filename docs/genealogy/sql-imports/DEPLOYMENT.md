# Genealogy Data Deployment

This document describes how to deploy genealogy data (persons, groups, statements) to staging and production databases.

## Overview

The deployment system uses a **stateful migration generator** that:
- Compares current `.sql` files against the last deployed state (checksums)
- Generates a single consolidated migration with only the changes (delta)
- Concatenates entity files first, then statement files
- Produces idempotent SQL safe for re-runs

## Directory Structure

```
docs/genealogy/sql-imports/
├── entities/
│   ├── persons/*.sql           # Person profile INSERTs
│   └── groups/*.sql            # Group profile INSERTs
├── statements/
│   ├── persons/*.sql           # Person relationship INSERTs
│   └── groups/*.sql            # Group relationship INSERTs
├── deployed-state.json         # Baseline state from last deployment
└── build/
    ├── generate-migration.ts   # Migration generator script
    ├── pending-migration.sql   # Generated: SQL to apply
    └── pending-state.json      # Generated: state after migration
```

## Workflow

### 1. Edit SQL Files

Make changes to files in `entities/` or `statements/`. Use the `/import-person` or `/import-group` commands to generate new files.

**Key principle**: Each statement lives in ONE file only - the subject's file in `statements/`.

### 2. Generate Migration

```bash
pnpm db:genealogy:build           # Generate migration files
pnpm db:genealogy:build:dry-run   # Preview without writing files
```

This creates:
- `build/pending-migration.sql` - The SQL to run on staging/production
- `build/pending-state.json` - Snapshot of state after migration applies

### 3. Test Locally

Apply the migration to your local database:

```bash
pnpm db:genealogy:apply
```

### 4. Review the Migration

Inspect `build/pending-migration.sql` to verify:
- Correct entities are being upserted
- Expected statements are being inserted

The migration has two phases:
1. UPSERT entities (persons first, then groups)
2. INSERT statements (with ON CONFLICT DO NOTHING)

### 5. Commit and Push to Staging

```bash
git add docs/genealogy/sql-imports/
git commit -m "feat(genealogy): add new persons and statements"
git push origin develop
```

The GitHub Action `.github/workflows/genealogy-deploy-staging.yml` will:
- Detect the `pending-migration.sql` file changed
- Apply it to the staging database
- Report statistics in the workflow summary

### 6. Verify Staging

Test the staging environment:
- Check the genealogy graph renders correctly
- Verify new persons/groups appear
- Confirm statements create expected connections

### 7. Confirm the Deployment

Once staging looks good, update the baseline state:

```bash
mv docs/genealogy/sql-imports/build/pending-state.json docs/genealogy/sql-imports/deployed-state.json
git add docs/genealogy/sql-imports/deployed-state.json
git commit -m "chore(genealogy): confirm staging deployment"
```

This "locks in" the current state as the baseline for future migrations.

### 8. Deploy to Production

Merge to main:

```bash
git checkout main
git merge develop
git push origin main
```

The GitHub Action `.github/workflows/genealogy-deploy-production.yml` will apply the same migration to production.

## Important Notes

### Idempotency

All SQL uses `ON CONFLICT` clauses, making it safe to re-run:
- Entity INSERTs use `ON CONFLICT DO UPDATE`
- Statement INSERTs use `ON CONFLICT DO NOTHING`

### No SQL Parsing

The new structure eliminates SQL parsing complexity:
- Entity files contain only the profile INSERT
- Statement files contain only relationship INSERTs
- Migration generator just concatenates files based on checksum diffs

### Entity Preservation

Entities (persons, groups) are **never auto-deleted**, even if you delete their `.sql` file. Deleted files generate a warning but require manual database cleanup.

### Forgetting to Confirm

If you forget to move `pending-state.json` → `deployed-state.json` after staging, the next `pnpm db:genealogy:build` will regenerate the same migration. This is safe (idempotent) but wasteful.

### Manual Trigger

Both GitHub workflows support `workflow_dispatch` for manual triggering:
- Go to Actions → Select workflow → Run workflow
- Use "dry run" option to preview without applying

## Troubleshooting

### Migration shows all files as "new"

The `deployed-state.json` is empty or missing. This happens on first deployment or if the file was reset. The migration will include all entities and statements.

### Statement not inserted

Check that the referenced entities exist. Statements use SELECT to look up IDs by apelido/name - if the entity doesn't exist, the INSERT returns 0 rows.

### Duplicate statement warnings

With the new structure, each statement should exist in exactly one file (the subject's file). If you see duplicates, check that you haven't added the same relationship in multiple files.
