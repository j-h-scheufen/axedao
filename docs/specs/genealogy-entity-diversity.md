# Genealogy Entity Type Diversity Specification

**Status**: Draft
**Author**: Claude (AI-assisted design)
**Date**: 2026-01-12

## 1. Problem Statement

The genealogy database currently supports only two entity types: **persons** and **groups**. However, research has uncovered diverse organizational forms that don't fit the traditional "group" (academy/escola) model:

| Entity Type | Count in Backlog | Example |
|-------------|------------------|---------|
| Proto-groups | ~15 | Roda de São Félix - "no one gave classes... everyone got together and played" |
| Street rodas | ~20 | Roda da Praça da República - 60+ years continuous |
| Seasonal rodas | ~5 | Roda da Central - 24 hours during Carnival |
| Historical events | Many | Pastinha's trip to Africa, Bimba's demonstration at presidential palace |
| Maltas/gangs | ~5 | Guaiamuns, Nagoas (19th century) |
| Venues | ~3 | Gafieira de Zacarias |

### Current Workarounds

All non-academy entities are stored as `group_profiles` with:
- `legal_structure = 'informal'`
- `is_active = false`
- Type noted in text fields (name, notes)

**Problems:**
- Cannot query "show all rodas" vs "show all academies"
- No way to record roda schedules (weekly, seasonal)
- No heritage status tracking (some rodas are registered cultural heritage)
- Historical events have no home in the schema

## 2. Requirements

### Functional Requirements

1. **Distinguish entity subtypes**: Query rodas, proto-groups, academies separately
2. **Subtype-specific properties**: Rodas have schedules; academies don't
3. **Heritage status**: Track municipal/state/federal cultural heritage designations
4. **Historical events**: Store dated events with participants and outcomes
5. **Event participation**: Link persons/groups to events they participated in
6. **Maintain statement system**: Preserve subject-predicate-object relationships

### Non-Functional Requirements

1. **Minimal schema disruption**: Extend rather than replace existing tables
2. **Backward compatibility**: Existing SQL imports continue working
3. **Gradual migration**: Classify existing groups incrementally
4. **Query performance**: Subtype filtering should be fast

## 3. Solution Design

### 3.1 Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     Statements Table                             │
│      subject (person|group|event) → predicate → object          │
└─────────────────────────────────────────────────────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│ person_profiles │  │ group_profiles  │  │     events      │
│                 │  │ + subtype enum  │  │  (new table)    │
│                 │  │ + metadata JSONB│  │                 │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

### 3.2 Group Subtype Enhancement

#### Enum: `group_subtype`

```typescript
export const groupSubtypes = [
  'formal_academy',    // Registered academies, schools with legal structure
  'proto_group',       // Informal training communities (pre-formalization era)
  'street_roda',       // Regular street rodas (weekly/monthly)
  'seasonal_roda',     // Festival/seasonal rodas (Carnival, saint days)
  'venue',             // Gafieiras, cultural centers, performance spaces
  'malta',             // 19th century maltas/gangs
  'affiliation'        // Umbrella organizations, federations
] as const;
```

#### Subtype Definitions

| Subtype | Description | Example | Distinguishing Features |
|---------|-------------|---------|------------------------|
| `formal_academy` | Registered escola with address, classes, curriculum | CECA, Senzala | has legal_structure, fixed location, scheduled classes |
| `proto_group` | Informal training community, pre-academia era | Roda de Trapiche de Baixo | no classes, organic gatherings, often pre-1940s |
| `street_roda` | Regular public roda with consistent schedule | Roda da Praça da República | weekly/monthly schedule, public location |
| `seasonal_roda` | Rodas tied to festivals or seasons | Roda da Central (Carnival) | specific time of year only |
| `venue` | Physical space for capoeira (not a group) | Gafieira de Zacarias | commercial or cultural space, no "membership" |
| `malta` | Historical gang/faction | Guaiamuns, Nagoas | 19th century, territorial, competitive |
| `affiliation` | Umbrella organization | ABCA, Confederação | coordinates multiple groups, may not have own academy |

