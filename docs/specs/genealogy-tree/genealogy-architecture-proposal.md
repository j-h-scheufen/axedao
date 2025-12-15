# Genealogy Schema Architecture Proposal

**Status:** Draft → **REVISED 2025-12-07**
**Created:** 2025-12-05
**Updated:** 2025-12-07
**Related:**
- [Genealogy Data Model Proposal](./genealogy-data-model-proposal.md)
- [User Flows Overview](./user-flows/00-overview.md) ← **NEW**
- [3D Network Visualization Spec](../../apps/quilombo/docs/specs/capoeira-network-visualization.md)

---

## ⚠️ IMPORTANT UPDATE (2025-12-07)

### Pivot: Separate Data Domains, Not Merged Queries

The original proposal below described merging user and genealogy data via JOIN queries at the database layer. **This approach has been revised** after recognizing a critical privacy concern:

**The Problem:**
- `public.users` contains private account data (email, phone, personal social links)
- `genealogy.person_profiles` is intended for public historical records
- Merging them via JOINs conflates these different consent models
- Users haven't consented to having their personal data (name, links) automatically published

**The New Approach:**

1. **Keep data separate** - User queries return only `users` data; genealogy queries return only `person_profiles` data
2. **Opt-in publishing** - Users explicitly choose to create a genealogy profile via a "Publish to Genealogy" wizard
3. **One-time data selection** - During publishing, users select which data to share (can differ from private profile)
4. **Separate edit contexts** - Profile edit page for private data, genealogy edit page for public data
5. **Claims for existing profiles** - Mestres finding themselves in genealogy can claim ownership via admin-approved process

### What Changed:

| Aspect | Original Proposal | Current Approach |
|--------|------------------|------------------|
| User queries | JOIN with person_profiles | Query users only |
| Profile fields | Migrate to person_profiles | Keep in both (separate values) |
| Data sync | Automatic via queries | Opt-in prompts when user edits |
| New user flow | Auto-create profile | Explicit publish wizard |
| person_profiles.avatar | Moved from users | Renamed to `portrait` |
| person_profiles.links | Moved from users | Renamed to `public_links` |

### User Flow Documents:

- `user-flows/01-publish-profile-to-genealogy.md` - Creating new genealogy profile
- `user-flows/02-claim-existing-genealogy-profile.md` - Claiming community-created profile
- `user-flows/03-group-claiming-management.md` - Group genealogy integration

### Schema Changes Applied:

```sql
-- Column renames for clarity
ALTER TABLE genealogy.person_profiles RENAME COLUMN avatar TO portrait;
ALTER TABLE genealogy.person_profiles RENAME COLUMN links TO public_links;
```

---

## Executive Summary

Introduce a separate `genealogy` database schema to cleanly separate capoeira identity/lineage data from app authentication concerns. This enables:

1. **Historical figures** (deceased mestres) without polluting the auth-focused `users` table
2. **Clean claiming model** - linking a `person` to a `user` rather than merging user records
3. **Consistent relationship tracking** via the statements/predicates model
4. **Future-proof architecture** for the genealogy visualization and beyond
5. **Privacy-respecting opt-in** - Users explicitly choose to publish to public genealogy

**Key Principle:** ~~The API contract stays unchanged. Only the DB layer changes.~~ **REVISED:** Users and genealogy are separate data domains with separate APIs. Publishing is an explicit user action, not an automatic merge.

---

## Architecture Overview

