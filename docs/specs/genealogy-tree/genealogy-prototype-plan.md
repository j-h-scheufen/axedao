# Genealogy Visualization Prototype Plan

**Status:** Phase 4 Complete, Phase 5 Pending
**Created:** 2025-12-05
**Updated:** 2025-12-07
**Related:**
- [Genealogy Architecture Proposal](./genealogy-architecture-proposal.md) - **Primary reference for schema**
- [Genealogy Data Model Proposal](./genealogy-data-model-proposal.md) - Predicates and relationships
- [3D Network Visualization Spec](../../apps/quilombo/docs/specs/capoeira-network-visualization.md)

---

## Objective

Build a minimal prototype to demonstrate the genealogy data model with 3D visualization using `react-force-graph-3d`. This prototype will:
1. Validate the data model predicates work for real-world scenarios
2. Demonstrate the visual representation of lineage relationships
3. Provide a foundation for the full network visualization feature
4. **Operate entirely within the `genealogy` schema** (self-contained)

---

## Alignment with Architecture Proposal

This prototype implements **Phase 1** of the migration sequence:
1. ✅ Add genealogy schema and tables (no breaking changes)
2. ✅ Build visualization prototype using genealogy schema
3. ⏳ (Later) Update DB queries to join across schemas
4. ⏳ (Later) Migrate data from old columns to new tables
5. ⏳ (Later) Drop old columns from `users` and `groups`

**Key principle:** The prototype uses only the `genealogy` schema. The genealogy schema is **fully self-contained** with NO foreign keys pointing to the public schema. The FKs flow the other direction: `users.profile_id` → `person_profiles.id` and `groups.profile_id` → `group_profiles.id`. For the prototype, we don't need those FKs at all.

---

## Scope

### In Scope
- Create `genealogy` schema with `person_profiles`, `group_profiles`, and `statements` tables
- Select 3-5 groups with well-documented lineages from case studies
- Manually populate seed data in the genealogy schema
- Basic 3D force-directed graph visualization
- Person and Group nodes with basic styling
- Core relationship types (student_of, founded, member_of, teaches_at, split_from_group)
- Node click → details panel
- Basic filtering by node/link type

### Out of Scope (for prototype)
- Integration with existing `public.users` and `public.groups` tables
- Data migration from existing tables
- Event nodes
- Geographic layout mode
- Timeline controls
- Path finding
- Authentication/authorization for data entry
- Full CRUD operations
- Performance optimization for large networks

---

## Phase 1: Database Schema

### 1.1 Create Genealogy Schema

The schema follows the [Architecture Proposal](./genealogy-architecture-proposal.md). Key points:
- Separate `genealogy` schema for all genealogy data
- **Fully self-contained**: NO foreign keys pointing to public schema
- Statements reference `person_profiles.id` and `group_profiles.id` only
- FKs flow FROM public TO genealogy (not used in prototype)

**Migration file:** `atlas/migrations/YYYYMMDD_HHMMSS_create_genealogy_schema.sql`