#### Schema Changes to `group_profiles`

```sql
-- Add subtype column
ALTER TABLE genealogy.group_profiles
ADD COLUMN subtype genealogy.group_subtype DEFAULT 'formal_academy';

-- Add metadata JSONB for subtype-specific properties
ALTER TABLE genealogy.group_profiles
ADD COLUMN metadata JSONB DEFAULT '{}';

-- Index for fast subtype filtering
CREATE INDEX group_profiles_subtype_idx ON genealogy.group_profiles(subtype);
```

#### Metadata Schema

```typescript
export type GroupMetadata = {
  // For rodas (street_roda, seasonal_roda)
  schedule?: {
    type: 'weekly' | 'monthly' | 'seasonal' | 'annual' | 'irregular';
    days?: string[];        // e.g., ['Sunday']
    times?: string[];       // e.g., ['10:00']
    months?: string[];      // e.g., ['February'] for Carnival
    notes?: BilingualText;  // e.g., "During Carnival only"
  };

  // For venues
  venueType?: 'gafieira' | 'cultural_center' | 'community_hall' | 'public_space' | 'terreiro';

  // Heritage recognition (any subtype)
  heritageStatus?: {
    type: 'municipal' | 'state' | 'federal' | 'unesco';
    designation?: string;   // e.g., "Intangible Cultural Heritage of Rio de Janeiro"
    registrationNumber?: string;
    year?: number;
  };

  // For maltas
  territory?: string;               // e.g., "Downtown Rio"
  rivalFactions?: string[];         // UUIDs of rival maltas

  // Primary location details (any subtype)
  primaryLocation?: {
    address?: string;
    neighborhood?: string;
    landmark?: string;      // e.g., "In front of Mercado Modelo"
  };
};
```

### 3.3 Events Entity

#### Enum: `genealogy_event_type`

```typescript
export const genealogyEventTypes = [
  'ceremony',          // Batizados, title conferrals, formatura
  'demonstration',     // Public demonstrations, exhibitions
  'trip',             // Travel events (Pastinha's Africa trip)
  'competition',       // Championships, Berimbau de Ouro
  'founding',         // Group founding ceremonies
  'commemoration',     // Memorial events, anniversaries
  'recognition'        // Official recognition, heritage designation
] as const;
```

#### Table: `genealogy.events`

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| name | VARCHAR(255) | Event name |
| name_context | VARCHAR(100) | Disambiguation (e.g., "1966" for annual event) |
| event_type | genealogy_event_type | Type of event |
| occurred_at | DATE | When event happened |
| occurred_at_precision | date_precision | How certain is the date |
| ended_at | DATE | For multi-day events |
| ended_at_precision | date_precision | How certain is end date |
| location | VARCHAR(255) | Free-text location |
| location_id | UUID | FK to locations table (optional) |
| description_en | TEXT | What happened (English) |
| description_pt | TEXT | What happened (Portuguese) |
| outcome_en | TEXT | Historical significance (English) |
| outcome_pt | TEXT | Historical significance (Portuguese) |
| confidence | confidence | Verification level |
| source | VARCHAR(500) | Citation |
| public_links | TEXT[] | References |
| notes_en | TEXT | Researcher notes |
| notes_pt | TEXT | Researcher notes |
| created_at | TIMESTAMP | Auto-set |
| updated_at | TIMESTAMP | Auto-update |

#### Extend Entity Type Enum

```sql
ALTER TYPE genealogy.entity_type ADD VALUE 'event';
```

#### New Predicates for Events

```sql
ALTER TYPE genealogy.predicate ADD VALUE 'participated_in';
ALTER TYPE genealogy.predicate ADD VALUE 'organized';
ALTER TYPE genealogy.predicate ADD VALUE 'honored_at';
```

| Predicate | Subject | Object | Description |
|-----------|---------|--------|-------------|
| participated_in | person/group | event | Was present at event |
| organized | person/group | event | Organized/hosted the event |
| honored_at | person | event | Received recognition at event |

### 3.4 Example Entities

#### Proto-Group: Roda de São Félix

