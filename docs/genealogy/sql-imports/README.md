# SQL Imports

This directory contains SQL import scripts for populating the genealogy schema with historical and documented capoeira figures.

## Directory Structure

```
sql-imports/
├── README.md                           # This file
├── deployed-state.json                 # Last deployed state (checksums)
├── entities/
│   ├── persons/                        # Person profile INSERTs only
│   │   └── [person-name].sql
│   └── groups/                         # Group profile INSERTs only
│       └── [group-name].sql
├── statements/
│   ├── persons/                        # All statements WHERE subject = person
│   │   └── [person-name].sql
│   └── groups/                         # All statements WHERE subject = group
│       └── [group-name].sql
└── build/
    ├── generate-migration.ts           # Migration generator script
    ├── pending-migration.sql           # Generated migration (uncommitted state)
    └── pending-state.json              # State snapshot after pending migration
```

## Key Principles

1. **Entities and statements are separate files**
   - Entity files contain ONLY the INSERT for person_profiles or group_profiles
   - Statement files contain ALL relationships WHERE that entity is the SUBJECT

2. **One subject per file**
   - `statements/persons/bimba.sql` contains all statements where Bimba is the subject
   - This makes ownership clear and prevents duplicate statements

3. **No SQL parsing needed**
   - Migration generation uses file checksums, not SQL parsing
   - Changed files are simply concatenated into the migration

## Workflow

### Adding a New Person/Group

1. Use `/import-person` or `/import-group` slash command
2. Two files are generated:
   - `entities/[type]/[name].sql` - Profile INSERT
   - `statements/[type]/[name].sql` - Relationship INSERTs (if any)
3. Generate migration: `pnpm db:genealogy:build`
4. Test locally: `pnpm db:genealogy:apply`
5. Review `build/pending-migration.sql`
6. Commit all changes

### Building Migrations

```bash
# Generate migration comparing current files to deployed-state.json
pnpm db:genealogy:build

# Preview what would be generated without writing files
pnpm db:genealogy:build:dry-run
```

### Deploying Migrations

1. Push to `develop` branch → GitHub Action applies to staging
2. Verify staging data is correct
3. Promote state: `mv build/pending-state.json deployed-state.json`
4. Commit deployed-state.json
5. Merge to `main` → GitHub Action applies to production

---

## SQL Template: Entity File (Person)

```sql
-- ============================================================
-- GENEALOGY PERSON: [Apelido]
-- Generated: [Date]
-- Primary Source: [URL]
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes_en,
  style_notes_pt,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  notes_en,
  notes_pt
) VALUES (
  '[Full Name]',
  '[Apelido]',
  '[title enum or NULL]'::genealogy.title,
  NULL, -- portrait URL if available
  ARRAY['https://...']::text[], -- or ARRAY[]::text[] if no links
  '[style enum or NULL]'::genealogy.style,
  E'[Style notes in English]',
  E'[Notas de estilo em português]',
  [year or NULL],
  '[precision]'::genealogy.date_precision,
  '[City, State, Country]',
  [year or NULL],
  '[precision]'::genealogy.date_precision,
  '[City, State, Country]',
  E'[Biography in English]',
  E'[Biografia em português]',
  '[Achievements in English]',
  '[Conquistas em português]',
  E'[Researcher notes in English]',
  E'[Notas de pesquisador em português]'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en,
  achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();
```

---

## SQL Template: Statements File (Person)

```sql
-- ============================================================
-- STATEMENTS FOR: [Apelido]
-- Generated: [Date]
-- ============================================================
-- This file contains all relationships where [Apelido] is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- [Apelido] student_of [Teacher]
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '[YYYY-MM-DD]'::date, '[precision]'::genealogy.date_precision,
  '[confidence]'::genealogy.confidence,
  '[Source citation]',
  '[Relationship context in English]',
  '[Contexto do relacionamento em português]'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = '[Subject Apelido]' AND o.apelido = '[Object Apelido]'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
```

---

## Bilingual Content Convention

**All narrative fields must include both English (_en) and Portuguese (_pt) versions:**

### Person Profiles
| Column | Description |
|--------|-------------|
| `bio_en` | Biography in English |
| `bio_pt` | Biografia em português |
| `achievements_en` | Achievements in English |
| `achievements_pt` | Conquistas em português |
| `style_notes_en` | Style notes in English |
| `style_notes_pt` | Notas de estilo em português |
| `notes_en` | Researcher notes in English |
| `notes_pt` | Notas de pesquisador em português |

### Group Profiles
| Column | Description |
|--------|-------------|
| `description_en` | Description in English |
| `description_pt` | Descrição em português |
| `philosophy_en` | Philosophy in English |
| `philosophy_pt` | Filosofia em português |
| `history_en` | History in English |
| `history_pt` | História em português |
| `style_notes_en` | Style notes in English |
| `style_notes_pt` | Notas de estilo em português |

### Statements
| Column | Description |
|--------|-------------|
| `notes_en` | Relationship notes in English |
| `notes_pt` | Notas de relacionamento em português |

---

## Enums Reference

### date_precision
- `exact` - Known to the day
- `month` - Known to the month
- `year` - Known to the year
- `decade` - Known to the decade
- `approximate` - Rough estimate
- `unknown` - Completely unknown

### confidence
- `verified` - Multiple reliable sources agree
- `likely` - Strong evidence but some uncertainty
- `unverified` - Single source or oral tradition
- `disputed` - Sources conflict

### predicates (person-to-person)
- `student_of` - Formal student-teacher relationship
- `trained_under` - Historical/past training, workshops
- `influenced_by` - Studied philosophy without direct training
- `family_of` - Family relationship (see properties.relationship_type)
- `baptized_by` - Received apelido from
- `granted_title_to` - Conferred a title/rank
- `associated_with` - Informal connection (see properties.association_context)

### predicates (person-to-group)
- `founded` - Founded the group (sole founder)
- `co_founded` - Equal partner in founding
- `leads` - Current primary leader
- `member_of` - Member of the group
- `teaches_at` - Teaches at the group
- `regional_coordinator_of` - Coordinates a region
- `cultural_pioneer_of` - First to bring capoeira to region/country
- `departed_from` - Left the group (see properties.departure_type)

### predicates (group-to-group)
- `part_of` - Branch or affiliate (see properties.affiliation_type)
- `split_from_group` - Separated from (see properties.split_type)
- `merged_into` - Group merged into another
- `evolved_from` - Major organizational transformation
- `affiliated_with` - Formal affiliation (non-hierarchical)
- `cooperates_with` - Regular cooperation without formal structure

---

## Research Tips

1. **Portuguese sources first**: Many primary sources are in Portuguese. Capture the original text, then translate to English.

2. **Escape single quotes**: Use `E'...'` syntax and escape single quotes as `''` (double single quote).

3. **Date precision**: Be explicit about uncertainty. Use `approximate` for "around 1900" and `year` for "1900".

4. **Researcher notes**: Use `notes_en`/`notes_pt` columns for date estimation reasoning, source conflicts, and caveats.

5. **ON CONFLICT clauses**: Entity files use upsert (DO UPDATE), statement files use idempotent insert (DO NOTHING).
