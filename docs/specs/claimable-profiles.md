# Claimable Profiles: Person Profiles in the Genealogy System

**Version:** 3.0
**Last Updated:** 2025-12-05
**Status:** Specification (Updated to align with Genealogy Architecture v2)
**Target Platform:** Quilombo (Next.js 15 + PostgreSQL)
**Depends On:**
- [Genealogy Architecture Proposal](./genealogy-tree/genealogy-architecture-proposal.md)
- [Genealogy Data Model Proposal](./genealogy-tree/genealogy-data-model-proposal.md)

---

## Executive Summary

This spec defines how person profiles are created, managed, and claimed within the genealogy system. The architecture cleanly separates:

- **`public.users`** = App accounts (authentication, authorization, sessions)
- **`genealogy.person_profiles`** = Capoeira identities (lineage, history, relationships)

**Core Value Propositions:**
1. **For the Community**: Build comprehensive Capoeira genealogy including deceased mestres and historical figures
2. **For Users**: Find and reference important figures in their lineage (founders, teachers, influencers)
3. **For Admins**: Curate accurate biographical and lineage information before people join
4. **For Future Users**: Join the app and discover their profile already exists with pre-filled information
5. **For Cultural Preservation**: Honor and preserve the legacy of the mestres and mestras who shaped, spread, and keep Capoeira alive

**Key Simplification:**
Claiming a profile is trivial: just set `users.profile_id` to link the user to the person profile. No complex account merging required.

**Key Architecture Principle:**
The genealogy schema is **fully self-contained** - no foreign keys point OUT of genealogy. All FKs flow FROM public TO genealogy.

---

## Architecture Overview

```
PUBLIC SCHEMA (app/auth)              GENEALOGY SCHEMA (capoeira identity)
┌─────────────────────────┐          ┌─────────────────────────────┐
│ users                   │          │ person_profiles             │
│ ├── id (PK)             │          │ ├── id (PK)◄────────────────┼─┐
│ ├── email               │          │ ├── name                    │ │
│ ├── passwordHash        │          │ ├── apelido                 │ │
│ ├── walletAddress       │          │ ├── title                   │ │
│ ├── accountStatus       │          │ ├── avatar                  │ │
│ ├── isGlobalAdmin       │          │ ├── links                   │ │
│ ├── profileId (FK)──────┼──────────┼─┘ (UNIQUE)                  │ │
│ └── ...auth fields      │          │ ├── bio                     │ │
├─────────────────────────┤          │ ├── birth_year              │ │
│ profile_claims          │          │ ├── death_year              │ │
│ ├── person_profile_id───┼──────────┼─► (references person_profiles)
│ ├── claimer_user_id     │          │ └── ...                     │
│ ├── status              │          ├─────────────────────────────┤
│ └── ...                 │          │ statements                  │
└─────────────────────────┘          │ ├── subject_id              │
                                     │ ├── predicate               │
                                     │ ├── object_id               │
                                     │ └── ...                     │
                                     └─────────────────────────────┘

NOTES:
• genealogy schema is FULLY SELF-CONTAINED (no FKs pointing out)
• users.profile_id has UNIQUE constraint (one profile per user)
• Historical figures exist only in person_profiles (no linked user)
• All FKs flow FROM public TO genealogy

CLAIM FLOW:
┌─────────────────┐                    ┌─────────────────┐
│ person_profiles │                    │ person_profiles │
│ id: P1          │                    │ id: P1          │
│ apelido:        │                    │ apelido:        │
│ "Mestre X"      │                    │ "Mestre X"      │
└─────────────────┘                    └─────────────────┘
                                              ▲
┌─────────────┐                        ┌──────┴──────┐
│ users       │                        │ users       │
│ id: U1      │   ──claim──►           │ id: U1      │
│ profile_id: │                        │ profile_id: │
│ NULL        │                        │ P1          │ ← linked!
│ email: ...  │                        │ email: ...  │
└─────────────┘                        └─────────────┘

No merge needed! Just set users.profile_id = person_profiles.id
```

---

## Design Decisions

### 1. Person Profiles Exist Independently of Users