```sql
INSERT INTO genealogy.group_profiles (
  name, name_context, subtype, legal_structure, is_active,
  founded_year, founded_year_precision, founded_location,
  description_en, description_pt, metadata
) VALUES (
  'Roda de São Félix', 'Juvêncio', 'proto_group', 'informal', false,
  1935, 'decade', 'São Félix, Bahia, Brazil',
  'Informal dock rodas during Igreja de São Deus Menino and Senhor São Félix festivals. Led by dock worker/blacksmith Juvêncio. "No one gave classes... everyone got together and played."',
  'Rodas informais nas docas durante as festas da Igreja de São Deus Menino e Senhor São Félix. Liderada pelo estivador/ferreiro Juvêncio.',
  '{"schedule": {"type": "seasonal", "notes": {"en": "During church festivals", "pt": "Durante festas da igreja"}}}'
);
```

#### Street Roda: Roda da Praça da República

```sql
INSERT INTO genealogy.group_profiles (
  name, subtype, legal_structure, is_active,
  founded_year, founded_year_precision, founded_location,
  description_en, metadata
) VALUES (
  'Roda da Praça da República', 'street_roda', 'informal', true,
  1953, 'year', 'São Paulo, Brazil',
  'Famous Sunday roda founded by Mestre Ananias. Endured 60+ years. Mestres from all styles passed through.',
  '{"schedule": {"type": "weekly", "days": ["Sunday"]}, "heritageStatus": null}'
);
```

#### Seasonal Roda: Roda da Central

```sql
INSERT INTO genealogy.group_profiles (
  name, subtype, legal_structure, is_active,
  founded_year, founded_year_precision, founded_location,
  dissolved_at, description_en, metadata
) VALUES (
  'Roda da Central', 'seasonal_roda', 'informal', false,
  1950, 'decade', 'Rio de Janeiro, Brazil',
  '1983-01-01',
  'Legendary Carnival street roda. Formed spontaneously between Av. Presidente Vargas samba parade route and Central Station. Ran 24 hours for 4 days during Carnival. Ended when sambódromo was built.',
  '{"schedule": {"type": "seasonal", "months": ["February"], "notes": {"en": "During Carnival only, 24 hours for 4 days"}}}'
);
```

#### Event: Pastinha's Trip to Africa

```sql
INSERT INTO genealogy.events (
  name, event_type, occurred_at, occurred_at_precision,
  location, description_en, outcome_en
) VALUES (
  'Pastinha''s Trip to Africa', 'trip', '1966-04-01', 'month',
  'Dakar, Senegal',
  'Mestre Pastinha led a delegation of capoeiristas to the First World Festival of Black Arts in Dakar, Senegal. The group included João Grande, Gato, Roberto Satanás, and others.',
  'Represented Brazil and capoeira on the international stage. Demonstrated capoeira angola to African audiences. Historic moment connecting capoeira to its African roots.'
);

-- Link participants
INSERT INTO genealogy.statements (subject_type, subject_id, predicate, object_type, object_id)
SELECT 'person', p.id, 'participated_in', 'event',
       (SELECT id FROM genealogy.events WHERE name = 'Pastinha''s Trip to Africa')
FROM genealogy.person_profiles p
WHERE p.apelido IN ('Mestre Pastinha', 'João Grande', 'Gato', 'Roberto Satanás');
```

### 3.5 Query Patterns

#### Find all street rodas in Rio

```typescript
const rioRodas = await db
  .select()
  .from(groupProfiles)
  .where(
    and(
      eq(groupProfiles.subtype, 'street_roda'),
      sql`${groupProfiles.foundedLocation} ILIKE '%Rio%'`
    )
  );
```

#### Find all events a person participated in

```typescript
const personEvents = await db
  .select({ event: genealogyEvents })
  .from(statements)
  .innerJoin(genealogyEvents, eq(statements.objectId, genealogyEvents.id))
  .where(
    and(
      eq(statements.subjectType, 'person'),
      eq(statements.subjectId, personId),
      eq(statements.predicate, 'participated_in')
    )
  );
```

#### Find all participants in an event

