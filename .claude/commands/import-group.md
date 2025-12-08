# Import Group to Genealogy Database

**Purpose:** Research a capoeira group and generate SQL to import their profile and relationships into the genealogy schema.

**Input:** Group name and optionally a website/source URL

**Output:** SQL file written to `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql`

---

## Instructions

You are researching **$ARGUMENTS** to create a complete group profile for the genealogy database.

### Phase 0: Check Group Reports Directory FIRST

Before starting web research, check if we already have documentation on this group:

1. **Check for individual file:** Look for `docs/genealogy/group-reports/[name-lowercase].md`
   - Use lowercase with hyphens for spaces (e.g., `grupo-senzala.md`, `abada-capoeira.md`)
   - For acronyms, use lowercase (e.g., `gcap.md`, `ceca.md`)

2. **If individual file exists:** Read that file for existing research
   - Use this as your starting point
   - Verify and expand on existing information
   - Note any discrepancies with new research

3. **If no individual file exists:** Proceed to Phase 1

### CRITICAL: Research Requirements

**You MUST perform extensive web research using WebSearch and WebFetch tools:**

1. Search multiple queries to find all available information
2. Fetch and read the actual web pages from sources found
3. Look for founding details, history, philosophy, leadership
4. Search for official websites, Wikipedia, capoeira directories
5. Cross-reference multiple sources to verify information
6. Document ALL names discovered during research (founders, leaders, teachers, notable members)

### Phase 1: Research & Data Collection

**IMPORTANT: Read the research sources file first!**

Before starting web searches, read `docs/genealogy/sources/research-sources.md` for:
- Tier 1-4 source rankings by reliability
- Specific URL patterns for each source
- What data is available from each source
- Tips for extracting information

**Research priority by tier:**
1. **Always check the group's official website first** (if known)
2. Then check **Tier 1** sources (highest reliability) - Wikipedia, Lalaue
3. Cross-reference with **Tier 2** sources - IPHAN, Portal Capoeira, CapoeiraHub
4. **Skip Tier 3** (social media) for historical groups - only use for active groups to verify current activity
5. Consult **Tier 4** (academic) for historical groups and primary source citations

**IMPORTANT:** Do NOT include social media accounts (Instagram, Facebook, Twitter) in `links` - these are too ephemeral for genealogy data. Social media is only for verifying current activity, not as a data source.

**Collect ALL of the following data (maps to `genealogy.group_profiles` table):**

#### Core Identity (REQUIRED fields marked with *)
| Field | Column | Description |
|-------|--------|-------------|
| Name* | `name` | Official group name - **required** |
| Description* | `description` | 1-2 paragraph description - **required** |
| Name Aliases | `name_aliases` | Array of alternative names, abbreviations (e.g., ["GCAP", "Pelourinho"]) |
| Style | `style` | Primary style (angola, regional, contemporanea, mixed) |
| Style Notes | `style_notes` | e.g., "Originally Regional, evolved to Contemporânea" |

#### Founding Details
| Field | Column | Description |
|-------|--------|-------------|
| Founded Year | `founded_year` | Integer year |
| Founded Year Precision | `founded_year_precision` | exact, month, year, decade, approximate, unknown |
| Founded Location | `founded_location` | "City, Country" |

#### Extended Content
| Field | Column | Description |
|-------|--------|-------------|
| Philosophy | `philosophy` | Group's stated philosophy/mission statement |
| History | `history` | Long-form group history narrative |

#### Name History (for groups that changed names)
| Field | Column | Description |
|-------|--------|-------------|
| Name History | `name_history` | JSONB array tracking name changes over time |

Format:
```json
[
  {"name": "Original Name", "startedAt": "1980-01-01", "endedAt": "1990-01-01", "changeReason": "political_statement", "context": "Reaffirm African origins"},
  {"name": "Current Name", "startedAt": "1990-01-01"}
]
```

#### Organizational Structure
| Field | Column | Description |
|-------|--------|-------------|
| Legal Structure | `legal_structure` | Legal form (enum below) |
| Is Headquarters | `is_headquarters` | true if main/original location |
| Is Active | `is_active` | true if currently operating |
| Dissolved At | `dissolved_at` | Date when group ceased operations (NULL if active) |