```sql
-- Create the genealogy schema
CREATE SCHEMA IF NOT EXISTS genealogy;

-- Enums
CREATE TYPE genealogy.entity_type AS ENUM ('person', 'group');

CREATE TYPE genealogy.confidence AS ENUM (
  'verified',
  'likely',
  'unverified',
  'disputed',
  'uncertain'
);

CREATE TYPE genealogy.predicate AS ENUM (
  -- Person-to-Person (6)
  'student_of', 'trained_under', 'influenced_by',
  'received_title_from', 'baptized_by', 'family_of',
  -- Person-to-Group (9)
  'founded', 'co_founded', 'leads', 'regional_coordinator_of',
  'member_of', 'teaches_at', 'cultural_pioneer_of',
  'associated_with', 'departed_from',
  -- Group-to-Group (6)
  'part_of', 'split_from_group', 'merged_into',
  'evolved_from', 'affiliated_with', 'cooperates_with'
);

-- Person profiles table (NO FK to public schema - fully self-contained)
CREATE TABLE genealogy.person_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Identity (will be moved from users in production)
  name VARCHAR(255),
  apelido VARCHAR(100),
  title public.title,  -- reuse existing enum
  avatar VARCHAR(500),
  links JSONB DEFAULT '[]',

  -- Capoeira-specific
  style public.style,  -- reuse existing enum
  birth_year INTEGER,
  death_year INTEGER,
  bio TEXT,

  -- Timestamps
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Constraints
  CONSTRAINT person_profiles_birth_before_death CHECK (
    death_year IS NULL OR birth_year IS NULL OR birth_year <= death_year
  )
);

-- Group profiles table (NO FK to public schema - fully self-contained)
-- NOTE: For prototype, we store group name here. In production, name stays in public.groups
-- and group_profiles contains only capoeira identity fields.
CREATE TABLE genealogy.group_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- For prototype: store name here for standalone visualization
  -- In production: name stays in public.groups, queried via join
  name VARCHAR(255) NOT NULL,  -- prototype only

  -- Capoeira identity (will be moved from groups in production)
  description TEXT,
  style public.style,
  logo VARCHAR(500),
  links JSONB DEFAULT '[]',

  -- Genealogy-specific
  founded_year INTEGER,
  name_history JSONB DEFAULT '[]',

  -- Timestamps
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Statements table (relationships) - NO FK to public schema
CREATE TABLE genealogy.statements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Subject: references person_profiles.id OR group_profiles.id
  subject_type genealogy.entity_type NOT NULL,
  subject_id UUID NOT NULL,

  -- Predicate
  predicate genealogy.predicate NOT NULL,

  -- Object: references person_profiles.id OR group_profiles.id
  object_type genealogy.entity_type NOT NULL,
  object_id UUID NOT NULL,

  -- Timeline
  started_at DATE,
  ended_at DATE,

  -- Properties (predicate-specific JSONB)
  properties JSONB DEFAULT '{}',

  -- Verification
  confidence genealogy.confidence DEFAULT 'unverified',
  source VARCHAR(500),
  notes TEXT,

  -- Timestamps
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  created_by UUID,  -- tracks who created (app user id, no FK constraint)

  -- Constraints
  CONSTRAINT statements_different_entities CHECK (
    NOT (subject_type = object_type AND subject_id = object_id)
  ),
  CONSTRAINT statements_timeline_valid CHECK (
    started_at IS NULL OR ended_at IS NULL OR started_at <= ended_at
  )
);

-- Indexes
CREATE INDEX person_profiles_apelido_idx ON genealogy.person_profiles(apelido);
CREATE INDEX person_profiles_title_idx ON genealogy.person_profiles(title);
CREATE INDEX person_profiles_style_idx ON genealogy.person_profiles(style);

CREATE INDEX group_profiles_name_idx ON genealogy.group_profiles(name);
CREATE INDEX group_profiles_style_idx ON genealogy.group_profiles(style);

CREATE INDEX statements_subject_idx ON genealogy.statements(subject_type, subject_id);
CREATE INDEX statements_object_idx ON genealogy.statements(object_type, object_id);
CREATE INDEX statements_predicate_idx ON genealogy.statements(predicate);
CREATE INDEX statements_subject_predicate_idx ON genealogy.statements(subject_type, subject_id, predicate);

-- Triggers for updated_at
CREATE TRIGGER person_profiles_updated_at BEFORE UPDATE ON genealogy.person_profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER group_profiles_updated_at BEFORE UPDATE ON genealogy.group_profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER statements_updated_at BEFORE UPDATE ON genealogy.statements
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
```

### 1.2 Drizzle Schema

**File:** `apps/quilombo/db/schema/genealogy.ts`