```typescript
const eventParticipants = await db
  .select({ person: personProfiles })
  .from(statements)
  .innerJoin(personProfiles, eq(statements.subjectId, personProfiles.id))
  .where(
    and(
      eq(statements.objectType, 'event'),
      eq(statements.objectId, eventId),
      eq(statements.predicate, 'participated_in'),
      eq(statements.subjectType, 'person')
    )
  );
```

#### Find groups with heritage status

```typescript
const heritageGroups = await db
  .select()
  .from(groupProfiles)
  .where(sql`${groupProfiles.metadata}->>'heritageStatus' IS NOT NULL`);
```

#### Find weekly rodas

```typescript
const weeklyRodas = await db
  .select()
  .from(groupProfiles)
  .where(
    and(
      eq(groupProfiles.subtype, 'street_roda'),
      sql`${groupProfiles.metadata}->'schedule'->>'type' = 'weekly'`
    )
  );
```

## 4. Migration Plan

### Phase 1: Add Subtype Column

```sql
-- Add enum
CREATE TYPE genealogy.group_subtype AS ENUM (
  'formal_academy', 'proto_group', 'street_roda',
  'seasonal_roda', 'venue', 'malta', 'affiliation'
);

-- Add columns
ALTER TABLE genealogy.group_profiles
ADD COLUMN subtype genealogy.group_subtype DEFAULT 'formal_academy',
ADD COLUMN metadata JSONB DEFAULT '{}';

-- Create index
CREATE INDEX group_profiles_subtype_idx ON genealogy.group_profiles(subtype);
```

### Phase 2: Auto-Classify Existing Groups

```sql
-- Proto-groups: informal + dissolved + "Roda" in name
UPDATE genealogy.group_profiles
SET subtype = 'proto_group'
WHERE legal_structure = 'informal'
  AND is_active = false
  AND (name ILIKE 'Roda de%' OR name ILIKE 'Roda do%')
  AND founded_year < 1960;

-- Street rodas: informal + "Roda" in name + active or recent
UPDATE genealogy.group_profiles
SET subtype = 'street_roda'
WHERE legal_structure = 'informal'
  AND (name ILIKE 'Roda%' OR name_aliases::text ILIKE '%roda%')
  AND subtype = 'formal_academy';  -- not already classified

-- Review remaining for manual classification
SELECT name, legal_structure, is_active, founded_year, notes_en
FROM genealogy.group_profiles
WHERE subtype = 'formal_academy' AND legal_structure = 'informal';
```

### Phase 3: Create Events Table

```sql
-- Create event type enum
CREATE TYPE genealogy.genealogy_event_type AS ENUM (
  'ceremony', 'demonstration', 'trip', 'competition',
  'founding', 'commemoration', 'recognition'
);

-- Create events table
CREATE TABLE genealogy.events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  name_context VARCHAR(100),
  event_type genealogy.genealogy_event_type NOT NULL,
  occurred_at DATE,
  occurred_at_precision genealogy.date_precision DEFAULT 'unknown',
  ended_at DATE,
  ended_at_precision genealogy.date_precision,
  location VARCHAR(255),
  location_id UUID REFERENCES genealogy.locations(id),
  description_en TEXT,
  description_pt TEXT,
  outcome_en TEXT,
  outcome_pt TEXT,
  confidence genealogy.confidence DEFAULT 'unverified',
  source VARCHAR(500),
  public_links TEXT[] DEFAULT '{}',
  notes_en TEXT,
  notes_pt TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX events_event_type_idx ON genealogy.events(event_type);
CREATE INDEX events_occurred_at_idx ON genealogy.events(occurred_at);
```

### Phase 4: Extend Entity Type and Predicates

```sql
-- Extend entity_type enum
ALTER TYPE genealogy.entity_type ADD VALUE 'event';

-- Add new predicates
ALTER TYPE genealogy.predicate ADD VALUE 'participated_in';
ALTER TYPE genealogy.predicate ADD VALUE 'organized';
ALTER TYPE genealogy.predicate ADD VALUE 'honored_at';
```

## 5. Import Workflow Updates

### Updated `/import-group` Command

