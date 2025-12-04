# Capoeira Genealogy Data Model Proposal

**Version:** 1.0
**Date:** 2025-12-03
**Status:** Draft for Review
**Based on:** Analysis of 33 case studies from `/docs/genealogy/case-studies/`

---

## Executive Summary

This document proposes a data model for capturing complex relationships in Capoeira genealogy using a **statement/triple table pattern** (EAV model). The design enables flexible representation of person-to-person, person-to-group, and group-to-group relationships while keeping essential biographical and organizational attributes directly on entity tables.

**Key Design Decisions:**
1. **Statement Table Pattern**: Use subject-predicate-object triples with optional properties
2. **Direct Attributes**: Keep frequently queried, well-defined attributes on entity tables
3. **Relationship Categories**: Consolidated from 33 real-world case studies
4. **Temporal Support**: All relationships support `started_at` and `ended_at`
5. **Verification System**: Built-in confidence levels and verification tracking

---

## Part 1: Relationship Types (Predicates)

### 1.1 Person-to-Person Relationships

Extracted from 33 case studies, consolidated into core categories:

#### Training & Lineage Relationships

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `student_of` | Primary student-teacher relationship. The foundational lineage connection. | All case studies - universal pattern |
| `trained_under` | Informal or short-term training. Workshops, seminars, guest instruction. | Areia trained under Casca Dura (CDO) |
| `trained_alongside` | Peer relationship - trained together under same mestre. "Capoeira siblings." | GCAP's trained-together patterns, Zimba |
| `influenced_by` | Studied methods/philosophy without direct training. Important for style evolution. | Senzala members influenced by multiple mestres |
| `successor_to` | Designated or acknowledged successor in lineage/teaching authority. | João Pequeno → Pastinha legacy |

#### Mentorship & Recognition Relationships

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `mentored` | Informal guidance beyond formal student relationship. | Various case studies |
| `granted_title_to` | Peer recognition - one mestre conferring title/recognition on another. | Zimba: peer mestre title conferral |
| `blessed_departure` | Formal blessing from mestre for student to start own group/teaching. | Zimba: Boca do Rio's departure from GCAP |
| `padrinho_of` | Godfather/godmother relationship - spiritual/ceremonial role. | Common in batizado ceremonies |

#### Family Relationships

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `biological_parent_of` | Direct biological parent relationship. | Bimba → Formiga (Candeias lineage) |
| `biological_child_of` | Direct biological child relationship (inverse). | Formiga → Bimba |
| `sibling_of` | Biological sibling relationship. | ABADÁ: Camisa + Camisa Roxa (brothers) |
| `spouse_of` | Married or life partner (often co-teach). | Multiple couples in case studies |

#### Professional & Historical Relationships

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `childhood_friends_with` | Pre-capoeira friendship context. | Oriaxé: childhood best friends |
| `worked_together_with` | Professional collaboration outside direct lineage. | Various case studies |

> **Note:** `co_founded_with` was removed as redundant. Co-founders are derived from multiple `co_founded` person-to-group statements on the same group.
>
> **Note:** `split_from_person` was removed as redundant. Person splits from groups are captured by `departed_from` with `departure_type` property. Interpersonal context can be noted in the `reason` field.

---

### 1.2 Person-to-Group Relationships

#### Founding & Leadership Roles

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `founded` | Created/established the group. | All 33 case studies |
| `co_founded` | Equal partner in founding. | CB: 3 co-founders; Oriaxé: 2 co-founders |
| `leads` | Current primary leader/coordinator. Use properties for role distinction. | Active leadership role |
| `successor_leader_of` | Inherited leadership after founder. | Muzenza: Burguês after Paulão |
| `regional_coordinator_of` | Coordinates region for international group. | ABADÁ: Camisa Roxa for Europe |

> **Note:** `international_representative_of` was removed. Representatives are captured by `teaches_at` or `leads` with timeline, plus `departed_from` when leaving.

