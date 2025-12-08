# Genealogy Data Entry Guide

**Purpose:** Step-by-step instructions for analyzing a capoeira group or person and generating complete database entries for the genealogy tree.

**Use Cases:**
1. Initial database seeding with prototype data
2. Adding new groups or persons to the production genealogy tree
3. Expanding existing entries with newly discovered relationships

**Related:**
- [Genealogy Data Model Proposal](../specs/genealogy-tree/genealogy-data-model-proposal.md)
- [Genealogy Architecture Proposal](../specs/genealogy-tree/genealogy-architecture-proposal.md)
- [Case Study Review Instructions](./case-study-review-instructions.md)

---

## Quick Reference: Predicates

> **Direction Convention:** Predicates flow from "younger/newer" to "older/established" (student → mestre, child → parent, new group → predecessor).

### Person-to-Person (7)

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `student_of` | Primary, ongoing teacher-student relationship | - |
| `trained_under` | Historical/past training, workshops, seminars | - |
| `influenced_by` | Studied philosophy/methods without direct training | - |
| `associated_with` | Documented connection between contemporaries (peers, collaborators, known associates) | `association_context` (REQUIRED - text explaining circumstances and sources) |
| `granted_title_to` | Mestre conferred a title/rank | `title_grant: { title, ceremony?, location? }` |
| `baptized_by` | Received apelido at batizado ceremony from this mestre | `baptism: { apelido_given, ceremony?, location? }` |
| `family_of` | Biological or ceremonial family | `relationship_type: parent|sibling|spouse|padrinho|other` |

### Person-to-Group (9)

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `founded` | Created/established the group (sole founder) | - |
| `co_founded` | Equal partner in founding (use for each co-founder) | - |
| `leads` | Current primary leader/coordinator | - |
| `regional_coordinator_of` | Coordinates a region for international group | `region?, country?` |
| `member_of` | Formal membership (implies training) | - |
| `teaches_at` | Active instructor at the group | - |
| `cultural_pioneer_of` | First to bring capoeira to region/country | `region?, country?, context?` |
| `associated_with` | Loose/informal affiliation | `association_type: supporter|patron|informal_affiliate|friend|honorary` |
| `departed_from` | Left group | `departure_type: neutral|blessed|contentious|expelled` |

### Group-to-Group (6)

| Predicate | Use When | Properties |
|-----------|----------|------------|
| `part_of` | Hierarchical organizational relationship | `affiliation_type: branch|nucleus|affiliate|official_filial` |
| `split_from_group` | Group formed by splitting from parent | `split_type: neutral|blessed|contentious`, `blessed_by?: string[]` |
| `merged_into` | Group merged into another | - |
| `evolved_from` | Major organizational transformation | - |
| `affiliated_with` | Formal or cultural affiliation (non-hierarchical) | - |
| `cooperates_with` | Regular cooperation without formal structure | - |

---

## Phase 1: Research & Data Collection

### 1.1 Primary Sources

Gather information from these sources (in order of reliability):

1. **Official Website** - Group history, founder bio, lineage claims
2. **Social Media** - Instagram, Facebook, YouTube for current activity and relationships
3. **Wikipedia / Capoeira Wiki** - Background and historical context
4. **Lalaue.com / CapoeiraHub** - Directory listings, group connections
5. **Academic Papers** - For historical figures (IPHAN, university research)
6. **Interviews / Videos** - Oral history, event footage

### 1.2 Sourcing Images (Avatars & Logos)

When collecting visual assets, prioritize these sources in order:

**For Person Portraits (avatar field):**
1. **Wikimedia Commons** - Public domain images of historical mestres
   - Search: `https://commons.wikimedia.org/wiki/Special:Search?search=mestre+[name]`
   - Use thumb URLs for appropriate sizes (e.g., `220px-` prefix)
2. **Group Official Websites** - Often have leader/founder photos
3. **Social Media Profiles** - Instagram/Facebook profile pictures (if public)
4. **Documentary Screenshots** - From public YouTube videos
5. **Event Photography** - Published event photos with attribution

**For Group Logos:**
1. **Wikimedia Commons** - Major groups often have logos uploaded
   - Search: `https://commons.wikimedia.org/wiki/Special:Search?search=capoeira+[group+name]+logo`
2. **Official Group Websites** - Usually in header or about page
3. **Social Media** - Profile pictures on Facebook/Instagram
4. **Lalaue.com / CapoeiraHub** - Group directory listings