**Decision:** Person profiles live in `genealogy.person_profiles` with no FK pointing back to users.

**Rationale:**
- Historical figures (Pastinha, Bimba) exist only in `person_profiles` with no linked user
- Living practitioners who join the app have: `users` record with `profile_id` pointing to their `person_profiles` record
- Genealogy schema is fully self-contained - cleaner separation of concerns
- Profiles can exist before any user claims them

### 2. Claiming = Setting users.profile_id

**Decision:** Claiming a profile is simply setting `users.profile_id` to link the user to the profile.

**Rationale:**
- No complex merge algorithm needed
- All relationships (statements) remain intact - they reference `person_profiles.id`
- User gains control of the profile immediately upon approval
- Reversible if needed (admin can set `profile_id = NULL`)
- UNIQUE constraint on `profile_id` ensures one-to-one relationship

### 3. Management Rights for Unclaimed Profiles

**Decision:** Students/family of deceased mestres can request management rights through an approval workflow.

**Rationale:**
- Students have intimate knowledge of their mestre's history and achievements
- Community-driven maintenance is more sustainable than admin-only management
- Global admins retain override capability to handle abuse cases

**Implementation:** Managed via `profile_managers` table with admin approval required.

### 4. Profile Visibility

**Decision:** All person profiles are publicly searchable by default.

**Rationale:**
- Maximizes discoverability for building genealogy tree
- Users researching lineages need to find historical figures
- Optional filter gives users control without hiding valuable data

### 5. No Account Status Change

**Decision:** No `accountStatus = 'managed_profile'` needed on users table.

**Rationale:**
- With the new architecture, unclaimed profiles don't exist in `users` at all
- They exist only in `genealogy.person_profiles` with no linked user
- Simpler model: users are always real app accounts

---

## Database Schema

### Profile Claims Table (in public schema)

```sql
-- Claim status enum
CREATE TYPE profile_claim_status AS ENUM ('pending', 'approved', 'rejected');

-- Profile claims table
CREATE TABLE profile_claims (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Which person profile is being claimed
  person_profile_id UUID NOT NULL REFERENCES genealogy.person_profiles(id) ON DELETE CASCADE,

  -- Who is claiming it (must be an active user)
  claimer_user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  -- Status tracking
  status profile_claim_status NOT NULL DEFAULT 'pending',
  requested_at TIMESTAMP NOT NULL DEFAULT NOW(),
  processed_at TIMESTAMP,
  processed_by UUID REFERENCES users(id) ON DELETE SET NULL,

  -- Justification & evidence
  user_message TEXT NOT NULL,
  evidence_urls JSONB DEFAULT '[]',
  admin_notes TEXT,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Constraints
  -- Note: Validation that profile is unclaimed is done at application level
  -- by checking that no user has profile_id pointing to this person_profile_id
  CONSTRAINT profile_claims_claimer_has_no_profile CHECK (
    -- Will be enforced at application level - claimer must have profile_id = NULL
    -- or this is a profile merge request
    true
  )
);

-- Indexes
CREATE INDEX profile_claims_person_profile_idx ON profile_claims(person_profile_id);
CREATE INDEX profile_claims_claimer_idx ON profile_claims(claimer_user_id);
CREATE INDEX profile_claims_status_idx ON profile_claims(status);
CREATE INDEX profile_claims_date_idx ON profile_claims(requested_at);

-- Prevent duplicate pending claims for same profile
CREATE UNIQUE INDEX profile_claims_pending_unique
  ON profile_claims(person_profile_id, claimer_user_id)
  WHERE status = 'pending';
```

### Profile Managers Table (in public schema)

```sql
-- Explicit management grants for unclaimed profiles
CREATE TABLE profile_managers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- The person profile being granted management rights
  person_profile_id UUID NOT NULL REFERENCES genealogy.person_profiles(id) ON DELETE CASCADE,

  -- The user granted management rights
  manager_user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

  -- Who granted this permission and when
  granted_by UUID REFERENCES users(id) ON DELETE SET NULL,
  granted_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- Optional context
  notes TEXT,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX profile_managers_person_profile_idx ON profile_managers(person_profile_id);
CREATE INDEX profile_managers_manager_idx ON profile_managers(manager_user_id);

-- Prevent duplicate grants
CREATE UNIQUE INDEX profile_managers_unique
  ON profile_managers(person_profile_id, manager_user_id);
```