#### Membership & Teaching Roles

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `member_of` | General formal membership. | Universal pattern |
| `individual_member_of` | Non-formal affiliation (orphaned nodes, informal schools). | Marinheiro Russia pattern |
| `teaches_at` | Active instructor at group (with title/rank as property). | All teaching relationships |
| `studies_at` | Currently training as student. | Active student membership |
| `cultural_pioneer_of` | First to bring capoeira to region/country for this group. | Oriaxé: Argentina pioneers; many international expansion cases |

#### Historical Roles

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `graduated_from` | Completed training/batizado at group (no longer member). | Lineage tracking |
| `departed_from` | Left group. Use `departure_type` property to specify context. | Split patterns |

> **Note:** `expelled_from` was consolidated into `departed_from` with `departure_type: 'expelled'` property.

---

### 1.3 Group-to-Group Relationships

#### Hierarchical/Organizational

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `part_of` | Hierarchical organizational relationship. Use `affiliation_type` property. | All hierarchical groups |

> **Affiliation types for `part_of`:**
> - `branch` - Close tie, low autonomy (filial)
> - `nucleus` - More autonomous than branch
> - `affiliate` - Independent identity but affiliated
> - `official_filial` - Government-registered relationship
>
> **Note:** `headquarters_of` is derivable - any group with `part_of` relationships pointing to it is effectively HQ. Individual predicates (`branch_of`, `nucleus_of`, `affiliate_of`, `official_filial_of`) were consolidated into `part_of` with `affiliation_type` property.

#### Evolution & Succession

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `split_from_group` | Group formed by splitting from parent. Use `split_type` property to specify context. | CB from Senzala; many case studies |
| `merged_into` | Group merged into another. | Candeias unification |
| `absorbed` | Group absorbed another (inverse). | Rare but exists |
| `succeeded` | Group continues legacy of defunct group. | Historical continuity cases |
| `evolved_from` | Name change or significant transformation. | Ngoma from "Marrom e Alunos" |

> **Note:** `blessed_split_from` was consolidated into `split_from_group` with `split_type: 'blessed'` property.

#### Affiliation & Cooperation

| Predicate | Description | Case Study Examples |
|-----------|-------------|---------------------|
| `affiliated_with` | Formal or cultural affiliation. | CDO network |
| `cooperates_with` | Regular cooperation without formal structure. | Multi-group events |
| `shares_lineage_with` | Same ancestral lineage (different groups). | All Senzala-derived groups |

---

## Part 2: Direct Attributes

### 2.1 User/Person Attributes

These attributes should be stored directly on the `users` table (or an extended `person_profiles` table) because they are:
- Frequently queried
- Well-defined with clear data types
- Not relationships between entities

**Note:** The following columns already exist in the `users` table:
- `nickname` (serves as apelido)
- `title` (TitleEnum)
- `avatar` (photo URL)
- `accountStatus` (includes 'managed_profile' per claimable-profiles.md)

#### New Biographical Attributes (for person_profiles table)

```typescript
interface PersonProfileAttributes {
  // Life dates (NEW)
  born_at: Date | null;        // Birth date (approximate OK)
  born_at_precision: 'exact' | 'year' | 'decade' | 'unknown';
  birth_place: string | null;  // City, Country or just Country

  deceased_at: Date | null;    // Death date if passed
  deceased_at_precision: 'exact' | 'year' | 'decade' | 'unknown';
  deceased_place: string | null;

  // Capoeira identity (NEW)
  primary_style: StyleEnum | null;  // angola | regional | contemporanea | mixed
  style_notes: string | null;       // "Transitioned from Regional to Angola in 1985"

  // Extended content (NEW)
  biography: text | null;           // Long-form life story
  achievements: text | null;        // Awards, recognitions

  // Managed profile metadata (per claimable-profiles.md)
  is_managed: boolean;              // True if admin-created, claimable
  managed_reason: text | null;      // "Deceased mestre", etc.
  // NOTE: Management permissions use multi-manager model:
  // 1. Global admins (users.isGlobalAdmin)
  // 2. Group admins - derived if profile is leader of their group
  // 3. Explicit grants via profile_managers table
}
```

