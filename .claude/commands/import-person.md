# Import Person to Genealogy Database (v2)

Research a capoeira person and generate SQL to import their profile and relationships.

**Input:** $ARGUMENTS (person name/apelido, optionally a source URL)

**Output:**
- Entity SQL → `docs/genealogy/sql-imports/entities/persons/[apelido-lowercase].sql`
- Statements SQL → `docs/genealogy/sql-imports/statements/persons/[apelido-lowercase].sql`
- Report → `docs/genealogy/person-reports/[name-lowercase].md`

---

## Phase 0: Check Existing Documentation

**BEFORE any research**, check for existing work:

1. Glob `docs/genealogy/person-reports/*.md` for name variations
2. Check `docs/genealogy/sql-imports/entities/persons/[name].sql`

If found: use as starting point, note what's pre-existing vs newly discovered.
If not found: proceed to Phase 1.

---

## Phase 1: Research & Data Collection

### CRITICAL: Research Requirements

**You MUST perform extensive web research.** Use WebSearch and WebFetch to:
- Search multiple queries for all available information
- Fetch actual web pages, not just snippets
- Find exact dates, places, relationships, teachers, students
- Search archival sources, academic papers, historical records
- Cross-reference multiple sources
- Document ALL names discovered (other capoeiristas for later import)

**Read `docs/genealogy/sources/research-sources.md` first** for source tiering:
- **Tier 1** (highest reliability): Velhos Mestres (Bahia), Capoeira History (Rio), Wikipedia, CapoeiraHub, Lalaue, Papoeira
- **Tier 2**: Portal Capoeira, IPHAN, CapoeiraWiki
- **Tier 3** (social media): Instagram/Facebook—for verifying activity only, NOT for `public_links`
- **Tier 4** (academic): Research papers, university publications

**PARALLEL EXECUTION:** Fetch multiple Tier 1 sources simultaneously using parallel WebFetch calls for: Wikipedia EN, Wikipedia PT, Velhos Mestres, Capoeira History, Lalaue, Papoeira.

### Follow-up Research (CRITICAL)

After initial research, look for "clues" that warrant deeper investigation:
- Named historical events with dates (revolts, competitions, ceremonies)
- Named individuals mentioned in passing (teachers of teachers, rivals)
- Academic sources or books cited
- Eyewitness accounts referenced

For each significant clue: search specifically, find primary sources, extract vivid details and direct quotes. **Do not skip this phase.**

**PARALLEL EXECUTION:** When you have 2+ clues, spawn parallel Task agents (subagent_type=Explore) to investigate each clue simultaneously. Example:
```
Task 1: "Research the 1828 Mercenary Revolt Rio de Janeiro capoeira involvement"
Task 2: "Find academic paper by Frede Abreu about [person]"
Task 3: "Identify training companions of [person] in Salvador 1910s"
```
Consolidate results before proceeding to data collection.

---

## Phase 2: Data to Collect

### Person Profile Fields (`genealogy.person_profiles`)

| Field | Column | Required |
|-------|--------|----------|
| Full Name | `name` | No |
| Apelido | `apelido` | **Yes** |
| Title | `title` | No |
| Style | `style` | No |
| Portrait URL | `portrait` | No |
| Public Links | `public_links` | No |
| Birth Year | `birth_year` | Estimate if clues exist |
| Birth Year Precision | `birth_year_precision` | Required if birth_year set |
| Birth Place | `birth_place` | No |
| Death Year | `death_year` | No |
| Death Year Precision | `death_year_precision` | Required if death_year set |
| Death Place | `death_place` | No |
| Bio EN | `bio_en` | **Yes** |
| Bio PT | `bio_pt` | **Yes** |
| Achievements EN | `achievements_en` | No |
| Achievements PT | `achievements_pt` | No |
| Style Notes EN | `style_notes_en` | No |
| Style Notes PT | `style_notes_pt` | No |
| Researcher Notes EN | `notes_en` | Date estimates, source conflicts, name variations |
| Researcher Notes PT | `notes_pt` | Date estimates, source conflicts, name variations |

**Bilingual content is REQUIRED.** See `docs/genealogy/BILINGUAL_CONTENT.md`.

### Researcher Notes Structure (CRITICAL)

