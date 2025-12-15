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
- **Tier 1** (highest reliability): Velhos Mestres, Wikipedia, CapoeiraHub, Lalaue, Papoeira
- **Tier 2**: Portal Capoeira, IPHAN, CapoeiraWiki
- **Tier 3** (social media): Instagram/Facebook—for verifying activity only, NOT for `public_links`
- **Tier 4** (academic): Research papers, university publications

**PARALLEL EXECUTION:** Fetch multiple Tier 1 sources simultaneously using parallel WebFetch calls for: Wikipedia EN, Wikipedia PT, Velhos Mestres, Lalaue, Papoeira.

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

**CRITICAL - Tone:**
- Let facts speak—they're dramatic enough
- Use source language (translated if needed)
- Be direct about what we know and don't know
- Write as if explaining to a fellow capoeirista, not a tourist
- Don't speculate on origins of apelido, only comment

**AVOID:** Poetic embellishments ("hunted yet indestructible"), grandiose unsupported claims, romanticizing violence, treating capoeira as exotic, flowery language.

**Source conflicts:** Choose most reliable version for narrative, document conflicts in `notes_en`/`notes_pt`. Keep bio clean.

### Public Links

Include stable, authoritative pages: Wikipedia, group website bios, Lalaue, CapoeiraHub.
**Do NOT include social media accounts**—too ephemeral.

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

### Discovered Entities Table

| Type | Apelido/Name | Full Name | Title | Relationship | In Dataset? | Import? | Notes |
|------|--------------|-----------|-------|--------------|-------------|---------|-------|
| person | João Grande | João Oliveira dos Santos | mestre | teacher of subject | check | yes | |
| person | Manuel Cardoso | - | - | slave owner | no | **no** | Not capoeirista |
| group | GCAP | - | - | led by subject | check | yes | |
| group | Santa Luzia Party | - | - | gang led by subject | no | **no** | Street gang |

**In Dataset?**: `yes`/`no`/`check` (ask if unsure)
**Import?**: `yes` (capoeira entity), `no` (not capoeira—do not add to backlog), `?` (needs investigation)

---

## Phase 4: Relationship Mapping

Map all relationships. **Direction:** predicates flow from "younger/newer" to "older/established".

### Person-to-Person Predicates

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `student_of` | Primary ongoing teacher-student | - |
| `trained_under` | Historical/past, workshops, seminars | - |
| `influenced_by` | Studied philosophy without direct training | - |
| `associated_with` | Documented connection between contemporaries | `association_context` (**required**) |
| `received_title_from` | Person received title FROM mestre | `title_grant: {title, ceremony?, location?}` |
| `baptized_by` | Received apelido at batizado | `baptism: {apelido_given, ceremony?, location?}` |
| `family_of` | Biological/ceremonial family | `relationship_type` |

### Person-to-Group Predicates

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `founded` | Sole founder | - |
| `co_founded` | Equal partner in founding | - |
| `leads` | Current primary leader | - |
| `member_of` | Formal membership | - |
| `teaches_at` | Active instructor | - |
| `regional_coordinator_of` | Coordinates a region for international group | `region?, country?` |
| `cultural_pioneer_of` | First to bring capoeira to region | `region?, country?, context?` |
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
- Only generate statements for entities that already exist in dataset
- **PENDING RELATIONSHIPS:** Add comment section at end of statement file for relationships where object doesn't exist yet
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
   - Add `Import? = yes` or `?` persons to `docs/genealogy/import-backlog/persons-backlog.md`
   - Add `Import? = yes` or `?` groups to `docs/genealogy/import-backlog/groups-backlog.md`
   - **Do NOT add `Import? = no` entities**

**Failure to write all required files is a critical error.**

---

## Phase 7: Output Verification (MANDATORY)

After writing files, verify consistency:

1. **Read back** the written entity SQL, statements SQL, and .md report
   - **PARALLEL:** Read all three files simultaneously
2. **Cross-check sources:** Every source in your summary must appear in written files
3. **Cross-check entities:** All discovered persons/groups with `Import? = yes/?` must be in backlogs
4. **Fix discrepancies immediately**

**Data quality checks:**
- Person has at least: apelido, bio (bilingual)
- If deceased: death_year is set
- If mestre/teacher: at least one `student_of`, `trained_under`, `received_title_from`, `baptized_by` relationship (unless Layer Zero orphan)
- Timeline consistency: no end dates before start dates

**Cross-reference existing reports:**
- For each teacher/student/associate already in dataset, check their person-report and entity SQL
- Verify dates and facts are consistent (e.g., if you say Traira trained under Waldemar from 1947, check waldemar.sql/waldemar.md mentions this)
- If inconsistencies found: determine which version is correct based on sources, update both files if needed, note discrepancy in researcher notes

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