```typescript
import {
  pgSchema,
  uuid,
  varchar,
  text,
  integer,
  timestamp,
  date,
  jsonb,
  index,
} from 'drizzle-orm/pg-core';
import { titleEnum, styleEnum, type SocialLink } from '../schema';

// Create the genealogy schema
export const genealogySchema = pgSchema('genealogy');

// Enums within genealogy schema
export const entityTypeEnum = genealogySchema.enum('entity_type', ['person', 'group']);

export const confidenceEnum = genealogySchema.enum('confidence', [
  'verified', 'likely', 'unverified', 'disputed', 'uncertain',
]);

export const predicateEnum = genealogySchema.enum('predicate', [
  // Person-to-Person (6)
  'student_of', 'trained_under', 'influenced_by',
  'received_title_from', 'baptized_by', 'family_of',
  // Person-to-Group (9)
  'founded', 'co_founded', 'leads', 'regional_coordinator_of',
  'member_of', 'teaches_at', 'cultural_pioneer_of',
  'associated_with', 'departed_from',
  // Group-to-Group (6)
  'part_of', 'split_from_group', 'merged_into',
  'evolved_from', 'affiliated_with', 'cooperates_with',
]);

// Person profiles table (NO FK to public schema - fully self-contained)
export const personProfiles = genealogySchema.table(
  'person_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Identity (moved from users)
    name: varchar('name', { length: 255 }),
    apelido: varchar('apelido', { length: 100 }),
    title: titleEnum('title'),
    avatar: varchar('avatar', { length: 500 }),
    links: jsonb('links').$type<SocialLink[]>().default([]),

    // Capoeira-specific
    style: styleEnum('style'),
    birthYear: integer('birth_year'),
    deathYear: integer('death_year'),
    bio: text('bio'),

    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
  },
  (t) => [
    index('person_profiles_apelido_idx').on(t.apelido),
    index('person_profiles_title_idx').on(t.title),
    index('person_profiles_style_idx').on(t.style),
  ]
);

// Group profiles table (NO FK to public schema - fully self-contained)
// NOTE: For prototype, we store name here. In production, name stays in public.groups.
export const groupProfiles = genealogySchema.table(
  'group_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // For prototype: store name here for standalone visualization
    name: varchar('name', { length: 255 }).notNull(),  // prototype only

    // Capoeira identity (moved from groups)
    description: text('description'),
    style: styleEnum('style'),
    logo: varchar('logo', { length: 500 }),
    links: jsonb('links').$type<SocialLink[]>().default([]),

    // Genealogy-specific
    foundedYear: integer('founded_year'),
    nameHistory: jsonb('name_history').$type<{
      name: string;
      startedAt: string;
      endedAt?: string;
      changeReason?: string;
      context?: string;
    }[]>().default([]),

    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
  },
  (t) => [
    index('group_profiles_name_idx').on(t.name),
    index('group_profiles_style_idx').on(t.style),
  ]
);

// Statement properties type
export type StatementProperties = {
  relationship_type?: 'parent' | 'sibling' | 'spouse' | 'padrinho' | 'other';
  other_type?: string;
  title_grant?: { title: string; ceremony?: string; location?: string };
  baptism?: { apelido_given: string; ceremony?: string; location?: string };
  departure_type?: 'neutral' | 'blessed' | 'contentious' | 'expelled';
  split_type?: 'neutral' | 'blessed' | 'contentious';
  blessed_by?: string[];
  affiliation_type?: 'branch' | 'nucleus' | 'affiliate' | 'official_filial';
  association_type?: 'supporter' | 'patron' | 'informal_affiliate' | 'friend' | 'honorary';
  region?: string;
  country?: string;
  context?: string;
};

// Statements table (NO FK to public schema - fully self-contained)
export const statements = genealogySchema.table(
  'statements',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    subjectType: entityTypeEnum('subject_type').notNull(),
    subjectId: uuid('subject_id').notNull(),

    predicate: predicateEnum('predicate').notNull(),

    objectType: entityTypeEnum('object_type').notNull(),
    objectId: uuid('object_id').notNull(),

    startedAt: date('started_at'),
    endedAt: date('ended_at'),

    properties: jsonb('properties').$type<StatementProperties>().default({}),

    confidence: confidenceEnum('confidence').default('unverified'),
    source: varchar('source', { length: 500 }),
    notes: text('notes'),

    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
    createdBy: uuid('created_by'),  // tracks who created (app user id, no FK constraint)
  },
  (t) => [
    index('statements_subject_idx').on(t.subjectType, t.subjectId),
    index('statements_object_idx').on(t.objectType, t.objectId),
    index('statements_predicate_idx').on(t.predicate),
    index('statements_subject_predicate_idx').on(t.subjectType, t.subjectId, t.predicate),
  ]
);

// NOTE: No relations defined here - genealogy schema is fully self-contained
// Relations are defined in public schema where FKs point TO genealogy

// Types
export type InsertPersonProfile = typeof personProfiles.$inferInsert;
export type SelectPersonProfile = typeof personProfiles.$inferSelect;

export type InsertGroupProfile = typeof groupProfiles.$inferInsert;
export type SelectGroupProfile = typeof groupProfiles.$inferSelect;

export type InsertStatement = typeof statements.$inferInsert;
export type SelectStatement = typeof statements.$inferSelect;
```

---

## Phase 2: Seed Data

### 2.1 Selected Case Studies

Based on the case study review, we select groups with rich, well-documented lineages:

1. **GCAP (Grupo de Capoeira Angola Pelourinho)** - Case study #22
   - Founded by Mestre Moraes
   - Clear lineage: Pastinha → João Grande → Moraes
   - Multiple generations of students