The `notes_en`/`notes_pt` columns serve as **structured research documentation** for database queries and future researchers. Include ALL of the following sections when applicable:

```
BIRTH YEAR ESTIMATION ([year], [precision]):
[Reasoning and sources]

DEATH YEAR ESTIMATION ([year], [precision]):
[Reasoning and sources]

NAME DISCREPANCY:
- "[Name 1]" - source1, source2 (MAJORITY)
- "[Name 2]" - source3
[Which used and why]

TEACHERS:
- Mestre [Name] ([context], ~[year], [location])
- ...

STUDENTS:
- Mestre [Name] ([full name if known], began ~[year])
- ...

MEDIA APPEARANCES:
- [Year]: [Description] (film/photo/interview/LP/publication)
- [Year]: [Description]
- ...

RODA LOCATION: [Address], [Neighborhood], [City]

[Any other relevant structured data]
```

**Why this matters:** The .md report is for human reading, but `notes_en`/`notes_pt` persist in the database and enable queries like "find all mestres photographed by Pierre Verger" or "list all media appearances from 1954".

### Capoeira History (for relationships)

Also collect for statement generation:
- Training timeline: who, when, where
- Primary teacher(s) vs. workshop influences
- Titles received: when, by whom
- Baptism: who gave apelido, when
- Groups founded/led/taught/member

### Historical Figures (Pre-1930s)

For Layer Zero figures:
- **Title:** Often NULL—formal titles didn't exist in modern sense
- **Style:** NULL—Angola/Regional distinction came later
- **Confidence:** Often `uncertain` or `likely` due to limited documentation
- **Sources:** Police/arrest records, newspapers, academic research are primary

### Bio Writing Guidelines

The bio tells the person's story. Write a **narrative**, not a dry summary.

**Include:** Human journey, pivotal moments, historical context, relationships, stakes, direct quotes from sources, mysteries, legacy.

**CRITICAL - Narrative Richness (DO NOT SACRIFICE FOR COMPACTNESS):**
- Include **direct quotes** from primary sources (with attribution)
- Document **media appearances** chronologically: films, photographs, recordings, publications
- Name **specific locations**: street addresses, neighborhood names, church names
- Capture **colorful details**: description of rodas, environment, intensity
- Include **transformation stories**: before/after capoeira, prison to mestre, etc.
- Reference **academic studies** that mention the person (e.g., Waldeloir Rego 1968)

**Example of good detail (from Traíra bio):**
> "His rodas were notorious for their intensity - Mestre Barba Branca recalled them as 'violent,' with constant headbutts to the face and rasteiras. The roda took place on packed dirt, and chickens would cross through the middle while people played."

**CRITICAL - Tone:**
- Let facts speak—they're dramatic enough
- Use source language (translated if needed)
- Be direct about what we know and don't know
- Write as if explaining to a fellow capoeirista, not a tourist
- Don't speculate on origins of apelido—only state facts (e.g., "his apelido suggests he worked in stables" is acceptable, but lengthy speculation paragraphs are not)

**CRITICAL - Brazilian Portuguese Spelling:**
- **ALWAYS preserve Brazilian Portuguese spelling with accents** when writing person names, place names, apelidos, and literal quotes in textual content (bio, notes, achievements)
- Examples: Bastião (not Bastiao), César (not Cesar), Calçada (not Calcada), São Paulo (not Sao Paulo)
- This applies to both English and Portuguese text—proper nouns retain their original spelling
- Only exception: SQL identifiers and file names use ASCII (e.g., `bastiao.sql`)

**AVOID:** Poetic embellishments ("hunted yet indestructible"), grandiose unsupported claims, romanticizing violence, treating capoeira as exotic, flowery language.

**Source conflicts:** Choose most reliable version for narrative, document conflicts in `notes_en`/`notes_pt`. Keep bio clean.

### Public Links

Include stable, authoritative pages: Wikipedia, group website bios, Lalaue, CapoeiraHub.
**Do NOT include social media accounts**—too ephemeral.

