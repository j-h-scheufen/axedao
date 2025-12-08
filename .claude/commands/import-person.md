# Import Person to Genealogy Database

**Purpose:** Research a capoeira person and generate SQL to import their profile and relationships into the genealogy schema.

**Input:** Person name (apelido or full name) and optionally a website/source URL

**Output:** SQL file written to `docs/genealogy/sql-imports/persons/[apelido-lowercase].sql`

---

## Instructions

You are researching **$ARGUMENTS** to create a complete person profile for the genealogy database.

### CRITICAL: Research Requirements

**You MUST perform extensive web research using WebSearch and WebFetch tools.** The Layer Zero document is only a starting point. For each person:

1. Search multiple queries to find all available information
2. Fetch and read the actual web pages from sources found
3. Look for details not in Layer Zero: exact dates, places, relationships, teachers, students
4. Search for archival sources, academic papers, historical records
5. Cross-reference multiple sources to verify information
6. Document ALL names discovered during research (other capoeiristas, teachers, students, etc.)

### Phase 0: Check Person Reports Directory FIRST

**BEFORE doing any web research**, check if this person already has documentation:

1. **Check for individual file:** Look for `docs/genealogy/person-reports/[name-lowercase].md`
   - Use Glob pattern: `docs/genealogy/person-reports/*.md` to list available files
   - Check variations of the name (apelido, full name with hyphens)

2. **If individual file exists:**
   - Read that file for existing research
   - Note the sources listed
   - Check if SQL import already exists (noted in file header)
   - Use this as your **starting point**
   - Then proceed to Phase 1 to expand with deeper web research

3. **If NOT found:**
   - Proceed directly to Phase 1 (web research)
   - A new person report file will be created in Phase 6

### Phase 1: Research & Data Collection

**IMPORTANT: Read the research sources file first!**

Before starting web searches, read `docs/genealogy/sources/research-sources.md` for:
- Tier 1-4 source rankings by reliability
- Specific URL patterns for each source
- What data is available from each source
- Tips for extracting information

**Research priority by tier:**
1. Start with **Tier 1** sources (highest reliability) - check all relevant ones
2. Cross-reference with **Tier 2** sources for additional detail
3. **Skip Tier 3** (social media) for historical figures - only use for living persons to verify current activity
4. Consult **Tier 4** (academic) for historical figures and primary source citations

**IMPORTANT:** Do NOT include social media accounts (Instagram, Facebook, Twitter) in `public_links` - these are too ephemeral for genealogy data. Social media is only for verifying current activity, not as a data source.

**Collect ALL of the following data (maps to `genealogy.person_profiles` table):**

#### Core Identity (REQUIRED fields marked with *)
| Field | Column | Description |
|-------|--------|-------------|
| Full Name | `name` | Legal name if known |
| Apelido* | `apelido` | Capoeira nickname - **required** |
| Title | `title` | Current highest rank (enum below) |
| Style | `style` | Primary style (angola, regional, contemporanea, mixed) |

#### Life Dates & Places
| Field | Column | Description |
|-------|--------|-------------|
| Birth Year | `birth_year` | Integer year |
| Birth Year Precision | `birth_year_precision` | exact, month, year, decade, approximate, unknown |
| Birth Place | `birth_place` | "City, Country" or just "Country" |
| Death Year | `death_year` | Integer year (NULL if alive) |
| Death Year Precision | `death_year_precision` | exact, month, year, decade, approximate, unknown |
| Death Place | `death_place` | "City, Country" |

#### Extended Content (BILINGUAL - English and Portuguese)
| Field | Columns | Description |
|-------|---------|-------------|
| Bio | `bio_en`, `bio_pt` | Rich narrative biography in both languages |
| Achievements | `achievements_en`, `achievements_pt` | Awards, recognitions in both languages |
| Style Notes | `style_notes_en`, `style_notes_pt` | Style notes in both languages |
| Researcher Notes | `notes_en`, `notes_pt` | Birth/death year estimation reasoning, source conflicts, name spelling variations, pending relationships, caveats |

**IMPORTANT: All narrative content must be written in BOTH English and Brazilian Portuguese.**
See `docs/genealogy/BILINGUAL_CONTENT.md` for the full convention.

**Bio Writing Guidelines:**

The bio is where the person's story comes alive. Write a **narrative**, not a dry summary. You have the sources - tell the story they contain.