2. **Grupo Senzala** - Case study #28
   - Multiple co-founders ("Sete Mestres")
   - Foundational for contemporary capoeira
   - Source of many blessed departures

3. **ABADÁ-Capoeira** - Case study #1
   - Founded by Mestre Camisa (blessed split from Senzala)
   - Well-structured international organization

4. **Cordão de Ouro** - Case study #15
   - Founded by Mestre Suassuna (blessed split from Senzala)
   - Strong Regional lineage

5. **João Grande Capoeira Angola Center** - Case study #30
   - Founded by Mestre João Grande
   - Cultural pioneer in USA
   - Direct link to Pastinha

### 2.2 Seed Script

**File:** `apps/quilombo/db/seed/genealogy-prototype.ts`

```typescript
import { db } from '../index';
import { personProfiles, groupProfiles, statements } from '../schema/genealogy';

export async function seedGenealogyPrototype() {
  console.log('Seeding genealogy prototype data...');

  // ============================================
  // PERSON PROFILES - Historical Mestres
  // ============================================

  const [pastinha] = await db.insert(personProfiles).values({
    name: 'Vicente Ferreira Pastinha',
    apelido: 'Pastinha',
    title: 'mestre',
    style: 'angola',
    birthYear: 1889,
    deathYear: 1981,
    bio: 'Considered the father of modern Capoeira Angola. Founded the Centro Esportivo de Capoeira Angola (CECA) in 1941.',
  }).returning();

  const [bimba] = await db.insert(personProfiles).values({
    name: 'Manoel dos Reis Machado',
    apelido: 'Bimba',
    title: 'mestre',
    style: 'regional',
    birthYear: 1899,
    deathYear: 1974,
    bio: 'Creator of Capoeira Regional. Revolutionized capoeira by systematizing training and gaining government recognition.',
  }).returning();

  const [joaoGrande] = await db.insert(personProfiles).values({
    name: 'João Oliveira dos Santos',
    apelido: 'João Grande',
    title: 'mestre',
    style: 'angola',
    birthYear: 1933,
    bio: 'Student of Mestre Pastinha. Cultural pioneer who brought Capoeira Angola to the United States in 1990.',
  }).returning();

  const [moraes] = await db.insert(personProfiles).values({
    name: 'Pedro Moraes Trindade',
    apelido: 'Moraes',
    title: 'mestre',
    style: 'angola',
    birthYear: 1950,
    bio: 'Founder of GCAP. Studied under João Grande and directly with Pastinha. Key figure in the Capoeira Angola renaissance.',
  }).returning();

  const [camisa] = await db.insert(personProfiles).values({
    name: 'José Tadeu Carneiro Cardoso',
    apelido: 'Camisa',
    title: 'mestre',
    style: 'contemporanea',
    birthYear: 1956,
    bio: 'Founder of ABADÁ-Capoeira. Former member of Grupo Senzala who left with blessing to start his own organization.',
  }).returning();

  const [suassuna] = await db.insert(personProfiles).values({
    name: 'Reinaldo Ramos Suassuna',
    apelido: 'Suassuna',
    title: 'mestre',
    style: 'regional',
    birthYear: 1938,
    bio: 'Founder of Cordão de Ouro. One of the "Sete Mestres" of Grupo Senzala who departed to create his own group.',
  }).returning();

  const [peixinho] = await db.insert(personProfiles).values({
    name: 'Antônio Carlos',
    apelido: 'Peixinho',
    title: 'mestre',
    style: 'contemporanea',
    birthYear: 1943,
    bio: 'One of the founding "Sete Mestres" of Grupo Senzala. Remained with the group as a key leader.',
  }).returning();

  console.log(`Created ${7} person profiles`);

  // ============================================
  // GROUP PROFILES
  // ============================================

  const [ceca] = await db.insert(groupProfiles).values({
    name: 'Centro Esportivo de Capoeira Angola (CECA)',
    style: 'angola',
    foundedYear: 1941,
    description: 'Founded by Mestre Pastinha in Salvador, Bahia. The birthplace of organized Capoeira Angola.',
  }).returning();

  const [gcap] = await db.insert(groupProfiles).values({
    name: 'Grupo de Capoeira Angola Pelourinho (GCAP)',
    style: 'angola',
    foundedYear: 1980,
    description: 'Founded by Mestre Moraes in Salvador. Central to the Capoeira Angola renaissance movement.',
  }).returning();

  const [senzala] = await db.insert(groupProfiles).values({
    name: 'Grupo Senzala',
    style: 'contemporanea',
    foundedYear: 1963,
    description: 'Founded in Rio de Janeiro by the "Sete Mestres". One of the most influential groups in spreading contemporary capoeira worldwide.',
  }).returning();

  const [abada] = await db.insert(groupProfiles).values({
    name: 'ABADÁ-Capoeira',
    style: 'contemporanea',
    foundedYear: 1988,
    description: 'Founded by Mestre Camisa after a blessed departure from Grupo Senzala. One of the largest capoeira organizations globally.',
  }).returning();

  const [cordaoDeOuro] = await db.insert(groupProfiles).values({
    name: 'Cordão de Ouro',
    style: 'regional',
    foundedYear: 1967,
    description: 'Founded by Mestre Suassuna. Known for its emphasis on Capoeira Regional traditions.',
  }).returning();

  const [jgcac] = await db.insert(groupProfiles).values({
    name: 'João Grande Capoeira Angola Center',
    style: 'angola',
    foundedYear: 1990,
    description: 'Founded by Mestre João Grande in New York City. First permanent Capoeira Angola school in the USA.',
  }).returning();

  console.log(`Created ${6} group profiles`);

  // ============================================
  // STATEMENTS (Relationships)
  // ============================================

  const statementsData = [
    // === LINEAGE: Angola tree ===
    // João Grande student_of Pastinha
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      startedAt: '1941-01-01',
      confidence: 'verified' as const,
      source: 'Historical records, interviews with Mestre João Grande',
    },
    // Moraes student_of João Grande
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: joaoGrande.id,
      confidence: 'verified' as const,
      source: 'GCAP documentation',
    },
    // Moraes trained_under Pastinha (direct but limited)
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Historical records - trained at CECA before Pastinha\'s death',
    },

    // === FOUNDING RELATIONSHIPS ===
    // Pastinha founded CECA
    {
      subjectType: 'person' as const,
      subjectId: pastinha.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: ceca.id,
      startedAt: '1941-01-01',
      confidence: 'verified' as const,
    },
    // Moraes founded GCAP
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
    },
    // João Grande founded JGCAC
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
    },
    // Camisa founded ABADÁ
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: abada.id,
      startedAt: '1988-01-01',
      confidence: 'verified' as const,
    },
    // Suassuna founded Cordão de Ouro
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '1967-01-01',
      confidence: 'verified' as const,
    },
    // Peixinho co_founded Senzala
    {
      subjectType: 'person' as const,
      subjectId: peixinho.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      confidence: 'verified' as const,
    },
    // Suassuna co_founded Senzala (before departing)
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      confidence: 'verified' as const,
    },

    // === GROUP SPLITS ===
    // ABADÁ split from Senzala (blessed)
    {
      subjectType: 'group' as const,
      subjectId: abada.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1988-01-01',
      properties: {
        split_type: 'blessed',
        blessed_by: ['Mestre Peixinho'],
        context: 'Mestre Camisa left Senzala with blessing to establish ABADÁ-Capoeira',
      },
      confidence: 'verified' as const,
    },
    // Cordão de Ouro split from Senzala (blessed)
    {
      subjectType: 'group' as const,
      subjectId: cordaoDeOuro.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1967-01-01',
      properties: {
        split_type: 'blessed',
        context: 'Mestre Suassuna departed to focus on Capoeira Regional traditions',
      },
      confidence: 'verified' as const,
    },

    // === MEMBERSHIP/TEACHING ===
    // Camisa was member_of Senzala (before founding ABADÁ)
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1972-01-01',
      endedAt: '1988-01-01',
      confidence: 'verified' as const,
    },
    // Camisa departed_from Senzala
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1988-01-01',
      properties: {
        departure_type: 'blessed',
      },
      confidence: 'verified' as const,
    },

    // === CULTURAL PIONEER ===
    // João Grande cultural_pioneer_of JGCAC (USA)
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'cultural_pioneer_of' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '1990-01-01',
      properties: {
        region: 'United States',
        country: 'USA',
        context: 'First Capoeira Angola mestre to establish permanent school in the USA',
      },
      confidence: 'verified' as const,
    },

    // === LEADS (current leadership) ===
    // Moraes leads GCAP
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
    },
    // Camisa leads ABADÁ
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: abada.id,
      startedAt: '1988-01-01',
      confidence: 'verified' as const,
    },
  ];

  await db.insert(statements).values(statementsData);
  console.log(`Created ${statementsData.length} statements`);

  console.log('Genealogy prototype seed complete!');
}
```