**Image Guidelines:**
- Prefer publicly licensed images (CC0, CC-BY, public domain)
- Use stable URLs (Wikipedia/Wikimedia are preferred for permanence)
- Optimal size: 200-400px for avatars/logos (thumbnail URLs work well)
- If no image available, leave field null (UI will show initials fallback)

**Example URLs:**
```
# Wikimedia thumbnail URL pattern:
https://upload.wikimedia.org/wikipedia/commons/thumb/[path]/220px-[filename]

# Common capoeira images on Wikimedia:
Mestre Pastinha: .../thumb/8/89/Mestre_Pastinha.jpg/220px-Mestre_Pastinha.jpg
Mestre Bimba: .../thumb/c/c0/Mestre_Bimba.jpg/220px-Mestre_Bimba.jpg
```

### 1.3 Information to Extract

For each group, collect:

#### Group Profile Data
```
- Name (official)
- Name aliases (abbreviations, former names)
- Style (angola | regional | contemporânea)
- Founded year (and precision: exact, year, decade, approximate)
- Founded location (City, Country)
- Description (1-2 paragraphs)
- Philosophy/mission statement (if stated)
- Logo URL (if available)
- Social links (website, Instagram, Facebook, etc.)
- Is active? (yes/no)
- Legal structure (if known)
```

#### Founder/Leader Data
```
- Full name (legal name if known)
- Apelido (capoeira nickname)
- Title (mestre, professor, etc.)
- Style
- Birth year (and precision)
- Death year (if deceased, and precision)
- Birth place
- Bio (1-2 paragraphs)
- Avatar URL (if available)
```

#### Lineage Chain
```
For each person in the lineage (founder → teacher → teacher's teacher → ...):
- Who trained whom?
- What was the nature of the relationship? (primary student, workshop attendee, etc.)
- When did training occur? (approximate dates)
- Where? (group name, location)
```

#### Key Relationships
```
- Co-founders (if any)
- Current leadership
- Notable teachers/instructors
- Parent organization (if any)
- Split history (if applicable)
- International expansion / pioneers
```

---

## Phase 2: Entity Identification

### 2.1 Create Entity Lists

From your research, create two lists:

#### Persons (person_profiles)

```markdown
| # | Apelido | Full Name | Title | Style | Birth Year | Death Year | New? |
|---|---------|-----------|-------|-------|------------|------------|------|
| 1 | Pastinha | Vicente Ferreira Pastinha | mestre | angola | 1889 | 1981 | no |
| 2 | João Grande | João Oliveira dos Santos | mestre | angola | 1933 | - | no |
| 3 | Moraes | Pedro Moraes Trindade | mestre | angola | 1950 | - | no |
```

Mark "New?" = yes if this person doesn't exist in the database yet.

#### Groups (group_profiles)

```markdown
| # | Name | Style | Founded | New? |
|---|------|-------|---------|------|
| 1 | CECA | angola | 1941 | no |
| 2 | GCAP | angola | 1980 | yes |
```

Mark "New?" = yes if this group doesn't exist in the database yet.

### 2.2 Assign Temporary IDs

For SQL generation, assign temporary variable names:

```
-- Persons
pastinha_id
joao_grande_id
moraes_id

-- Groups
ceca_id
gcap_id
```

---

## Phase 3: Relationship Mapping

### 3.1 Map Each Relationship to a Predicate

For each relationship found in research, determine:

1. **Subject** - Who/what is the statement about?
2. **Predicate** - What type of relationship?
3. **Object** - Who/what are they related to?
4. **Timeline** - When did it start/end?
5. **Properties** - Any additional typed data?
6. **Confidence** - How certain are we?
7. **Source** - Where did we find this information?

#### Example Mapping Table

```markdown
| Subject | Predicate | Object | Started | Ended | Properties | Confidence | Source |
|---------|-----------|--------|---------|-------|------------|------------|--------|
| João Grande | student_of | Pastinha | 1941 | 1981 | - | verified | Historical records |
| Moraes | student_of | João Grande | ~1970 | - | - | verified | GCAP documentation |
| Moraes | trained_under | Pastinha | ~1975 | 1981 | - | verified | Historical records |
| Moraes | founded | GCAP | 1980 | - | - | verified | Official sources |
| Moraes | leads | GCAP | 1980 | - | - | verified | Current |
| GCAP | split_from_group | CECA | 1980 | - | split_type: blessed | likely | Oral history |
```

### 3.2 Relationship Direction Rules

Always enter relationships in the correct direction (younger/newer → older/established):