**CRITICAL - Primary Source Verification:**
If you used **velhosmestres.com** or **capoeirahistory.com** during research, you MUST include it in `public_links`. This is the most authoritative source for historical mestres. Check for:
- Person-specific page: `velhosmestres.com/en/featured-[number]` or `velhosmestres.com/pt/destaque-[number]`
- Interview pages mentioning the person
- LP/recording documentation pages, media appearences

**Order in public_links array:** Primary sources first, then secondary:
1. velhosmestres.com (if applicable)
2. Wikipedia (EN/PT)
3. CapoeiraWiki
4. Lalaue/CapoeiraHub
5. Group official websites
6. Other stable sources

### Portrait Sourcing

Priority order for finding images:
1. **Wikimedia Commons** - Public domain, stable URLs. Pattern: `commons.wikimedia.org/wiki/Special:Search?search=mestre+[name]`
2. **Group official websites** - Leader/founder photos
3. **Documentary screenshots** - Public YouTube videos

**Guidelines:** Prefer public domain/CC-licensed, use stable URLs (Wikimedia preferred), optimal size 200-400px. If none available, leave NULL.

### Historical Figures: Birth Year Estimation

**When no birth date available, estimate using evidence.** Use `decade` precision.

Method:
1. **Anchor events:** If active/teaching in year X, work backwards (teacher likely 25-50, fighter 18-40)
2. **Relationships:** If taught someone born in Y who started learning at 12, teacher was 25-40 years older
3. **Historical context:** African-born in early 1900s Brazil → born before 1850

Document reasoning in **both**:
- SQL file header comment (brief)
- `notes_en`/`notes_pt` columns (full bilingual reasoning)

**An estimate with `decade` precision is more useful than NULL.**

### Date Validation (CRITICAL)

Cross-check dates for logical consistency. Watch for:
- Same date for arrest AND release (unlikely)
- Same date for training start AND title conferral
- Any date appearing twice in different contexts

When inconsistent: re-read context, determine which event the date belongs to, use logical deduction for the other, note uncertainty.

---

## Phase 3: Entity Tracking

As you research, track discovered entities for later import.

### CRITICAL: Check Existing Reports BEFORE Web Searches

**When you encounter a person or group name during research, DO NOT immediately perform web searches.** First check our existing documentation:

1. **For person names encountered:**
   - Glob `docs/genealogy/person-reports/*.md` for name variations
   - Check `docs/genealogy/import-backlog/persons-done.md` for already-imported persons (may use different apelido than you expect—check full names too)
   - If found: Read the existing report for basic information, relationships, sources already gathered
   - Only perform web searches for: new leads not covered in existing report, verification of disputed facts, or filling gaps

2. **For group names encountered:**
   - Glob `docs/genealogy/group-reports/*.md` for name variations
   - If found: Read the existing report for basic information, founding details, key figures
   - Only perform web searches for: new details not in existing report

**Why this matters:** Existing reports contain research already performed - re-fetching the same web sources wastes time and resources. Use what we have, then search for NEW information only.

**CRITICAL: Add EVERY capoeira person/group name you encounter to this table.** This includes names in:
- Historic photos ("photo shows X with A, B, C, D...")
- Quotes listing contemporaries ("the notable capoeiristas were...")
- Training companions mentioned in passing
- Academies, rodas, or groups where the subject trained/performed

If it's a capoeira-related name, it goes in this table. Decide `Import? = yes/?/no` for each.

### Discovered Entities Table

| Type | Apelido/Name | Full Name | Title/Role | Relationship | In Dataset? | Import? | Notes |
|------|--------------|-----------|------------|--------------|-------------|---------|-------|
| person | João Grande | João Oliveira dos Santos | Mestre | teacher of subject | check | yes | |
| person | Manuel Cardoso | - | - | slave owner | no | **no** | Not capoeirista |
| group | GCAP | - | - | led by subject | check | yes | |
| group | Santa Luzia Party | - | - | gang led by subject | no | **no** | Street gang |
| spiritual | Mãe Stella de Oxóssi | Maria Stella de Azevedo Santos | Ialorixá | spiritual influence | no | **?** | Candomblé; partnership with [Mestre Name] at Ilê Axé Opô Afonjá |
| terreiro | Ilê Axé Opô Afonjá | - | Terreiro | spiritual location | no | **?** | Candomblé terreiro; hosted capoeira training |