---

## Phase 3: API Endpoints

### 3.1 Graph Data Endpoint

**File:** `apps/quilombo/app/api/genealogy/graph/route.ts`

```typescript
import { db } from '@/db';
import { personProfiles, groupProfiles, statements } from '@/db/schema/genealogy';

interface GraphNode {
  id: string;
  name: string;
  type: 'person' | 'group';
  metadata: Record<string, unknown>;
}

interface GraphLink {
  source: string;
  target: string;
  type: string;
  metadata: Record<string, unknown>;
}

/**
 * @openapi
 * /api/genealogy/graph:
 *   get:
 *     summary: Get genealogy graph data for visualization
 *     tags: [Genealogy]
 *     parameters:
 *       - name: nodeTypes
 *         in: query
 *         schema:
 *           type: string
 *         description: Comma-separated list of node types (person, group)
 *       - name: linkTypes
 *         in: query
 *         schema:
 *           type: string
 *         description: Comma-separated list of predicate types to include
 *     responses:
 *       200:
 *         description: Graph data with nodes and links
 */
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const nodeTypes = searchParams.get('nodeTypes')?.split(',') || ['person', 'group'];
  const linkTypes = searchParams.get('linkTypes')?.split(',').filter(Boolean) || [];

  const nodes: GraphNode[] = [];
  const links: GraphLink[] = [];
  const nodeIds = new Set<string>();

  // Fetch person profiles
  if (nodeTypes.includes('person')) {
    const personData = await db.select().from(personProfiles);
    for (const person of personData) {
      nodeIds.add(person.id);
      nodes.push({
        id: person.id,
        name: person.apelido || person.name || 'Unknown',
        type: 'person',
        metadata: {
          fullName: person.name,
          title: person.title,
          style: person.style,
          birthYear: person.birthYear,
          deathYear: person.deathYear,
          avatar: person.avatar,
          bio: person.bio,
        },
      });
    }
  }

  // Fetch groups
  if (nodeTypes.includes('group')) {
    const groupData = await db.select().from(groupProfiles);
    for (const group of groupData) {
      nodeIds.add(group.id);
      nodes.push({
        id: group.id,
        name: group.name,
        type: 'group',
        metadata: {
          style: group.style,
          foundedYear: group.foundedYear,
          logo: group.logo,
          description: group.description,
        },
      });
    }
  }

  // Fetch statements (relationships)
  const statementsData = await db.select().from(statements);

  for (const stmt of statementsData) {
    // Filter by link types if specified
    if (linkTypes.length > 0 && !linkTypes.includes(stmt.predicate)) {
      continue;
    }

    // Only include if both nodes exist in graph
    if (nodeIds.has(stmt.subjectId) && nodeIds.has(stmt.objectId)) {
      links.push({
        source: stmt.subjectId,
        target: stmt.objectId,
        type: stmt.predicate,
        metadata: {
          confidence: stmt.confidence,
          startedAt: stmt.startedAt,
          endedAt: stmt.endedAt,
          properties: stmt.properties,
          source: stmt.source,
        },
      });
    }
  }

  return Response.json({
    nodes,
    links,
    stats: {
      totalNodes: nodes.length,
      totalLinks: links.length,
      personCount: nodes.filter(n => n.type === 'person').length,
      groupCount: nodes.filter(n => n.type === 'group').length,
    },
  });
}
```

