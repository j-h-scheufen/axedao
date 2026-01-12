# Genealogy Temporal & Geographic Search Specification

**Status**: Draft
**Author**: Claude (AI-assisted design)
**Date**: 2026-01-12

## 1. Problem Statement

The genealogy research captured in person reports and group profiles contains rich temporal and geographic information, but it's stored as free text and not queryable. Researchers cannot ask questions like:

- "Show me all mestres active in Rio in the 60s and 70s"
- "Who were the main Angola-style mestres in Salvador around the time of Pastinha"
- "Which groups and events existed in Sao Paulo at the beginning of the 1980s"

### Current Data Patterns

From analysis of 350+ person reports:

| Pattern | Example | Frequency |
|---------|---------|-----------|
| Exact birth date | "May 8, 1924" | Rare |
| Year only | "1924" | Common |
| Decade estimate | "~1940 (decade estimate)" | Common |
| Approximate | "around 1910" | Common |
| Event-anchored | "before Bimba left for Goiânia in November 1972" | Occasional |
| City + Country | "Salvador, Bahia, Brazil" | Standard |
| Neighborhood | "Pelourinho, Salvador" | Common |
| Landmarks | "Largo da Lapa" | Occasional |
| Migration | "Born Santo Amaro → moved to Salvador" | Common |

## 2. Requirements

### Functional Requirements

1. **Location Search**: Query by city, state, country, or neighborhood
2. **Fuzzy Matching**: Handle spelling variations (São Paulo vs Sao Paulo vs SP)
3. **Hierarchy Search**: Search "Rio" should find entities in Niterói, Duque de Caxias
4. **Proximity Search**: Optional "near X location" queries for geocoded locations
5. **Temporal Search**: Query by year, decade, or date range
6. **Combined Search**: "mestres in Salvador in the 1940s"
7. **Activity Types**: Distinguish born/died/taught/trained/lived/performed

### Non-Functional Requirements

1. **Practical for Research**: Import workflow shouldn't require geocoding expertise
2. **Incremental Enhancement**: Existing data can be migrated gradually
3. **Graceful Degradation**: Missing location/time data shouldn't break queries
4. **Performance**: Location registry should support fast lookups and fuzzy search

## 3. Solution Design

### 3.1 Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        Query Layer                               │
│  "mestres in Rio 1960s" → location lookup + time range + title  │
│  Uses unaccent() + LOWER() for accent-insensitive matching      │
└─────────────────────────────────────────────────────────────────┘
                              │
         ┌────────────────────┴────────────────────┐
         │                                         │
         ▼                                         ▼