#### Title Enum (Hierarchy)

```typescript
type TitleEnum =
  | 'mestre'
  | 'mestra'
  | 'grao_mestre'        // Grand Master
  | 'contra_mestre'
  | 'contra_mestra'
  | 'mestrando'
  | 'mestranda'
  | 'professor'
  | 'professora'
  | 'instrutor'
  | 'instrutora'
  | 'monitor'
  | 'monitora'
  | 'treinel'            // Used in some groups
  | 'graduado'
  | 'graduada'
  | 'formado'            // CB-specific
  | 'formando'           // CB-specific
  | 'aluno'
  | 'aluna';
```

---

### 2.2 Group Attributes

**Note:** The following columns already exist in the `groups` table:
- `name`, `description`, `style`, `email`
- `logo`, `banner`
- `leader` (uuid FK to users)
- `founder` (varchar - to be replaced by statements)
- `links` (json array of social links)
- `createdBy`, `claimedBy`, `claimedAt`

#### New Group Attributes (to add)

```typescript
interface NewGroupAttributes {
  // Identity enhancements (NEW)
  name_aliases: string[];           // Alternative names, old names
  acronym: string | null;           // GCAP, FICA, CB, etc.

  // Founding details (NEW)
  founded_at: Date | null;
  founded_at_precision: 'exact' | 'year' | 'decade' | 'approximate';
  founded_location: string | null;  // City, Country
  founding_type: FoundingTypeEnum;

  // Style evolution (NEW)
  style_notes: string | null;       // "Originally Regional, evolved to Contemporânea"
  philosophy: text | null;          // Group's stated philosophy/mission

  // Organizational (NEW)
  organizational_model: OrgModelEnum;
  legal_structure: LegalStructureEnum | null;
  is_headquarters: boolean;
  headquarters_location: string | null;

  // Status (NEW)
  is_active: boolean;
  dissolved_at: Date | null;

  // Extended content (NEW)
  history: text | null;             // Long-form group history

  // Statistics - denormalized for performance (NEW)
  estimated_member_count: number | null;
  location_count: number | null;
  country_count: number | null;
}
```

#### Supporting Enums

```typescript
type FoundingTypeEnum =
  | 'original'           // New, independent founding
  | 'split'              // Split from another group (may be contentious)
  | 'blessed_split'      // Amicable split with elder blessing
  | 'merger'             // Result of merging groups
  | 'successor'          // Continues legacy of defunct group
  | 'pioneer_period';    // Group existed informally before formal founding

type OrgModelEnum =
  | 'autonomous_continuation'  // Students independent, voluntary connection (Ngoma)
  | 'nucleus_network'          // Semi-autonomous núcleos (Angoleiros)
  | 'certified_affiliates'     // Trademark, fees, approval (CDO)
  | 'registered_network'       // Central registry (Muzenza)
  | 'branch_hierarchy'         // Hierarchical arms→branches (Axé, CB)
  | 'decentralized_legal'      // Independent legal entities (ABADÁ)
  | 'family_school'            // Single location, family-run
  | 'individual_school';       // Solo practitioner school

type LegalStructureEnum =
  | 'for_profit'
  | 'non_profit'
  | 'nonprofit_501c3'     // USA specific
  | 'association_ev'      // German e.V.
  | 'association_loi1901' // French
  | 'informal'
  | 'mixed';              // Different in different countries

type StyleEnum =
  | 'angola'
  | 'regional'
  | 'contemporanea'
  | 'mixed'
  | 'unknown';
```

---

## Part 3: Statement/Triple Table Schema

### 3.1 Core Statement Table

The central table for all relationships using EAV (Entity-Attribute-Value) pattern:

```typescript
// statements - Core triple table for all relationships
export const statements = pgTable('statements', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Subject-Predicate-Object triple
  subject_type: entityTypeEnum('subject_type').notNull(),  // 'person' | 'group'
  subject_id: uuid('subject_id').notNull(),

  predicate: predicateEnum('predicate').notNull(),         // Relationship type

  object_type: entityTypeEnum('object_type').notNull(),    // 'person' | 'group'
  object_id: uuid('object_id').notNull(),

  // Temporal bounds (when was this relationship active?)
  started_at: date('started_at'),
  started_at_precision: precisionEnum('started_at_precision').default('unknown'),
  ended_at: date('ended_at'),                              // null = ongoing
  ended_at_precision: precisionEnum('ended_at_precision').default('unknown'),

  // Context & qualifiers
  properties: jsonb('properties'),                         // Additional typed properties
  notes: text('notes'),                                    // Free-form context

  // Verification & confidence
  confidence: confidenceEnum('confidence').default('unverified'),
  verified_at: timestamp('verified_at'),
  verified_by: uuid('verified_by').references(() => users.id),

  // Provenance
  source_type: sourceTypeEnum('source_type'),              // Where did this data come from?
  source_url: varchar('source_url'),
  source_notes: text('source_notes'),

  // Metadata
  created_at: timestamp('created_at').notNull().defaultNow(),
  created_by: uuid('created_by').references(() => users.id),
  updated_at: timestamp('updated_at').notNull().$onUpdate(() => new Date()),

}, (t) => [
  // Indexes for common queries
  index('statements_subject_idx').on(t.subject_type, t.subject_id),
  index('statements_object_idx').on(t.object_type, t.object_id),
  index('statements_predicate_idx').on(t.predicate),
  index('statements_confidence_idx').on(t.confidence),

  // Prevent exact duplicates
  uniqueIndex('statements_unique_idx').on(
    t.subject_type, t.subject_id, t.predicate, t.object_type, t.object_id, t.started_at
  ),
]);
```

### 3.2 Supporting Enums

```typescript
// Entity types (subjects and objects)
export const entityTypeEnum = pgEnum('entity_type', [
  'person',
  'group',
]);

// Date precision (for historical data with uncertainty)
export const precisionEnum = pgEnum('date_precision', [
  'exact',      // Known to the day
  'month',      // Known to the month
  'year',       // Known to the year
  'decade',     // Known to the decade (e.g., "early 1970s")
  'approximate', // Rough estimate
  'unknown',    // No date information
]);

// Confidence levels for verification
export const confidenceEnum = pgEnum('confidence_level', [
  'verified',      // Community-verified, multiple sources
  'likely',        // Single reliable source
  'unverified',    // Entered but not verified
  'disputed',      // Conflicting information exists
  'uncertain',     // Low confidence, needs investigation
]);

// Source types for provenance tracking
export const sourceTypeEnum = pgEnum('source_type', [
  'official_website',     // Group's official website
  'social_media',         // Instagram, Facebook, etc.
  'interview',            // Direct interview/conversation
  'book',                 // Published book
  'academic_paper',       // Academic research
  'news_article',         // News coverage
  'community_knowledge',  // Oral tradition/community
  'self_reported',        // Person reported about themselves
  'iphan_registry',       // Official IPHAN documentation
  'directory',            // Lalaue, CapoeiraHub, etc.
  'other',
]);

// All predicates in single enum
export const predicateEnum = pgEnum('predicate', [
  // Person-to-Person: Training & Lineage
  'student_of',
  'trained_under',
  'trained_alongside',
  'influenced_by',
  'successor_to',

  // Person-to-Person: Mentorship & Recognition
  'mentored',
  'granted_title_to',
  'blessed_departure',
  'padrinho_of',

  // Person-to-Person: Family
  'biological_parent_of',
  'biological_child_of',
  'sibling_of',
  'spouse_of',

  // Person-to-Person: Professional
  'childhood_friends_with',
  'worked_together_with',

  // Person-to-Group: Founding & Leadership
  'founded',
  'co_founded',
  'leads',
  'successor_leader_of',
  'regional_coordinator_of',

  // Person-to-Group: Membership
  'member_of',
  'individual_member_of',
  'teaches_at',
  'studies_at',
  'cultural_pioneer_of',
  'graduated_from',
  'departed_from',  // Use departure_type property for context

  // Group-to-Group: Hierarchical
  'part_of',  // Use affiliation_type property: branch, nucleus, affiliate, official_filial

  // Group-to-Group: Evolution
  'split_from_group',  // Use split_type property for context
  'merged_into',
  'absorbed',
  'succeeded',
  'evolved_from',

  // Group-to-Group: Affiliation
  'affiliated_with',
  'cooperates_with',
  'shares_lineage_with',
]);
```