### Drizzle Schema

```typescript
// db/schema/profileClaims.ts

import { pgTable, pgEnum, uuid, text, timestamp, jsonb, index, uniqueIndex } from 'drizzle-orm/pg-core';
import { users } from './public';
import { personProfiles } from './genealogy';

// Enums
export const profileClaimStatusEnum = pgEnum('profile_claim_status', [
  'pending',
  'approved',
  'rejected',
]);

// Profile claims table
export const profileClaims = pgTable(
  'profile_claims',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Which person profile is being claimed
    personProfileId: uuid('person_profile_id')
      .notNull()
      .references(() => personProfiles.id, { onDelete: 'cascade' }),

    // Who is claiming it
    claimerUserId: uuid('claimer_user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),

    // Status
    status: profileClaimStatusEnum('status').notNull().default('pending'),
    requestedAt: timestamp('requested_at').notNull().defaultNow(),
    processedAt: timestamp('processed_at'),
    processedBy: uuid('processed_by').references(() => users.id, { onDelete: 'set null' }),

    // Justification
    userMessage: text('user_message').notNull(),
    evidenceUrls: jsonb('evidence_urls').$type<string[]>().default([]),
    adminNotes: text('admin_notes'),

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
  },
  (t) => [
    index('profile_claims_person_profile_idx').on(t.personProfileId),
    index('profile_claims_claimer_idx').on(t.claimerUserId),
    index('profile_claims_status_idx').on(t.status),
    index('profile_claims_date_idx').on(t.requestedAt),
  ]
);

// Profile managers table
export const profileManagers = pgTable(
  'profile_managers',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // The person profile
    personProfileId: uuid('person_profile_id')
      .notNull()
      .references(() => personProfiles.id, { onDelete: 'cascade' }),

    // The manager
    managerUserId: uuid('manager_user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),

    // Grant details
    grantedBy: uuid('granted_by').references(() => users.id, { onDelete: 'set null' }),
    grantedAt: timestamp('granted_at').notNull().defaultNow(),
    notes: text('notes'),

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
  },
  (t) => [
    index('profile_managers_person_profile_idx').on(t.personProfileId),
    index('profile_managers_manager_idx').on(t.managerUserId),
    uniqueIndex('profile_managers_unique').on(t.personProfileId, t.managerUserId),
  ]
);

// Types
export type InsertProfileClaim = typeof profileClaims.$inferInsert;
export type SelectProfileClaim = typeof profileClaims.$inferSelect;

export type InsertProfileManager = typeof profileManagers.$inferInsert;
export type SelectProfileManager = typeof profileManagers.$inferSelect;
```

---

## Implementation Phases

### Phase 1: Person Profile Creation (Admin)

**Goal:** Global admins can create person profiles for historical figures.

**Deliverables:**
1. API: `POST /api/admin/person-profiles` - Create person profile
2. API: `GET /api/admin/person-profiles` - List unclaimed profiles
3. API: `PUT /api/admin/person-profiles/[profileId]` - Edit profile
4. UI: Admin dashboard - Person profiles section
5. UI: Create/Edit person profile modal
6. Search: Include all person profiles in genealogy search

**Key Points:**
- Creates record in `genealogy.person_profiles`
- No linked user (profile exists independently)
- Profile immediately available for statements (relationships)

### Phase 2: Profile Claiming

**Goal:** Active users can claim unclaimed person profiles.

**Deliverables:**
1. Database migration: Add `profile_claims` table
2. API: `POST /api/person-profiles/[profileId]/claim` - Submit claim
3. API: `GET /api/admin/claims/profiles` - List pending claims
4. API: `PUT /api/admin/claims/profiles/[claimId]/approve`
5. API: `PUT /api/admin/claims/profiles/[claimId]/reject`
6. UI: "Claim This Profile" button on unclaimed profiles
7. UI: Claim request form
8. UI: Admin claims dashboard
9. Email: Notify admins of new claims
10. Email: Notify user of claim result