### 3.2 Node Details Endpoint

**File:** `apps/quilombo/app/api/genealogy/node/[id]/route.ts`

```typescript
import { eq } from 'drizzle-orm';
import { db } from '@/db';
import { personProfiles, groupProfiles, statements } from '@/db/schema/genealogy';

/**
 * @openapi
 * /api/genealogy/node/{id}:
 *   get:
 *     summary: Get details for a specific genealogy node
 *     tags: [Genealogy]
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *     responses:
 *       200:
 *         description: Node details with relationships
 *       404:
 *         description: Node not found
 */
export async function GET(
  request: Request,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;

  // Try person profile first
  const [person] = await db.select().from(personProfiles).where(eq(personProfiles.id, id));

  if (person) {
    const [outgoing, incoming] = await Promise.all([
      db.select().from(statements).where(eq(statements.subjectId, id)),
      db.select().from(statements).where(eq(statements.objectId, id)),
    ]);

    return Response.json({
      type: 'person',
      data: person,
      relationships: { outgoing, incoming },
    });
  }

  // Try group
  const [group] = await db.select().from(groupProfiles).where(eq(groupProfiles.id, id));

  if (group) {
    const [outgoing, incoming] = await Promise.all([
      db.select().from(statements).where(eq(statements.subjectId, id)),
      db.select().from(statements).where(eq(statements.objectId, id)),
    ]);

    return Response.json({
      type: 'group',
      data: group,
      relationships: { outgoing, incoming },
    });
  }

  return Response.json({ error: 'Node not found' }, { status: 404 });
}
```

