# Flow 4: Groups Schema Migration

## Overview

This spec covers the migration of group identity data from `public.groups` to `genealogy.group_profiles`. Unlike users (where genealogy profiles are optional), **all groups must have a genealogy profile** as the source of truth for identity data.

This is a **breaking change** to existing functionality and must be implemented carefully to maintain backwards compatibility during transition.

## Goal

Consolidate group identity data in `genealogy.group_profiles`:
- Remove duplicate/redundant columns from `public.groups`
- Update all queries, APIs, and UI to read from genealogy
- Maintain `public.groups` only for app-specific operational data

## Schema Changes

### Before (Current State)

```
public.groups                        genealogy.group_profiles
├── id                               ├── id
├── name ◄─── DUPLICATE ───────────► ├── name
├── description ◄── DUPLICATE ─────► ├── description_en/pt
├── style ◄──── DUPLICATE ─────────► ├── style
├── logo ◄───── DUPLICATE ─────────► ├── logo
├── links ◄──── DUPLICATE ─────────► ├── links
├── email                            ├── founded_year
├── banner                           ├── founded_location
├── leader_id ◄── DEPRECATED         ├── history_en/pt
├── founder ◄──── DEPRECATED         ├── philosophy_en/pt
├── created_by                       └── ...
├── claimed_by
├── claimed_at
├── profile_id ─────────────────────►
└── verified
```

### After (Target State)

```
public.groups                        genealogy.group_profiles
├── id                               ├── id
├── email                            ├── name (source of truth)
├── banner                           ├── description_en/pt
├── created_by                       ├── style
├── claimed_by                       ├── logo
├── claimed_at                       ├── links
├── profile_id ─────────────────────► ├── founded_year
└── verified                         └── ...
```

### Columns to Remove from `public.groups`

| Column | Reason | Migration |
|--------|--------|-----------|
| `name` | Moved to genealogy | Read from `group_profiles.name` |
| `description` | Moved to genealogy | Read from `group_profiles.description_en` |
| `style` | Moved to genealogy | Read from `group_profiles.style` |
| `logo` | Moved to genealogy | Read from `group_profiles.logo` |
| `links` | Moved to genealogy | Read from `group_profiles.links` |
| `leader_id` | Use `leads` predicate | Query statements table |
| `founder` | Use `founded` predicate | Query statements table |

### Columns to Keep in `public.groups`

| Column | Reason |
|--------|--------|
| `id` | Primary key for app relationships |
| `email` | Operational contact (not public genealogy) |
| `banner` | App-specific display (not genealogy data) |
| `created_by` | Tracks who registered the group in app |
| `claimed_by` | Tracks who claimed the group (for rewards/attribution) |
| `claimed_at` | When the group was claimed |
| `profile_id` | FK to genealogy (required, NOT NULL) |
| `verified` | App-specific trust signal |

## Implementation Phases

### Phase 4.1: Add Profile Requirement

**Constraint**: `public.groups.profile_id` becomes NOT NULL

This requires Flow 3 (group claiming/registration) to be implemented first, as all new groups will be created via the claim workflow which creates both records.

**Migration for existing groups**:

Production has only **1 existing group**, so migration is trivial:
1. Manually create `genealogy.group_profiles` entry for the one group
2. Link via `UPDATE public.groups SET profile_id = ...`
3. Add NOT NULL constraint

**Note**: Only migrate core attributes (name, description, style, logo, links). Do NOT migrate relationships like founder/leader - admins can re-add these via the UI after migration.

```sql
-- Migration: Create profile for the single existing group (core attributes only)
INSERT INTO genealogy.group_profiles (id, name, description_en, style, logo, links)
SELECT
  gen_random_uuid(),
  g.name,
  g.description,
  g.style,
  g.logo,
  g.links
FROM public.groups g
WHERE g.profile_id IS NULL
RETURNING id;

-- Link profile back to group (single row)
UPDATE public.groups g
SET profile_id = (
  SELECT gp.id FROM genealogy.group_profiles gp
  WHERE gp.name = g.name
  LIMIT 1
)
WHERE g.profile_id IS NULL;

-- Add NOT NULL constraint
ALTER TABLE public.groups
ALTER COLUMN profile_id SET NOT NULL;
```

### Phase 4.2: Update Read Queries

All queries that read group identity data must JOIN to genealogy:

**Before**:
```typescript
const group = await db.select({
  id: groups.id,
  name: groups.name,
  style: groups.style,
  logo: groups.logo,
}).from(groups);
```

