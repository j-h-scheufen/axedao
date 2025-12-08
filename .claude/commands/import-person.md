# Import Person to Genealogy Database

**Purpose:** Research a capoeira person and generate SQL to import their profile and relationships into the genealogy schema.

**Input:** Person name (apelido or full name) and optionally a website/source URL

---

## Instructions

You are researching **$ARGUMENTS** to create a complete person profile for the genealogy database.

### Phase 1: Research & Data Collection

Search for information using these source types (in order of reliability):

1. **Official sources** - Group websites, academy pages
2. **Wikipedia / Wikimedia** - For historical figures
3. **Capoeira directories** - Lalaue.com, CapoeiraHub.net
4. **Social media** - Instagram, Facebook (for current activity)
5. **Academic sources** - IPHAN, university research for historical figures
6. **Videos/Interviews** - YouTube documentaries, oral history

**Collect ALL of the following data (maps to `genealogy.person_profiles` table):**

#### Core Identity (REQUIRED fields marked with *)
| Field | Column | Description |
|-------|--------|-------------|
| Full Name | `name` | Legal name if known |
| Apelido* | `apelido` | Capoeira nickname - **required** |
| Title | `title` | Current highest rank (enum below) |
| Style | `style` | Primary style (angola, regional, contemporanea, mixed) |
| Style Notes | `style_notes` | e.g., "Transitioned from Regional to Angola in 1985" |

#### Life Dates & Places
| Field | Column | Description |
|-------|--------|-------------|
| Birth Year | `birth_year` | Integer year |
| Birth Year Precision | `birth_year_precision` | exact, month, year, decade, approximate, unknown |
| Birth Place | `birth_place` | "City, Country" or just "Country" |
| Death Year | `death_year` | Integer year (NULL if alive) |
| Death Year Precision | `death_year_precision` | exact, month, year, decade, approximate, unknown |
| Death Place | `death_place` | "City, Country" |

#### Extended Content
| Field | Column | Description |
|-------|--------|-------------|
| Bio | `bio` | 1-2 paragraph biography highlighting capoeira significance |
| Achievements | `achievements` | Awards, recognitions, notable accomplishments |

#### Visual & Links
| Field | Column | Description |
|-------|--------|-------------|
| Portrait | `portrait` | URL to public-facing image (prefer Wikimedia, 200-400px) |
| Public Links | `public_links` | JSONB array: `[{"type": "website", "url": "..."}]` |

**Link types:** website (use this for all stable web pages)

**IMPORTANT - Populate public_links from research sources:**
Include stable, authoritative web pages about this person:
- **Wikipedia** - If person has a Wikipedia page
- **Group website** - If their group has a bio/about page for them
- **Capoeira directories** - Lalaue.com, CapoeiraHub profile pages
- **Academic/cultural sources** - IPHAN pages for historical figures

Do NOT include social media accounts (Instagram, Facebook, Twitter) - these are too ephemeral for genealogy data.

Example:
```json
[
  {"type": "website", "url": "https://en.wikipedia.org/wiki/Mestre_Pastinha"},
  {"type": "website", "url": "https://capoeirahub.net/person/pastinha"}
]
```

#### Capoeira History (for relationships, not profile fields)
Collect this information for generating statements:
- Training timeline: who they trained under, when, where
- Primary teacher(s) vs. workshop influences
- Titles received: when, by whom, ceremony details
- Baptism: who gave them their apelido, when, where
- Groups founded/co-founded
- Groups they lead or have led
- Groups they teach/taught at
- Groups they are/were members of
- Family relationships in capoeira

---

### Phase 2: Entity Tracking

As you research, you will discover other persons and groups. Track them:

#### Discovered Persons
Create a list of persons mentioned who are NOT the subject:
```
## Discovered Persons (for later import)
| Apelido | Full Name | Title | Relationship to Subject | Already in Dataset? |
|---------|-----------|-------|-------------------------|---------------------|
| João Grande | João Oliveira dos Santos | mestre | teacher of subject | check |
```

Mark "Already in Dataset?" as:
- `yes` - if you've already generated SQL for them
- `no` - needs future import
- `check` - **ask me** if you're unsure

#### Discovered Groups
Create a list of groups mentioned:
```
## Discovered Groups (for later import)
| Name | Style | Relationship to Subject | Already in Dataset? |
|------|-------|-------------------------|---------------------|
| GCAP | angola | group led by subject | check |
```

---

### Phase 3: Relationship Mapping