---

## Phase 4: Visualization Components

### 4.1 Dependencies

```bash
pnpm --filter quilombo add react-force-graph-3d three
pnpm --filter quilombo add -D @types/three
```

### 4.2 Component Structure

```
apps/quilombo/app/genealogy/
├── page.tsx                      # Main page
├── components/
│   ├── GenealogyGraph.tsx        # 3D graph wrapper
│   ├── GraphControls.tsx         # Filter panel
│   ├── NodeDetailsPanel.tsx      # Selected node info
│   └── GraphLegend.tsx           # Color legend
├── hooks/
│   └── useGenealogyData.ts       # Data fetching hook
└── types.ts                      # TypeScript types
```

### 4.3 Types

**File:** `apps/quilombo/app/genealogy/types.ts`

```typescript
export interface GraphNode {
  id: string;
  name: string;
  type: 'person' | 'group';
  metadata: {
    fullName?: string;
    title?: string;
    style?: string;
    birthYear?: number;
    deathYear?: number;
    foundedYear?: number;
    avatar?: string;
    logo?: string;
    bio?: string;
    description?: string;
  };
}

export interface GraphLink {
  source: string;
  target: string;
  type: string;
  metadata: {
    confidence?: string;
    startedAt?: string;
    endedAt?: string;
    properties?: Record<string, unknown>;
    source?: string;
  };
}

export interface GraphData {
  nodes: GraphNode[];
  links: GraphLink[];
  stats: {
    totalNodes: number;
    totalLinks: number;
    personCount: number;
    groupCount: number;
  };
}

export interface GraphFilters {
  nodeTypes: string[];
  linkTypes: string[];
}
```

### 4.4 Data Hook

**File:** `apps/quilombo/app/genealogy/hooks/useGenealogyData.ts`

```typescript
import { useQuery } from '@tanstack/react-query';
import type { GraphData, GraphFilters } from '../types';

export function useGenealogyData(filters: GraphFilters) {
  return useQuery<GraphData>({
    queryKey: ['genealogy-graph', filters],
    queryFn: async () => {
      const params = new URLSearchParams();
      if (filters.nodeTypes.length) {
        params.set('nodeTypes', filters.nodeTypes.join(','));
      }
      if (filters.linkTypes.length) {
        params.set('linkTypes', filters.linkTypes.join(','));
      }

      const res = await fetch(`/api/genealogy/graph?${params}`);
      if (!res.ok) throw new Error('Failed to fetch graph data');
      return res.json();
    },
    staleTime: 1000 * 60 * 5, // 5 minutes
  });
}
```

### 4.5 Main Components

See the [3D Network Visualization Spec](../../apps/quilombo/docs/specs/capoeira-network-visualization.md) for detailed component implementations. The prototype uses simplified versions of:

- `GenealogyGraph.tsx` - ForceGraph3D wrapper with node/link styling
- `GraphControls.tsx` - Checkbox filters for node and link types
- `NodeDetailsPanel.tsx` - Card showing selected node details
- `GraphLegend.tsx` - Color legend for node types and styles

---

## Implementation Checklist

### Phase 1: Database Schema ✅
- [x] Create Atlas migration for genealogy schema
- [x] Create `genealogy.person_profiles` table
- [x] Create `genealogy.group_profiles` table
- [x] Create `genealogy.statements` table
- [x] Create enums (entity_type, confidence, predicate)
- [x] Run migration locally: `pnpm db:atlas:apply`
- [x] Verify schema: `pnpm db:atlas:status`

### Phase 2: Drizzle Schema & Seed Data ✅
- [x] Create `db/schema/genealogy.ts`
- [x] Export from `db/schema/index.ts`
- [x] Create `db/seed/genealogy-prototype.ts`
- [x] Add seed command to package.json
- [x] Run seed script
- [x] Verify data with psql queries

### Phase 3: API Endpoints ✅
- [x] Create `/api/genealogy/graph/route.ts`
- [x] Create `/api/genealogy/persons/[id]/route.ts`
- [x] Create `/api/genealogy/groups/[id]/route.ts`
- [x] Test endpoints with curl/Postman
- [x] Add to API documentation (OpenAPI comments)