**After**:
```typescript
const group = await db.select({
  id: groups.id,
  name: groupProfiles.name,
  style: groupProfiles.style,
  logo: groupProfiles.logo,
  verified: groups.verified,
}).from(groups)
  .innerJoin(groupProfiles, eq(groups.profileId, groupProfiles.id));
```

**Affected files**:
- `db/queries/groups.ts` - All group fetch functions
- `db/queries/groupLocations.ts` - Location queries with group data
- `app/api/groups/[groupId]/route.ts` - GET endpoint
- `app/api/groups/search/route.ts` - Search endpoint
- `app/api/groups/route.ts` - List endpoint (if exists)

### Phase 4.3: Update Write Operations

Group identity updates go to genealogy, not groups:

**Before** (`PATCH /api/groups/[groupId]`):
```typescript
await db.update(groups)
  .set({ name, description, style })
  .where(eq(groups.id, groupId));
```

**After** (`PATCH /api/genealogy/groups/[profileId]`):
```typescript
await db.update(groupProfiles)
  .set({ name, descriptionEn, style })
  .where(eq(groupProfiles.id, profileId));
```

**Affected endpoints**:
- `PATCH /api/groups/[groupId]` → Remove identity fields, keep operational only
- `POST /api/groups/[groupId]/logo` → Move to `PATCH /api/genealogy/groups/[profileId]`
- Create new: `PATCH /api/genealogy/groups/[profileId]` for identity updates

### Phase 4.4: Update UI Components

**Group Edit Form** (`/groups/[groupId]/edit`):
- Remove: name, description, style, logo fields
- Keep: email, banner, locations, admins, verification

**Group Profile View** (`/groups/[groupId]`):
- Read name, style, logo, description from genealogy profile
- Display "Edit Genealogy Profile" button for admins

**Group Search/List**:
- Update to use joined data from genealogy

**Affected components**:
```
components/groups/
  GroupProfile/
    index.tsx          # Read from genealogy
  GroupCard.tsx        # Read from genealogy
  forms/
    GroupEditForm.tsx  # Remove identity fields
```

### Phase 4.5: Migrate Leader/Founder to Predicates

**Before**:
- `groups.leader_id` → FK to users
- `groups.founder` → varchar string

**After**:
- Leader: Query `statements` for `leads` predicate where object is group
- Founder: Query `statements` for `founded` predicate where object is group

```typescript
// Get group leaders
const leaders = await db.select({
  personId: statements.subjectId,
  personName: personProfiles.name,
  personApelido: personProfiles.apelido,
})
.from(statements)
.innerJoin(personProfiles, eq(statements.subjectId, personProfiles.id))
.where(
  and(
    eq(statements.predicate, 'leads'),
    eq(statements.objectType, 'group'),
    eq(statements.objectId, profileId),
    isNull(statements.endedAt) // Current leader
  )
);
```

### Phase 4.6: Remove Deprecated Columns

After all code is updated and tested:

```sql
ALTER TABLE public.groups
  DROP COLUMN name,
  DROP COLUMN description,
  DROP COLUMN style,
  DROP COLUMN logo,
  DROP COLUMN links,
  DROP COLUMN leader_id,
  DROP COLUMN founder;
```

Note: `claimed_by` and `claimed_at` are **kept** for tracking who claimed group management (useful for rewards/attribution).

## API Changes

### Deprecated Endpoints

| Old Endpoint | New Endpoint | Notes |
|--------------|--------------|-------|
| `PATCH /api/groups/[groupId]` (identity) | `PATCH /api/genealogy/groups/[profileId]` | Identity data |
| `POST /api/groups/[groupId]/logo` | `PATCH /api/genealogy/groups/[profileId]` | Logo in genealogy |

### Updated Endpoints

| Endpoint | Change |
|----------|--------|
| `GET /api/groups/[groupId]` | JOIN to genealogy for identity data |
| `GET /api/groups/search` | JOIN to genealogy for identity data |
| `PATCH /api/groups/[groupId]` | Only operational fields (email, banner, verified) |

### New Endpoints (from Flow 3)

| Endpoint | Purpose |
|----------|---------|
| `PATCH /api/genealogy/groups/[profileId]` | Update genealogy profile (identity) |

## Component Changes

### GroupEditForm Refactor

**Current fields**:
- name, description, style, logo, banner, email, links

**After refactor**:
- banner, email (operational only)
- Button: "Edit Genealogy Profile" → navigates to `/groups/[groupId]/genealogy`

### New: Group Genealogy Profile Editor