┌─────────────────────────┐           ┌─────────────────────────┐
│   Primary Path          │           │   Fallback Path         │
│   person → statement →  │           │   person →              │
│   group → location      │           │   person_locations →    │
│   (uses existing        │           │   location              │
│   relationship data)    │           │   (when no relationship │
│                         │           │   data exists)          │
└─────────────────────────┘           └─────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                     Location Registry                            │
│  Canonical locations with hierarchy + optional coordinates      │
│  name_normalized: lowercase + unaccented for search             │
└─────────────────────────────────────────────────────────────────┘
```

**Design Principle**: Person location queries primarily go through existing relationships (statements) to groups. Groups have locations. The `person_locations` table is a fallback for when we know someone was in a location but don't have relationship data to express it.

**Note on Spelling Variations**: Accent/case variations (São Paulo vs Sao Paulo vs SAO PAULO) are handled automatically via `unaccent()` + `LOWER()` on both search input and `name_normalized` column - the same pattern already used for person name searches. No separate aliases table needed.

### 3.2 Database Schema

#### Enum: `location_level`

```typescript
export const locationLevels = [
  'country',      // Brazil, Portugal
  'state',        // Bahia, Rio de Janeiro
  'city',         // Salvador, São Paulo
  'neighborhood', // Pelourinho, Liberdade, Lapa
  'venue'         // Mercado Modelo, CECA
] as const;
```


#### Table: `genealogy.locations`

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| parent_id | UUID | FK to parent location (city → state → country) |
| level | location_level | Hierarchy level |
| name | VARCHAR(255) | Display name ("Salvador") |
| name_normalized | VARCHAR(255) | Lowercase, unaccented for search ("salvador") |
| country_code | CHAR(2) | ISO 3166-1 alpha-2 ("BR") |
| coordinates | GEOMETRY(POINT, 4326) | Optional PostGIS point |
| coordinates_source | VARCHAR(100) | "osm", "google", "manual" |
| created_at | TIMESTAMP | Auto-set |
| updated_at | TIMESTAMP | Auto-update |

**Indexes:**
- `UNIQUE(parent_id, name_normalized)` - No duplicate children
- `GIST(coordinates)` - Spatial queries
- `GIN(name_normalized gin_trgm_ops)` - Fuzzy text search

#### Table: `genealogy.person_locations` (fallback for presence without relationships)

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| person_id | UUID | FK to person_profiles |
| location_id | UUID | FK to locations |
| started_at | DATE | When presence began |
| started_at_precision | date_precision | How certain is start date |
| ended_at | DATE | When presence ended (NULL if ongoing) |
| ended_at_precision | date_precision | How certain is end date |
| context | VARCHAR(255) | Free text: "lived", "taught", "traveled", etc. |
| confidence | confidence | Verification level |
| source | VARCHAR(500) | Citation |
| notes_en | TEXT | Researcher notes (English) |
| notes_pt | TEXT | Researcher notes (Portuguese) |
| created_at | TIMESTAMP | Auto-set |

**Purpose**: This table is a **fallback** for when we know someone was in a location during a time period, but we don't have relationship data (statements to groups) to express it. The primary path for location queries is through group relationships.

**Indexes:**
- `(person_id)` - Find all locations for a person
- `(location_id)` - Find all persons at a location
- `(started_at, ended_at)` - Time range queries

#### Modifications to Existing Tables

**person_profiles additions:**
```sql
birth_location_id UUID REFERENCES genealogy.locations(id)
death_location_id UUID REFERENCES genealogy.locations(id)
```

**group_profiles additions:**
```sql
location_id UUID REFERENCES genealogy.locations(id)  -- primary/current location
```

### 3.3 Location Registry Bootstrap

Initial seed data for canonical Brazilian locations:

```sql
-- Country
INSERT INTO genealogy.locations (level, name, name_normalized, country_code)
VALUES ('country', 'Brazil', 'brazil', 'BR');

-- States (key for capoeira history)
INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
SELECT 'state', name, normalize_text(name),
       (SELECT id FROM genealogy.locations WHERE name = 'Brazil'), 'BR'
FROM (VALUES
  ('Bahia'), ('Rio de Janeiro'), ('São Paulo'), ('Goiás'),
  ('Minas Gerais'), ('Pernambuco'), ('Distrito Federal')
) AS states(name);

-- Major cities
-- Salvador and its neighborhoods
INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
VALUES ('city', 'Salvador', 'salvador',
        (SELECT id FROM genealogy.locations WHERE name = 'Bahia'), 'BR');

INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
SELECT 'neighborhood', name, normalize_text(name),
       (SELECT id FROM genealogy.locations WHERE name = 'Salvador' AND level = 'city'), 'BR'
FROM (VALUES
  ('Pelourinho'), ('Liberdade'), ('Baixa do Sapateiro'), ('Terreiro de Jesus'),
  ('Itapuã'), ('Barra'), ('Chame-Chame'), ('Garcia'), ('Brotas'),
  ('Cidade Baixa'), ('Santo Antônio Além do Carmo')
) AS neighborhoods(name);

-- Rio de Janeiro and neighborhoods
INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
VALUES ('city', 'Rio de Janeiro', 'rio de janeiro',
        (SELECT id FROM genealogy.locations WHERE name = 'Rio de Janeiro' AND level = 'state'), 'BR');

INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
SELECT 'neighborhood', name, normalize_text(name),
       (SELECT id FROM genealogy.locations WHERE name = 'Rio de Janeiro' AND level = 'city'), 'BR'
