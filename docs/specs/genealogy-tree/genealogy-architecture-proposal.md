# Genealogy Schema Architecture Proposal

**Status:** Draft
**Created:** 2025-12-05
**Related:**
- [Genealogy Data Model Proposal](./genealogy-data-model-proposal.md)
- [Claimable Profiles Spec](./claimable-profiles.md) (needs revision after this)
- [3D Network Visualization Spec](../../apps/quilombo/docs/specs/capoeira-network-visualization.md)

---

## Executive Summary

Introduce a separate `genealogy` database schema to cleanly separate capoeira identity/lineage data from app authentication concerns. This enables:

1. **Historical figures** (deceased mestres) without polluting the auth-focused `users` table
2. **Clean claiming model** - linking a `person` to a `user` rather than merging user records
3. **Consistent relationship tracking** via the statements/predicates model
4. **Future-proof architecture** for the genealogy visualization and beyond

**Key Principle:** The API contract stays unchanged. Only the DB layer changes.

---

## Architecture Overview

```
PUBLIC SCHEMA (app/auth)              GENEALOGY SCHEMA (capoeira identity)
┌─────────────────────────┐          ┌─────────────────────────┐
│ users                   │          │ persons                 │
│ ├── id (PK)             │◄─ ─ ─ ─ ─│ ├── id (PK)             │
│ ├── email               │  (opt.)  │ ├── user_id (FK)?       │ nullable for historical
│ ├── passwordHash        │          │ ├── name                │ ← moved
│ ├── walletAddress       │          │ ├── apelido             │ ← was nickname
│ ├── emailVerifiedAt     │          │ ├── title               │ ← moved
│ ├── accountStatus       │          │ ├── avatar              │ ← moved
│ ├── isGlobalAdmin       │          │ ├── links               │ ← moved
│ ├── phone               │          │ ├── birth_year          │ new
│ ├── invitedBy (FK)      │          │ ├── death_year          │ new
│ ├── groupId (FK)────┐   │          │ ├── bio                 │ new
│ └── timestamps      │   │          │ ├── style               │ new
├─────────────────────┼───┤          │ └── timestamps          │
│ groups              │   │          ├─────────────────────────┤
│ ├── id (PK)◄────────┘   │◄─────────│ group_profiles          │
│ ├── name                │ (req.)   │ ├── id (PK)             │
│ ├── description         │          │ ├── group_id (FK)       │ NOT NULL
│ ├── style               │          │ ├── founded_year        │ new
│ ├── logo, banner        │          │ ├── links               │ ← moved
│ ├── leader (FK)─────────┼─ ─►users │ ├── name_history        │ new (JSONB)
│ ├── createdBy (FK)      │          │ └── timestamps          │
│ ├── claimedBy (FK)      │          ├─────────────────────────┤
│ └── claimedAt           │          │ statements              │
├─────────────────────────┤          │ ├── id (PK)             │
│ groupAdmins             │          │ ├── subject_type        │ 'person'|'group'
│ groupClaims             │          │ ├── subject_id ─────────┼──► persons.id OR
│ groupVerifications      │          │ ├── predicate           │    group_profiles.id
│ groupLocations          │          │ ├── object_type         │
│ (app workflow tables)   │          │ ├── object_id ──────────┼──► persons.id OR
└─────────────────────────┘          │ ├── started_at          │    group_profiles.id
                                     │ ├── ended_at            │
                                     │ ├── properties          │ JSONB
                                     │ ├── confidence          │
                                     │ ├── source              │
                                     │ └── timestamps          │
                                     └─────────────────────────┘

NOTES:
• persons.user_id is NULLABLE - historical figures have no user account
• group_profiles.group_id is NOT NULL - every group profile links to public.groups
• statements reference persons.id and group_profiles.id (self-contained within genealogy schema)
• Only public schema references INTO genealogy (e.g., persons.user_id, group_profiles.group_id)
• users.groupId kept for current UI compatibility (will deprecate later)
• groups.leader kept for app permissions (will derive from predicates later)
```

---

## Design Decisions

### 1. Persons vs Users Separation

**Decision:** Create `genealogy.persons` table separate from `public.users`.