Include:
- **The human journey** - How did they find capoeira? What transformed them?
- **Pivotal moments** - Key events, confrontations, turning points
- **Historical context** - What was happening around them? What obstacles did they face?
- **Relationships** - Teachers, students, rivals, allies (even if unnamed)
- **The stakes** - What did they risk? What did they gain or lose?
- **Quotes from sources** - Use direct quotes when they add power (e.g., "the gravest of crimes")
- **The mystery** - What remains unknown? What happened next?
- **Legacy** - Why does this person matter to capoeira history?

**Do NOT embellish or invent.** Every detail must come from your sources. But present the facts as a compelling narrative, not a list. If a source describes someone as "robust, hardworking, and very obedient" who later "became more outgoing, independent, and began to arrive home late" - that's a transformation worth telling.

For historical figures especially, the bio may be the only way users learn about these people. Make it worth reading.

**CRITICAL: Tone and Authenticity**

This database serves the capoeira community. Capoeiristas will read these bios and they can smell inauthenticity instantly.

**AVOID:**
- Poetic embellishments that sound like marketing copy ("hunted yet indestructible", "eternal flame of resistance")
- Grandiose claims not supported by sources
- Romanticizing violence or suffering
- Treating capoeira as exotic or mysterious to outsiders
- Flowery language that a mestre would never use

**INSTEAD:**
- Let the facts speak - they're dramatic enough on their own
- Use the language of the sources (translated if needed)
- Be direct about what we know and don't know
- Respect the complexity - heroes had flaws, villains had skills
- Write as if explaining to a fellow capoeirista, not a tourist

**Handling Contradictions:**

When sources contradict each other on names, dates, places, or facts:
1. Choose the most reliable version for the main narrative (primary sources > secondary, multiple agreement > single claim)
2. **Document details in `notes_en` / `notes_pt`** - record specific source conflicts, alternate spellings, and researcher reasoning for future reference
3. **Keep the bio clean** - do NOT clutter the bio with source conflict explanations. The notes columns exist specifically for this metadata.

Example in notes_en:
```
NAME: Full name recorded as Manoel Alves da Silva in most sources. One source (CEV, 1936) gives Arthur Bento dos Santos. Using majority spelling.

DEATH DATE: February 1894 (exact day unknown). One source gives Feb 12, another just "February." Using month precision.
```

This approach keeps the bio focused on narrative while preserving research transparency in the notes.

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

### Phase 1b: Follow-up Research (CRITICAL)

**After completing initial research, review your findings for "clues" that warrant deeper investigation.**

Clues to look for:
- **Named historical events** with dates (revolts, competitions, ceremonies, conflicts)
- **Named individuals** mentioned in passing (teachers of teachers, rivals, witnesses)
- **Specific incidents** described briefly that could have more detail
- **Academic sources or books** cited that might contain primary accounts
- **Eyewitness accounts** referenced but not quoted in full

For each significant clue:
1. Search specifically for that event/person/incident
2. Look for primary sources, eyewitness accounts, casualty numbers, named participants
3. Cross-reference multiple accounts for accuracy
4. Extract vivid details and direct quotes that bring the story alive

**Example:** If initial research mentions "the 1828 Mercenary Revolt where capoeiras helped suppress the uprising," that's a clue. Search specifically for:
- "1828 mercenary revolt Rio de Janeiro capoeira"
- The exact dates, trigger incident, named leaders
- Eyewitness accounts of the fighting
- Casualty numbers and aftermath
- How this event changed capoeira's status

This follow-up research often yields the most compelling narrative details—the difference between "capoeiras helped in a revolt" and a vivid eyewitness account of armed soldiers falling to "fists, stones, and sticks."

**Do not skip this phase.** The richest stories come from following the clues.

---

### Phase 2: Entity Tracking

As you research, you will discover other persons and groups. Track them:

#### Discovered Persons
Create a list of persons mentioned who are NOT the subject:
```
## Discovered Persons (for later import)
| Apelido | Full Name | Title | Relationship to Subject | Already in Dataset? | Import? |
|---------|-----------|-------|-------------------------|---------------------|---------|
| João Grande | João Oliveira dos Santos | mestre | teacher of subject | check | yes |
| Manuel Cardoso Fontes | Manuel Cardoso Fontes | - | slave owner | no | no |
```

Mark "Already in Dataset?" as:
- `yes` - if you've already generated SQL for them
- `no` - needs future import
- `check` - **ask me** if you're unsure

Mark "Import?" as:
- `yes` - Capoeirista or direct lineage figure, should be imported to genealogy
- `no` - Not a capoeirista (historian, military figure, writer, slave owner, etc.) - do not import
- `?` - Needs investigation to determine

