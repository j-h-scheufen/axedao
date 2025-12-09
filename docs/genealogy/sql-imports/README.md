# SQL Imports

This directory contains SQL import scripts for populating the genealogy schema with historical and documented capoeira figures.

## Directory Structure

```
sql-imports/
├── README.md                    # This file
├── persons/                     # Person profile imports
│   └── [person-name].sql
└── groups/                      # Group profile imports
    └── [group-name].sql
```

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

### JSONB Properties (BilingualText)
For `properties.context` and `properties.association_context`:
```json
{
  "context": {
    "en": "Context in English",
    "pt": "Contexto em português"
  }
}
```

---

## SQL Template: Person Import

```sql
-- ============================================================
-- GENEALOGY PERSON IMPORT: [Name]
-- Generated: [Date]
-- Primary Sources:
--   - [Source URL or citation]
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  achievements_pt
) VALUES (
  -- Identity
  '[Full Name]',
  '[Apelido]',
  '[title enum or NULL]',
  NULL, -- portrait URL if available
  '[{"type": "website", "url": "..."}]'::jsonb,
  -- Capoeira-specific
  '[style enum or NULL]',
  E'[Style notes in English]',
  E'[Notas de estilo em português]',
  -- Life dates
  [year or NULL],
  '[precision]'::genealogy.date_precision,
  '[City, State, Country]',
  [year or NULL],
  '[precision]'::genealogy.date_precision,
  '[City, State, Country]',
  -- Extended content (bilingual)
  E'[Biography in English - use E'' for escaping single quotes]',
  E'[Biografia em português - use E'' para escapar aspas simples]',
  '[Achievements in English]',
  '[Conquistas em português]'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Example: Person was student_of another Person
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

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/[filename].sql',
  NULL,
  ARRAY['[dependency files]'],
  '[Brief description]'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

-- ============================================================
-- NOTES
-- ============================================================
--
-- [Document any uncertainties, date discrepancies, pending relationships]
--
-- ============================================================
```

---

## SQL Template: Group Import

```sql
-- ============================================================
-- GENEALOGY GROUP IMPORT: [Name]
-- Generated: [Date]
-- Primary Sources:
--   - [Source URL or citation]
-- ============================================================

BEGIN;

-- ============================================================
-- GROUP PROFILE
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  name_aliases,
  logo,
  links,
  -- Style
  style,
  style_notes_en,
  style_notes_pt,
  -- Founding
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content (bilingual)
  description_en,
  description_pt,
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Status
  is_active,
  dissolved_at,
  legal_structure,
  is_headquarters
) VALUES (
  '[Group Name]',
  ARRAY['[Alias 1]', '[Alias 2]'],
  NULL, -- logo URL if available
  '[{"type": "website", "url": "..."}]'::jsonb,
  -- Style
  '[style enum or NULL]',
  E'[Style notes in English]',
  E'[Notas de estilo em português]',
  -- Founding
  [year or NULL],
  '[precision]'::genealogy.date_precision,
  '[City, State, Country]',
  -- Extended content (bilingual)
  E'[Description in English]',
  E'[Descrição em português]',
  E'[Philosophy in English]',
  E'[Filosofia em português]',
  E'[History in English]',
  E'[História em português]',
  -- Status
  true, -- is_active
  NULL, -- dissolved_at
  NULL, -- legal_structure
  false -- is_headquarters
)
ON CONFLICT (name) DO UPDATE SET
  name_aliases = EXCLUDED.name_aliases,
  logo = EXCLUDED.logo,
  links = EXCLUDED.links,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- [Add relationship statements as needed]

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'group',
  'groups/[filename].sql',
  NULL,
  ARRAY[]::text[],
  '[Brief description]'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
```

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
- `family_of` - Family relationship (see properties.relationship_type)
- `baptized_by` - Received apelido from
- `associated_with` - Informal connection (see properties.association_context)

### predicates (person-to-group)
- `founder_of` - Founded the group
- `member_of` - Member of the group
- `teaches_at` - Teaches at the group
- `departed_from` - Left the group (see properties.departure_type)

### predicates (group-to-group)
- `part_of` - Branch or affiliate
- `split_from_group` - Separated from (see properties.split_type)

---

## Research Tips

1. **Portuguese sources first**: Many primary sources are in Portuguese. Capture the original text, then translate to English.

2. **Escape single quotes**: Use `E'...'` syntax and escape single quotes as `''` (double single quote).

3. **Dependencies**: List all SQL files that must be imported before this one for relationship statements to work.

4. **Date precision**: Be explicit about uncertainty. Use `approximate` for "around 1900" and `year` for "1900".

5. **Notes section**: Document uncertainties, source conflicts, and pending relationships at the end of the file.