**Rationale:**
- `users` = app accounts (authentication, authorization, sessions)
- `persons` = capoeira identities (lineage, history, relationships)
- Historical figures (Pastinha, Bimba) exist only in `persons` with `user_id = NULL`
- Living practitioners who join the app have both: `users` record + linked `persons` record

**Claiming Model:**
```
BEFORE CLAIM:                        AFTER CLAIM:
┌─────────────┐                      ┌─────────────┐
│ persons     │                      │ persons     │
│ id: P1      │                      │ id: P1      │
│ user_id: ∅  │  ──claim──►          │ user_id: U1 │ ← linked!
│ apelido:    │                      │ apelido:    │
│ "Mestre X"  │                      │ "Mestre X"  │
└─────────────┘                      └─────────────┘
                                            │
┌─────────────┐                      ┌──────┴──────┐
│ users       │                      │ users       │
│ id: U1      │                      │ id: U1      │
│ email: ...  │                      │ email: ...  │
└─────────────┘                      └─────────────┘
```

No complex merge needed! Just set `persons.user_id = users.id`.

### 2. Groups: Hybrid Approach

**Decision:** Keep `public.groups` for app workflow, add `genealogy.group_profiles` for lineage data.

**Rationale:**
- `public.groups` has deep integration: claims, verifications, locations, admins, events
- Moving everything to genealogy schema = massive refactoring
- Instead: extend with `genealogy.group_profiles` linked via FK

**What stays in `public.groups`:**
- `id`, `name`, `description`, `style`, `logo`, `banner`, `email`
- `createdBy`, `claimedBy`, `claimedAt` (app workflow)
- `leader` (FK to users - app permission model)

**What moves to `genealogy.group_profiles`:**
- `links` (social links - sources/references)
- `founded_year` (new)
- `name_history` (new - JSONB for tracking name changes)
- `founder` removed from groups - use `founded`/`co_founded` predicates instead

### 3. Fields Migration

**From `public.users` to `genealogy.persons`:**

| Old Location | New Location | Notes |
|--------------|--------------|-------|
| `users.name` | `persons.name` | Full legal name |
| `users.nickname` | `persons.apelido` | Capoeira nickname |
| `users.title` | `persons.title` | Mestre, Professor, etc. |
| `users.avatar` | `persons.avatar` | Profile photo |
| `users.links` | `persons.links` | Social links |

**New fields in `genealogy.persons`:**

| Field | Type | Description |
|-------|------|-------------|
| `birth_year` | integer | Year of birth (not full date for privacy) |
| `death_year` | integer | Year of death (null if alive) |
| `bio` | text | Biography/background |
| `style` | enum | Primary capoeira style |

**From `public.groups` to `genealogy.group_profiles`:**

| Old Location | New Location | Notes |
|--------------|--------------|-------|
| `groups.links` | `group_profiles.links` | Social links |
| `groups.founder` | (removed) | Use `founded` predicate instead |

**New fields in `genealogy.group_profiles`:**

| Field | Type | Description |
|-------|------|-------------|
| `founded_year` | integer | Year group was founded |
| `name_history` | jsonb | Array of {name, started_at, ended_at, reason} |

### 4. API Compatibility Strategy

**Decision:** DB queries abstract the schema split. API returns same shape.

**Example - fetchUser:**
```typescript
// Before: Single table query
const user = await db.select().from(users).where(eq(users.id, id));
// Returns: { id, name, nickname, title, avatar, email, ... }

// After: Join query
const user = await db
  .select({
    // Auth fields from users
    id: users.id,
    email: users.email,
    groupId: users.groupId,
    accountStatus: users.accountStatus,
    // ... other auth fields

    // Profile fields from persons (aliased for API compatibility)
    name: persons.name,
    nickname: persons.apelido,  // alias!
    title: persons.title,
    avatar: persons.avatar,
    links: persons.links,
  })
  .from(users)
  .leftJoin(persons, eq(persons.userId, users.id))
  .where(eq(users.id, id));
// Returns: { id, name, nickname, title, avatar, email, ... } - same shape!
```