FROM (VALUES
  ('Lapa'), ('Centro'), ('Bonsucesso'), ('Copacabana'), ('Ipanema'),
  ('Tijuca'), ('Jacarezinho'), ('Madureira'), ('Pavão-Pavãozinho')
) AS neighborhoods(name);

-- Other important cities in Rio state
INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
SELECT 'city', name, normalize_text(name),
       (SELECT id FROM genealogy.locations WHERE name = 'Rio de Janeiro' AND level = 'state'), 'BR'
FROM (VALUES
  ('Niterói'), ('Duque de Caxias'), ('São Gonçalo'), ('Nova Iguaçu')
) AS cities(name);

-- São Paulo
INSERT INTO genealogy.locations (level, name, name_normalized, parent_id, country_code)
VALUES ('city', 'São Paulo', 'sao paulo',
        (SELECT id FROM genealogy.locations WHERE name = 'São Paulo' AND level = 'state'), 'BR');
```

### 3.4 Query Patterns

#### Query 1: Mestres active in Rio in 60s-70s

```typescript
async function findMestresActiveInRioIn60s70s() {
  return db.execute(sql`
    WITH rio_locations AS (
      -- Get Rio de Janeiro city and all nested locations (neighborhoods)
      SELECT id FROM genealogy.locations
      WHERE name_normalized = 'rio de janeiro' AND level = 'city'
      UNION ALL
      SELECT l.id FROM genealogy.locations l
      WHERE l.parent_id = (SELECT id FROM genealogy.locations
                           WHERE name_normalized = 'rio de janeiro' AND level = 'city')
    )
    -- Primary path: through group relationships
    SELECT DISTINCT p.*
    FROM genealogy.person_profiles p
    JOIN genealogy.statements s ON s.subject_type = 'person' AND s.subject_id = p.id
    JOIN genealogy.group_profiles g ON s.object_type = 'group' AND s.object_id = g.id
    WHERE g.location_id IN (SELECT id FROM rio_locations)
      AND p.title IN ('mestre', 'mestra')
      AND s.predicate IN ('teaches_at', 'leads', 'member_of', 'founded', 'co_founded')
      AND (s.started_at IS NULL OR s.started_at < '1980-01-01')
      AND (s.ended_at IS NULL OR s.ended_at > '1960-01-01')

    UNION

    -- Fallback path: direct person-location records
    SELECT DISTINCT p.*
    FROM genealogy.person_profiles p
    JOIN genealogy.person_locations pl ON pl.person_id = p.id
    WHERE pl.location_id IN (SELECT id FROM rio_locations)
      AND p.title IN ('mestre', 'mestra')
      AND (pl.started_at IS NULL OR pl.started_at < '1980-01-01')
      AND (pl.ended_at IS NULL OR pl.ended_at > '1960-01-01')

    ORDER BY apelido;
  `);
}
```

#### Query 2: Angola mestres in Salvador during Pastinha's era

```typescript
async function findAngolaMestresInSalvadorDuringPastinha() {
  // Pastinha was active in Salvador 1941-1981
  return db.execute(sql`
    WITH salvador_locations AS (
      SELECT id FROM genealogy.locations
      WHERE (name_normalized = 'salvador' AND level = 'city')
         OR parent_id = (SELECT id FROM genealogy.locations
                         WHERE name_normalized = 'salvador' AND level = 'city')
    )
    -- Primary path: through group relationships
    SELECT DISTINCT p.*
    FROM genealogy.person_profiles p
    JOIN genealogy.statements s ON s.subject_type = 'person' AND s.subject_id = p.id
    JOIN genealogy.group_profiles g ON s.object_type = 'group' AND s.object_id = g.id
    WHERE g.location_id IN (SELECT id FROM salvador_locations)
      AND p.style = 'angola'
      AND p.title IN ('mestre', 'mestra')
      AND (s.started_at IS NULL OR EXTRACT(YEAR FROM s.started_at) <= 1981)
      AND (s.ended_at IS NULL OR EXTRACT(YEAR FROM s.ended_at) >= 1941)

    UNION

    -- Fallback path: direct person-location records
    SELECT DISTINCT p.*
    FROM genealogy.person_profiles p
    JOIN genealogy.person_locations pl ON pl.person_id = p.id
    WHERE pl.location_id IN (SELECT id FROM salvador_locations)
      AND p.style = 'angola'
      AND p.title IN ('mestre', 'mestra')
      AND (pl.started_at IS NULL OR EXTRACT(YEAR FROM pl.started_at) <= 1981)
      AND (pl.ended_at IS NULL OR EXTRACT(YEAR FROM pl.ended_at) >= 1941)

    ORDER BY apelido;
  `);
}
```

#### Query 3: Location text search (accent-insensitive)

```typescript
async function findLocationByText(searchText: string): Promise<Location[]> {
  // Use same unaccent + lower pattern as person name search
  return db.execute(sql`
    SELECT l.* FROM genealogy.locations l
    WHERE l.name_normalized ILIKE ${`%${searchText}%`}
    ORDER BY
      CASE WHEN l.name_normalized = LOWER(unaccent(${searchText})) THEN 0 ELSE 1 END,
      l.level,
      l.name
    LIMIT 20;
  `);
}
```

Note: Since `name_normalized` is already stored as `LOWER(unaccent(name))`, searching with the same transformation on input handles all accent/case variations automatically.

#### Query 4: Proximity search (optional PostGIS)

```typescript
async function findGroupsNearLocation(
  locationId: string,
  radiusKm: number
): Promise<{ group: GroupProfile; distanceKm: number }[]> {
  return db.execute(sql`
    WITH target_location AS (
      SELECT coordinates FROM genealogy.locations WHERE id = ${locationId}
    )
    SELECT
      g.*,
      ST_Distance(l.coordinates::geography, t.coordinates::geography) / 1000 as distance_km
    FROM genealogy.group_profiles g
    JOIN genealogy.locations l ON l.id = g.location_id
    CROSS JOIN target_location t
    WHERE l.coordinates IS NOT NULL
      AND t.coordinates IS NOT NULL
      AND ST_DWithin(l.coordinates::geography, t.coordinates::geography, ${radiusKm * 1000})
    ORDER BY distance_km;
  `);
}
```

## 4. Migration Plan

### Phase 0: Normalize Statement Properties (Prerequisite)

Before adding new schema, normalize existing JSONB `properties` data in statements table.

**Issues to fix:**

1. **`association_context`** - Convert plain strings to bilingual format:
```sql
-- Find non-standard association_context (plain strings)
SELECT id, properties->>'association_context' as ctx
FROM genealogy.statements
WHERE properties->>'association_context' IS NOT NULL
  AND properties->'association_context'->>'en' IS NULL;

