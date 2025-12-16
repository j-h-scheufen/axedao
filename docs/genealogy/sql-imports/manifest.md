# Genealogy SQL Import Manifest

This manifest documents the SQL import files and their migration workflow.

## Directory Structure

```
sql-imports/
├── entities/
│   ├── persons/           # 71 person profiles
│   └── groups/            # 3 group profiles
├── statements/
│   ├── persons/           # 61 person statement files
│   └── groups/            # 1 group statement file
├── build/
│   ├── generate-migration.ts
│   ├── pending-migration.sql
│   └── pending-state.json
├── deployed-state.json    # Last deployed checksums
├── README.md
└── manifest.md            # This file
```

## Migration Workflow

### Generate Migration

```bash
# Generate migration (compares files to deployed-state.json)
pnpm db:genealogy:build

# Preview only (no files written)
pnpm db:genealogy:build:dry-run
```

### Deploy Migration

1. Push to `develop` → GitHub Action applies `pending-migration.sql` to staging
2. Verify staging data is correct
3. Promote state: `mv build/pending-state.json deployed-state.json`
4. Commit and push `deployed-state.json`
5. Merge to `main` → GitHub Action applies to production

### Local Testing

```bash
# Generate migration from current files
pnpm db:genealogy:build

# Apply migration to local database
pnpm db:genealogy:apply
```

## File Format

### Entity Files (`entities/persons/*.sql`, `entities/groups/*.sql`)

Each entity file contains ONLY the profile INSERT with ON CONFLICT upsert:

```sql
-- ============================================================
-- GENEALOGY PERSON: [Apelido]
-- Generated: [Date]
-- ============================================================

INSERT INTO genealogy.person_profiles (...)
VALUES (...)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  ...
  updated_at = NOW();
```

No statements, no import_log, no BEGIN/COMMIT.

### Statement Files (`statements/persons/*.sql`, `statements/groups/*.sql`)

Each statement file contains ALL relationships where the entity is the SUBJECT:

```sql
-- ============================================================
-- STATEMENTS FOR: [Apelido]
-- Generated: [Date]
-- ============================================================

-- [Subject] student_of [Object]
INSERT INTO genealogy.statements (...)
SELECT ...
ON CONFLICT (...) DO NOTHING;

-- [Subject] member_of [Group]
INSERT INTO genealogy.statements (...)
SELECT ...
ON CONFLICT (...) DO NOTHING;
```

Statements use `ON CONFLICT DO NOTHING` for idempotency.

## Ownership Rules

**Key principle: Each statement lives in ONE file only - the subject's file.**

- `Bimba student_of Bentinho` → lives in `statements/persons/bimba.sql`
- `GCAP part_of GCAP-HQ` → lives in `statements/groups/gcap.sql`

This prevents duplicate statements and makes ownership clear.

---

## Current Import Summary

### Persons (71 entities, 61 statement files)

| Count | Category | Examples |
|-------|----------|----------|
| 25 | Layer Zero (pre-1900) | Adão, Manduca da Praia, Cyriaco |
| 35 | Early Mestres (1900-1940) | Bimba, Pastinha, Waldemar |
| 11 | Proto-Mestres (teachers of mestres) | Bentinho, Tio Alípio, Noronha |

### Groups (3 entities, 1 statement file)

| Name | Type | Period |
|------|------|--------|
| Roda de Trapiche de Baixo | Informal community | ~1888-1924 |
| Roda do Matatu Preto | Sunday training circle | 1930s |
| Gengibirra | Informal group | 1920s |

---

## Adding New Imports

1. **Use slash commands**: `/import-person [name]` or `/import-group [name]`
2. **Two files generated**:
   - `entities/[type]/[name].sql` - Profile INSERT
   - `statements/[type]/[name].sql` - Relationship INSERTs (if any)
3. **Build migration**: `pnpm db:genealogy:build`
4. **Test locally**: `pnpm db:genealogy:apply`
5. **Review**: Check `build/pending-migration.sql`
6. **Commit**: All changes including build/ files

## Bilingual Content

All narrative fields must include both English (`_en`) and Portuguese (`_pt`) versions:

- Person profiles: `bio`, `achievements`, `style_notes`, `notes`
- Group profiles: `description`, `philosophy`, `history`, `style_notes`
- Statements: `notes`

See `docs/genealogy/BILINGUAL_CONTENT.md` for details.

## Idempotent SQL Patterns

**Person Profiles** use `ON CONFLICT ... DO UPDATE`:
```sql
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  ...
  updated_at = NOW();
```

**Group Profiles** use `ON CONFLICT ... DO UPDATE`:
```sql
ON CONFLICT (name, COALESCE(name_context, '')) WHERE name IS NOT NULL DO UPDATE SET
  style = EXCLUDED.style,
  ...
  updated_at = NOW();
```

**Statements** use `ON CONFLICT ... DO NOTHING`:
```sql
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
```

The `COALESCE` expressions match the unique indexes and handle NULL values correctly.

## Checking Database State

```sql
-- Count entities by type
SELECT
  'persons' as type, COUNT(*) FROM genealogy.person_profiles
UNION ALL
SELECT
  'groups' as type, COUNT(*) FROM genealogy.group_profiles
UNION ALL
SELECT
  'statements' as type, COUNT(*) FROM genealogy.statements;

-- List all persons
SELECT apelido, name, title, birth_year
FROM genealogy.person_profiles
ORDER BY apelido;

-- List all statements for a person
SELECT
  s.predicate,
  CASE s.object_type
    WHEN 'person' THEN p.apelido
    WHEN 'group' THEN g.name
  END as object,
  s.confidence
FROM genealogy.statements s
JOIN genealogy.person_profiles subj ON s.subject_id = subj.id AND s.subject_type = 'person'
LEFT JOIN genealogy.person_profiles p ON s.object_id = p.id AND s.object_type = 'person'
LEFT JOIN genealogy.group_profiles g ON s.object_id = g.id AND s.object_type = 'group'
WHERE subj.apelido = 'Bimba';
```