**Example - createUser:**
```typescript
// Before: Single insert
await db.insert(users).values({ name, nickname, title, email, ... });

// After: Transaction with two inserts
await db.transaction(async (tx) => {
  const [user] = await tx
    .insert(users)
    .values({ email, passwordHash, accountStatus, ... })
    .returning();

  await tx
    .insert(persons)
    .values({
      userId: user.id,
      name,
      apelido: nickname,  // map nickname → apelido
      title,
      avatar,
      links,
    });

  return user;
});
```

### 5. What Stays Unchanged

**Tables (no changes):**
- `groupAdmins` - app permissions
- `groupClaims` - app workflow
- `groupVerifications` - app workflow
- `groupLocations` - PostGIS data
- `events` - app feature
- `invitations` - app feature
- `verificationTokens` - auth
- `oauthAccounts` - auth

**API Endpoints (no changes to contract):**
- All `/api/users/*` endpoints
- All `/api/groups/*` endpoints
- All `/api/profile/*` endpoints
- All `/api/admin/*` endpoints

**UI Components (no changes):**
- User cards, profiles, search
- Group cards, profiles, search
- Admin panels

---

## Database Schema

### Genealogy Schema Setup

```sql
-- Create the genealogy schema
CREATE SCHEMA IF NOT EXISTS genealogy;

-- Grant access (adjust role as needed)
GRANT USAGE ON SCHEMA genealogy TO postgres;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA genealogy TO postgres;
ALTER DEFAULT PRIVILEGES IN SCHEMA genealogy GRANT ALL ON TABLES TO postgres;
```

### Enums

```sql
-- Entity type for statements
CREATE TYPE genealogy.entity_type AS ENUM ('person', 'group');

-- Confidence levels for statements
CREATE TYPE genealogy.confidence AS ENUM (
  'verified',    -- Confirmed by multiple sources or official records
  'likely',      -- Strong evidence but not definitively confirmed
  'unverified',  -- Claimed but not yet verified
  'disputed',    -- Conflicting claims exist
  'uncertain'    -- Explicitly uncertain/unknown
);

-- Predicates (24 total)
CREATE TYPE genealogy.predicate AS ENUM (
  -- Person-to-Person: Training & Lineage (3)
  'student_of',
  'trained_under',
  'influenced_by',

  -- Person-to-Person: Mentorship & Recognition (3)
  'mentored',
  'granted_title_to',
  'baptized',

  -- Person-to-Person: Family (1)
  'family_of',

  -- Person-to-Group: Founding & Leadership (4)
  'founded',
  'co_founded',
  'leads',
  'regional_coordinator_of',

  -- Person-to-Group: Membership & Affiliation (6)
  'member_of',
  'teaches_at',
  'cultural_pioneer_of',
  'associated_with',
  'graduated_from',
  'departed_from',

  -- Group-to-Group: Hierarchical (1)
  'part_of',

  -- Group-to-Group: Evolution (5)
  'split_from_group',
  'merged_into',
  'absorbed',
  'succeeded',
  'evolved_from',

  -- Group-to-Group: Affiliation (2)
  'affiliated_with',
  'cooperates_with'
);
```

### Persons Table

```sql
CREATE TABLE genealogy.persons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Link to app user (nullable - historical figures have no user)
  user_id UUID REFERENCES public.users(id) ON DELETE SET NULL,

  -- Identity (moved from users)
  name VARCHAR(255),
  apelido VARCHAR(100),  -- capoeira nickname (was users.nickname)
  title public.title,    -- reuse existing enum from public schema
  avatar VARCHAR(500),
  links JSONB DEFAULT '[]',  -- social links array

  -- Capoeira-specific (new)
  style public.style,    -- primary style (reuse existing enum)
  birth_year INTEGER,
  death_year INTEGER,    -- null if alive
  bio TEXT,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Constraints
  CONSTRAINT persons_user_unique UNIQUE (user_id),
  CONSTRAINT persons_birth_before_death CHECK (
    death_year IS NULL OR birth_year IS NULL OR birth_year <= death_year
  )
);

-- Indexes
CREATE INDEX persons_user_id_idx ON genealogy.persons(user_id);
CREATE INDEX persons_apelido_idx ON genealogy.persons(apelido);
CREATE INDEX persons_title_idx ON genealogy.persons(title);
CREATE INDEX persons_style_idx ON genealogy.persons(style);

-- Trigger for updated_at
CREATE TRIGGER persons_updated_at
  BEFORE UPDATE ON genealogy.persons
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at_column();
```