### 3.3 Properties JSON Schema

The `properties` JSONB field allows typed additional data per relationship:

```typescript
// Properties schemas by predicate type
interface StatementProperties {
  // For 'teaches_at' / 'studies_at'
  teaches_at?: {
    title: TitleEnum;           // Their rank at this group
    is_primary_location: boolean;
  };

  // For 'leads'
  leads?: {
    role: 'founder' | 'president' | 'co_leader' | 'vice_president' | 'director' | 'coordinator';
    is_primary: boolean;        // Distinguishes primary leader from co-leaders
  };

  // For 'student_of' / 'trained_under'
  student_of?: {
    style_learned: StyleEnum;
    location: string;           // Where training occurred
    rank_achieved: TitleEnum;   // Highest rank under this teacher
  };

  // For 'departed_from' (person-to-group)
  departed_from?: {
    departure_type: 'neutral' | 'blessed' | 'contentious' | 'expelled';
    reason?: string;
  };

  // For 'split_from_group' (group-to-group)
  split_from_group?: {
    split_type: 'neutral' | 'blessed' | 'contentious';
    reason?: string;
    blessed_by?: uuid[];        // IDs of mestres who blessed the split (if blessed)
  };

  // For 'part_of' (group-to-group hierarchical)
  part_of?: {
    affiliation_type: 'branch' | 'nucleus' | 'affiliate' | 'official_filial';
  };

  // For 'regional_coordinator_of'
  coordinator?: {
    region: string;             // "Europe", "Northeast US", etc.
    countries: string[];
  };

  // For 'graduated_from'
  graduated?: {
    graduation_year: number;
    final_rank: TitleEnum;
  };

  // For 'cultural_pioneer_of'
  pioneer?: {
    region_or_country: string;
    year_arrived: number;
    context: string;            // "Invited for cultural project"
  };

  // For title conferrals
  title_grant?: {
    title_granted: TitleEnum;
    ceremony_date: string;
    ceremony_location: string;
  };
}
```

---

## Part 4: Schema Diagram