-- Migration: Convert string to bilingual object
UPDATE genealogy.statements
SET properties = jsonb_set(
  properties,
  '{association_context}',
  jsonb_build_object('en', properties->>'association_context', 'pt', properties->>'association_context')
)
WHERE properties->>'association_context' IS NOT NULL
  AND properties->'association_context'->>'en' IS NULL;
```

2. **`relationship_type`** - Fix values to match schema enum:
```sql
-- "brother" → "sibling"
UPDATE genealogy.statements
SET properties = jsonb_set(properties, '{relationship_type}', '"sibling"')
WHERE properties->>'relationship_type' = 'brother';

-- "son" → "parent" (note: direction may need review)
UPDATE genealogy.statements
SET properties = jsonb_set(properties, '{relationship_type}', '"parent"')
WHERE properties->>'relationship_type' = 'son';
```

3. **Validation query** - Ensure all properties match schema:
```sql
-- Find any non-standard keys
SELECT DISTINCT jsonb_object_keys(properties) as key
FROM genealogy.statements
WHERE properties != '{}'::jsonb;
```

### Phase 1: Schema Creation

1. Create enum: `location_level`
2. Create tables: `locations`, `person_locations`
3. Add FK columns to `person_profiles` (birth_location_id, death_location_id) and `group_profiles` (location_id)
4. Create all indexes (including trigram index for fuzzy search)

### Phase 2: Data Bootstrap

1. Run seed script for ~100 canonical locations (states, cities, key neighborhoods)
2. Store `name_normalized` as `LOWER(unaccent(name))` for accent-insensitive search
3. Optionally add coordinates for major cities

### Phase 3: Data Migration

```typescript
async function migratePersonBirthLocations() {
  const persons = await db.select().from(personProfiles).where(isNotNull(personProfiles.birthPlace));

  for (const person of persons) {
    const locationId = await matchLocation(person.birthPlace);

    if (locationId) {
      // Update person's birth_location_id FK
      await db.update(personProfiles)
        .set({ birthLocationId: locationId })
        .where(eq(personProfiles.id, person.id));
    }
  }
}