### Group Profiles Table

```sql
CREATE TABLE genealogy.group_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Link to app group (required)
  group_id UUID NOT NULL REFERENCES public.groups(id) ON DELETE CASCADE,

  -- Extended data (moved from groups)
  links JSONB DEFAULT '[]',  -- social links array

  -- Genealogy-specific (new)
  founded_year INTEGER,
  name_history JSONB DEFAULT '[]',  -- Array of name change records
  -- Schema: [{ name: string, started_at: string, ended_at?: string,
  --            change_reason?: string, context?: string }]

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Constraints
  CONSTRAINT group_profiles_group_unique UNIQUE (group_id)
);

-- Indexes
CREATE INDEX group_profiles_group_id_idx ON genealogy.group_profiles(group_id);

-- Trigger for updated_at
CREATE TRIGGER group_profiles_updated_at
  BEFORE UPDATE ON genealogy.group_profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at_column();
```

### Statements Table

```sql
CREATE TABLE genealogy.statements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Subject (who/what this statement is about)
  -- If subject_type = 'person': subject_id references genealogy.persons.id
  -- If subject_type = 'group': subject_id references genealogy.group_profiles.id
  -- (self-contained within genealogy schema)
  subject_type genealogy.entity_type NOT NULL,
  subject_id UUID NOT NULL,

  -- Predicate (relationship type)
  predicate genealogy.predicate NOT NULL,

  -- Object (who/what they're related to)
  -- If object_type = 'person': object_id references genealogy.persons.id
  -- If object_type = 'group': object_id references genealogy.group_profiles.id
  -- (self-contained within genealogy schema)
  object_type genealogy.entity_type NOT NULL,
  object_id UUID NOT NULL,

  -- Timeline
  started_at DATE,
  ended_at DATE,

  -- Properties (predicate-specific data as JSONB)
  properties JSONB DEFAULT '{}',

  -- Verification
  confidence genealogy.confidence DEFAULT 'unverified',
  source VARCHAR(500),  -- citation or reference
  notes TEXT,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,

  -- Constraints
  CONSTRAINT statements_different_entities CHECK (
    NOT (subject_type = object_type AND subject_id = object_id)
  ),
  CONSTRAINT statements_timeline_valid CHECK (
    started_at IS NULL OR ended_at IS NULL OR started_at <= ended_at
  )
);

-- Indexes for common query patterns
CREATE INDEX statements_subject_idx ON genealogy.statements(subject_type, subject_id);
CREATE INDEX statements_object_idx ON genealogy.statements(object_type, object_id);
CREATE INDEX statements_predicate_idx ON genealogy.statements(predicate);
CREATE INDEX statements_confidence_idx ON genealogy.statements(confidence);

-- Composite indexes for relationship lookups
CREATE INDEX statements_subject_predicate_idx
  ON genealogy.statements(subject_type, subject_id, predicate);
CREATE INDEX statements_object_predicate_idx
  ON genealogy.statements(object_type, object_id, predicate);

-- Trigger for updated_at
CREATE TRIGGER statements_updated_at
  BEFORE UPDATE ON genealogy.statements
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at_column();
```

---

## Migration Plan

### Phase 1: Schema Creation (No Data Changes)

1. Create `genealogy` schema
2. Create enums (entity_type, confidence, predicate)
3. Create tables (persons, group_profiles, statements)
4. Create indexes and triggers

**Risk:** None - additive only

### Phase 2: Data Migration

```sql
-- 2a. Migrate user profile data to persons
INSERT INTO genealogy.persons (user_id, name, apelido, title, avatar, links)
SELECT id, name, nickname, title, avatar, links
FROM public.users
WHERE account_status != 'managed_profile';  -- handle managed separately if exists

-- 2b. Create group_profiles for existing groups
INSERT INTO genealogy.group_profiles (group_id, links)
SELECT id, links
FROM public.groups;

-- 2c. Drop columns from public tables (AFTER updating queries)
-- This happens in Phase 4 after queries are updated
```