| Relationship Type | Subject | Object |
|-------------------|---------|--------|
| Training | Student | Teacher |
| Baptism | Person baptized | Mestre who baptized them |
| Title conferral | Grantor | Recipient |
| Founding | Founder | Group |
| Leadership | Leader | Group |
| Membership | Member | Group |
| Group hierarchy | Child group | Parent group |
| Group split | New group | Original group |
| Group evolution | New group | Predecessor group |

### 3.3 Handle Ambiguity

When information is uncertain:

1. **Use appropriate confidence level:**
   - `verified` - Multiple reliable sources agree
   - `likely` - Single reliable source
   - `unverified` - Claimed but not verified
   - `disputed` - Conflicting information exists
   - `uncertain` - Low confidence, needs investigation

2. **Use appropriate date precision:**
   - `exact` - Known to the day
   - `month` - Known to the month
   - `year` - Known to the year
   - `decade` - Known to the decade (e.g., "early 1970s")
   - `approximate` - Rough estimate
   - `unknown` - No date information

3. **Document in notes/source fields:**
   - Always cite where information came from
   - Note any conflicting claims

---

## Phase 4: SQL Generation

### 4.1 Person Profile Inserts

For each NEW person (not already in database):

```sql
-- Person: [Apelido] ([Full Name])
INSERT INTO genealogy.person_profiles (
  id, name, apelido, title, style,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio, avatar, links
) VALUES (
  gen_random_uuid(),
  '[Full Name]',
  '[Apelido]',
  '[title]'::genealogy.title,
  '[style]'::genealogy.style,
  [birth_year], '[precision]'::genealogy.date_precision, '[birth_place]',
  [death_year], '[precision]'::genealogy.date_precision, '[death_place]',
  '[Bio text]',
  '[avatar_url]',
  '[]'::jsonb
) RETURNING id AS [variable_name];
```

### 4.2 Group Profile Inserts

For each NEW group (not already in database):

```sql
-- Group: [Name]
INSERT INTO genealogy.group_profiles (
  id, description, style, style_notes,
  founded_year, founded_year_precision, founded_location,
  philosophy, logo, links, is_active
) VALUES (
  gen_random_uuid(),
  '[Description]',
  '[style]'::genealogy.style,
  '[style_notes]',
  [founded_year], '[precision]'::genealogy.date_precision, '[location]',
  '[philosophy]',
  '[logo_url]',
  '[{"type": "website", "url": "https://..."}]'::jsonb,
  true
) RETURNING id AS [variable_name];
```

### 4.3 Statement Inserts

For each relationship:

```sql
-- [Subject] [predicate] [Object]
INSERT INTO genealogy.statements (
  id, subject_type, subject_id, predicate, object_type, object_id,
  started_at, ended_at, properties, confidence, source, notes
) VALUES (
  gen_random_uuid(),
  '[person|group]'::genealogy.entity_type,
  [subject_id],
  '[predicate]'::genealogy.predicate,
  '[person|group]'::genealogy.entity_type,
  [object_id],
  '[YYYY-MM-DD]'::date,
  [NULL or 'YYYY-MM-DD'::date],
  '[{}]'::jsonb,
  '[confidence]'::genealogy.confidence,
  '[source citation]',
  '[additional notes]'
);
```

### 4.4 Complete SQL Template

```sql
-- ============================================================
-- GENEALOGY DATA ENTRY: [Group Name]
-- Generated: [Date]
-- Source: [Primary source URL]
-- ============================================================

-- Enable transaction for atomicity
BEGIN;

-- ============================================================
-- PERSON PROFILES
-- ============================================================

-- [Repeat for each new person]

-- ============================================================
-- GROUP PROFILES
-- ============================================================

-- [Repeat for each new group]

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- --- Person-to-Person: Recognition ---

-- --- Person-to-Person: Family ---

-- --- Person-to-Group: Founding & Leadership ---

-- --- Person-to-Group: Membership & Affiliation ---

-- --- Group-to-Group: Hierarchical ---

-- --- Group-to-Group: Evolution ---

-- --- Group-to-Group: Affiliation ---

COMMIT;
```

---

## Phase 5: TypeScript Seed Script Format

For programmatic seeding, use this format:

```typescript
import { db } from '@/db';
import { personProfiles, groupProfiles, statements } from '@/db/schema/genealogy';

export async function seedGroupName() {
  console.log('Seeding [Group Name]...');

  // ============================================================
  // PERSON PROFILES
  // ============================================================

  const [personAlias] = await db.insert(personProfiles).values({
    name: 'Full Legal Name',
    apelido: 'Apelido',
    title: 'mestre',
    style: 'angola',
    birthYear: 1950,
    birthYearPrecision: 'year',
    birthPlace: 'City, Country',
    deathYear: null,
    bio: 'Biography text...',
  }).returning();

  // ============================================================
  // GROUP PROFILES
  // ============================================================

  const [groupAlias] = await db.insert(groupProfiles).values({
    description: 'Group description...',
    style: 'angola',
    foundedYear: 1980,
    foundedYearPrecision: 'year',
    foundedLocation: 'City, Country',
    philosophy: 'Group philosophy...',
    isActive: true,
  }).returning();

  // ============================================================
  // STATEMENTS
  // ============================================================

  await db.insert(statements).values([
    // Person-to-Person: Training & Lineage
    {
      subjectType: 'person',
      subjectId: personAlias.id,
      predicate: 'student_of',
      objectType: 'person',
      objectId: teacherId,
      startedAt: '1970-01-01',
      confidence: 'verified',
      source: 'Source citation',
    },
    // ... more statements
  ]);

  console.log('Seeding [Group Name] complete!');
}
```

---

## Phase 6: Validation Checklist

Before submitting data, verify:

### Entity Completeness
- [ ] All persons have at least: apelido, title, style
- [ ] All groups have at least: description, style, founded_year
- [ ] Historical figures have death_year if deceased

### Relationship Completeness
- [ ] Every group has at least one `founded` or `co_founded` statement
- [ ] Every founder has at least one `student_of` or `trained_under` (unless orphaned)
- [ ] Current groups have a `leads` statement for active leader
- [ ] Split groups have `split_from_group` statement

### Lineage Chain
- [ ] Can trace lineage from founder up to a known historical figure?
- [ ] Any gaps marked with appropriate confidence level?

### Data Quality
- [ ] Sources cited for all key claims
- [ ] Confidence levels appropriate for evidence quality
- [ ] No duplicate entities (check existing database first)
- [ ] Timeline consistency (no end dates before start dates)

---

## Appendix A: Common Patterns

### Pattern 1: Single Founder with Clear Lineage

```
Founder → student_of → Teacher → student_of → Grandteacher
Founder → founded → Group
Founder → leads → Group
```

### Pattern 2: Co-Founded Group

```
Founder1 → co_founded → Group
Founder2 → co_founded → Group
Founder1 → leads → Group  (if primary leader)
```

### Pattern 3: Blessed Split

```
NewGroup → split_from_group → OriginalGroup
  properties: { split_type: 'blessed', blessed_by: ['Mestre X'] }
Founder → departed_from → OriginalGroup
  properties: { departure_type: 'blessed' }
Founder → founded → NewGroup
```

### Pattern 4: International Pioneer

```
Pioneer → cultural_pioneer_of → Group
  properties: { region: 'Europe', country: 'Germany' }
Pioneer → teaches_at → Group
Pioneer → member_of → Group
```

### Pattern 5: Leadership Succession

```
Founder → founded → Group
Founder → leads → Group
  ended_at: '2010-01-01'
Successor → leads → Group
  started_at: '2010-01-01'
Successor → student_of → Founder
```

### Pattern 6: Family Capoeira

```
Parent → family_of → Child
  properties: { relationship_type: 'parent' }
Parent → student_of → Grandparent  (if capoeirista)
Child → student_of → Parent
Parent → founded → Group
Child → leads → Group  (succession)
```

---

## Appendix B: Troubleshooting

### "I can't find the founder's teacher"

1. Check if the teacher is a well-known historical figure (may already exist)
2. Create a minimal person_profile with `confidence: 'uncertain'`
3. Note in the source field that lineage is incomplete
4. Consider using `trained_under` instead of `student_of` if relationship was informal

### "The group has had multiple names"

Use the `name_history` JSONB field on group_profiles:
```json
[
  { "name": "Original Name", "startedAt": "1980-01-01", "endedAt": "1990-01-01" },
  { "name": "Current Name", "startedAt": "1990-01-01" }
]
```
Do NOT create separate group entities for name changes.

### "The split was contentious and parties disagree"

1. Use `confidence: 'disputed'`
2. Document both versions in the `notes` field
3. Cite sources for each claim
4. The verification workflow can resolve later

### "I found conflicting dates"

1. Use the most reliable source
2. Set `precision` to 'approximate' or 'decade' if uncertain
3. Note the conflict in the `source` field
4. Example: "Founded circa 1980 (some sources say 1978)"

---

## Revision History

| Date | Version | Changes |
|------|---------|---------|
| 2025-12-07 | 1.0 | Initial version |