### Phase 3: Claim Approval (Linking)

**Goal:** When admin approves, link user to the person profile.

**Implementation:**
```typescript
async function approveProfileClaim(claimId: string, adminUserId: string): Promise<void> {
  await db.transaction(async (tx) => {
    // 1. Fetch claim
    const claim = await tx.query.profileClaims.findFirst({
      where: eq(profileClaims.id, claimId),
    });

    if (!claim || claim.status !== 'pending') {
      throw new Error('Invalid claim');
    }

    // 2. Verify profile is still unclaimed (no user has profile_id pointing to it)
    const existingOwner = await tx.query.users.findFirst({
      where: eq(users.profileId, claim.personProfileId),
    });

    if (existingOwner) {
      throw new Error('Profile already claimed');
    }

    // 3. Link user to profile - THE ONLY ESSENTIAL STEP!
    await tx
      .update(users)
      .set({ profileId: claim.personProfileId })
      .where(eq(users.id, claim.claimerUserId));

    // 4. Update claim status
    await tx
      .update(profileClaims)
      .set({
        status: 'approved',
        processedAt: new Date(),
        processedBy: adminUserId,
      })
      .where(eq(profileClaims.id, claimId));

    // 5. Remove any management grants (user now owns profile)
    await tx
      .delete(profileManagers)
      .where(eq(profileManagers.personProfileId, claim.personProfileId));
  });
}
```

**What Happens:**
- `users.profile_id` is set to the claimed `person_profiles.id`
- All existing statements (relationships) remain unchanged - they reference `person_profiles.id`
- User can now edit their own profile
- Any management grants are removed

### Phase 4: Management Rights