**Risk:** Low - data copy, originals preserved

### Phase 3: Update DB Queries

Update all queries in `apps/quilombo/db/queries/`:

**users.ts:**
- `fetchUser` - join with persons
- `fetchSessionData` - join with persons (for display name)
- `searchUsers` - join with persons
- `createUser` - transaction: insert users + persons
- `updateUser` - transaction: update users + persons
- `upsertUser` - transaction: upsert users + persons

**groups.ts:**
- `fetchGroup` - join with group_profiles
- `searchGroups` - join with group_profiles
- `createGroup` - transaction: insert groups + group_profiles
- `updateGroup` - transaction: update groups + group_profiles

**New genealogy.ts:**
- `fetchPerson` - direct query (for genealogy visualization)
- `fetchPersonByUserId` - lookup by user
- `createPerson` - for historical figures (no user)
- `searchPersons` - for genealogy search
- `createStatement` - add relationship
- `fetchStatements` - query relationships
- `fetchLineage` - recursive lineage query

**Risk:** Medium - must update all queries correctly

### Phase 4: Remove Old Columns

After queries are updated and tested:

```sql
-- Remove migrated columns from users
ALTER TABLE public.users DROP COLUMN name;
ALTER TABLE public.users DROP COLUMN nickname;
ALTER TABLE public.users DROP COLUMN title;
ALTER TABLE public.users DROP COLUMN avatar;
ALTER TABLE public.users DROP COLUMN links;

-- Remove migrated columns from groups
ALTER TABLE public.groups DROP COLUMN links;
ALTER TABLE public.groups DROP COLUMN founder;  -- replaced by predicate
```

**Risk:** High - irreversible. Must verify all queries work first.

### Phase 5: Update Claimable Profiles Spec

The claimable-profiles.md spec needs revision:
- Remove "managed profiles ARE user records" approach
- Claiming = setting `persons.user_id` (simple!)
- No complex merge algorithm needed
- `person_profiles` table concept merges into `genealogy.persons`

---

## Drizzle Schema Updates

### New Schema File: `db/schema/genealogy.ts`

