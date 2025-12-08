# Genealogy SQL Import Manifest

This manifest documents the SQL import files and their dependencies. The actual import process is handled by the `sync.sh` script.

## Sync Script Usage

```bash
# Show current import status
./sync.sh --status

# Dry run (show what would be done)
./sync.sh --dry-run

# Sync to local database (uses DATABASE_URL env var)
./sync.sh

# Sync to specific database
./sync.sh "postgres://user:pass@host:port/db"

# Sync to staging
./sync.sh "$STAGING_DATABASE_URL"

# Sync to production
./sync.sh "$PRODUCTION_DATABASE_URL"

# Force re-run ALL files (useful after adding new persons)
./sync.sh --force
```

## How Sync Works

The sync script determines which files need to be imported based on:

1. **New files**: Files not yet in `genealogy.import_log`
2. **Changed files**: Files where the MD5 checksum differs from stored value
3. **Forced**: All files when `--force` flag is used

### When to Use --force

Use `--force` after adding new persons/groups when you want to create statements that reference them. For example:

1. Import `besouro-manganga.sql` (references Nascimento Grande who doesn't exist yet) → profile created, statement skipped
2. Import `nascimento-grande.sql` → profile created
3. Run `./sync.sh --force` → re-runs Besouro's file, statement now created

The `ON CONFLICT DO NOTHING` pattern ensures re-runs are safe and idempotent.

### Idempotent SQL Pattern

All SQL files use idempotent patterns:

**Profiles**: Use `ON CONFLICT ... DO UPDATE` to upsert
```sql
INSERT INTO genealogy.person_profiles (...) VALUES (...)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  ...
  updated_at = NOW();
```

**Important**: All narrative content uses bilingual columns (`_en` / `_pt`). See `docs/genealogy/BILINGUAL_CONTENT.md` for details.

**Statements**: Use `ON CONFLICT DO NOTHING` to skip duplicates
```sql
INSERT INTO genealogy.statements (...)
SELECT ...
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
```

This allows files to be re-run safely without creating duplicates.

## Checking Import Status

```sql
-- See all imported files
SELECT entity_type, file_path, imported_at, checksum, dependencies
FROM genealogy.import_log
ORDER BY imported_at;

-- Check if a specific file was imported
SELECT * FROM genealogy.import_log
WHERE file_path = 'persons/manduca-da-praia.sql';

-- Find files that depend on a specific file
SELECT file_path
FROM genealogy.import_log
WHERE 'persons/manduca-da-praia.sql' = ANY(dependencies);

-- Count imports by type
SELECT entity_type, COUNT(*)
FROM genealogy.import_log
GROUP BY entity_type;
```

---

## Persons Import Reference

Files are listed in recommended import order (dependencies first).

| Order | File | Dependencies | Description |
|-------|------|--------------|-------------|
| 1 | persons/adao.sql | none | First documented capoeirista (1789) |
| 2 | persons/major-vidigal.sql | none | Police chief & capoeira master (1745-1843) |
| 3 | persons/manduca-da-praia.sql | none | Chief of Nagôas malta, Rio de Janeiro |
| 4 | persons/nascimento-grande.sql | manduca-da-praia | Legendary Pernambuco capoeirista (1842-1936) |
| 5 | persons/placido-de-abreu.sql | manduca-da-praia | First capoeira historian (1857-1894) |
| 6 | persons/tio-alipio.sql | roda-de-trapiche-de-baixo | African proto-mestre, teacher of Besouro Mangangá |
| 7 | persons/besouro-manganga.sql | roda-de-trapiche-de-baixo | Legendary Bahia capoeirista (1895-1924) |

---

## Groups Import Reference

| Order | File | Dependencies | Description |
|-------|------|--------------|-------------|
| 1 | groups/roda-de-trapiche-de-baixo.sql | none | Informal capoeira community in Santo Amaro (~1888-1924) |

---

## Adding New Imports

When creating a new SQL import file:

1. **Follow the template** in the `/import-person` or `/import-group` commands
2. **Write bilingual content**: All narrative fields (`bio`, `description`, `achievements`, `history`, `philosophy`, `style_notes`, statement `notes`) must include both `_en` and `_pt` versions. See `docs/genealogy/BILINGUAL_CONTENT.md`
3. **List dependencies** in the SQL file header comment and in the `import_log` INSERT
4. **Use idempotent patterns**: `ON CONFLICT DO UPDATE` for profiles, `ON CONFLICT DO NOTHING` for statements
5. **Test locally** before syncing to staging/production

## Re-running Imports After Edits

If you edit a SQL file:

1. The sync script will detect the checksum change
2. Running `./sync.sh` will re-import the file
3. The upsert pattern ensures profiles are updated, not duplicated
4. The `ON CONFLICT DO NOTHING` pattern ensures statements aren't duplicated

## Workflow Example

```bash
# 1. Check current status
./sync.sh --status

# 2. Add a new person import file
# (use /import-person command)

# 3. Preview what will be imported
./sync.sh --dry-run

# 4. Import to local database
./sync.sh

# 5. Verify the import
./sync.sh --status

# 6. When ready, sync to staging
./sync.sh "$STAGING_DATABASE_URL"

# 7. After verification, sync to production
./sync.sh "$PRODUCTION_DATABASE_URL"
```