#### Visual & Links
| Field | Column | Description |
|-------|--------|-------------|
| Logo | `logo` | URL to group logo (prefer Wikimedia, 200-400px) |
| Links | `links` | JSONB array: `[{"type": "website", "url": "..."}]` |

**Link types:** website (use this for all stable web pages)

**IMPORTANT - Populate links from research sources:**
Include stable, authoritative web pages about this group:
- **Official website** - Group's own website
- **Wikipedia** - If group has a Wikipedia page
- **Capoeira directories** - Lalaue.com, CapoeiraHub group pages

Do NOT include social media accounts (Instagram, Facebook, Twitter) - these are too ephemeral for genealogy data.

Example:
```json
[
  {"type": "website", "url": "https://www.abadacapoeira.com.br"},
  {"type": "website", "url": "https://en.wikipedia.org/wiki/ABADA-Capoeira"}
]
```

#### Information for Relationships (not profile fields)
Collect this information for statements and discovered entities:
- Founder(s) - who started this group (for person imports)
- Founding context - original creation, split, succession, merger?
- Current leadership - who leads now
- Parent organization - if this is a branch/nucleus/affiliate
- Split history - if applicable, from which group
- Notable teachers and members

---

### Phase 2: Entity Tracking

As you research, you will discover persons and other groups. Track them:

#### Discovered Persons
Create a list of persons mentioned (founders, leaders, teachers, notable members):
```
## Discovered Persons (for later import)
| Apelido | Full Name | Title | Relationship to Group | Already in Dataset? |
|---------|-----------|-------|----------------------|---------------------|
| Camisa | José Tadeu Carneiro Cardoso | mestre | founded group | check |
```

Mark "Already in Dataset?" as:
- `yes` - if you've already generated SQL for them
- `no` - needs future import
- `check` - **ask me** if you're unsure

#### Discovered Groups
Create a list of related groups mentioned:
```
## Discovered Groups (for later import)
| Name | Style | Relationship to Subject | Already in Dataset? |
|------|-------|-------------------------|---------------------|
| Grupo Senzala | mixed | parent group (split_from) | check |
```

---

### Phase 3: Relationship Mapping

Map all relationships found to predicates. Direction convention: predicates flow from "younger/newer" to "older/established".

#### Person-to-Group Predicates (for tracking, not generating)
| Predicate | Use When | Properties |
|-----------|----------|------------|
| `founded` | Created/established the group (sole founder) | - |
| `co_founded` | Equal partner in founding | - |
| `leads` | Current primary leader/coordinator | - |
| `regional_coordinator_of` | Coordinates a region for international group | `region?, country?` |
| `member_of` | Formal membership | - |
| `teaches_at` | Active instructor at the group | - |
| `cultural_pioneer_of` | First to bring capoeira to region/country | `region?, country?, context?` |
| `associated_with` | Loose/informal affiliation | `association_type` |
| `departed_from` | Left group | `departure_type: neutral|blessed|contentious|expelled` |

#### Group-to-Group Predicates
| Predicate | Use When | Properties |
|-----------|----------|------------|
| `part_of` | Hierarchical organizational relationship | `affiliation_type: branch|nucleus|affiliate|official_filial` |
| `split_from_group` | Group formed by splitting from parent | `split_type: neutral|blessed|contentious`, `blessed_by?: string[]` |
| `merged_into` | Group merged into another | - |
| `evolved_from` | Major organizational transformation | - |
| `affiliated_with` | Formal or cultural affiliation (non-hierarchical) | - |
| `cooperates_with` | Regular cooperation without formal structure | - |

Create a mapping table:
```
| Subject | Predicate | Object | Started | Ended | Properties | Confidence | Source |
|---------|-----------|--------|---------|-------|------------|------------|--------|
```

---

### Phase 4: SQL Generation & File Output

Generate SQL and **write it to a file**:

**File path:** `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql`
- Use lowercase group name with hyphens for spaces (e.g., `grupo-senzala.sql`, `abada-capoeira.sql`)
- For acronyms, use lowercase (e.g., `gcap.sql`, `ceca.sql`)

**Use the Write tool to create the SQL file.** Do not just display the SQL - actually write it to disk.

Generate SQL in this format:

```sql
-- ============================================================
-- GENEALOGY GROUP IMPORT: [Group Name]
-- Generated: [Date]
-- Primary Source: [URL]
-- ============================================================

BEGIN;

-- ============================================================
-- GROUP PROFILE (all columns from genealogy.group_profiles)
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  description,
  style,
  style_notes,
  logo,
  links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
  philosophy,
  history,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  '[Name]',
  '[Description]',
  '[style or NULL]'::genealogy.style,
  '[style_notes or NULL]',
  '[logo_url or NULL]',
  '[{"type": "website", "url": "..."}]'::jsonb,
  -- Identity enhancements
  ARRAY['alias1', 'alias2'],  -- or ARRAY[]::text[] if none
  '[{"name": "...", "startedAt": "..."}]'::jsonb,  -- or '[]'::jsonb if no history
  -- Founding details
  [founded_year or NULL],
  '[precision]'::genealogy.date_precision,
  '[founded_location or NULL]',
  -- Extended content
  '[philosophy or NULL]',
  '[history or NULL]',
  -- Organizational
  '[legal_structure or NULL]'::genealogy.legal_structure,
  [true|false],  -- is_headquarters
  -- Status
  [true|false],  -- is_active
  [NULL or 'YYYY-MM-DD'::date]  -- dissolved_at
)
ON CONFLICT (name) DO UPDATE SET
  description = EXCLUDED.description,
  style = EXCLUDED.style,
  style_notes = EXCLUDED.style_notes,
  logo = EXCLUDED.logo,
  links = EXCLUDED.links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  philosophy = EXCLUDED.philosophy,
  history = EXCLUDED.history,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- Use ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Group-to-Group: Evolution & Hierarchy ---
-- Example: Split from parent group with date precision
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id,
--   predicate,
--   object_type, object_id,
--   started_at, started_at_precision,
--   properties, confidence, source, notes
-- )
-- SELECT
--   'group'::genealogy.entity_type, s.id,
--   'split_from_group'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1980-01-01'::date, 'year'::genealogy.date_precision,
--   '{"split_type": "blessed"}'::jsonb,
--   'verified'::genealogy.confidence,
--   'Source citation',
--   'Additional context'
-- FROM genealogy.group_profiles s, genealogy.group_profiles o
-- WHERE s.name = '[Subject Name]' AND o.name = '[Object Name]'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
--
-- Date precision values: exact, month, year, decade, approximate, unknown

-- --- Group-to-Group: Affiliation ---

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'group',
  'groups/[group-name-lowercase].sql',
  NULL,  -- Checksum computed by sync script
  ARRAY['groups/dependency1.sql'],  -- List dependencies or ARRAY[]::text[] if none
  '[Brief description of this group]'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
```

**Important Rules:**
1. Only generate statement SQL for entities that already exist in the dataset
2. For new entities, list them in "Discovered Persons/Groups" sections
3. Person-to-Group statements (founded, leads, etc.) should be generated when **importing the person**, not the group
4. Focus on group-to-group relationships and static group data
5. Use appropriate confidence levels based on source quality
6. Always cite sources in the `source` field
7. Use `NULL` for unknown values, not empty strings
8. Use `ARRAY[]` for empty arrays, not NULL

---

### Phase 5: Output Format

Present your findings in this structure:

```markdown
# Group Import: [Group Name]

## Research Summary
[1-2 paragraph summary of what this group is and its significance]

## Profile Data
[Structured data collected]

## Discovered Persons (for later import)
[Table of persons to process later - founders, leaders, teachers]
**ACTION: Add any new persons with status `no` to `docs/genealogy/import-backlog/persons-backlog.md`**

## Discovered Groups (for later import)
[Table of related groups to process later]
**ACTION: Add any new groups with status `no` to `docs/genealogy/import-backlog/groups-backlog.md`**

## Relationship Mapping
[Predicate mapping table - focus on group-to-group]

## Generated SQL
**ACTION: Write SQL to `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql` using the Write tool**
[Show the complete SQL block here AND write it to file]

## Notes & Uncertainties
[Any conflicting information, gaps, questions]

## Sources
[List all sources consulted with URLs]
```