```typescript
import { relations } from 'drizzle-orm';
import {
  pgSchema,
  pgEnum,
  pgTable,
  uuid,
  varchar,
  text,
  integer,
  timestamp,
  date,
  jsonb,
  index,
  uniqueIndex,
  check,
} from 'drizzle-orm/pg-core';
import { users, groups, titleEnum, styleEnum } from './schema';
import type { SocialLink } from './schema';

// Create the genealogy schema
export const genealogySchema = pgSchema('genealogy');

// Enums
export const entityTypeEnum = genealogySchema.enum('entity_type', ['person', 'group']);

export const confidenceEnum = genealogySchema.enum('confidence', [
  'verified',
  'likely',
  'unverified',
  'disputed',
  'uncertain',
]);

export const predicateEnum = genealogySchema.enum('predicate', [
  // Person-to-Person (7)
  'student_of', 'trained_under', 'influenced_by',
  'mentored', 'granted_title_to', 'baptized',
  'family_of',
  // Person-to-Group (10)
  'founded', 'co_founded', 'leads', 'regional_coordinator_of',
  'member_of', 'teaches_at', 'cultural_pioneer_of',
  'associated_with', 'graduated_from', 'departed_from',
  // Group-to-Group (8)
  'part_of', 'split_from_group', 'merged_into', 'absorbed',
  'succeeded', 'evolved_from', 'affiliated_with', 'cooperates_with',
]);

// Persons table
export const persons = genealogySchema.table(
  'persons',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Link to app user (nullable)
    userId: uuid('user_id').references(() => users.id, { onDelete: 'set null' }),

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

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
  },
  (t) => [
    uniqueIndex('persons_user_id_idx').on(t.userId),
    index('persons_apelido_idx').on(t.apelido),
    index('persons_title_idx').on(t.title),
    index('persons_style_idx').on(t.style),
  ]
);

// Group profiles table
export const groupProfiles = genealogySchema.table(
  'group_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Link to app group
    groupId: uuid('group_id')
      .notNull()
      .references(() => groups.id, { onDelete: 'cascade' }),

    // Extended data
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

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
  },
  (t) => [
    uniqueIndex('group_profiles_group_id_idx').on(t.groupId),
  ]
);

// Statement properties type
export type StatementProperties = {
  // For family_of
  relationship_type?: 'parent' | 'sibling' | 'spouse' | 'padrinho' | 'other';
  other_type?: string;

  // For granted_title_to
  title_grant?: {
    title: string;
    ceremony?: string;
    location?: string;
  };

  // For baptized
  baptism?: {
    apelido_given: string;
    ceremony?: string;
    location?: string;
  };

  // For departed_from
  departure_type?: 'neutral' | 'blessed' | 'contentious' | 'expelled';

  // For split_from_group
  split_type?: 'neutral' | 'blessed' | 'contentious';
  blessed_by?: string[];

  // For part_of
  affiliation_type?: 'branch' | 'nucleus' | 'affiliate' | 'official_filial';

  // For associated_with
  association_type?: 'supporter' | 'patron' | 'informal_affiliate' | 'friend' | 'honorary';

  // For cultural_pioneer_of
  region?: string;
  country?: string;

  // Generic
  context?: string;
};

// Statements table
export const statements = genealogySchema.table(
  'statements',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Subject (who/what this statement is about)
    // If 'person': references genealogy.persons.id
    // If 'group': references genealogy.group_profiles.id
    // (self-contained within genealogy schema)
    subjectType: entityTypeEnum('subject_type').notNull(),
    subjectId: uuid('subject_id').notNull(),

    // Predicate
    predicate: predicateEnum('predicate').notNull(),

    // Object (who/what they're related to)
    // If 'person': references genealogy.persons.id
    // If 'group': references genealogy.group_profiles.id
    // (self-contained within genealogy schema)
    objectType: entityTypeEnum('object_type').notNull(),
    objectId: uuid('object_id').notNull(),

    // Timeline
    startedAt: date('started_at'),
    endedAt: date('ended_at'),

    // Properties
    properties: jsonb('properties').$type<StatementProperties>().default({}),

    // Verification
    confidence: confidenceEnum('confidence').default('unverified'),
    source: varchar('source', { length: 500 }),
    notes: text('notes'),

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
    createdBy: uuid('created_by').references(() => users.id, { onDelete: 'set null' }),
  },
  (t) => [
    index('statements_subject_idx').on(t.subjectType, t.subjectId),
    index('statements_object_idx').on(t.objectType, t.objectId),
    index('statements_predicate_idx').on(t.predicate),
    index('statements_confidence_idx').on(t.confidence),
    index('statements_subject_predicate_idx').on(t.subjectType, t.subjectId, t.predicate),
    index('statements_object_predicate_idx').on(t.objectType, t.objectId, t.predicate),
  ]
);

// Relations
export const personsRelations = relations(persons, ({ one }) => ({
  user: one(users, {
    fields: [persons.userId],
    references: [users.id],
  }),
}));

export const groupProfilesRelations = relations(groupProfiles, ({ one }) => ({
  group: one(groups, {
    fields: [groupProfiles.groupId],
    references: [groups.id],
  }),
}));

// Types
export type InsertPerson = typeof persons.$inferInsert;
export type SelectPerson = typeof persons.$inferSelect;

export type InsertGroupProfile = typeof groupProfiles.$inferInsert;
export type SelectGroupProfile = typeof groupProfiles.$inferSelect;

export type InsertStatement = typeof statements.$inferInsert;
export type SelectStatement = typeof statements.$inferSelect;
```

### Updated `db/schema.ts` (After Migration)