#### Discovered Groups
Create a list of groups mentioned:
```
## Discovered Groups (for later import)
| Name | Style | Relationship to Subject | Already in Dataset? | Import? |
|------|-------|-------------------------|---------------------|---------|
| GCAP | angola | group led by subject | check | yes |
| Santa Luzia Party | - | gang led by subject | no | no |
```

Mark "Already in Dataset?" as:
- `yes` - if you've already generated SQL for them
- `no` - needs future import (if Import? = yes or ?)
- `check` - **ask me** if you're unsure

Mark "Import?" as:
- `yes` - Capoeira group (academy, association, etc.) - should be imported to genealogy
- `no` - Not a capoeira group (street gang, political party, non-capoeira organization) - do not import
- `?` - Needs investigation to determine

---

### Phase 3: Relationship Mapping

Map all relationships found to predicates. Direction convention: predicates flow from "younger/newer" to "older/established".

#### Person-to-Person Predicates
| Predicate | Use When | Properties |
|-----------|----------|------------|
| `student_of` | Primary, ongoing teacher-student relationship | - |
| `trained_under` | Historical/past training, workshops, seminars | - |
| `influenced_by` | Studied philosophy/methods without direct training | - |
| `associated_with` | Documented connection between contemporaries (peers, collaborators, known associates) | `association_context` (REQUIRED - text explaining circumstances and sources) |
| `granted_title_to` | Mestre conferred a title/rank (MESTRE grants to student) | `title_grant: { title, ceremony?, location? }` |
| `baptized_by` | Received apelido at batizado ceremony from this mestre | `baptism: { apelido_given, ceremony?, location? }` |
| `family_of` | Biological or ceremonial family | `relationship_type: parent|sibling|spouse|padrinho|other` |

**About `associated_with` (Person-to-Person):**
This predicate captures documented connections between capoeiristas who were contemporaries - people who knew each other, trained in the same environment, or had documented interactions without a formal teacher-student relationship. This is especially valuable for the "Layer Zero" era where oral tradition networks are crucial but formal lineages are undocumented.

The `association_context` property is **required** and must explain:
1. The nature of the connection (peers, trained together, rivals, collaborators)
2. The evidence (source that documents this connection)
3. The time/place context if known

Example:
```json
{
  "association_context": "Both trained at the port of Salvador in the 1910s; documented as peers in Abreu's 1886 account of the Nagoa-Guaiamum rivalry"
}
```

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

Create a mapping table with an additional **Import?** column to track whether the relationship should generate SQL:

```
| Subject | Predicate | Object | Started | Ended | Properties | Confidence | Source | Import? |
|---------|-----------|--------|---------|-------|------------|------------|--------|---------|
```

**Import? column values:**
- `yes` - Object exists in dataset OR is a capoeira entity that should be added to backlog → generate SQL when object is imported
- `no` - Object is NOT a capoeira entity (e.g., a street gang, political party, non-capoeira group) → do NOT generate SQL, do NOT add to backlog
- `?` - Unclear if object qualifies → add to backlog with `?` for later determination

**Example:**
```
| Manduca da Praia | leads | Santa Luzia Party (Nagoa) | ~1850 | ? | - | likely | Plácido de Abreu 1886 | no |
```
*Reason: Santa Luzia Party was a street gang that used capoeira, not a capoeira group. No SQL generated, not added to groups backlog.*

**SQL Generation Rules:**
- Only generate statement SQL for relationships where `Import? = yes` AND the object already exists in the dataset
- For `Import? = yes` but object not yet in dataset: note in SQL comments as "pending future import"
- For `Import? = no`: do not generate SQL, do not add object to any backlog
- For `Import? = ?`: add object to appropriate backlog with `?` status for later determination

---

### Phase 4: SQL Generation & File Output

Generate SQL and **write it to a file**:

**File path:** `docs/genealogy/sql-imports/persons/[apelido-lowercase].sql`
- Use lowercase apelido with hyphens for spaces (e.g., `joao-grande.sql`, `cobrinha-verde.sql`)
- For single-name historical figures, just use the name (e.g., `adao.sql`, `benedito.sql`)