### Phase 4: Visualization ✅
- [x] Install dependencies (react-force-graph-3d, three)
- [x] Create types file
- [x] Create useGenealogyData hook
- [x] Create GenealogyGraph component (with dynamic import)
- [x] Create GraphControls component
- [x] Create NodeDetailsPanel component
- [x] Create GraphLegend component
- [x] Create main page.tsx
- [x] Create dedicated layout.tsx for full-width display
- [x] Add middleware exclusions for /genealogy routes
- [x] Add text labels showing "Title Apelido" below person nodes
- [x] Add text labels showing group name below group nodes
- [x] Test in browser

### Validation
- [x] All 25 predicates can be stored
- [x] Graph renders persons and groups
- [x] Links display with correct colors
- [x] Node click shows details panel and centers camera
- [x] Filters work correctly
- [x] Performance acceptable (~50-100 nodes)

---

## Success Criteria

1. **Schema Deployed**: `genealogy` schema exists with all tables
2. **Seed Data Loaded**: 7 person profiles, 6 group profiles, 17+ statements
3. **API Working**: Both endpoints return correct data
4. **Visualization Renders**: 3D graph displays nodes and links
5. **Interactivity**: Click nodes to see details, use filters
6. **Self-Contained**: No dependencies on public.users or public.groups data

---

## Phase 5: Image Storage & Display

### 5.1 Pinata Storage Setup

Create dedicated folders for genealogy assets in Pinata:
```
genealogy/
├── avatars/     # Person portraits
└── logos/       # Group logos
```

### 5.2 Image Upload API

Extend or create a genealogy-specific image upload endpoint that:
1. Accepts image uploads with entity type (person/group) and entity ID
2. Stores images in appropriate Pinata folder
3. Returns the IPFS URL
4. Updates the `avatar` or `logo` field in the corresponding profile

**API Route:** `POST /api/genealogy/images`
```typescript
// Request: multipart/form-data
// - file: image file
// - entityType: 'person' | 'group'
// - entityId: UUID of the profile

// Response: { url: string } (IPFS URL)
```

### 5.3 Display Implementation

#### For Person Nodes (spheres with labels)
- Continue using colored spheres based on title
- Display "Title Apelido" label below sphere
- Show avatar in the details panel when clicked

#### For Group Nodes (textured spheres)
- If logo exists: Apply logo as texture to sphere
- If no logo: Use colored sphere with style-based color
- Display group name as label below sphere
- Show logo in details panel when clicked

### 5.4 Implementation Steps

1. **Pinata Setup** (manual)
   - Create `genealogy/avatars` folder
   - Create `genealogy/logos` folder
   - Document folder IDs in environment config

2. **API Development**
   - Create `/api/genealogy/images` endpoint
   - Handle authentication (require admin or owner)
   - Validate image types (jpg, png, webp)
   - Upload to Pinata with proper folder
   - Update profile record with URL

3. **Visualization Updates**
   - Update `NodeDetailsPanel` to display avatar/logo
   - Implement textured sphere rendering for groups with logos
   - Add texture caching for performance

4. **Data Entry Workflow**
   - Document image sourcing guidelines (already in genealogy-data-entry-guide.md)
   - Create admin UI or script for batch uploading
   - Populate prototype seed data with real images

### 5.5 Checklist

- [ ] Create Pinata folders for genealogy assets
- [ ] Document folder IDs in environment config
- [ ] Create `/api/genealogy/images` upload endpoint
- [ ] Add avatar display to person details panel
- [ ] Add logo display to group details panel
- [ ] Implement textured sphere for groups with logos
- [ ] Upload test images for historical mestres
- [ ] Upload test logos for major groups
- [ ] Update seed script with Pinata URLs

---

## Next Steps (Post-Prototype)

After the prototype validates the data model:

1. **Phase 2 of Architecture**: Add `profile_id` FK columns to `public.users` and `public.groups`
2. **Data Migration**: Move user profile fields to `genealogy.person_profiles`, group identity fields to `genealogy.group_profiles`
3. **Update DB Queries**: Join public ↔ genealogy in all user/group queries
4. **Claiming System**: Implement simplified claimable profiles (just set `users.profile_id`)
5. **Drop Old Columns**: Remove migrated fields from `users` and `groups` tables
6. **Full CRUD**: Admin UI for managing genealogy data
7. **Performance**: Optimize for larger networks