```typescript
// Remove these fields from users table:
// - name
// - nickname
// - title
// - avatar
// - links

// Users becomes auth-only:
export const users = pgTable(
  'users',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().$onUpdate(() => new Date()),

    // Auth fields only
    email: text('email'),
    phone: varchar('phone'),
    walletAddress: varchar('wallet_address'),
    passwordHash: text('password_hash'),
    emailVerifiedAt: timestamp('email_verified_at'),
    accountStatus: accountStatusEnum('account_status').default('active').notNull(),
    isGlobalAdmin: boolean('is_global_admin').default(false).notNull(),

    // App relationships
    groupId: uuid('group_id').references((): AnyPgColumn => groups.id, { onDelete: 'set null' }),
    invitedBy: uuid('invited_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
  },
  // ... indexes
);

// Remove these fields from groups table:
// - links
// - founder

// Groups keeps app workflow fields:
export const groups = pgTable(
  'groups',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().$onUpdate(() => new Date()),

    // Core identity (stays here)
    name: varchar('name').notNull(),
    description: text('description'),
    style: styleEnum('style'),
    email: text('email'),
    logo: varchar('logo'),
    banner: varchar('banner'),

    // App workflow (stays here)
    leader: uuid('leader_id').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    createdBy: uuid('created_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedBy: uuid('claimed_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedAt: timestamp('claimed_at'),

    // REMOVED: links (moved to genealogy.group_profiles)
    // REMOVED: founder (replaced by genealogy predicates)
  },
  // ... indexes
);
```

---

## Query Update Examples

### fetchUser (After Migration)

```typescript
// db/queries/users.ts

export async function fetchUser(userId: string): Promise<UserWithProfile | null> {
  const result = await db
    .select({
      // Auth fields from users
      id: users.id,
      email: users.email,
      phone: users.phone,
      walletAddress: users.walletAddress,
      emailVerifiedAt: users.emailVerifiedAt,
      accountStatus: users.accountStatus,
      isGlobalAdmin: users.isGlobalAdmin,
      groupId: users.groupId,
      invitedBy: users.invitedBy,
      createdAt: users.createdAt,
      updatedAt: users.updatedAt,

      // Profile fields from persons (aliased for API compatibility)
      name: persons.name,
      nickname: persons.apelido,  // alias!
      title: persons.title,
      avatar: persons.avatar,
      links: persons.links,

      // Extended fields (new)
      bio: persons.bio,
      birthYear: persons.birthYear,
      style: persons.style,
    })
    .from(users)
    .leftJoin(persons, eq(persons.userId, users.id))
    .where(eq(users.id, userId))
    .limit(1);

  return result[0] ?? null;
}
```

### createUser (After Migration)

```typescript
export async function createUser(data: CreateUserInput): Promise<UserWithProfile> {
  return await db.transaction(async (tx) => {
    // 1. Create user record (auth only)
    const [user] = await tx
      .insert(users)
      .values({
        id: data.id ?? crypto.randomUUID(),
        email: data.email?.toLowerCase(),
        passwordHash: data.passwordHash,
        walletAddress: data.walletAddress,
        accountStatus: data.accountStatus ?? 'active',
      })
      .returning();

    // 2. Create person record (profile)
    const [person] = await tx
      .insert(persons)
      .values({
        userId: user.id,
        name: data.name,
        apelido: data.nickname,  // map from API field name
        title: data.title,
        avatar: data.avatar,
        links: data.links ?? [],
      })
      .returning();

    // 3. Return combined shape for API compatibility
    return {
      ...user,
      name: person.name,
      nickname: person.apelido,
      title: person.title,
      avatar: person.avatar,
      links: person.links,
    };
  });
}
```

### fetchGroup (After Migration)

```typescript
export async function fetchGroup(groupId: string): Promise<GroupWithProfile | null> {
  const result = await db
    .select({
      // Core from groups
      id: groups.id,
      name: groups.name,
      description: groups.description,
      style: groups.style,
      email: groups.email,
      logo: groups.logo,
      banner: groups.banner,
      leader: groups.leader,
      createdBy: groups.createdBy,
      claimedBy: groups.claimedBy,
      claimedAt: groups.claimedAt,
      createdAt: groups.createdAt,
      updatedAt: groups.updatedAt,

      // Extended from group_profiles
      links: groupProfiles.links,
      foundedYear: groupProfiles.foundedYear,
      nameHistory: groupProfiles.nameHistory,
    })
    .from(groups)
    .leftJoin(groupProfiles, eq(groupProfiles.groupId, groups.id))
    .where(eq(groups.id, groupId))
    .limit(1);

  return result[0] ?? null;
}
```

---

## Type Definitions