Located at `/groups/[groupId]/genealogy` (from Flow 3C):
- Name, description (en/pt), style, logo, links
- Founded year, founded location
- History (en/pt), philosophy (en/pt)
- Lineage connections (parent group, affiliations)
- Founder/leader relationships

### GroupProfile/GroupCard Updates

- Fetch data via JOIN to genealogy
- Display genealogy profile data as primary
- Show operational data (locations, verified status) from groups table

## Database Query Patterns

### Unified Group Type

```typescript
// types/group.ts
export type GroupWithProfile = {
  // From public.groups
  id: string;
  email: string | null;
  banner: string | null;
  verified: boolean;
  createdBy: string | null;
  claimedBy: string | null;
  claimedAt: Date | null;
  profileId: string;

  // From genealogy.group_profiles
  name: string;
  descriptionEn: string | null;
  descriptionPt: string | null;
  style: Style | null;
  logo: string | null;
  links: string[];
  foundedYear: number | null;
  foundedLocation: string | null;
  historyEn: string | null;
  historyPt: string | null;
  philosophyEn: string | null;
  philosophyPt: string | null;
  isActive: boolean;
};
```

### Standard Query Pattern

```typescript
// db/queries/groups.ts
export async function fetchGroup(groupId: string): Promise<GroupWithProfile | null> {
  const result = await db
    .select({
      // Groups table
      id: groups.id,
      email: groups.email,
      banner: groups.banner,
      verified: groups.verified,
      createdBy: groups.createdBy,
      claimedBy: groups.claimedBy,
      claimedAt: groups.claimedAt,
      profileId: groups.profileId,
      // Genealogy profile
      name: groupProfiles.name,
      descriptionEn: groupProfiles.descriptionEn,
      descriptionPt: groupProfiles.descriptionPt,
      style: groupProfiles.style,
      logo: groupProfiles.logo,
      links: groupProfiles.links,
      foundedYear: groupProfiles.foundedYear,
      foundedLocation: groupProfiles.foundedLocation,
      historyEn: groupProfiles.historyEn,
      historyPt: groupProfiles.historyPt,
      philosophyEn: groupProfiles.philosophyEn,
      philosophyPt: groupProfiles.philosophyPt,
      isActive: groupProfiles.isActive,
    })
    .from(groups)
    .innerJoin(groupProfiles, eq(groups.profileId, groupProfiles.id))
    .where(eq(groups.id, groupId))
    .limit(1);

  return result[0] ?? null;
}
```

## Testing Requirements

### Unit Tests

- Query functions return correct data from joined tables
- API endpoints validate genealogy profile exists
- Form components render correct fields

### Integration Tests

- Group creation creates both records
- Group update updates correct table based on field
- Group search returns correct data
- Leader/founder queries work via predicates

### Migration Tests

- All existing groups get genealogy profiles
- No data loss during migration
- Rollback works correctly

## Rollback Strategy

If issues arise:
1. Keep deprecated columns until migration is complete
2. Add `_deprecated` suffix to columns instead of dropping
3. Maintain backwards-compatible views during transition

```sql
-- Backwards-compatible view during transition
CREATE VIEW groups_compat AS
SELECT
  g.id,
  COALESCE(gp.name, g.name) as name,
  COALESCE(gp.description_en, g.description) as description,
  COALESCE(gp.style, g.style) as style,
  COALESCE(gp.logo, g.logo) as logo,
  g.email,
  g.banner,
  g.verified,
  g.profile_id
FROM public.groups g
LEFT JOIN genealogy.group_profiles gp ON g.profile_id = gp.id;
```

## Dependencies

- **Flow 3 must be complete first**: Group claiming/registration workflow creates both records
- **Genealogy schema must exist**: `genealogy.group_profiles` and `genealogy.statements`

## Success Metrics

- All groups have `profile_id` set (NOT NULL constraint holds)
- No queries reference deprecated columns
- UI shows data from genealogy profile
- Leader/founder displayed from predicates
- No regression in group functionality

## Timeline Considerations

This migration should happen **after** Flow 3 is complete because:
1. New group registration creates genealogy profile first
2. Existing groups need profiles before we can remove columns
3. UI patterns established in Flow 3 inform this refactor

Suggested order:
1. Flow 3A/3B: Group registration/claiming (creates profiles)
2. Phase 4.1: Migrate existing groups to have profiles
3. Phase 4.2-4.4: Update queries and UI
4. Phase 4.5: Migrate leader/founder to predicates
5. Phase 4.6: Remove deprecated columns (can be deferred)