**Use the Write tool to create the SQL file.** Do not just display the SQL - actually write it to disk.

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
  -- Researcher notes (bilingual) - for date estimates, source conflicts, caveats
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  '[Full Name or NULL]',
  '[Apelido]',
  '[title or NULL]'::genealogy.title,
  '[portrait_url or NULL]',
  '[{"type": "website", "url": "..."}]'::jsonb,
  -- Capoeira-specific
  '[style or NULL]'::genealogy.style,
  E'[Style notes in English or NULL]',
  E'[Notas de estilo em português or NULL]',
  -- Life dates (see header for estimation reasoning if applicable)
  [birth_year or NULL],
  '[precision]'::genealogy.date_precision,
  '[birth_place or NULL]',
  [death_year or NULL],
  '[precision]'::genealogy.date_precision,
  '[death_place or NULL]',
  -- Extended content (bilingual)
  E'[Bio in English]',
  E'[Biografia em português]',
  '[Achievements in English or NULL]',
  '[Conquistas em português or NULL]',
  -- Researcher notes (bilingual)
  E'[Notes in English or NULL - birth year estimates, source conflicts, caveats]',
  E'[Notas em português or NULL - estimativas de datas, conflitos de fontes, ressalvas]'
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
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- Use ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---
-- Example with date precision columns and bilingual notes:
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id,
--   predicate,
--   object_type, object_id,
--   started_at, started_at_precision,
--   ended_at, ended_at_precision,
--   properties, confidence, source,
--   notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'student_of'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '1908-01-01'::date, 'year'::genealogy.date_precision,  -- Year-level precision
--   '1924-07-08'::date, 'exact'::genealogy.date_precision, -- Exact date known
--   '{}'::jsonb,
--   'verified'::genealogy.confidence,
--   'Source citation here',
--   'Relationship context in English',
--   'Contexto do relacionamento em português'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = '[Subject Apelido]' AND o.apelido = '[Object Apelido]'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;
--
-- Date precision values: exact, month, year, decade, approximate, unknown
-- Use started_at = NULL with started_at_precision = 'unknown' when date is completely unknown
-- IMPORTANT: notes_en and notes_pt should both be provided for bilingual support

-- --- Person-to-Person: Recognition ---
-- (Title grants, baptisms)

-- --- Person-to-Group: Founding & Leadership ---
-- (Only if the group exists in dataset)

-- --- Person-to-Group: Membership & Affiliation ---

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/[apelido-lowercase].sql',
  NULL,  -- Checksum computed by sync script
  ARRAY['persons/dependency1.sql', 'persons/dependency2.sql'],  -- List dependencies or ARRAY[]::text[] if none
  '[Brief description of who this person is]'
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

## Person Report Status
[Was this person found in the person-reports directory? What information was pre-existing vs newly discovered?]

## Research Summary
[1-2 paragraph summary of who this person is and their significance]

## Profile Data
[Structured data collected]

## Discovered Persons (for later import)
[Table of persons to process later]
**ACTION: Add any new persons with status `no` to `docs/genealogy/import-backlog/persons-backlog.md`**

## Discovered Groups (for later import)
[Table of groups to process later]
**ACTION: Add any new groups with status `no` to `docs/genealogy/import-backlog/groups-backlog.md`**

## Relationship Mapping
[Predicate mapping table]

## Generated SQL
**ACTION: Write SQL to `docs/genealogy/sql-imports/persons/[apelido-lowercase].sql` using the Write tool**
[Show the complete SQL block here AND write it to file]

## Notes & Uncertainties
[Any conflicting information, gaps, questions]

## Person Report File Update
[Note whether the person-reports file was created or updated with new findings]

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

### Historical Figures (Layer Zero Era)

For persons from the pre-1930s era, special considerations apply:

1. **Title field**: May be NULL or use historical terms - most were not formally titled in the modern sense
2. **Style field**: Use NULL or note that style distinctions (Angola/Regional) didn't exist yet
3. **Confidence**: Often `uncertain` or `likely` due to limited documentation
4. **Sources**: Police/arrest records, historical newspapers, academic research are primary sources
5. **Profile Type**: Use appropriate historical types (proto_mestre, historical_capoeirista, early_mestre, etc.) in the person report file

### Estimating Birth Years for Historical Figures (IMPORTANT)

**When no birth/death dates are available**, you MUST make an educated estimate using available evidence. Do not leave birth_year as NULL if any context clues exist. Use `decade` precision for estimates.

**How to estimate:**

1. **Look for anchor events** - If the person was "active" or "teaching" or "arrested" in year X, work backwards:
   - Active as teacher/mestre → likely 25-50 years old
   - Active as fighter/practitioner → likely 18-40 years old
   - Mentioned as "young" → likely 15-25 years old
   - Mentioned as "old" or "elder" → likely 50+ years old

2. **Use student/teacher relationships**:
   - If they taught someone born in year Y who started learning at age 12, the teacher was likely 25-40 years older
   - Example: Bentinho taught Bimba (b. 1899) starting in 1911. If Bentinho was 30-50 when teaching, he was born ~1860-1880

3. **Consider historical context**:
   - African-born in early 1900s Brazil → born before 1850 (slavery ended 1888; most Africans came before)
   - If someone was "African-born" and active in 1910, they were likely born 1840-1870