```typescript
// types/genealogy.ts

import type { SelectUser, SelectGroup, SocialLink } from '@/db/schema';
import type { SelectPerson, SelectGroupProfile } from '@/db/schema/genealogy';

// Combined type for API responses (maintains backward compatibility)
export type UserWithProfile = Omit<SelectUser, 'name' | 'nickname' | 'title' | 'avatar' | 'links'> & {
  name: string | null;
  nickname: string | null;  // aliased from apelido
  title: SelectPerson['title'];
  avatar: string | null;
  links: SocialLink[];
  // Extended fields (optional in responses)
  bio?: string | null;
  birthYear?: number | null;
  style?: SelectPerson['style'];
};

export type GroupWithProfile = Omit<SelectGroup, 'links' | 'founder'> & {
  links: SocialLink[];
  foundedYear: number | null;
  nameHistory: SelectGroupProfile['nameHistory'];
};

// For genealogy-only queries (no user/group link required)
export type Person = SelectPerson;
export type GroupProfile = SelectGroupProfile;
```

---

## Impact Summary

### What Changes

| Area | Change Type | Effort |
|------|-------------|--------|
| Database schema | New tables + column migration | Medium |
| `db/queries/users.ts` | Join queries, transaction inserts | Medium |
| `db/queries/groups.ts` | Join queries | Low |
| New `db/queries/genealogy.ts` | New file | Medium |
| Type definitions | New combined types | Low |
| Drizzle schema | New schema file | Medium |

### What Stays the Same

| Area | Notes |
|------|-------|
| All API endpoints | Same request/response shapes |
| All UI components | Same data, same props |
| Authentication flow | Unchanged |
| Group permissions | groupAdmins unchanged |
| Group workflow | claims, verifications unchanged |
| Events | Unchanged |
| Locations | Unchanged |

### Risks

1. **Query bugs** - Must test all user/group queries thoroughly
2. **Transaction failures** - Create/update now span two tables
3. **Performance** - Joins add overhead (mitigated by indexes)
4. **Migration ordering** - Must update queries before dropping columns

---

## Next Steps

1. **Review this proposal** - confirm approach
2. **Update prototype plan** - align with this architecture
3. **Revise claimable-profiles spec** - simplify to use `persons.user_id` linking
4. **Create migration scripts** - Atlas migrations for schema changes
5. **Update DB queries** - systematic update of all affected queries
6. **Test thoroughly** - especially create/update flows
7. **Deploy** - schema first, then query updates, then drop old columns

---

## Design Decisions (Resolved)

### 1. `users.groupId` - Keep for App Compatibility

**Decision:** Keep `users.groupId` as-is to avoid breaking current UI.

**Rationale:**
- Current UI depends on `groupId` for displaying user's group membership
- Eventually will be replaced by `member_of` predicate with `is_primary: true` property
- Gradual migration path: keep both working, deprecate `groupId` later

### 2. `groups.leader` - Keep for App Permissions

**Decision:** Keep `groups.leader` FK for now.

**Rationale:**
- Used for app-level permissions (who can edit group)
- Will gradually replace with `leads` predicate
- Keeps permission model unchanged during migration

### 3. Groups Strategy - Parallel Structure (Like Users → Persons)

**Decision:** Keep `public.groups` as app reference, extend with `genealogy.group_profiles`.

**Rationale:**
- `public.groups` = app entity (permissions, claims, verifications, locations)
- `genealogy.group_profiles` = lineage data (links, founded_year, name_history)
- Same pattern as `users` → `persons`: separation of app and genealogy concerns
- Internal permissions (groupAdmins) stay tied to `public.groups.id`
- Historical groups still need a `public.groups` record to be referenced

**Implication:** No "genealogy-only" groups. Every group in the system has a `public.groups` record, optionally extended by `genealogy.group_profiles`.

### 4. Migration Timing

**Decision:** Schema first (additive), then prototype, then data migration, then drop old columns.

**Sequence:**
1. Add genealogy schema and tables (no breaking changes)
2. Build visualization prototype using genealogy schema
3. Update DB queries to join across schemas
4. Migrate data from old columns to new tables
5. Test thoroughly
6. Drop old columns from `users` and `groups`
