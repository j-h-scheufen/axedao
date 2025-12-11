# Genealogy Data Deployment

This document describes how to deploy genealogy data (persons, groups, statements) to staging and production databases.

## Overview

The deployment system uses a **stateful migration generator** that:
- Compares current `.sql` files against the last deployed state
- Generates a single consolidated migration with only the changes (delta)
- Tracks statement signatures to detect additions and deletions
- Produces idempotent SQL safe for re-runs

## Files

```
docs/genealogy/sql-imports/
├── persons/*.sql              # Individual person import files
├── groups/*.sql               # Individual group import files
├── sync.sh                    # Local dev sync (direct to localhost DB)
├── deployed-state.json        # Baseline state from last deployment
└── build/
    ├── generate-migration.ts  # Migration generator script
    ├── pending-migration.sql  # Generated: SQL to apply
    └── pending-state.json     # Generated: state after migration
```

## Workflow

### 1. Edit SQL Files

Make changes to files in `persons/` or `groups/`. Use the `/import-person` or `/import-group` commands to generate new files.

### 2. Test Locally

Sync changes to your local database:

```bash
pnpm db:genealogy:sync        # Apply new/changed files
pnpm db:genealogy:sync:force  # Re-apply all files
pnpm db:genealogy:status      # Check sync status
```

### 3. Generate Migration

Once local testing looks good, generate the deployment migration:

```bash
pnpm db:genealogy:build           # Generate migration files
pnpm db:genealogy:build:dry-run   # Preview without writing files
```

This creates:
- `build/pending-migration.sql` - The SQL to run on staging/production
- `build/pending-state.json` - Snapshot of state after migration applies

### 4. Review the Migration

Inspect `build/pending-migration.sql` to verify:
- Correct entities are being upserted
- Expected statements are being inserted
- Any statement deletions are intentional

The migration has four phases:
1. DELETE orphaned statements (from removed/changed files)
2. UPSERT entities (persons first, then groups)
3. INSERT new statements
4. UPDATE import_log entries

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

### Statement Deletion

When you remove a statement from a `.sql` file, the migration generator detects this and generates a DELETE statement. This is tracked via "statement signatures" (subject + predicate + object + startedAt).

### Entity Preservation

Entities (persons, groups) are **never auto-deleted**, even if you delete their `.sql` file. Only statements from deleted files are removed. To delete an entity, you must do so manually in the database.

### Forgetting to Confirm

If you forget to move `pending-state.json` → `deployed-state.json` after staging, the next `pnpm db:genealogy:build` will regenerate the same migration. This is safe (idempotent) but wasteful.

### Manual Trigger

Both GitHub workflows support `workflow_dispatch` for manual triggering:
- Go to Actions → Select workflow → Run workflow
- Use "dry run" option to preview without applying

## Troubleshooting

### Migration shows all files as "new"

The `deployed-state.json` is empty or missing. This happens on first deployment or if the file was reset. The migration will include all entities and statements.

### Statement not being deleted

Check that the statement signature matches exactly. The signature includes:
- Subject type and identifier (apelido/name)
- Predicate
- Object type and identifier
- started_at date (or NULL)

### Parsing warnings

If you see "Could not extract entity block" warnings, the SQL file format may not match expected patterns. Ensure files follow the standard template from `/import-person` or `/import-group`.