4. **Document your reasoning** in TWO places:

   a. **SQL file header** (after `-- DEPENDENCIES:` line) - brief summary for developers reading the file
   b. **`notes_en` / `notes_pt` columns** - full bilingual reasoning stored in the database

**Example - SQL file header (brief summary):**
```sql
-- ============================================================
-- GENEALOGY PERSON IMPORT: Bentinho
-- Generated: 2025-12-08
-- Primary Source: [URL]
-- ============================================================
-- DEPENDENCIES: none
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1870 with 'decade' precision):
-- African-born captain teaching capoeira by 1911. If 35-45 when teaching
-- 12-year-old Bimba in 1911, birth = ~1866-1876. Using 1870 as midpoint.
--
-- ============================================================
```

**Example - notes_en / notes_pt columns (full reasoning stored in DB):**
```sql
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): African-born; was a captain (established profession) and teaching capoeira by 1911. If he was 35-45 when teaching 12-year-old Bimba in 1911, birth = ~1866-1876. Using 1870 as midpoint estimate.

DEATH: Unknown. No records of his death have been found.

NAME: Also recorded as "Nozinho Bento" in some sources.

PENDING RELATIONSHIPS (requires Mestre Bimba import):
- Bimba student_of Bentinho (~1911-1915)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Nascido na África; era capitão (profissão estabelecida) e ensinava capoeira por volta de 1911. Se tinha 35-45 anos quando ensinava Bimba de 12 anos em 1911, nascimento = ~1866-1876. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Também registrado como "Nozinho Bento" em algumas fontes.

RELACIONAMENTOS PENDENTES (requer importação de Mestre Bimba):
- Bimba student_of Bentinho (~1911-1915)'
```

Also document in the person report's "Date Discrepancies" section for easy reference.

**Key rule:** An educated estimate with `decade` precision is more useful for timeline visualization than NULL. Always prefer a documented estimate over missing data.

### Date Validation (CRITICAL)

**Always cross-check dates for logical consistency.** Sources (including Layer Zero) may contain transcription errors where the same date appears multiple times when it shouldn't.

**Red flags to watch for:**
- Same date used for arrest AND clemency/release (unlikely - legal processes take time)
- Same date for birth AND death events
- Same date for training start AND title conferral (requires years of training)
- Any date appearing twice in different contexts

**When you find date inconsistencies:**
1. Re-read the narrative context carefully - look for phrases like "after months of..." or "several years later..."
2. Determine which event the date most likely belongs to (usually the documented archival record)
3. Use logical deduction for the other date (e.g., "late 1788 or early 1789" if clemency was April 1789 and "months" passed)
4. Note the uncertainty in the SQL comments
5. Flag the inconsistency for potential correction in the source document

---

### Phase 6: File Actions (MANDATORY)

After completing research and generating the report, you MUST perform these file operations:

1. **Write SQL file**: Use the Write tool to create `docs/genealogy/sql-imports/persons/[apelido-lowercase].sql`

2. **Create/Update person report file**: Write comprehensive research to `docs/genealogy/person-reports/[name-lowercase].md`
   - Use lowercase with hyphens for spaces (e.g., `joao-grande.md`, `cobrinha-verde.md`)
   - Follow the template in `docs/genealogy/person-reports/README.md`
   - Include: profile type, basic information table, biography, connection to capoeira, sources
   - Reference the SQL import file path
   - If file already exists, UPDATE it with new research (preserve existing content, add new findings)

3. **Update persons backlog**: Append discovered persons with `Import? = yes` or `Import? = ?` to `docs/genealogy/import-backlog/persons-backlog.md`
   - Use the backlog table format with these columns: `Apelido | Full Name | Title | Discovered From | Status | Import | Notes`
   - Set `Status` to `pending` for new entries
   - Set `Import` column: `yes` or `?` based on whether they're a capoeirista
   - **Do NOT add persons with `Import? = no`** - they don't belong in the genealogy

4. **Update groups backlog**: Append discovered groups with `Import? = yes` or `Import? = ?` to `docs/genealogy/import-backlog/groups-backlog.md`
   - **Do NOT add groups with `Import? = no`** (street gangs, political parties, non-capoeira organizations)

**Key principle:** The backlogs track capoeira entities pending import. Non-capoeira entities (Import? = no) should not be added - they are simply not part of the genealogy data model.

**Failure to write the SQL file AND the person report file is a critical error. Both MUST be saved to disk.**

---

Now research **$ARGUMENTS** and generate the complete import package.