```
PUBLIC SCHEMA (private app data)      GENEALOGY SCHEMA (public historical data)
┌─────────────────────────┐          ┌─────────────────────────┐
│ users                   │          │ person_profiles         │
│ ├── id (PK)             │          │ ├── id (PK)◄────────────┼─┐
│ ├── email (private)     │          │ ├── name (public)       │ │
│ ├── passwordHash        │          │ ├── apelido (public)    │ │
│ ├── walletAddress       │          │ ├── title (public)      │ │
│ ├── name (private)      │          │ ├── portrait (public)   │ │ ← renamed from avatar
│ ├── nickname (private)  │          │ ├── public_links        │ │ ← renamed from links
│ ├── avatar (private)    │          │ ├── birth_year          │ │
│ ├── links (private)     │          │ ├── death_year          │ │
│ ├── phone (private)     │          │ ├── bio                 │ │
│ ├── emailVerifiedAt     │          │ ├── style               │ │
│ ├── accountStatus       │          │ │                       │ │
│ ├── isGlobalAdmin       │          │ └── timestamps          │ │
│ ├── hideEmail           │          │                         │ │
│ ├── invitedBy (FK)      │          │ (historical figures     │ │
│ ├── groupId (FK)────┐   │          │  exist only here with   │ │
│ ├── profileId (FK)──┼───┼──OPT-IN──┼─┘ no linked user)       │ │
│ └── timestamps      │   │          │                         │ │
├─────────────────────┼───┤          ├─────────────────────────┤ │
│ groups              │   │          │ group_profiles          │ │
│ ├── id (PK)◄────────┘   │          │ ├── id (PK)◄────────────┼─┼─┐
│ ├── name                │          │ ├── name                │ │ │
│ ├── email               │          │ ├── description         │ │ │
│ ├── style               │          │ ├── style               │ │ │
│ ├── banner              │          │ ├── logo                │ │ │
│ ├── verified            │          │ ├── links               │ │ │
│ ├── createdBy (FK)      │          │ ├── founded_year        │ │ │
│ ├── claimedBy (FK)      │          │ ├── history             │ │ │
│ ├── claimedAt           │          │ └── timestamps          │ │ │
│ └── profileId (FK)──────┼──LINK────┼─────────────────────────┘ │ │
├─────────────────────────┤          ├─────────────────────────┤ │ │
│ groupAdmins             │          │ statements              │ │ │
│ groupClaims             │          │ ├── id (PK)             │ │ │
│ groupVerifications      │          │ ├── subject_type        │ │ │ 'person'|'group'
│ groupLocations          │          │ ├── subject_id ─────────┼─┘ │
│ groupMembers            │          │ ├── predicate           │   │
│ (app workflow tables)   │          │ ├── object_type         │   │
└─────────────────────────┘          │ ├── object_id ──────────┼───┘
                                     │ ├── started_at          │
                                     │ ├── ended_at            │
                                     │ ├── properties (JSONB)  │
                                     │ ├── confidence          │
                                     │ └── timestamps          │
                                     └─────────────────────────┘

KEY POINTS (REVISED):
• Users keep ALL their profile fields - data is NOT migrated to genealogy
• users.profile_id is OPT-IN link - set via "Publish to Genealogy" wizard
• person_profiles can exist without linked user (historical figures)
• person_profiles.portrait and .public_links are SEPARATE from users.avatar and .links
• Groups can exist in public schema without genealogy entry (legacy groups)
• Groups can exist in genealogy without public entry (historical groups)
• All FKs flow FROM public TO genealogy (genealogy has no outbound FKs)
• Membership can be in both: groupMembers (app) and statements/member_of (genealogy)
```

---

## Design Decisions

### 1. Person Profiles vs Users Separation

**Decision:** Create `genealogy.person_profiles` table separate from `public.users`.

**Rationale:**
- `users` = app accounts (authentication, authorization, sessions)
- `person_profiles` = capoeira identities (lineage, history, relationships)
- Historical figures (Pastinha, Bimba) exist only in `person_profiles` with no linked user
- Living practitioners who join the app have both: `users` record + linked `person_profiles` record

**Claiming Model:**
```
BEFORE CLAIM:                        AFTER CLAIM:
┌─────────────────┐                  ┌─────────────────┐
│ person_profiles │                  │ person_profiles │
│ id: P1          │                  │ id: P1          │
│ apelido:        │                  │ apelido:        │
│ "Mestre X"      │                  │ "Mestre X"      │
└─────────────────┘                  └─────────────────┘
                                            ▲
┌─────────────┐                      ┌──────┴──────┐
│ users       │                      │ users       │
│ id: U1      │   ──claim──►         │ id: U1      │
│ profile_id: │                      │ profile_id: │
│ NULL        │                      │ P1          │ ← linked!
│ email: ...  │                      │ email: ...  │
└─────────────┘                      └─────────────┘
```

No complex merge needed! Just set `users.profile_id = person_profiles.id`.

### 2. Groups: Hybrid Approach

**Decision:** Keep `public.groups` for app workflow, add `genealogy.group_profiles` for lineage data.

**Rationale:**
- `public.groups` has deep integration: claims, verifications, locations, admins, events
- Moving everything to genealogy schema = massive refactoring
- Instead: extend with `genealogy.group_profiles` linked via FK from `groups.profile_id`

**What stays in `public.groups`:**
- `id`, `name` (core identifier for app references)
- `email` (contact for app workflow)
- `banner` (app UI decoration)
- `createdBy`, `claimedBy`, `claimedAt` (app workflow)
- `profile_id` (FK to group_profiles - nullable)

**What moves to `genealogy.group_profiles`:**
- `description` (identity/history - capoeira-related)
- `style` (capoeira-specific)
- `logo` (visual identity)
- `links` (social links - sources/references)
- `founded_year` (new)
- `name_history` (new - JSONB for tracking name changes)

**What is REMOVED from `public.groups`:**
- `leader` - not used in UI, will be replaced by `leads` predicate
- `founder` - replaced by `founded`/`co_founded` predicates

### 3. Fields Migration

**From `public.users` to `genealogy.person_profiles`:**

| Old Location | New Location | Notes |
|--------------|--------------|-------|
| `users.name` | `person_profiles.name` | Full legal name |
| `users.nickname` | `person_profiles.apelido` | Capoeira nickname |
| `users.title` | `person_profiles.title` | Mestre, Professor, etc. |
| `users.avatar` | `person_profiles.avatar` | Profile photo |
| `users.links` | `person_profiles.links` | Social links |

**New fields in `genealogy.person_profiles`:**

| Field | Type | Description |
|-------|------|-------------|
| `style` | enum | Primary capoeira style |
| `style_notes` | text | e.g., "Transitioned from Regional to Angola in 1985" |
| `birth_year` | integer | Year of birth |
| `birth_year_precision` | enum | Precision: exact, month, year, decade, approximate, unknown |
| `birth_place` | varchar | City, Country or just Country |
| `death_year` | integer | Year of death (null if alive) |
| `death_year_precision` | enum | Precision: exact, month, year, decade, approximate, unknown |
| `death_place` | varchar | City, Country or just Country |
| `bio` | text | Biography/background |
| `achievements` | text | Awards, recognitions, notable accomplishments |