async function migrateGroupLocations() {
  const groups = await db.select().from(groupProfiles).where(isNotNull(groupProfiles.foundedLocation));

  for (const group of groups) {
    const locationId = await matchLocation(group.foundedLocation);

    if (locationId) {
      // Update group's location_id FK
      await db.update(groupProfiles)
        .set({ locationId: locationId })
        .where(eq(groupProfiles.id, group.id));
    }
  }
}
```

### Phase 4: Import Workflow Enhancement

Update `/import-person` command to include:

```markdown
## Phase 8: Location Normalization

For each location mentioned (birth_place, death_place):

1. Check if canonical location exists in registry
2. If found: Include location_id in SQL output
3. If not found: Add to `docs/genealogy/import-backlog/locations-backlog.md`

For person-location records (when person was in a location but no group relationship exists):
1. Identify locations mentioned in bio without corresponding group relationships
2. Generate person_locations INSERT statements if warranted
```

Update `/import-group` command to include location_id linking.

## 5. Cost Analysis

### Storage Costs

- locations table: ~100 rows initially, ~500 with all neighborhoods
- person_locations: minimal - only used as fallback when no group relationship exists
- **Total: <3MB additional storage**

### Query Performance

- Location search: O(log n) with indexes, <10ms
- Activity period joins: O(n) but n is small per entity
- Spatial queries: O(log n) with GIST index
- **Expected query time: <100ms for complex queries**

### Migration Effort

- Schema creation: 1-2 hours
- Seed data: 2-3 hours
- Migration scripts: 4-6 hours
- Import workflow updates: 4-6 hours
- **Total: ~2 days of implementation**

## 6. Alternatives Considered

### Alternative A: Full Geocoding

**Approach**: Geocode every location to coordinates, use only spatial queries.

**Pros**: Best search quality, "near X" always works.

**Cons**:
- Impractical for research workflow (every import needs geocoding)
- Historical locations may not geocode well
- Neighborhoods inconsistent across geocoding services

**Decision**: Rejected for primary approach; optional enhancement.

### Alternative B: Free-Text Search Only

**Approach**: Use full-text search on existing location strings.

**Pros**: No migration needed.

**Cons**:
- No hierarchy (searching "Rio" won't find "Niterói")
- Spelling variations cause missed results
- No temporal queries

**Decision**: Rejected; insufficient for research needs.

### Alternative C: AI-Powered Entity Extraction

**Approach**: Use LLM to extract structured location/time data from bios.

**Pros**: Could automate activity period extraction.

**Cons**:
- Inconsistent results
- Requires review
- Expensive at scale

**Decision**: Possible future enhancement for semi-automated extraction.

## 7. Resolved Design Decisions

1. **Coordinates scope**: **Cities + key neighborhoods (~100 locations)** for better historical research precision. This includes major cities plus historically significant neighborhoods like Pelourinho, Liberdade, Lapa, etc.

## 8. Remaining Open Questions

1. **Historical locations**: How to handle locations that no longer exist or changed names?
2. **Non-Brazilian locations**: What level of detail for Portugal, USA, Europe?
3. **Activity extraction**: Manual vs semi-automated extraction from existing bios?