**In Dataset?**: `yes`/`no`/`check` (ask if unsure)
**Import?**:
- `yes` - Capoeira entity, should be imported
- `no` - Not capoeira AND not spiritually connected (slave owners, politicians, etc.)—do not add to backlog
- `?` - Needs investigation OR **spiritual/religious influence** to be tracked for future import

### Spiritual/Religious Influence Tracking (CRITICAL)

Capoeira has deep connections to Afro-Brazilian spirituality. Track ALL religious figures, terreiros, and spiritual organizations encountered:

**What to capture:**
- **Candomblé figures**: Ialorixás (Mães de Santo), Babalorixás (Pais de Santo), Ogãs, Ekédis
- **Umbanda figures**: Leaders, mediums with documented capoeira connections
- **Terreiros**: Candomblé/Umbanda houses where capoeira was practiced or that had partnerships with mestres
- **Other spiritual**: Catholic saints with capoeira devotions (e.g., Nossa Senhora da Conceição), syncretic practices

**How to track:**
1. Use Type = `spiritual` for religious figures, `terreiro` for sacred spaces
2. Mark Import? = `?` (these need data model evaluation)
3. In Notes, include:
   - Religion/tradition (Candomblé Ketu, Umbanda, etc.)
   - **Which mestre they were associated with** (critical for relationship)
   - Nature of connection (partnership, initiation, spiritual advisor, terreiro host)