**New FK in `public.users`:**

| Field | Type | Description |
|-------|------|-------------|
| `profile_id` | uuid (FK) | References `genealogy.person_profiles.id`, nullable |

**From `public.groups` to `genealogy.group_profiles`:**

| Old Location | New Location | Notes |
|--------------|--------------|-------|
| `groups.description` | `group_profiles.description` | Identity/history |
| `groups.style` | `group_profiles.style` | Capoeira-specific |
| `groups.logo` | `group_profiles.logo` | Visual identity |
| `groups.links` | `group_profiles.links` | Social links |
| `groups.founder` | (removed) | Use `founded` predicate instead |
| `groups.leader` | (removed) | Use `leads` predicate instead |

**New fields in `genealogy.group_profiles`:**

| Field | Type | Description |
|-------|------|-------------|
| `style_notes` | text | e.g., "Originally Regional, evolved to Contemporânea" |
| `name_aliases` | text[] | Alternative names, abbreviations (e.g., ["GCAP"]) |
| `founded_year` | integer | Year group was founded |
| `founded_year_precision` | enum | Precision: exact, month, year, decade, approximate, unknown |
| `founded_location` | varchar | City, Country |
| `philosophy` | text | Group's stated philosophy/mission |
| `history` | text | Long-form group history |
| `name_history` | jsonb | Array of {name, started_at, ended_at, reason} |
| `legal_structure` | enum | for_profit, non_profit, association_ev, etc. |
| `is_headquarters` | boolean | Whether this is the HQ location |
| `is_active` | boolean | Whether group is currently active |
| `dissolved_at` | date | When group ceased operations (null if active) |

**New FK in `public.groups`:**

| Field | Type | Description |
|-------|------|-------------|
| `profile_id` | uuid (FK) | References `genealogy.group_profiles.id`, nullable |

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

    // Profile fields from person_profiles (aliased for API compatibility)
    name: personProfiles.name,
    nickname: personProfiles.apelido,  // alias!
    title: personProfiles.title,
    avatar: personProfiles.avatar,
    links: personProfiles.links,
  })
  .from(users)
  .leftJoin(personProfiles, eq(users.profileId, personProfiles.id))
  .where(eq(users.id, id));
// Returns: { id, name, nickname, title, avatar, email, ... } - same shape!
```

**Example - createUser:**
```typescript
// Before: Single insert
await db.insert(users).values({ name, nickname, title, email, ... });