```
┌──────────────────────────────────────────────────────────────────────┐
│                           ENTITY TABLES                               │
├──────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  ┌─────────────────────┐           ┌─────────────────────┐           │
│  │      users          │           │      groups         │           │
│  ├─────────────────────┤           ├─────────────────────┤           │
│  │ id (PK)             │           │ id (PK)             │           │
│  │ full_name           │           │ name                │           │
│  │ apelido             │           │ name_aliases[]      │           │
│  │ title               │           │ acronym             │           │
│  │ born_at             │           │ founded_at          │           │
│  │ deceased_at         │           │ founding_type       │           │
│  │ primary_style       │           │ style               │           │
│  │ is_historical       │           │ organizational_model│           │
│  │ is_managed          │           │ is_headquarters     │           │
│  │ biography           │           │ iphan_registered    │           │
│  │ ...                 │           │ ...                 │           │
│  └─────────────────────┘           └─────────────────────┘           │
│           │                                  │                        │
│           └──────────────┬───────────────────┘                        │
│                          │                                            │
│                          ▼                                            │
│  ┌───────────────────────────────────────────────────────────────┐   │
│  │                    statements (triples)                        │   │
│  ├───────────────────────────────────────────────────────────────┤   │
│  │ id (PK)                                                        │   │
│  │                                                                │   │
│  │ subject_type   │ 'person' | 'group'                           │   │
│  │ subject_id     │ FK → users.id OR groups.id                   │   │
│  │                                                                │   │
│  │ predicate      │ 'student_of' | 'founded' | 'branch_of' | ... │   │
│  │                                                                │   │
│  │ object_type    │ 'person' | 'group'                           │   │
│  │ object_id      │ FK → users.id OR groups.id                   │   │
│  │                                                                │   │
│  │ started_at     │ When relationship began                      │   │
│  │ ended_at       │ When relationship ended (null = ongoing)     │   │
│  │                                                                │   │
│  │ properties     │ JSONB - typed additional data                │   │
│  │ confidence     │ 'verified' | 'unverified' | 'disputed'       │   │
│  │ source_type    │ Provenance tracking                          │   │
│  │ ...                                                            │   │
│  └───────────────────────────────────────────────────────────────┘   │
│                                                                       │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Part 5: Query Examples

### 5.1 Find Person's Complete Lineage (Teachers)

```sql
-- Recursive CTE to trace lineage upward
WITH RECURSIVE lineage AS (
  -- Base: Start with the person
  SELECT
    s.object_id as teacher_id,
    u.full_name as teacher_name,
    u.apelido as teacher_apelido,
    u.title as teacher_title,
    s.started_at,
    s.ended_at,
    s.properties,
    1 as generation
  FROM statements s
  JOIN users u ON u.id = s.object_id
  WHERE s.subject_type = 'person'
    AND s.subject_id = $personId
    AND s.predicate = 'student_of'
    AND s.object_type = 'person'

  UNION ALL

  -- Recursive: Go up the teacher chain
  SELECT
    s.object_id,
    u.full_name,
    u.apelido,
    u.title,
    s.started_at,
    s.ended_at,
    s.properties,
    l.generation + 1
  FROM lineage l
  JOIN statements s ON s.subject_id = l.teacher_id
  JOIN users u ON u.id = s.object_id
  WHERE s.subject_type = 'person'
    AND s.predicate = 'student_of'
    AND s.object_type = 'person'
)
SELECT * FROM lineage ORDER BY generation;
```

### 5.2 Find All Groups Derived from a Parent Group

```sql
-- All groups that split from Grupo Senzala
WITH RECURSIVE derived_groups AS (
  SELECT
    s.subject_id as group_id,
    g.name as group_name,
    s.predicate,
    s.started_at as split_date,
    1 as generation
  FROM statements s
  JOIN groups g ON g.id = s.subject_id
  WHERE s.object_type = 'group'
    AND s.object_id = $parentGroupId
    AND s.predicate IN ('split_from_group', 'blessed_split_from')

  UNION ALL

  SELECT
    s.subject_id,
    g.name,
    s.predicate,
    s.started_at,
    dg.generation + 1
  FROM derived_groups dg
  JOIN statements s ON s.object_id = dg.group_id
  JOIN groups g ON g.id = s.subject_id
  WHERE s.object_type = 'group'
    AND s.predicate IN ('split_from_group', 'blessed_split_from')
)
SELECT * FROM derived_groups ORDER BY generation, split_date;
```

### 5.3 Find All Mestres in a Group's Network

```sql
SELECT DISTINCT
  u.id,
  u.full_name,
  u.apelido,
  u.title,
  g.name as group_name,
  s.predicate as role,
  s.started_at
