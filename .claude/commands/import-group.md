# Import Group to Genealogy Database

**Purpose:** Research a capoeira group and generate SQL to import their profile and relationships into the genealogy schema.

**Input:** Group name and optionally a website/source URL

**Output:** SQL file written to `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql`

---

## Instructions

You are researching **$ARGUMENTS** to create a complete group profile for the genealogy database.

### CRITICAL: Research Requirements

**You MUST perform extensive web research using WebSearch and WebFetch tools:**

1. Search multiple queries to find all available information
2. Fetch and read the actual web pages from sources found
3. Look for founding details, history, philosophy, leadership
4. Search for official websites, Wikipedia, capoeira directories
5. Cross-reference multiple sources to verify information
6. Document ALL names discovered during research (founders, leaders, teachers, notable members)

### Phase 1: Research & Data Collection

Search for information using these source types (in order of reliability):

1. **Official website** - Group's own site, about page, history
2. **Social media** - Instagram, Facebook, YouTube for current activity
3. **Capoeira directories** - Lalaue.com, CapoeiraHub.net
4. **Wikipedia / Wikimedia** - For established groups
5. **Academic sources** - IPHAN, university research for historical groups
6. **News articles** - Local coverage, event announcements

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
) RETURNING id AS [group_snake_case]_id;

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- --- Group-to-Group: Evolution & Hierarchy ---
-- (Only if the other group exists in dataset)

-- Example: Split from parent group
-- INSERT INTO genealogy.statements (...)
-- VALUES (..., 'split_from_group'::genealogy.predicate, ...);

-- --- Group-to-Group: Affiliation ---

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
  id, subject_type, subject_id, predicate, object_type, object_id,
  started_at, properties, confidence, source
) VALUES (
  gen_random_uuid(),
  'group'::genealogy.entity_type, new_group_id,
  'split_from_group'::genealogy.predicate,
  'group'::genealogy.entity_type, original_group_id,
  '1980-01-01'::date,
  '{"split_type": "blessed", "blessed_by": ["mestre-x-uuid"]}'::jsonb,
  'verified'::genealogy.confidence,
  'Source citation'
);
```

#### Pattern 2: Branch/Nucleus Hierarchy
```sql
-- LocalGroup is a branch of MainGroup
INSERT INTO genealogy.statements (
  id, subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source
) VALUES (
  gen_random_uuid(),
  'group'::genealogy.entity_type, local_group_id,
  'part_of'::genealogy.predicate,
  'group'::genealogy.entity_type, main_group_id,
  '{"affiliation_type": "branch"}'::jsonb,
  'verified'::genealogy.confidence,
  'Source citation'
);
```

#### Pattern 3: Organizational Evolution (NOT name change)
```sql
-- Only for genuine transformations, NOT name changes
-- Name changes go in name_history JSONB field
INSERT INTO genealogy.statements (
  id, subject_type, subject_id, predicate, object_type, object_id,
  started_at, confidence, source
) VALUES (
  gen_random_uuid(),
  'group'::genealogy.entity_type, new_organization_id,
  'evolved_from'::genealogy.predicate,
  'group'::genealogy.entity_type, predecessor_id,
  '1990-01-01'::date,
  'verified'::genealogy.confidence,
  'Source citation'
);
```

---

### Phase 6: File Actions (MANDATORY)

After completing research and generating the report, you MUST perform these file operations:

1. **Write SQL file**: Use the Write tool to create `docs/genealogy/sql-imports/groups/[group-name-lowercase].sql`

2. **Update persons backlog**: If any persons were discovered with status `no`, append them to `docs/genealogy/import-backlog/persons-backlog.md`

3. **Update groups backlog**: If any groups were discovered with status `no`, append them to `docs/genealogy/import-backlog/groups-backlog.md`

**Failure to write the SQL file is a critical error. The SQL MUST be saved to disk.**

---

Now research **$ARGUMENTS** and generate the complete import package.