Map all relationships found to predicates. Direction convention: predicates flow from "younger/newer" to "older/established".

#### Person-to-Person Predicates
| Predicate | Use When | Properties |
|-----------|----------|------------|
| `student_of` | Primary, ongoing teacher-student relationship | - |
| `trained_under` | Historical/past training, workshops, seminars | - |
| `influenced_by` | Studied philosophy/methods without direct training | - |
| `granted_title_to` | Mestre conferred a title/rank (MESTRE grants to student) | `title_grant: { title, ceremony?, location? }` |
| `baptized_by` | Received apelido at batizado ceremony from this mestre | `baptism: { apelido_given, ceremony?, location? }` |
| `family_of` | Biological or ceremonial family | `relationship_type: parent|sibling|spouse|padrinho|other` |

#### Person-to-Group Predicates
| Predicate | Use When | Properties |
|-----------|----------|------------|
| `founded` | Created/established the group (sole founder) | - |
| `co_founded` | Equal partner in founding | - |
| `leads` | Current primary leader/coordinator | - |
| `regional_coordinator_of` | Coordinates a region for international group | `region?, country?` |
| `member_of` | Formal membership (implies training) | - |
| `teaches_at` | Active instructor at the group | - |
| `cultural_pioneer_of` | First to bring capoeira to region/country | `region?, country?, context?` |
| `associated_with` | Loose/informal affiliation | `association_type` |
| `departed_from` | Left group | `departure_type: neutral|blessed|contentious|expelled` |

Create a mapping table:
```
| Subject | Predicate | Object | Started | Ended | Properties | Confidence | Source |
|---------|-----------|--------|---------|-------|------------|------------|--------|
```

---

### Phase 4: SQL Generation

Generate SQL in this format:

```sql
-- ============================================================
-- GENEALOGY PERSON IMPORT: [Apelido]
-- Generated: [Date]
-- Primary Source: [URL]
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (all columns from genealogy.person_profiles)
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
  style_notes,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content
  bio,
  achievements
) VALUES (
  -- Identity
  '[Full Name or NULL]',
  '[Apelido]',
  '[title or NULL]'::genealogy.title,
  '[portrait_url or NULL]',
  '[{"type": "website", "url": "..."}]'::jsonb,
  -- Capoeira-specific
  '[style or NULL]'::genealogy.style,
  '[style_notes or NULL]',
  -- Life dates
  [birth_year or NULL],
  '[precision]'::genealogy.date_precision,
  '[birth_place or NULL]',
  [death_year or NULL],
  '[precision]'::genealogy.date_precision,
  '[death_place or NULL]',
  -- Extended content
  '[Bio text or NULL]',
  '[Achievements or NULL]'
) RETURNING id AS [apelido_snake_case]_id;

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---
-- (Only if the other person exists in dataset)

-- --- Person-to-Person: Recognition ---
-- (Title grants, baptisms)

-- --- Person-to-Group: Founding & Leadership ---
-- (Only if the group exists in dataset)

-- --- Person-to-Group: Membership & Affiliation ---

COMMIT;
```

**Important Rules:**
1. Only generate statement SQL for entities that already exist in the dataset
2. For new entities, list them in "Discovered Persons/Groups" sections
3. Use appropriate confidence levels based on source quality
4. Always cite sources in the `source` field
5. Use `NULL` for unknown values, not empty strings
6. Date precision: `exact`, `month`, `year`, `decade`, `approximate`, `unknown`
7. Confidence: `verified`, `likely`, `unverified`, `disputed`, `uncertain`

---

### Phase 5: Output Format

Present your findings in this structure:

```markdown
# Person Import: [Apelido] ([Full Name])

## Research Summary
[1-2 paragraph summary of who this person is and their significance]

## Profile Data
[Structured data collected]

## Discovered Persons (for later import)
[Table of persons to process later]

## Discovered Groups (for later import)
[Table of groups to process later]

## Relationship Mapping
[Predicate mapping table]

## Generated SQL
[Complete SQL block]

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

**Titles:** mestra, mestre, contra-mestra, contra-mestre, mestranda, mestrando, professora, professor, instrutora, instrutor, graduada, graduado, formada, formado, estagiaria, estagiario, estagianda, estagiando, monitora, monitor, treinel, aluna, aluno, iniciante

**Styles:** angola, regional, contemporanea, mixed

**Date Precision:** exact, month, year, decade, approximate, unknown

**Confidence:** verified, likely, unverified, disputed, uncertain

---

Now research **$ARGUMENTS** and generate the complete import package.