---

### Confidence Guidelines

- **verified**: Multiple reliable sources agree (Wikipedia + official source)
- **likely**: Single reliable source (official group website)
- **unverified**: Claimed but not independently verified (social media only)
- **disputed**: Conflicting information exists (note in source field)
- **uncertain**: Low confidence, needs investigation

---

### Available Enum Values

**Styles:** angola, regional, contemporanea, mixed

**Legal Structures:** for_profit, non_profit, nonprofit_501c3, association_ev, association_loi1901, informal, mixed

**Date Precision:** exact, month, year, decade, approximate, unknown

**Confidence:** verified, likely, unverified, disputed, uncertain

**Affiliation Types (for `part_of`):** branch, nucleus, affiliate, official_filial

**Split Types (for `split_from_group`):** neutral, blessed, contentious

**Association Types (for `associated_with`):** supporter, patron, informal_affiliate, friend, honorary

---

### Special Patterns to Watch For

#### Pattern 1: Split from Parent Group
```sql
-- NewGroup split from OriginalGroup
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes
)
SELECT
  'group'::genealogy.entity_type, s.id,
  'split_from_group'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  '{"split_type": "blessed"}'::jsonb,
  'verified'::genealogy.confidence,
  'Source citation',
  'Context about the split'
FROM genealogy.group_profiles s, genealogy.group_profiles o
WHERE s.name = 'New Group' AND o.name = 'Original Group'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
```

#### Pattern 2: Branch/Nucleus Hierarchy
```sql
-- LocalGroup is a branch of MainGroup
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source
)
SELECT
  'group'::genealogy.entity_type, s.id,
  'part_of'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '2000-01-01'::date, 'year'::genealogy.date_precision,
  '{"affiliation_type": "branch"}'::jsonb,
  'verified'::genealogy.confidence,
  'Source citation'
FROM genealogy.group_profiles s, genealogy.group_profiles o
WHERE s.name = 'Local Group' AND o.name = 'Main Group'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
```

#### Pattern 3: Organizational Evolution (NOT name change)
```sql
-- Only for genuine transformations, NOT name changes
-- Name changes go in name_history JSONB field
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source, notes
)
SELECT
  'group'::genealogy.entity_type, s.id,
  'evolved_from'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'year'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Source citation',
  'Description of the organizational transformation'
FROM genealogy.group_profiles s, genealogy.group_profiles o
WHERE s.name = 'New Organization' AND o.name = 'Predecessor'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
```

---

### Phase 6: File Actions (MANDATORY)

After completing research and generating the report, you MUST perform these file operations:

1. **Write SQL file**: Use the Write tool to create `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql`

2. **Create/Update group report file**: Write comprehensive research to `docs/genealogy/group-reports/[group-name-lowercase].md`
   - Use lowercase with hyphens for spaces (e.g., `grupo-senzala.md`, `abada-capoeira.md`)
   - For acronyms, use lowercase (e.g., `gcap.md`, `ceca.md`)
   - Follow the template in `docs/genealogy/group-reports/README.md`
   - Include: profile type, basic information table, history, founding & leadership, philosophy, notable members, lineage connections, sources
   - Reference the SQL import file path
   - If file already exists, UPDATE it with new research (preserve existing content, add new findings)

3. **Update persons backlog**: If any persons were discovered with status `no`, append them to `docs/genealogy/import-backlog/persons-backlog.md`

4. **Update groups backlog**: If any groups were discovered with status `no`, append them to `docs/genealogy/import-backlog/groups-backlog.md`

**Failure to write the SQL file AND the group report file is a critical error. Both MUST be saved to disk.**

---

Now research **$ARGUMENTS** and generate the complete import package.