**Goal:** Allow non-owners to manage unclaimed profiles (e.g., students maintaining deceased mestre's profile).

**Deliverables:**
1. Database migration: Add `profile_managers` table
2. API: `POST /api/person-profiles/[profileId]/request-management` - Request rights
3. API: `GET /api/admin/management-requests` - List pending requests
4. API: `PUT /api/admin/management-requests/[id]/approve`
5. API: `GET /api/admin/person-profiles/[profileId]/managers` - List managers
6. API: `POST /api/admin/person-profiles/[profileId]/managers` - Grant management
7. API: `DELETE /api/admin/person-profiles/[profileId]/managers/[userId]` - Revoke
8. UI: "Request Management Rights" on unclaimed profiles
9. UI: Admin management interface

**Permission Check:**
```typescript
async function canManagePersonProfile(userId: string, personProfileId: string): Promise<boolean> {
  // 1. Check if user owns this profile
  const user = await db.query.users.findFirst({
    where: eq(users.id, userId),
  });

  if (user?.profileId === personProfileId) return true;

  // 2. Check if global admin
  if (user?.isGlobalAdmin) return true;

  // 3. Check explicit management grant
  const grant = await db.query.profileManagers.findFirst({
    where: and(
      eq(profileManagers.personProfileId, personProfileId),
      eq(profileManagers.managerUserId, userId)
    ),
  });

  return !!grant;
}
```

---

## User Flows

### Flow 1: Admin Creates Historical Figure

```
1. Admin navigates to Admin Dashboard → Person Profiles
2. Clicks "Create Person"
3. Fills out form:
   - Name: Manuel dos Reis Machado
   - Apelido: Mestre Bimba
   - Title: Mestre
   - Birth Year: 1900
   - Death Year: 1974
   - Bio: "Founder of Capoeira Regional..."
   - Style: Regional
4. Clicks "Create"
5. System creates genealogy.persons record with user_id = NULL
6. Admin can now add statements (founded GCAP, student_of Bentinho, etc.)
```

### Flow 2: User Claims Profile

```
1. User searches for "Mestre João Silva"
2. Finds profile marked as "Unclaimed"
3. Clicks "Claim This Profile"
4. Fills out form:
   - Message: "This is me. I founded Grupo ABC in 1995..."
   - Evidence: https://grupoabc.com/mestre, https://instagram.com/mestre_joao
5. Submits claim
6. System creates profile_claims record (status = pending)
7. Admin receives notification
8. Admin reviews and approves
9. System sets users.profile_id = person_profiles.id
10. User now owns their profile with all existing relationships intact
```

### Flow 3: Student Requests Management of Deceased Mestre

```
1. User views profile of their deceased mestre
2. Clicks "Request Management Rights"
3. Fills out form:
   - Relationship: "I was their student for 20 years"
   - Evidence: Photos, group website, etc.
4. Admin reviews and approves
5. System adds profile_managers record
6. Student can now edit bio, add relationships, etc.
```

---

## API Routes

### Create Person Profile (Admin)

**Endpoint:** `POST /api/admin/person-profiles`

**Request Body:**
```typescript
{
  name?: string;
  apelido: string;        // Required
  title?: string;
  birthYear?: number;
  deathYear?: number;
  bio?: string;
  style?: 'angola' | 'regional' | 'contemporânea';
  links?: SocialLink[];
}
```

**Response:** `{ personProfileId: string }`

### Submit Claim

**Endpoint:** `POST /api/person-profiles/[profileId]/claim`

**Request Body:**
```typescript
{
  message: string;         // Required, max 1000 chars
  evidenceUrls?: string[]; // Optional URLs
}
```

**Validation:**
- User must be authenticated with active account
- Profile must be unclaimed (no user has `profile_id` pointing to it)
- User cannot have pending claim for this profile

### Approve Claim (Admin)

**Endpoint:** `PUT /api/admin/claims/profiles/[claimId]/approve`

**Process:**
1. Verify claim is pending
2. Verify profile still unclaimed
3. Set `users.profile_id = person_profiles.id`
4. Mark claim as approved
5. Remove any management grants
6. Send email to claimer

---

## Security & Permissions

### Permission Matrix

| Action | Global Admin | Profile Owner | Manager | Regular User |
|--------|--------------|---------------|---------|--------------|
| Create profile | ✅ | - | - | ❌ |
| Edit profile | ✅ | ✅ | ✅ | ❌ |
| Delete profile | ✅ | ❌ | ❌ | ❌ |
| View profile | ✅ | ✅ | ✅ | ✅ |
| Submit claim | ❌ | - | ❌ | ✅ |
| Approve claim | ✅ | - | ❌ | ❌ |
| Grant management | ✅ | - | ❌ | ❌ |
| Request management | ❌ | - | ❌ | ✅ |

### Security Considerations

1. **Prevent claiming owned profiles:**
   ```typescript
   // Check if any user has profile_id pointing to this profile
   const existingOwner = await db.query.users.findFirst({
     where: eq(users.profileId, personProfileId),
   });
   if (existingOwner) {
     return { error: 'Profile already claimed' };
   }
   ```

2. **Prevent duplicate pending claims:**
   - Database unique index on (person_profile_id, claimer_user_id) WHERE status = 'pending'

3. **Transaction safety:**
   - All claim approval in single transaction
   - Rollback on any failure

4. **Audit trail:**
   - `profile_claims` keeps history of all claims
   - `processedBy` tracks which admin acted

---

## Edge Cases

### Edge Case 1: User Already Has Profile

**Scenario:** User tries to claim a profile but already has one linked.

**Handling:**
- Check if user already has a `profile_id` set
- If yes, show error: "You already have a profile"
- User would need to request profile merge (future feature)

### Edge Case 2: Multiple Claims for Same Profile

**Scenario:** Two users claim the same unclaimed profile.

**Handling:**
- Both claims enter pending queue
- Admin reviews both, approves the legitimate one
- Approved claim sets user's profile_id to this profile
- Other pending claims auto-rejected (profile now claimed)

### Edge Case 3: Profile Claimed While Claim Pending

**Scenario:** Admin manually links profile while claim is pending.

**Handling:**
- On approval attempt, check if any user has `profile_id` set to this profile
- If set, reject with "Profile already claimed"
- Auto-reject all pending claims for this profile

### Edge Case 4: Manager Tries to Claim

**Scenario:** User with management rights tries to claim the profile.

**Handling:**
- Allowed - manager can still submit claim
- If approved, management grant is automatically removed
- They become owner instead of manager

---

## Testing Strategy

### Unit Tests

1. **Permission checks:**
   - `canManagePersonProfile()` returns correct boolean
   - `isProfileClaimable()` validates unclaimed status

2. **Claim validation:**
   - Cannot claim already-claimed profile
   - Cannot submit duplicate pending claim
   - Message and evidence validation

### Integration Tests

1. **Create profile flow:**
   - Admin creates profile → appears in search
   - Profile has no linked user (no user.profile_id pointing to it)

2. **Claim flow:**
   - Submit claim → pending status
   - Approve claim → user.profile_id linked
   - Statements remain unchanged

3. **Management flow:**
   - Grant management → manager can edit
   - Claim approved → management revoked

### Manual Testing Checklist

- [ ] Admin can create person profile
- [ ] Profile appears in genealogy search
- [ ] User can submit claim for unclaimed profile
- [ ] Admin sees pending claim
- [ ] Admin can approve claim
- [ ] After approval, user is linked to person
- [ ] User can now edit their profile
- [ ] Statements (relationships) remain intact
- [ ] Management grants work correctly
- [ ] Edge cases handled gracefully

---

## Migration from Previous Specs

The v1.0 spec used a different approach:
- Managed profiles were user records with `accountStatus = 'managed_profile'`
- Required complex account merging on claim approval

The v2.0 spec introduced genealogy schema separation but had FK direction pointing from genealogy to public.

**This v3.0 spec** reverses the FK direction:
- `users.profile_id` → `genealogy.person_profiles.id`
- Genealogy schema is fully self-contained (no FKs pointing out)

**Migration not needed** - v1.0/v2.0 were never implemented. This v3.0 spec starts fresh.

---

## Future Enhancements

### Enhancement 1: Profile Merge

**Goal:** Allow merging duplicate person profiles.

**Use Case:** User creates a new profile but later realizes they should claim an existing one.

**Implementation:** Admin workflow to transfer statements from one profile to another, then delete orphan.

### Enhancement 2: Bulk Import

**Goal:** Import historical figures from JSON/CSV.

**Implementation:** Admin upload with validation and conflict detection.

### Enhancement 3: Community Verification

**Goal:** Community members can suggest edits to profiles.

**Implementation:** Edit request workflow with admin approval.

### Enhancement 4: Masters Gallery

**Goal:** Dedicated gallery view for historical mestres.

**Features:**
- Visual grid of portraits
- Timeline view
- Lineage tree navigation

---

## Implementation Checklist

### Phase 1: Person Profile Creation
- [ ] API: POST /api/admin/person-profiles
- [ ] API: GET /api/admin/person-profiles
- [ ] API: PUT /api/admin/person-profiles/[profileId]
- [ ] UI: Admin person profiles list
- [ ] UI: Create/Edit profile modal
- [ ] Validation: PersonProfile schema
- [ ] Tests: Create, edit, list

### Phase 2: Profile Claiming
- [ ] Database migration: profile_claims table
- [ ] API: POST /api/person-profiles/[profileId]/claim
- [ ] API: GET /api/admin/claims/profiles
- [ ] UI: Claim button on unclaimed profiles
- [ ] UI: Claim form modal
- [ ] UI: Admin claims dashboard
- [ ] Validation: Claim schema
- [ ] Tests: Submit, list, validate

### Phase 3: Claim Approval
- [ ] API: PUT /api/admin/claims/profiles/[claimId]/approve
- [ ] API: PUT /api/admin/claims/profiles/[claimId]/reject
- [ ] Linking logic: Set users.profile_id
- [ ] Email: Claim result notification
- [ ] Tests: Approve, reject, link

### Phase 4: Management Rights
- [ ] Database migration: profile_managers table
- [ ] API: Request management rights
- [ ] API: Grant/revoke management
- [ ] UI: Request management button
- [ ] UI: Admin management interface
- [ ] Permission check: canManagePersonProfile()
- [ ] Tests: Grant, revoke, check

---

**End of Specification**

**Status:** Ready for implementation (after genealogy schema is created)
**Priority:** High (foundational for genealogy tree)
**Dependencies:** Genealogy Architecture (schema must exist first)