Add subtype detection phase:

```markdown
## Phase 1.5: Determine Group Subtype

Based on research, classify the entity:

**Questions to answer:**
1. Is this a formal registered academy with scheduled classes? → `formal_academy`
2. Is this an informal training community pre-dating academia era? → `proto_group`
3. Is this a recurring public roda with regular schedule? → `street_roda`
4. Is this tied to specific festivals/seasons? → `seasonal_roda`
5. Is this primarily a venue/space? → `venue`
6. Is this a 19th century faction/gang? → `malta`
7. Is this an umbrella organization? → `affiliation`

**For rodas, capture schedule:**
- Type: weekly / monthly / seasonal / annual / irregular
- Days: [Sunday, Saturday, etc.]
- Times: [10:00, etc.]
- Months: [February] (for seasonal)

**For heritage recognition:**
- Type: municipal / state / federal / unesco
- Designation: "Intangible Cultural Heritage of..."
- Year registered: YYYY
```

### New `/import-event` Command

```markdown
# Import Historical Event

## Phase 1: Research the Event

Gather information about:
- Event name and type
- Date (with precision level)
- Location
- Participants (persons and groups)
- What happened (description)
- Historical significance (outcome)
- Sources

## Phase 2: Generate SQL

### Event Entity
```sql
INSERT INTO genealogy.events (
  name, event_type, occurred_at, occurred_at_precision,
  location, description_en, description_pt, outcome_en, outcome_pt,
  source, confidence
) VALUES (...);
```

### Participant Statements
```sql
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id
) VALUES
  ('person', '[person-uuid]', 'participated_in', 'event', '[event-uuid]'),
  ...
ON CONFLICT DO NOTHING;
```
```

## 6. UI Considerations

### Graph Visualization Updates

The genealogy graph visualization needs to:

1. **Display event nodes** with distinct styling (different color/shape)
2. **Show event participation edges** as dashed lines
3. **Filter by entity type** (persons only, groups only, include events)
4. **Filter by group subtype** (academies only, rodas only, etc.)

### Search/Filter UI

Add filters for:
- Group subtype dropdown
- Event type dropdown
- Heritage status checkbox
- Active/inactive toggle

## 7. Alternatives Considered

### Alternative A: Separate Tables Per Entity Type

**Approach**: Create `rodas`, `events`, `venues` as separate tables.

**Pros**:
- Type-specific schemas with no nullable fields
- Clean separation of concerns

**Cons**:
- Major schema expansion
- Must extend `entity_type` enum for each new type
- Statement queries become more complex
- Significant code changes required

**Decision**: Rejected; too disruptive.

### Alternative B: Single Entity Table

**Approach**: Replace person_profiles + group_profiles with single `entities` table.

**Pros**:
- Maximum flexibility
- Easy to add new types

**Cons**:
- Loses schema enforcement
- All queries need type checking
- Major rewrite required

**Decision**: Rejected; loses too much type safety.

### Alternative C: Events as Enhanced Statements

**Approach**: Model events as statements with multiple participants in JSONB.

**Pros**: No new tables needed.

**Cons**:
- Events with 10 participants need 10 statements
- Hard to query "what events happened in 1966"
- Semantic mismatch

**Decision**: Rejected; events are entities, not relationships.

## 8. Resolved Design Decisions

1. **Event granularity**: **Comprehensive** - Any event worth documenting in research reports will be captured, including annual batizados and commemorations.

2. **Heritage status**: **Keep in metadata JSONB** with standardized structure for queryability. The `heritageStatus` object must follow the defined schema to enable JSON path queries.

3. **Migration approach**: **Manual review of ALL informal groups** for accurate classification into subtypes.

4. **Geocoding scope**: **Cities + key neighborhoods (~100 locations)** for better historical research precision.

## 9. Remaining Open Questions

1. **Roda membership**: Should `member_of` predicate work for rodas, or need new predicate like `participates_in_roda`?

2. **Malta relationships**: Do we need `rival_of` predicate for malta factions?

3. **Graph visualization priority**: How important is showing events in the graph vs just search/list?