FROM statements s
JOIN users u ON u.id = s.subject_id
JOIN groups g ON g.id = s.object_id
WHERE s.subject_type = 'person'
  AND s.object_type = 'group'
  AND s.predicate IN ('teaches_at', 'leads', 'founded')
  AND s.ended_at IS NULL  -- Currently active
  AND u.title IN ('mestre', 'mestra', 'grao_mestre')
  AND g.id IN (
    -- Include HQ and all branches
    SELECT id FROM groups WHERE id = $groupId
    UNION
    SELECT subject_id FROM statements
    WHERE object_id = $groupId
      AND predicate IN ('branch_of', 'nucleus_of', 'affiliate_of')
  )
ORDER BY u.title, u.full_name;
```

### 5.4 Find "Capoeira Siblings" (Trained Alongside)

```sql
SELECT
  u.id,
  u.full_name,
  u.apelido,
  s.started_at,
  s.ended_at
FROM statements s
JOIN users u ON u.id = s.object_id
WHERE s.subject_type = 'person'
  AND s.subject_id = $personId
  AND s.predicate = 'trained_alongside'
  AND s.object_type = 'person'

UNION

SELECT
  u.id,
  u.full_name,
  u.apelido,
  s.started_at,
  s.ended_at
FROM statements s
JOIN users u ON u.id = s.subject_id
WHERE s.object_type = 'person'
  AND s.object_id = $personId
  AND s.predicate = 'trained_alongside'
  AND s.subject_type = 'person';
```

---

## Part 6: Handling Special Cases

### 6.1 Orphaned Nodes (Untraceable Lineage)

When lineage cannot be traced (as in Marinheiro Russia case):

```sql
-- Mark person as having uncertain lineage
INSERT INTO statements (
  subject_type, subject_id, predicate, object_type, object_id,
  confidence, notes
) VALUES (
  'person', $personId, 'individual_member_of', 'group', $groupId,
  'uncertain',
  'Lineage untraceable. School exists but founder''s training history unknown.'
);
```

### 6.2 Style Transitions

When someone transitioned styles (e.g., Regional → Angola):

```sql
-- Record training in original style
INSERT INTO statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, ended_at, properties
) VALUES (
  'person', $personId, 'student_of', 'person', $regionalMestreId,
  '1975-01-01', '1985-01-01',
  '{"student_of": {"style_learned": "regional", "rank_achieved": "professor"}}'
);

-- Record transition to new style
INSERT INTO statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, properties
) VALUES (
  'person', $personId, 'student_of', 'person', $angolaMestreId,
  '1985-01-01',
  '{"student_of": {"style_learned": "angola", "rank_achieved": "mestre"}}'
);
```

### 6.3 Conflicting Information

When sources disagree (e.g., founding dates):

```sql
-- Create statement with disputed confidence
INSERT INTO statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, confidence, source_notes
) VALUES (
  'person', $founderId, 'founded', 'group', $groupId,
  '1991-01-01', 'disputed',
  'Primary sources cite 1991. One 2010 blog post claims 1987. Needs community verification.'
);
```

### 6.4 Pioneer Period Pattern

When group existed informally before formal founding (Candeias case):

```typescript
// On groups table
{
  founded_at: '1977-01-01',      // Formal founding
  founded_at_precision: 'year',
  founding_type: 'pioneer_period',
  // Store pioneer period details in history text or properties
}