// After: Transaction with two inserts
await db.transaction(async (tx) => {
  // 1. Create person_profile first (genealogy schema)
  const [profile] = await tx
    .insert(personProfiles)
    .values({
      name,
      apelido: nickname,  // map nickname → apelido
      title,
      avatar,
      links,
    })
    .returning();

  // 2. Create user with FK to profile
  const [user] = await tx
    .insert(users)
    .values({
      email,
      passwordHash,
      accountStatus,
      profileId: profile.id,  // link to profile
    })
    .returning();

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

-- Predicates (19 total)
-- Direction convention: predicates flow from "younger/newer" to "older/established"
-- (student → mestre, child → parent, new group → predecessor)
CREATE TYPE genealogy.predicate AS ENUM (
  -- Person-to-Person: Training & Lineage (3)
  'student_of',
  'trained_under',
  'influenced_by',

  -- Person-to-Person: Recognition (2)
  'received_title_from',
  'baptized_by',  -- Person was baptized BY mestre (received apelido from)

  -- Person-to-Person: Family (1)
  'family_of',

  -- Person-to-Group: Founding & Leadership (4)
  'founded',
  'co_founded',
  'leads',
  'regional_coordinator_of',

  -- Person-to-Group: Membership & Affiliation (5)
  'member_of',
  'teaches_at',
  'cultural_pioneer_of',
  'associated_with',
  'departed_from',

  -- Group-to-Group: Hierarchical (1)
  'part_of',

  -- Group-to-Group: Evolution (3)
  'split_from_group',
  'merged_into',
  'evolved_from',

  -- Group-to-Group: Affiliation (2)
  'affiliated_with',
  'cooperates_with'
);
```

### Person Profiles Table

```sql
-- Date precision enum (for historical data with uncertainty)
CREATE TYPE genealogy.date_precision AS ENUM (
  'exact',       -- Known to the day
  'month',       -- Known to the month
  'year',        -- Known to the year
  'decade',      -- Known to the decade (e.g., "early 1970s")
  'approximate', -- Rough estimate
  'unknown'      -- No date information
);

CREATE TABLE genealogy.person_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Identity (moved from users)
  name VARCHAR(255),
  apelido VARCHAR(100),  -- capoeira nickname (was users.nickname)
  title public.title,    -- reuse existing enum from public schema
  avatar VARCHAR(500),
  links JSONB DEFAULT '[]',  -- social links array

  -- Capoeira-specific (new)
  style public.style,    -- primary style (reuse existing enum)
  style_notes TEXT,      -- e.g., "Transitioned from Regional to Angola in 1985"

  -- Life dates
  birth_year INTEGER,
  birth_year_precision genealogy.date_precision DEFAULT 'unknown',
  birth_place VARCHAR(255),   -- City, Country or just Country
  death_year INTEGER,         -- null if alive
  death_year_precision genealogy.date_precision DEFAULT 'unknown',
  death_place VARCHAR(255),

  -- Extended content
  bio TEXT,              -- Biography/background
  achievements TEXT,     -- Awards, recognitions, notable accomplishments

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Constraints
  CONSTRAINT person_profiles_birth_before_death CHECK (
    death_year IS NULL OR birth_year IS NULL OR birth_year <= death_year
  )
);

-- Indexes
CREATE INDEX person_profiles_apelido_idx ON genealogy.person_profiles(apelido);
CREATE INDEX person_profiles_title_idx ON genealogy.person_profiles(title);
CREATE INDEX person_profiles_style_idx ON genealogy.person_profiles(style);

-- Trigger for updated_at
CREATE TRIGGER person_profiles_updated_at
  BEFORE UPDATE ON genealogy.person_profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at_column();

-- Add FK column to public.users (in separate migration after table exists)
ALTER TABLE public.users
  ADD COLUMN profile_id UUID REFERENCES genealogy.person_profiles(id) ON DELETE SET NULL;

-- UNIQUE index ensures a person_profile can only be claimed by ONE user
CREATE UNIQUE INDEX users_profile_id_idx ON public.users(profile_id);
```

### Group Profiles Table

```sql
-- Legal structure enum
CREATE TYPE genealogy.legal_structure AS ENUM (
  'for_profit',
  'non_profit',
  'nonprofit_501c3',     -- USA specific
  'association_ev',      -- German e.V.
  'association_loi1901', -- French
  'informal',
  'mixed'                -- Different in different countries
);

CREATE TABLE genealogy.group_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Extended data (moved from groups)
  description TEXT,          -- moved from groups (identity/history)
  style public.style,        -- moved from groups (capoeira-specific)
  style_notes TEXT,          -- e.g., "Originally Regional, evolved to Contemporânea"
  logo VARCHAR(500),         -- moved from groups (visual identity)
  links JSONB DEFAULT '[]',  -- social links array

  -- Identity enhancements (new)
  name_aliases TEXT[],       -- alternative names, abbreviations (e.g., ["GCAP", "Capoeira Angola Palmares"])

  -- Founding details (new)
  founded_year INTEGER,
  founded_year_precision genealogy.date_precision DEFAULT 'unknown',
  founded_location VARCHAR(255),  -- City, Country

  -- Extended content (new)
  philosophy TEXT,           -- group's stated philosophy/mission
  history TEXT,              -- long-form group history

  -- Name history for tracking name changes over time
  name_history JSONB DEFAULT '[]',
  -- Schema: [{ name: string, started_at: string, ended_at?: string,
  --            change_reason?: string, context?: string }]

  -- Organizational (new)
  legal_structure genealogy.legal_structure,
  is_headquarters BOOLEAN DEFAULT false,

  -- Status (new)
  is_active BOOLEAN DEFAULT true,
  dissolved_at DATE,         -- when group ceased operations (null if active)

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX group_profiles_style_idx ON genealogy.group_profiles(style);
CREATE INDEX group_profiles_is_active_idx ON genealogy.group_profiles(is_active);

-- Trigger for updated_at
CREATE TRIGGER group_profiles_updated_at
  BEFORE UPDATE ON genealogy.group_profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at_column();

-- Add FK column to public.groups (in separate migration after table exists)
ALTER TABLE public.groups
  ADD COLUMN profile_id UUID REFERENCES genealogy.group_profiles(id) ON DELETE SET NULL;

CREATE INDEX groups_profile_id_idx ON public.groups(profile_id);

-- Remove deprecated columns from public.groups
ALTER TABLE public.groups DROP COLUMN leader;
ALTER TABLE public.groups DROP COLUMN description;  -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN style;        -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN logo;         -- moved to group_profiles
```

### Statements Table

```sql
CREATE TABLE genealogy.statements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Subject (who/what this statement is about)
  -- If subject_type = 'person': subject_id references genealogy.person_profiles.id
  -- If subject_type = 'group': subject_id references genealogy.group_profiles.id
  -- (self-contained within genealogy schema)
  subject_type genealogy.entity_type NOT NULL,
  subject_id UUID NOT NULL,

  -- Predicate (relationship type)
  predicate genealogy.predicate NOT NULL,

  -- Object (who/what they're related to)
  -- If object_type = 'person': object_id references genealogy.person_profiles.id
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
  created_by UUID,  -- tracks who created this statement (app user id, not enforced by FK)

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
3. Create tables (person_profiles, group_profiles, statements)
4. Create indexes and triggers
5. Add `profile_id` FK columns to `public.users` and `public.groups`

**Risk:** None - additive only

### Phase 2: Data Migration

```sql
-- 2a. Migrate user profile data to person_profiles and link back
INSERT INTO genealogy.person_profiles (id, name, apelido, title, avatar, links)
SELECT gen_random_uuid(), name, nickname, title, avatar, links
FROM public.users
WHERE account_status != 'managed_profile';  -- handle managed separately if exists

-- 2b. Update users to point to their new person_profiles
UPDATE public.users u
SET profile_id = pp.id
FROM genealogy.person_profiles pp
WHERE pp.apelido = u.nickname  -- or match on another unique field
  AND pp.name = u.name;

-- 2c. Create group_profiles for existing groups and link back
INSERT INTO genealogy.group_profiles (id, description, style, logo, links)
SELECT gen_random_uuid(), description, style, logo, links
FROM public.groups;

-- 2d. Update groups to point to their new group_profiles
UPDATE public.groups g
SET profile_id = gp.id
FROM genealogy.group_profiles gp
WHERE gp.logo = g.logo AND gp.description = g.description;  -- match on multiple fields

-- 2e. Drop columns from public tables (AFTER updating queries)
-- This happens in Phase 4 after queries are updated
```

**Risk:** Low - data copy, originals preserved

### Phase 3: Update DB Queries

Update all queries in `apps/quilombo/db/queries/`:

**users.ts:**
- `fetchUser` - join with person_profiles via profileId
- `fetchSessionData` - join with person_profiles (for display name)
- `searchUsers` - join with person_profiles
- `createUser` - transaction: insert person_profiles first, then users with profileId
- `updateUser` - transaction: update users + person_profiles
- `upsertUser` - transaction: upsert users + person_profiles

**groups.ts:**
- `fetchGroup` - join with group_profiles via profileId
- `searchGroups` - join with group_profiles
- `createGroup` - transaction: insert group_profiles first, then groups with profileId
- `updateGroup` - transaction: update groups + group_profiles
- Remove all references to `groups.leader`

**New genealogy.ts:**
- `fetchPersonProfile` - direct query (for genealogy visualization)
- `fetchPersonProfileByUserId` - lookup by user's profileId
- `createPersonProfile` - for historical figures (no user)
- `searchPersonProfiles` - for genealogy search
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
ALTER TABLE public.groups DROP COLUMN description;  -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN style;        -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN logo;         -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN links;        -- moved to group_profiles
ALTER TABLE public.groups DROP COLUMN founder;      -- replaced by predicate
ALTER TABLE public.groups DROP COLUMN leader;       -- replaced by `leads` predicate
```

**Risk:** High - irreversible. Must verify all queries work first.

### Phase 5: Update Claimable Profiles Spec

The claimable-profiles.md spec needs revision:
- Remove "managed profiles ARE user records" approach
- Claiming = setting `users.profile_id` to an existing `person_profiles.id`
- No complex merge algorithm needed
- Historical figures exist as `person_profiles` records with no linked user

---

## Drizzle Schema Updates

### New Schema File: `db/schema/genealogy.ts`

```typescript
import { relations } from 'drizzle-orm';
import {
  pgSchema,
  uuid,
  varchar,
  text,
  integer,
  boolean,
  timestamp,
  date,
  jsonb,
  index,
} from 'drizzle-orm/pg-core';
import { titleEnum, styleEnum } from './schema';
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

export const datePrecisionEnum = genealogySchema.enum('date_precision', [
  'exact',
  'month',
  'year',
  'decade',
  'approximate',
  'unknown',
]);

export const legalStructureEnum = genealogySchema.enum('legal_structure', [
  'for_profit',
  'non_profit',
  'nonprofit_501c3',
  'association_ev',
  'association_loi1901',
  'informal',
  'mixed',
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
    styleNotes: text('style_notes'),

    // Life dates
    birthYear: integer('birth_year'),
    birthYearPrecision: datePrecisionEnum('birth_year_precision').default('unknown'),
    birthPlace: varchar('birth_place', { length: 255 }),
    deathYear: integer('death_year'),
    deathYearPrecision: datePrecisionEnum('death_year_precision').default('unknown'),
    deathPlace: varchar('death_place', { length: 255 }),

    // Extended content
    bio: text('bio'),
    achievements: text('achievements'),

    // Metadata
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
export const groupProfiles = genealogySchema.table(
  'group_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Extended data (moved from groups)
    description: text('description'),
    style: styleEnum('style'),
    styleNotes: text('style_notes'),
    logo: varchar('logo', { length: 500 }),
    links: jsonb('links').$type<SocialLink[]>().default([]),

    // Identity enhancements
    nameAliases: text('name_aliases').array(),

    // Founding details
    foundedYear: integer('founded_year'),
    foundedYearPrecision: datePrecisionEnum('founded_year_precision').default('unknown'),
    foundedLocation: varchar('founded_location', { length: 255 }),

    // Extended content
    philosophy: text('philosophy'),
    history: text('history'),

    // Name history for tracking name changes over time
    nameHistory: jsonb('name_history').$type<{
      name: string;
      startedAt: string;
      endedAt?: string;
      changeReason?: string;
      context?: string;
    }[]>().default([]),

    // Organizational
    legalStructure: legalStructureEnum('legal_structure'),
    isHeadquarters: boolean('is_headquarters').default(false),

    // Status
    isActive: boolean('is_active').default(true),
    dissolvedAt: date('dissolved_at'),

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().defaultNow().$onUpdate(() => new Date()),
  },
  (t) => [
    index('group_profiles_style_idx').on(t.style),
    index('group_profiles_is_active_idx').on(t.isActive),
  ]
);

// Statement properties type
export type StatementProperties = {
  // For family_of
  relationship_type?: 'parent' | 'sibling' | 'spouse' | 'padrinho' | 'other';
  other_type?: string;

  // For received_title_from
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

// Statements table (NO FK to public schema - fully self-contained)
export const statements = genealogySchema.table(
  'statements',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Subject (who/what this statement is about)
    // If 'person': references genealogy.person_profiles.id
    // If 'group': references genealogy.group_profiles.id
    // (self-contained within genealogy schema)
    subjectType: entityTypeEnum('subject_type').notNull(),
    subjectId: uuid('subject_id').notNull(),

    // Predicate
    predicate: predicateEnum('predicate').notNull(),

    // Object (who/what they're related to)
    // If 'person': references genealogy.person_profiles.id
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
    createdBy: uuid('created_by'),  // tracks who created (app user id, no FK constraint)
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

### Updated `db/schema.ts` (After Migration)

```typescript
import { personProfiles, groupProfiles } from './genealogy';

// Remove these fields from users table:
// - name
// - nickname
// - title
// - avatar
// - links

// Users becomes auth-only + FK to genealogy:
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

    // Link to genealogy profile (NEW - nullable for users without profiles yet)
    profileId: uuid('profile_id').references(() => personProfiles.id, { onDelete: 'set null' }),
  },
  (t) => [
    // ... existing indexes
    // UNIQUE index ensures a person_profile can only be claimed by ONE user
    uniqueIndex('users_profile_id_idx').on(t.profileId),
  ]
);

// Remove these fields from groups table:
// - description (moved to group_profiles)
// - style (moved to group_profiles)
// - logo (moved to group_profiles)
// - links (moved to group_profiles)
// - founder (replaced by predicate)
// - leader (DELETED - not used, replaced by `leads` predicate)

// Groups keeps app workflow fields + FK to genealogy:
export const groups = pgTable(
  'groups',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at').notNull().$onUpdate(() => new Date()),

    // Core identity (minimal - just name for app references)
    name: varchar('name').notNull(),
    email: text('email'),
    banner: varchar('banner'),

    // App workflow (stays here)
    createdBy: uuid('created_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedBy: uuid('claimed_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedAt: timestamp('claimed_at'),

    // Link to genealogy profile (NEW - nullable for groups without profiles yet)
    profileId: uuid('profile_id').references(() => groupProfiles.id, { onDelete: 'set null' }),

    // REMOVED: description (moved to genealogy.group_profiles)
    // REMOVED: style (moved to genealogy.group_profiles)
    // REMOVED: logo (moved to genealogy.group_profiles)
    // REMOVED: links (moved to genealogy.group_profiles)
    // REMOVED: founder (replaced by genealogy predicates)
    // REMOVED: leader (not used in UI, replaced by `leads` predicate)
  },
  (t) => [
    // ... existing indexes
    index('groups_profile_id_idx').on(t.profileId),
  ]
);

// Relations: public schema points TO genealogy schema
export const usersRelations = relations(users, ({ one }) => ({
  personProfile: one(personProfiles, {
    fields: [users.profileId],
    references: [personProfiles.id],
  }),
}));

export const groupsRelations = relations(groups, ({ one }) => ({
  groupProfile: one(groupProfiles, {
    fields: [groups.profileId],
    references: [groupProfiles.id],
  }),
}));
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
      profileId: users.profileId,
      createdAt: users.createdAt,
      updatedAt: users.updatedAt,

      // Profile fields from person_profiles (aliased for API compatibility)
      name: personProfiles.name,
      nickname: personProfiles.apelido,  // alias!
      title: personProfiles.title,
      avatar: personProfiles.avatar,
      links: personProfiles.links,

      // Extended fields (new)
      bio: personProfiles.bio,
      birthYear: personProfiles.birthYear,
      style: personProfiles.style,
    })
    .from(users)
    .leftJoin(personProfiles, eq(users.profileId, personProfiles.id))
    .where(eq(users.id, userId))
    .limit(1);

  return result[0] ?? null;
}
```

### createUser (After Migration)

```typescript
export async function createUser(data: CreateUserInput): Promise<UserWithProfile> {
  return await db.transaction(async (tx) => {
    // 1. Create person_profile first (genealogy schema)
    const [profile] = await tx
      .insert(personProfiles)
      .values({
        name: data.name,
        apelido: data.nickname,  // map from API field name
        title: data.title,
        avatar: data.avatar,
        links: data.links ?? [],
      })
      .returning();

    // 2. Create user record with FK to profile
    const [user] = await tx
      .insert(users)
      .values({
        id: data.id ?? crypto.randomUUID(),
        email: data.email?.toLowerCase(),
        passwordHash: data.passwordHash,
        walletAddress: data.walletAddress,
        accountStatus: data.accountStatus ?? 'active',
        profileId: profile.id,  // link to person_profile
      })
      .returning();

    // 3. Return combined shape for API compatibility
    return {
      ...user,
      name: profile.name,
      nickname: profile.apelido,
      title: profile.title,
      avatar: profile.avatar,
      links: profile.links,
    };
  });
}
```

### fetchGroup (After Migration)

```typescript
export async function fetchGroup(groupId: string): Promise<GroupWithProfile | null> {
  const result = await db
    .select({
      // Core from groups (app workflow only)
      id: groups.id,
      name: groups.name,
      email: groups.email,
      banner: groups.banner,
      createdBy: groups.createdBy,
      claimedBy: groups.claimedBy,
      claimedAt: groups.claimedAt,
      profileId: groups.profileId,
      createdAt: groups.createdAt,
      updatedAt: groups.updatedAt,

      // Extended from group_profiles (capoeira identity)
      description: groupProfiles.description,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      links: groupProfiles.links,
      foundedYear: groupProfiles.foundedYear,
      nameHistory: groupProfiles.nameHistory,
    })
    .from(groups)
    .leftJoin(groupProfiles, eq(groups.profileId, groupProfiles.id))
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
import type { SelectPersonProfile, SelectGroupProfile } from '@/db/schema/genealogy';

// Combined type for API responses (maintains backward compatibility)
export type UserWithProfile = Omit<SelectUser, 'name' | 'nickname' | 'title' | 'avatar' | 'links'> & {
  name: string | null;
  nickname: string | null;  // aliased from apelido
  title: SelectPersonProfile['title'];
  avatar: string | null;
  links: SocialLink[];
  // Extended fields (optional in responses)
  bio?: string | null;
  birthYear?: number | null;
  style?: SelectPersonProfile['style'];
};

export type GroupWithProfile = Omit<SelectGroup, 'description' | 'style' | 'logo' | 'links' | 'founder' | 'leader'> & {
  // All capoeira identity fields from group_profiles
  description: string | null;
  style: SelectGroupProfile['style'];
  logo: string | null;
  links: SocialLink[];
  foundedYear: number | null;
  nameHistory: SelectGroupProfile['nameHistory'];
};

// For genealogy-only queries (no user/group link required)
export type PersonProfile = SelectPersonProfile;
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
3. **Revise claimable-profiles spec** - simplify to use `users.profile_id` linking
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

### 2. `groups.leader` - DELETE (Not Used)

**Decision:** Delete `groups.leader` column entirely.

**Rationale:**
- Analysis confirmed it's NOT displayed in any editable UI
- Only used for role chip display in GroupMembers component (can be removed)
- Will be replaced by `leads` predicate in genealogy schema
- No reason to keep unused column

### 3. Groups Strategy - Parallel Structure (Users → PersonProfiles, Groups → GroupProfiles)

**Decision:** Keep `public.groups` as minimal app reference, move ALL capoeira identity to `genealogy.group_profiles`.

**Rationale:**
- `public.groups` = app entity (name, email, banner, permissions, claims, verifications, locations)
- `genealogy.group_profiles` = capoeira identity (description, style, logo, links, founded_year, name_history)
- Same pattern as `users` → `person_profiles`: clean separation of app and genealogy concerns
- Internal permissions (groupAdmins) stay tied to `public.groups.id`
- Historical groups still need a `public.groups` record to be referenced

**Fields in `public.groups`:**
- `id`, `name` - core identifier
- `email`, `banner` - app workflow/UI
- `createdBy`, `claimedBy`, `claimedAt` - app workflow
- `profile_id` - FK to group_profiles

**Fields in `genealogy.group_profiles`:**
- `description`, `style`, `logo`, `links` - capoeira identity (moved from groups)
- `founded_year`, `name_history` - genealogy-specific (new)

**Implication:** No "genealogy-only" groups. Every group in the system has a `public.groups` record, optionally extended by `genealogy.group_profiles`.

### 4. FK Direction - Public Points TO Genealogy

**Decision:** All foreign keys flow FROM public schema TO genealogy schema.

**Rationale:**
- `users.profile_id` → `genealogy.person_profiles.id`
- `groups.profile_id` → `genealogy.group_profiles.id`
- Genealogy schema is FULLY SELF-CONTAINED (no FKs pointing out)
- This allows genealogy data to exist independently (historical figures, unclaimed profiles)
- Cleaner separation of concerns

### 5. Naming Convention - Consistent `*_profiles` Pattern

**Decision:** Rename `persons` to `person_profiles` for consistency.

**Rationale:**
- `users.profile_id` → `person_profiles.id` (consistent naming)
- `groups.profile_id` → `group_profiles.id` (consistent naming)
- Clear semantic: profiles are extensions of app entities

### 6. Migration Timing

**Decision:** Schema first (additive), then prototype, then data migration, then drop old columns.

**Sequence:**
1. Add genealogy schema and tables (no breaking changes)
2. Add `profile_id` FK columns to `users` and `groups`
3. Build visualization prototype using genealogy schema
4. Update DB queries to join across schemas
5. Migrate data from old columns to new tables + link FKs
6. Test thoroughly
7. Drop old columns from `users` and `groups` (including `description`, `style`, `logo`, `leader`)

### 7. User Onboarding Flow - Deferred Profile Creation

**Decision:** Don't auto-create `person_profiles` on user signup. Keep `users.profile_id = NULL` until user explicitly creates or claims a profile.

**Rationale:**
- New users may not know if they should create a new profile or claim an existing one
- Avoids creating orphan profiles that need later cleanup
- Users who never engage with genealogy simply have no profile (that's fine)
- Clear UX: explicit choice during onboarding

**Onboarding Flow:**
```
New User Signs Up
       ↓
  users record created (profile_id = NULL)
       ↓
  Onboarding prompt: "Are you a capoeirista?"
       ↓
    ┌──────┴──────┐
   No            Yes
    ↓              ↓
  Skip       "Search for yourself"
  (done)           ↓
           ┌───────┴───────┐
        Found          Not Found
           ↓               ↓
      "Claim this      "Create new
       profile"         profile"
           ↓               ↓
      Verification    person_profiles created
      workflow        users.profile_id set
           ↓
      users.profile_id set
```

**Edge Case - Profile Merge:**
If a user creates a new profile but later realizes they should claim an existing one:
1. User requests claim on existing profile
2. Admin reviews and approves
3. Admin transfers any statements from user's current profile to claimed profile
4. Admin deletes the orphaned profile
5. User's `profile_id` is updated to claimed profile

### 8. Tree Navigation - On-Demand App ID Lookup

**Decision:** Tree stores only `profile_id` (genealogy IDs). Lookup `app_id` (users.id or groups.id) on-demand when navigating.

**Rationale:**
- Tree data is already large with relationships - don't bloat with extra IDs
- Most tree nodes are just visual - users won't click every node
- Single indexed lookup is ~10-50ms, negligible UX impact
- Simpler tree query = faster initial load
- Scale: ~1K-5K groups, ~100K-500K persons max (reasonable upper bounds)

**Implementation:**
```typescript
// On tree node click
async function navigateFromTreeNode(node: TreeNode) {
  if (node.type === 'person') {
    const result = await db
      .select({ id: users.id })
      .from(users)
      .where(eq(users.profileId, node.profileId))
      .limit(1);

    if (result[0]) {
      // User exists - navigate to full app profile
      navigate(`/users/${result[0].id}`);
    } else {
      // Historical figure - show read-only genealogy view
      navigate(`/genealogy/person/${node.profileId}`);
    }
  } else {
    // Groups always have app records
    const result = await db
      .select({ id: groups.id })
      .from(groups)
      .where(eq(groups.profileId, node.profileId))
      .limit(1);

    navigate(`/groups/${result[0]?.id}`);
  }
}
```

**Trade-off:**
- Pro: Smaller tree payload, simpler tree queries
- Con: Extra DB call per navigation
- Verdict: Good trade-off given scale and usage patterns

### 9. Drizzle Multi-File Schema Setup

**Decision:** Organize Drizzle schemas in `db/schema/` directory with glob pattern in config.

**Structure:**
```
db/
├── schema/
│   ├── public.ts       # Current public schema tables (users, groups, etc.)
│   ├── genealogy.ts    # Genealogy schema tables (person_profiles, group_profiles, statements)
│   └── index.ts        # Re-exports both schemas
├── queries/
│   └── ...
└── index.ts            # DB connection + query re-exports
```

**drizzle.config.ts:**
```typescript
export default {
  schema: './db/schema/**/*.ts',  // Glob pattern picks up all schema files
  out: './db/migrations',
  dialect: 'postgresql',
  // ... rest of config
} satisfies Config;
```

**Rationale:**
- Clear separation between schemas
- Each schema file is self-contained
- Easy to add more schemas in future
- Drizzle-kit and Atlas both handle this automatically

### 10. Enum Pattern - Constants + Models

**Decision:** Follow existing codebase pattern for enums: define in `constants.ts` as arrays, derive types in `models.ts`.

**Implementation:**
```typescript
// config/constants.ts
export const DATE_PRECISIONS = [
  'exact',
  'month',
  'year',
  'decade',
  'approximate',
  'unknown',
] as const;

export const CONFIDENCE_LEVELS = [
  'verified',
  'likely',
  'unverified',
  'disputed',
  'uncertain',
] as const;

export const LEGAL_STRUCTURES = [
  'for_profit',
  'non_profit',
  'nonprofit_501c3',
  'association_ev',
  'association_loi1901',
  'informal',
  'mixed',
] as const;

export const PREDICATES = [
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
] as const;

// models.ts (or types/genealogy.ts)
export type DatePrecision = (typeof DATE_PRECISIONS)[number];
export type ConfidenceLevel = (typeof CONFIDENCE_LEVELS)[number];
export type LegalStructure = (typeof LEGAL_STRUCTURES)[number];
export type Predicate = (typeof PREDICATES)[number];
```

**In Drizzle schema:**
```typescript
import { DATE_PRECISIONS, CONFIDENCE_LEVELS, PREDICATES } from '@/config/constants';

export const datePrecisionEnum = genealogySchema.enum('date_precision', [...DATE_PRECISIONS]);
export const confidenceEnum = genealogySchema.enum('confidence', [...CONFIDENCE_LEVELS]);
export const predicateEnum = genealogySchema.enum('predicate', [...PREDICATES]);
```

**Rationale:**
- Arrays can be used for validation (Yup `.oneOf()`)
- Types derived from arrays stay in sync automatically
- Consistent with existing codebase patterns
- Enums are importable anywhere without DB dependencies