**Examples from existing imports:**
- Mãe Alice (Bimba's later wife, Ialorixá) - brought spiritual dimension to Regional
- Mãe Stella de Oxóssi - partnership with Barba Branca at Ilê Axé Opô Afonjá
- Terreiro Ilê Axé Opô Afonjá - hosted GCAC youth training programs

**Why this matters:** The genealogy database may expand to include spiritual lineages and their influence on capoeira transmission. Tracking now ensures we don't lose this information.

### Regular Roda & Event Detection (CRITICAL)

When researching a person's history, watch for mentions of **regular gatherings, recurring rodas, and established events** that should be tracked as groups. These represent important social institutions where capoeira was transmitted and where practitioners from different backgrounds came together.

#### Types to Detect

**1. Regular Street Rodas (Weekly/Monthly)**
- Sunday rodas at specific locations
- Weekly gatherings in public spaces (praças, markets, docks)
- Named leaders or organizers
- Long-running traditions (years/decades)

**2. Seasonal/Festival Rodas**
- Church festival rodas (often October-November in Rio)
- Carnival-related gatherings
- Annual celebrations with recurring capoeira presence

**3. Open Rodas (Cross-Group Meeting Grounds)**
- Neutral spaces where practitioners from different groups/lineages played together
- "Historic" or "legendary" rodas mentioned across multiple sources
- Rodas known for attracting visiting mestres

**4. Informal Training Spaces**
- Backyard training before formal academies
- Named leaders of informal groups
- Phrases like "no one gave classes... everyone got together and played"

#### Detection Triggers

Watch for these phrases and patterns:
- "Every Sunday at [location]..."
- "The roda at [place] was famous for..."
- "Mestres from all over came to play at..."
- "For [X] years, capoeiristas gathered at..."
- "One of the most traditional rodas in [city]..."
- "Registered as Cultural Heritage / Patrimônio Cultural"
- "The legendary roda of..."
- Named locations with regular capoeira activity (Praça da República, Largo da Penha, Caxias, etc.)

#### Examples

| Name | Type | Description |
|------|------|-------------|
| Roda de Caxias | Regular (weekly) | Oldest roda in Rio; co-founded 1970s by Cobra Mansa, Rogerio Russo, Peixinho; continues to present day |
| Roda da Penha | Seasonal (festival) | October-November at Nossa Senhora da Penha church; led by Touro/Dentinho; Intangible Cultural Heritage |
| Roda da Praça da República | Regular (Sunday) | Founded 1953 by Ananias; 60+ years; mestres from all styles passed through |
| Roda da Central | Seasonal (Carnival) | 24-hour roda during Carnival at Central Station (1950s-1983) |
| Roda de São Félix | Seasonal (festival) | Dock rodas during church festivals; led by Juvêncio (~1930s-40s) |

#### When Detected - ADD TO GROUPS BACKLOG

1. **Add to `groups-backlog.md`** with appropriate prefix in Notes:
   - `Regular roda:` for weekly/monthly gatherings
   - `Seasonal roda:` for festival/annual events
   - `Open roda:` for cross-group meeting grounds
   - `Proto-group:` for informal pre-academy gatherings

2. **Include in Notes:**
   - Location (specific address/landmark if known)
   - Schedule (Sunday, October-November, during Carnival, etc.)
   - Leader(s) or organizer(s)
   - Era/duration (1970s-present, 1950s-1983, etc.)
   - Significance (why notable - oldest, largest, cross-group, heritage status)
   - Cultural heritage status if applicable (IPHAN, municipal, state)

3. **Format:**
```
| Roda de [Location] | Mixed | [Person] import | pending | [Type]: [Schedule] at [Location]; [leaders]; [era]; [significance]; [heritage status if any] |
```

#### Why This Matters

Regular rodas and events are **social institutions** that:
- Provided neutral ground for practitioners across lineages to meet and play
- Transmitted capoeira culture outside formal academy structures
- Created shared community identity across groups
- Often have official cultural heritage recognition
- Represent living traditions that continue today

**These are as important to document as formal groups.** A roda like Roda de Caxias or Roda da Penha may have more historical significance than many formal academies.

---

## Phase 4: Relationship Mapping

Map all relationships. **Direction:** predicates flow from "younger/newer" to "older/established".

### Person-to-Person Predicates

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `student_of` | Primary ongoing teacher-student | - |
| `trained_under` | Historical/past, workshops, seminars | - |
| `influenced_by` | Studied philosophy without direct training | - |
| `associated_with` | **Specific documented connection** between individuals | `association_context` (**required**) |
| `received_title_from` | Person received title FROM mestre | `title_grant: {title, ceremony?, location?}` |
| `baptized_by` | Received apelido at batizado | `baptism: {apelido_given, ceremony?, location?}` |
| `family_of` | Biological/ceremonial family | `relationship_type` |

### Sibling Relationships (Avoiding Redundancy)

For `family_of` with siblings, store **only one direction** to avoid redundancy:
- Only store `family_of` from the **younger sibling** to the **older** one
- Example: If Zeca (born 1956) and Gato II (born 1950) are brothers, only generate:
  - `Zeca family_of Gato II {relationship_type: brother}` ✓
  - Do NOT also generate `Gato II family_of Zeca` ✗

This convention ensures sibling relationships are captured once, in the younger sibling's statements file.

### CRITICAL: When to Use `associated_with` (AVOID OVERUSE)

**`associated_with` requires a SPECIFIC, DOCUMENTED connection.** Do NOT use it for:

- People listed together as contemporaries in a book/article
- People from the same era/neighborhood without documented interaction
- People mentioned in the same category (e.g., "legendary valentonas", "famous mestres of the 1950s")

**Valid uses of `associated_with`:**
- Shared a specific chapter/section in a book (implies scholarly pairing, e.g., "Rosa Palmeirão e Massú: Vacila pra tu vê!")
- Documented fight, rivalry, or conflict between them
- Named together as training companions in a specific roda/academy
- Collaborated on a recording, performance, or event
- Photographed together with attribution
- Explicitly described relationship in primary source ("was friends with", "worked alongside", "co-led")

**Where to document contemporaries instead:**
- **Biography text**: "Catu operated in the same era as Rosa Palmeirão, Salomé, and other legendary valentonas..."
- **notes_en/notes_pt CONTEMPORARIES section**: List names with dates/context
- **Connections table in .md report**: Use "Contemporary" as relationship type (for human readers, not SQL)

**Example - WRONG:**
```
-- DO NOT generate M:N mappings between all contemporaries
Massú associated_with Salomé -- NO: just listed together
Massú associated_with Chicão -- NO: just listed together
Massú associated_with Catu -- NO: just listed together
```

**Example - CORRECT:**
```
-- Only generate when specific documented connection exists
Massú associated_with Rosa Palmeirão -- YES: share book chapter (paired_in_scholarship)
```

### Person-to-Group Predicates

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `founded` | Sole founder | - |
| `co_founded` | Equal partner in founding | - |
| `leads` | Current primary leader | - |
| `member_of` | Formal membership | - |
| `teaches_at` | Active instructor | - |
| `regional_coordinator_of` | Coordinates a region for international group | `region?, country?` |
| `associated_with` | Loose/informal affiliation | `association_type` |
| `departed_from` | Left group | `departure_type: neutral/blessed/contentious/expelled` |

### Relationship Table

| Subject | Predicate | Object | Started | Ended | Properties | Confidence | Source | Import? |
|---------|-----------|--------|---------|-------|------------|------------|--------|---------|

**Import? column:** `yes` (object exists or should be imported), `no` (not capoeira entity—no SQL, no backlog), `?` (add to backlog with ? status)

**CRITICAL OWNERSHIP RULE:** Every statement goes in the file named after its **SUBJECT**. Example: `Atenilo student_of Bimba` goes in `atenilo.sql`, NOT `bimba.sql`. This prevents duplicates.

---

## Phase 5: SQL Generation

### Entity File: `docs/genealogy/sql-imports/entities/persons/[apelido].sql`

```sql
-- ============================================================
-- GENEALOGY PERSON: [Apelido]
-- Generated: [Date]
-- ============================================================
-- [Optional: BIRTH YEAR ESTIMATION reasoning if applicable]
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  '[name or NULL]', '[apelido]', '[title]'::genealogy.title, '[portrait or NULL]',
  ARRAY['https://...']::text[],
  '[style]'::genealogy.style, E'[style notes EN]', E'[style notes PT]',
  [birth_year], '[precision]'::genealogy.date_precision, '[birth_place]',
  [death_year], '[precision]'::genealogy.date_precision, '[death_place]',
  E'[bio EN]', E'[bio PT]', '[achievements EN]', '[achievements PT]',
  E'[notes EN]', E'[notes PT]'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
```

### Statements File: `docs/genealogy/sql-imports/statements/persons/[apelido].sql`

```sql
-- ============================================================
-- STATEMENTS FOR: [Apelido]
-- Generated: [Date]
-- ============================================================
-- Contains all relationships where [Apelido] is the SUBJECT.
-- ============================================================

-- [Subject] student_of [Teacher]
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '[date]'::date, '[precision]'::genealogy.date_precision,
  '[date]'::date, '[precision]'::genealogy.date_precision,
  '{}'::jsonb, '[confidence]'::genealogy.confidence,
  '[source]', '[notes EN]', '[notes PT]'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = '[Subject]' AND o.apelido = '[Object]'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- [Subject] student_of [Missing Teacher] - needs import first
-- [Subject] associated_with [Missing Peer] - needs import first
```

**Important:**
- **ALWAYS CHECK if relationship objects exist** in the dataset before deciding on pending vs actual SQL
  - Check `docs/genealogy/sql-imports/entities/persons/[apelido].sql` for persons
  - Check `docs/genealogy/sql-imports/entities/groups/[name].sql` for groups
  - Check `docs/genealogy/import-backlog/persons-done.md` for recently imported persons
- **If object EXISTS: Generate actual SQL statement** - do NOT leave as comment
- **If object does NOT exist: Add to PENDING RELATIONSHIPS** comment section AND add to backlog
- Include ALL meaningful relationships: teachers, students, fellow students, opponents, collaborators
- Use `NULL` for unknown values, not empty strings
- COALESCE in ON CONFLICT is required (handles NULL started_at)

### Enum Values

**Titles:** mestra, mestre, contra-mestra, contra-mestre, mestranda, mestrando, professora, professor, instrutora, instrutor, graduada, graduado, formada, formado, estagiaria, estagiario, monitora, monitor, treinel, aluna, aluno, iniciante

**Styles:** angola, regional, contemporanea, mixed

**Date Precision:** exact, month, year, decade, approximate, unknown

**Confidence:** verified (multiple reliable sources), likely (single reliable), unverified (social media only), disputed (conflicting info), uncertain (low confidence)

---

## Phase 6: File Actions (MANDATORY)

You MUST perform ALL of these file operations:

1. **Write entity SQL:** `docs/genealogy/sql-imports/entities/persons/[apelido-lowercase].sql`
2. **Write statements SQL:** `docs/genealogy/sql-imports/statements/persons/[apelido-lowercase].sql` (if relationships exist)
3. **Create/update person report:** `docs/genealogy/person-reports/[name-lowercase].md`
   - Follow template in `docs/genealogy/person-reports/README.md`
   - **Must be bilingual (EN/PT)** - see `adama.md` as reference
4. **Update backlogs:**
   - **BEFORE adding any person:** Check `docs/genealogy/import-backlog/persons-done.md`—persons may be listed under a different apelido than expected (e.g., "Aníbal Burlamaqui" is already imported as "Zuma")
   - Add `Import? = yes` or `?` persons to `docs/genealogy/import-backlog/persons-backlog.md`
   - Add `Import? = yes` or `?` groups to `docs/genealogy/import-backlog/groups-backlog.md`
   - Add `Import? = ?` spiritual figures/terreiros to `docs/genealogy/import-backlog/spiritual-backlog.md`
     - Format: `| Name | Role | Tradition | Connected To (Mestre) | Status | Notes |`
     - Example: `| Mãe Stella de Oxóssi | Ialorixá | Candomblé Ketu | Barba Branca | pending | Partnership at Ilê Axé Opô Afonjá 1993-2019 |`
   - **Do NOT add `Import? = no` entities**
   - **Do NOT add persons already in `persons-done.md`**

**Failure to write all required files is a critical error.**

---

## Phase 7: Output Verification (MANDATORY)

After writing files, verify consistency:

1. **Read back** the written entity SQL, statements SQL, and .md report
   - **PARALLEL:** Read all three files simultaneously
2. **Cross-check sources:** Every source in your summary must appear in written files
3. **Cross-check entities:** All discovered persons/groups with `Import? = yes/?` must be in backlogs
4. **Fix discrepancies immediately**

### Source Verification Checklist (CRITICAL)

For EVERY source used during research, verify it appears in the correct location(s):

| Source Type | Must Appear In |
|-------------|----------------|
| velhosmestres.com page | `public_links` array, .md Sources section |
| Wikipedia page | `public_links` array, .md Sources section |
| Other Tier 1/2 web sources | .md Sources section (evaluate for `public_links`) |
| Academic papers/books | .md Sources section, bio text attribution |
| Film/documentary | bio text, notes_en MEDIA APPEARANCES |
| Photograph (with photographer) | bio text, notes_en MEDIA APPEARANCES |
| LP/recording | bio text, notes_en MEDIA APPEARANCES |
| Interview/oral history | bio text attribution, .md Sources section |

**Verification process:**
1. List all sources you used during research
2. For each source, check the table above
3. Verify it appears in ALL required locations
4. If missing, add it before completing

**Common omission to avoid:** Using velhosmestres.com during research but forgetting to add it to `public_links`.

**Data quality checks:**
- Person has at least: apelido, bio (bilingual)
- If deceased: death_year is set
- If mestre/teacher: at least one `student_of`, `trained_under`, `received_title_from`, `baptized_by` relationship (unless Layer Zero orphan)
- Timeline consistency: no end dates before start dates

**Cross-reference existing reports:**
- For each teacher/student/associate already in dataset, check their person-report and entity SQL
- Verify dates and facts are consistent (e.g., if you say Traira trained under Waldemar from 1947, check waldemar.sql/waldemar.md mentions this)
- If inconsistencies found: determine which version is correct based on sources, update both files if needed, note discrepancy in researcher notes

**Cleanup
- Move the entry from persons-backlog.md to persons-done.md

---

## Console Output Format

```markdown
# Person Import: [Apelido] ([Full Name])

## Report Status
[Pre-existing vs newly discovered?]

## Research Summary
[1-2 paragraph summary]

## Discovered Entities
[Table from Phase 3]

## Relationship Mapping
[Table from Phase 4]

## SQL Files Written
- Entity: `docs/genealogy/sql-imports/entities/persons/[apelido].sql`
- Statements: `docs/genealogy/sql-imports/statements/persons/[apelido].sql`

## Person Report
`docs/genealogy/person-reports/[name].md`

## Notes & Uncertainties
[Conflicts, gaps, questions]

## Sources
[All sources consulted with URLs]
```

---

Now research **$ARGUMENTS** and generate the complete import package.