// Cultural pioneer statements
INSERT INTO statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, properties
) VALUES (
  'person', $pioneerMestreId, 'cultural_pioneer_of', 'group', $groupId,
  '1968-01-01',  -- Pioneer period start
  '{"pioneer": {"region_or_country": "Goiânia, Brazil", "context": "Teaching before formal group founding"}}'
);
```

---

## Part 7: Comparison with Traditional Normalized Schema

### Advantages of Statement/Triple Pattern

| Aspect | Traditional Schema | Statement Pattern |
|--------|-------------------|-------------------|
| **Flexibility** | Need new table for each relationship type | Single table handles all relationships |
| **Evolution** | Schema changes require migrations | New predicates = just enum values |
| **Provenance** | Must add to every table | Built-in on all relationships |
| **Temporal** | Must add to every table | Built-in on all relationships |
| **Confidence** | Must add to every table | Built-in on all relationships |
| **Queries** | Simple JOINs | More complex recursive queries |
| **Performance** | Faster for known patterns | May need more indexing |
| **Type Safety** | Strong column types | JSONB properties need validation |

### When to Use Each

**Use Direct Attributes When:**
- Data is always present (name, founding date)
- Data is frequently queried/filtered
- Data has clear, fixed schema
- Performance is critical

**Use Statement Table When:**
- Relationship between entities
- Need temporal tracking
- Need confidence/verification
- Need provenance
- Schema may evolve

---

## Part 8: Implementation Recommendations

### 8.1 Phase 1: Schema Creation

1. Add `statements` table with all enums
2. Add new columns to `users` table for direct attributes
3. Add new columns to `groups` table for direct attributes
4. Create indexes for common query patterns

### 8.2 Phase 2: Data Migration

1. Migrate existing `groups.founder` to statements
2. Migrate existing `groups.leader` relationships to statements
3. Backfill `founded_at`, `style`, etc. from existing data

### 8.3 Phase 3: UI/API Development

1. Statement creation/editing API
2. Lineage visualization components
3. Verification workflow
4. Search and filter by relationship type

### 8.4 Performance Considerations

1. **Materialized views** for common lineage queries
2. **Partial indexes** on `predicate` for frequent types
3. **JSONB indexes** on properties fields
4. **Connection pooling** for recursive queries

---

## Appendix A: Case Study Patterns Summary

| Pattern | Case Studies | Key Insight |
|---------|--------------|-------------|
| **Single Founder** | Most groups | Default pattern |
| **Co-Founders (Split)** | Oriaxé, Senzala | May separate later |
| **Co-Founders (Continued)** | CB, ABADÁ | Brothers often stay together |
| **Family Succession** | Axé, Filhos de Bimba | Biological lineage matters |
| **Blessed Departure** | Zimba, CB | Formalized split with approval |
| **Pioneer Period** | Candeias | Informal teaching before formal group |
| **Orphaned Node** | Marinheiro Russia | Untraceable lineage exists |
| **Style Transition** | Multiple | Track style evolution over time |
| **Remote Coordination** | Zimba | Leader abroad, HQ in Brazil |
| **IPHAN Structure** | Zimba | Official parent-child documentation |
| **Nucleus Network** | Ngoma, Angoleiros | Autonomous but connected |
| **Branch Hierarchy** | ABADÁ, CB, Axé | Formal organizational structure |
| **Affiliate Network** | CDO | Trademarked, licensed |

---

## Appendix B: Design Decisions

### Resolved Questions

1. **Predicate Granularity**: ✅ **DECIDED**
   - `student_of` = **current, active** training relationship ("who do you currently train under")
   - `trained_under` = **historical** relationship (past training at a school)
   - These remain separate predicates with clear semantic distinction

2. **Bidirectional Storage**: ✅ **DECIDED**
   - **Derive inverse relationships in queries** (not stored bidirectionally)
   - Keeps data normalized, reduces storage, avoids sync issues
   - Queries use UNION to get both directions when needed

3. **Historical Figures**: ✅ **DECIDED**
   - Historical figures use `users` table with `accountStatus = 'managed_profile'`
   - Follows the claimable-profiles.md specification
   - Even deceased persons have a "managed" user profile

4. **Properties Validation**: ✅ **DECIDED**
   - **Application-level validation only** (TypeScript types via `.$type<T>()`)
   - Matches existing pattern in codebase (`links` json columns)
   - No DB-level CHECK constraints on JSONB

### Open Question

5. **Confidence Default**: What should be the default verification status for new statements?
   - Options:
     - `unverified` - needs community/admin verification
     - `self_reported` - if the person making the statement is the subject
     - `likely` - single reliable source (the creator)
   - **Recommendation**: Default to `unverified`, auto-upgrade to `self_reported` if `created_by` matches `subject_id`
