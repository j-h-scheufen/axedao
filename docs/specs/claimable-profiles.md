# Claimable Profiles: Managed User Profiles for Capoeira Community

**Version:** 1.1
**Last Updated:** 2025-11-17
**Status:** Specification
**Target Platform:** Quilombo (Next.js 15 + PostgreSQL)
**Depends On:** [Capoeira Genealogy Research Report](./capoeira-genealogy-research.md)

---

## Executive Summary

Enable global admins to create and manage user profiles on behalf of Capoeira practitioners who are not yet in the system (or are deceased). These "managed profiles" appear like normal user profiles throughout the app but are maintained by admins or designated community members until the actual person claims them. When claimed, the managed profile merges with the claimer's active account.

**Core Value Propositions:**
1. **For the Community**: Build comprehensive Capoeira genealogy including deceased mestres and historical figures
2. **For Users**: Find and reference important figures in their lineage (founders, teachers, influencers)
3. **For Admins**: Curate accurate biographical and lineage information before people join
4. **For Future Users**: Join the app and discover their profile already exists with pre-filled information

**Example Use Cases:**
- Create profile for Mestre Bimba (deceased 1974) to reference as founder of Capoeira Regional groups
- Create profile for a living Mestre in Brazil who hasn't joined the app yet
- Allow group members to manage their deceased mestre's profile
- Enable a Mestre to claim their pre-made profile when they join the app

---

## Design Decisions

The following design decisions were made based on stakeholder feedback:

### 1. Management Rights for Deceased Mestres
**Decision**: Students of deceased mestres can request management rights through an approval workflow.

**Rationale**:
- Students have intimate knowledge of their mestre's history and achievements
- Community-driven maintenance is more sustainable than admin-only management
- Global admins retain override capability to handle abuse cases

**Implementation**: Phase 4 - Request workflow similar to profile claims, with admin approval required.

### 2. Profile Visibility
**Decision**: Managed profiles are publicly searchable by default, with optional filter to exclude them.

**Rationale**:
- Maximizes discoverability for building genealogy tree
- Users researching lineages need to find historical figures
- Optional filter gives users control without hiding valuable data

**Implementation**: Phase 1 - Search includes managed profiles; UI provides "Include managed profiles" checkbox.

### 3. Verification Tiers
**Decision**: Skip verification tier system for initial implementation.

**Rationale**:
- Adds complexity without clear immediate value
- Can be added later if needed based on user feedback
- Admin approval workflow provides sufficient quality control for now

**Implementation**: Deferred to future enhancements (if needed).

### 4. Biography Field Access
**Decision**: All users (active and managed) can have biography field.

**Rationale**:
- Normal users should be able to publish their own story
- No reason to restrict this feature to managed profiles only
- Enriches community profiles across the board

**Implementation**: Phase 1 - `person_profiles.biography` available to all users.

### 5. Implementation Order
**Decision**: Sequential implementation - complete profiles before adding relationships.

**Rationale**:
- Better code review and testing at each phase
- Allows for learning and adjustment before tackling relationships
- Relationships depend on profiles being stable

**Implementation**: Phases 1-4 (profiles) complete before implementing person-to-person relationships.

---

## Table of Contents

1. [Design Decisions](#design-decisions)
2. [Problem Statement](#problem-statement)
3. [Solution Overview](#solution-overview)
4. [Database Schema](#database-schema)
5. [Implementation Phases](#implementation-phases)
6. [Phase 1: Managed Profiles (Core)](#phase-1-managed-profiles-core)
7. [Phase 2: Profile Claiming](#phase-2-profile-claiming)
8. [Phase 3: Account Merging](#phase-3-account-merging)
9. [User Flows](#user-flows)
10. [Security & Permissions](#security--permissions)
11. [Edge Cases & Error Handling](#edge-cases--error-handling)
12. [Testing Strategy](#testing-strategy)
13. [Future Enhancements](#future-enhancements)

---

## Problem Statement

### Current Limitations

1. **Incomplete Lineage**: Can't reference people not in the system
   - `groups.founder` is just a varchar string
   - Can't link to user profiles, see their full lineage, or trace relationships

2. **Missing Historical Figures**: Deceased mestres can't be represented
   - Mestre Bimba, Mestre Pastinha, and other foundational figures aren't in system
   - Can't build genealogy tree without them

3. **Chicken-and-Egg Problem**: Groups need founders, founders might not have accounts
   - Group imported with founder "Mestre João Silva"
   - No way to create a proper profile for them without account

4. **Loss of Knowledge**: When mestres pass away, their digital presence disappears
   - Profile could be deleted or become inaccessible
   - Students lose ability to reference them in lineage

### User Stories

**As a Global Admin:**
- I want to create a profile for Mestre Bimba so groups can reference him as founder
- I want to create profiles for all major historical mestres to build genealogy tree
- I want to designate trusted users to manage specific profiles (e.g., a student managing their deceased mestre's profile)

**As a Group Admin:**
- I want to set my group's founder to a user profile (not just a string) so people can see their full lineage
- I want to manage my deceased mestre's profile because I have intimate knowledge of their history

**As a Regular User:**
- I want to see my teacher's complete lineage even if they're not in the app yet
- I want to discover that someone already created a profile for me and claim it
- I want to trace my lineage back to Mestre Pastinha through the genealogy tree

**As a New User (Joining):**
- I want to claim the profile that was pre-made for me by my students/group
- I want to merge my new account with the existing managed profile seamlessly

---

## Solution Overview

### High-Level Approach

```
┌────────────────────────────────────────────────────────────────┐
│                    MANAGED PROFILE LIFECYCLE                    │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. CREATION (Admin-driven)                                     │
│     • Global admin creates "managed profile"                    │
│     • Profile is a full user record with accountStatus =        │
│       'managed_profile'                                         │
│     • No authentication credentials (no email, password, etc.)  │
│     • Appears in search, can be referenced like normal user     │
│                                                                 │
│  2. MANAGEMENT (Admin or Designated Manager)                    │
│     • Global admin or designated user can edit profile          │
│     • Add biography, relationships, group affiliations          │
│     • Update information as community learns more               │
│                                                                 │
│  3. CLAIMING (User-initiated)                                   │
│     • Active user discovers managed profile that represents     │
│       them                                                      │
│     • Submits claim request with justification/proof            │
│     • Global admin reviews and approves/rejects                 │
│                                                                 │
│  4. MERGING (System-automated)                                  │
│     • Upon approval: merge managed profile INTO claimer account │
│     • Preserve all references (groups, relationships, events)   │
│     • Delete managed profile user record                        │
│     • Claimer account becomes the single source of truth        │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

### Key Design Decisions

**1. Managed Profiles ARE User Records**
- Don't create separate `managed_profiles` table
- Use existing `users` table with special `accountStatus = 'managed_profile'`
- Rationale: Minimal code changes, consistent API, easier to merge later

**2. Extended Profile Info for Everyone**
- Create `person_profiles` table for biographical data
- Every user gets a `person_profile` entry (not just managed ones)
- Normal users can write their own biography too

**3. Claiming Similar to Group Claims**
- Reuse proven workflow from group claims
- Create `profile_claims` table
- Admin approval required

**4. Merge Managed → Claimer (Not Reverse)**
- Keep claimer's `users` record (has authentication)
- Copy managed profile's extended data to claimer
- Update all foreign key references to point to claimer
- Delete managed profile's `users` record

**5. Permissions Model**
- Global admins: Can create, edit, delete any managed profile
- Designated managers: Can edit specific managed profiles (stored in `person_profiles.managedBy`)
- Regular users: Can view, search, reference managed profiles (read-only)

---

## Database Schema

### New Tables

#### 1. Person Profiles (Extended Biographical Info)

```typescript
// Add new account status
export const accountStatuses = [
  'pending_verification',
  'active',
  'disabled',
  'managed_profile', // NEW: Profile managed by admins, not an active account
] as const;

// person_profiles table
export const personProfiles = pgTable('person_profiles', {
  id: uuid('id').defaultRandom().primaryKey(),
  userId: uuid('user_id')
    .references(() => users.id, { onDelete: 'cascade' })
    .notNull()
    .unique(), // One profile per user

  // Biographical information
  birthDate: date('birth_date'),
  birthPlace: varchar('birth_place'),
  passedDate: date('passed_date'), // null if still alive
  passedPlace: varchar('passed_place'),

  // Extended content (available to everyone, not just managed profiles)
  biography: text('biography'), // Long-form background story
  achievements: text('achievements'), // Major accomplishments
  style: styleEnum('primary_style'), // Primary Capoeira style

  // Managed profile metadata (null for normal users)
  isManaged: boolean('is_managed').default(false).notNull(),
  managedBy: uuid('managed_by').references((): AnyPgColumn => users.id, {
    onDelete: 'set null',
  }), // Who manages this profile
  managedReason: text('managed_reason'), // Why it's managed (e.g., "Deceased mestre")

  // Verification
  verifiedAt: timestamp('verified_at'),
  verifiedBy: uuid('verified_by').references((): AnyPgColumn => users.id, {
    onDelete: 'set null',
  }),

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .$onUpdate(() => new Date()),
}, (t) => [
  index('person_profiles_user_idx').on(t.userId),
  index('person_profiles_managed_idx').on(t.isManaged),
  index('person_profiles_managed_by_idx').on(t.managedBy),
]);

export type InsertPersonProfile = typeof personProfiles.$inferInsert;
export type SelectPersonProfile = typeof personProfiles.$inferSelect;
```

**Design Notes:**
- `userId` references `users.id` - every profile belongs to a user
- `isManaged = true` means this is an admin-managed profile
- `managedBy` allows delegation (e.g., student manages deceased mestre's profile)
- `biography` field available to ALL users, not just managed profiles (normal users can write their own bio)

#### 2. Profile Claims

```typescript
export const profileClaimStatusEnum = pgEnum('profile_claim_status', [
  'pending',
  'approved',
  'rejected',
]);

export const profileClaims = pgTable('profile_claims', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Which managed profile is being claimed
  claimedProfileUserId: uuid('claimed_profile_user_id')
    .references(() => users.id, { onDelete: 'cascade' })
    .notNull(),

  // Who is claiming it (active user with real account)
  claimerUserId: uuid('claimer_user_id')
    .references(() => users.id, { onDelete: 'set null' })
    .notNull(),

  // Status tracking
  status: profileClaimStatusEnum('status').notNull().default('pending'),
  requestedAt: timestamp('requested_at').notNull().defaultNow(),
  processedAt: timestamp('processed_at'),
  processedBy: uuid('processed_by').references(() => users.id, { onDelete: 'set null' }),

  // Justification & evidence
  userMessage: text('user_message').notNull(), // Why they are this person
  evidenceUrls: json('evidence_urls').$type<string[]>().default([]), // Links to proof (social media, website, etc.)
  adminNotes: text('admin_notes'), // Admin's decision reasoning

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
}, (t) => [
  index('profile_claim_claimed_idx').on(t.claimedProfileUserId),
  index('profile_claim_claimer_idx').on(t.claimerUserId),
  index('profile_claim_status_idx').on(t.status),
  index('profile_claim_date_idx').on(t.requestedAt),
]);

export type InsertProfileClaim = typeof profileClaims.$inferInsert;
export type SelectProfileClaim = typeof profileClaims.$inferSelect;
```

**Design Notes:**
- Similar structure to `groupClaims` (proven pattern)
- `claimedProfileUserId` must have `accountStatus = 'managed_profile'`
- `claimerUserId` must have `accountStatus = 'active'`
- `evidenceUrls` allows users to provide proof (links to their social media, group website, etc.)

### Schema Changes to Existing Tables

#### Users Table - Add Account Status

```typescript
// users table - update accountStatus enum
export const accountStatusEnum = pgEnum('account_status', [
  'pending_verification',
  'active',
  'disabled',
  'managed_profile', // NEW
]);

// No other changes to users table needed!
// Managed profiles use same table with different status
```

#### Groups Table - No Changes Needed

```typescript
// groups table - NO CHANGES
// Keep existing structure:
// - groups.founder: varchar (legacy, will migrate to group_roles later)
// - groups.leader: uuid reference to users.id (works with managed profiles!)
```

**Rationale:**
- Managed profiles are users, so `groups.leader` can reference them
- Later enhancement: Replace `groups.founder` varchar with `group_roles` table (see genealogy research report)

---

## Implementation Phases

### Phase 1: Managed Profiles (Core)
**Goal**: Global admins can create and manage profiles for people not in system

**Deliverables:**
1. Database migration: Add `person_profiles` table
2. Add `accountStatus = 'managed_profile'` to enum
3. Admin UI: Create managed profile
4. Admin UI: Edit managed profile
5. Admin UI: List managed profiles
6. Search: Include managed profiles in user search
7. Profile view: Display managed profile badge
8. Permissions: Only global admins can create/edit

**Time Estimate**: 1 week

### Phase 2: Profile Claiming
**Goal**: Active users can claim managed profiles that represent them

**Deliverables:**
1. Database migration: Add `profile_claims` table
2. User UI: Claim profile button (on managed profile page)
3. User UI: Claim request form (justification + evidence)
4. Admin UI: View pending profile claims
5. Admin UI: Approve/reject claims
6. Email: Notify user when claim approved/rejected
7. Permissions: Any active user can submit claim

**Time Estimate**: 1 week

### Phase 3: Account Merging
**Goal**: When claim approved, seamlessly merge accounts

**Deliverables:**
1. Merge logic: Copy data from managed → claimer
2. Merge logic: Update all foreign key references
3. Merge logic: Delete managed profile user record
4. Testing: Comprehensive merge scenarios
5. Admin UI: Show merge preview before approval
6. Safety: Transaction-based merge (rollback on failure)

**Time Estimate**: 1 week

### Phase 4: Designated Managers
**Goal**: Allow students to request and be granted management rights for deceased mestres' profiles

**Deliverables:**
1. Add `person_profiles.managedBy` field (already in schema)
2. User UI: "Request Management Rights" button on managed profiles
3. Request workflow: Similar to profile claims, requires admin approval
4. Admin UI: Approve/reject management requests
5. Admin UI: Manually assign/revoke manager
6. Permissions: Manager can edit assigned profiles
7. Global admin can always override/revoke management rights
8. Use case: Student manages deceased mestre's profile

**Time Estimate**: 1 week

**Priority**: Implement after Phase 3 (sequential, not parallel)

---

## Phase 1: Managed Profiles (Core)

### Database Migration

**File**: `apps/quilombo/db/migrations/NNNN_add_person_profiles.sql`

```sql
-- Add 'managed_profile' to account_status enum
ALTER TYPE account_status ADD VALUE 'managed_profile';

-- Create person_profiles table
CREATE TABLE person_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,

  -- Biographical info
  birth_date DATE,
  birth_place VARCHAR,
  passed_date DATE,
  passed_place VARCHAR,

  -- Extended content
  biography TEXT,
  achievements TEXT,
  primary_style style,

  -- Managed profile metadata
  is_managed BOOLEAN NOT NULL DEFAULT FALSE,
  managed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  managed_reason TEXT,

  -- Verification
  verified_at TIMESTAMP,
  verified_by UUID REFERENCES users(id) ON DELETE SET NULL,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX person_profiles_user_idx ON person_profiles(user_id);
CREATE INDEX person_profiles_managed_idx ON person_profiles(is_managed);
CREATE INDEX person_profiles_managed_by_idx ON person_profiles(managed_by);

-- Trigger for updated_at
CREATE TRIGGER person_profiles_updated_at
  BEFORE UPDATE ON person_profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
```

### API Routes

#### 1. Create Managed Profile

**Endpoint**: `POST /api/admin/profiles/managed`

**Access**: Global admin only

**Request Body**:
```typescript
{
  name: string;              // Required
  nickname: string;          // Required (unique)
  title?: string;            // Optional (from titles enum)
  birthDate?: string;        // ISO date string
  birthPlace?: string;
  passedDate?: string;       // ISO date string (if deceased)
  passedPlace?: string;
  biography?: string;
  achievements?: string;
  style?: 'angola' | 'regional' | 'contemporânea';
  managedReason?: string;    // E.g., "Deceased mestre, founder of X group"
}
```

**Response**:
```typescript
{
  userId: string;  // ID of created user record
  profileId: string; // ID of created person_profile record
}
```

**Implementation**:
```typescript
// File: apps/quilombo/app/api/admin/profiles/managed/route.ts

/**
 * @openapi
 * /api/admin/profiles/managed:
 *   post:
 *     summary: Create a managed user profile
 *     description: |
 *       Creates a user profile for someone not in the system (deceased or not yet joined).
 *       - Creates user record with accountStatus = 'managed_profile'
 *       - Creates person_profile record with isManaged = true
 *       - No authentication credentials (no email, password)
 *       Requires global admin privileges.
 *     tags:
 *       - Admin
 *       - Profiles
 *     security:
 *       - session: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *               - nickname
 *             properties:
 *               name:
 *                 type: string
 *               nickname:
 *                 type: string
 *               title:
 *                 type: string
 *                 enum: [mestra, mestre, contra-mestra, ...]
 *               birthDate:
 *                 type: string
 *                 format: date
 *               passedDate:
 *                 type: string
 *                 format: date
 *               biography:
 *                 type: string
 *               style:
 *                 type: string
 *                 enum: [angola, regional, contemporânea]
 *               managedReason:
 *                 type: string
 *     responses:
 *       201:
 *         description: Profile created successfully
 *       400:
 *         description: Validation error
 *       403:
 *         description: Forbidden - not a global admin
 *       409:
 *         description: Conflict - nickname already exists
 */
export async function POST(req: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  // Check authentication
  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  // Check global admin permission
  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Global admin access required' }, { status: 403 });
  }

  try {
    const body = await req.json();

    // Validate input (use Yup schema)
    const validatedData = await createManagedProfileSchema.validate(body);

    // Create user record with managed_profile status
    const userId = uuid();
    await db.insert(schema.users).values({
      id: userId,
      name: validatedData.name,
      nickname: validatedData.nickname,
      title: validatedData.title,
      accountStatus: 'managed_profile', // Special status
      // No email, passwordHash, emailVerifiedAt
    });

    // Create person_profile record
    const profileId = await db.insert(schema.personProfiles).values({
      userId,
      birthDate: validatedData.birthDate,
      birthPlace: validatedData.birthPlace,
      passedDate: validatedData.passedDate,
      passedPlace: validatedData.passedPlace,
      biography: validatedData.biography,
      achievements: validatedData.achievements,
      style: validatedData.style,
      isManaged: true,
      managedBy: session.user.id, // Admin who created it
      managedReason: validatedData.managedReason,
    }).returning({ id: schema.personProfiles.id });

    return NextResponse.json(
      {
        userId,
        profileId: profileId[0].id,
        message: 'Managed profile created successfully',
      },
      { status: 201 }
    );
  } catch (error) {
    console.error('Error creating managed profile:', error);

    if (error instanceof ValidationError) {
      return NextResponse.json({ error: error.errors?.[0] }, { status: 400 });
    }

    return NextResponse.json(
      { error: generateErrorMessage(error, 'Failed to create managed profile') },
      { status: 500 }
    );
  }
}
```

#### 2. Edit Managed Profile

**Endpoint**: `PUT /api/admin/profiles/managed/[userId]`

**Access**: Global admin OR designated manager

**Request Body**: Same as create, all fields optional

**Implementation**: Similar to create, but use `update` instead of `insert`

#### 3. List Managed Profiles

**Endpoint**: `GET /api/admin/profiles/managed`

**Access**: Global admin only

**Query Params**:
- `page` (default: 1)
- `limit` (default: 25)
- `search` (nickname or name filter)

**Response**:
```typescript
{
  profiles: Array<{
    userId: string;
    name: string;
    nickname: string;
    title: string;
    passedDate: string | null;
    biography: string;
    managedBy: string; // User ID
    managedByName: string; // Manager's name
  }>;
  total: number;
  page: number;
  limit: number;
}
```

### UI Components

#### 1. Admin Dashboard - Managed Profiles Section

**File**: `apps/quilombo/app/admin/profiles/page.tsx`

**Features**:
- List all managed profiles (table view)
- Search/filter by name, nickname, title
- "Create New Profile" button → opens modal
- Edit icon on each row → opens edit modal
- Show deceased badge (if passedDate exists)

**Mockup**:
```
┌──────────────────────────────────────────────────────────────┐
│ Managed Profiles                           [+ Create Profile] │
├──────────────────────────────────────────────────────────────┤
│ Search: [____________]  Filter: [All | Living | Deceased]    │
├──────────────────────────────────────────────────────────────┤
│ Nickname          Name                Title      Actions      │
├──────────────────────────────────────────────────────────────┤
│ Mestre Bimba      Manuel dos Reis     Mestre     [Edit] [⚙]  │
│                   (1900-1974) ☠                               │
│ Mestre Pastinha   Vicente Pastinha    Mestre     [Edit] [⚙]  │
│                   (1889-1981) ☠                               │
│ Esquilo           [Unknown]           Mestre     [Edit] [⚙]  │
└──────────────────────────────────────────────────────────────┘
```

#### 2. Create/Edit Managed Profile Modal

**Component**: `ManagedProfileFormModal`

**Form Fields**:
- **Basic Info**:
  - Name (required)
  - Nickname (required, unique)
  - Title (dropdown from titles enum)
- **Biographical**:
  - Birth Date
  - Birth Place
  - Passed Date (if deceased)
  - Passed Place
- **Extended**:
  - Biography (rich text, optional)
  - Achievements (rich text, optional)
  - Primary Style (Angola / Regional / Contemporânea)
- **Management**:
  - Managed Reason (textarea, e.g., "Founder of X, deceased 1974")

**Validation**:
- Name required, max 100 chars
- Nickname required, unique, max 50 chars, alphanumeric + spaces
- Dates must be valid ISO dates
- PassedDate must be after BirthDate

#### 3. User Profile Page - Managed Badge

**File**: `apps/quilombo/app/users/[nickname]/page.tsx`

**Enhancement**: Show badge if profile is managed

**Mockup**:
```
┌──────────────────────────────────────────────┐
│ [Avatar]  Mestre Vicente Pastinha             │
│           @pastinha                           │
│           🏛 Historical Figure (Managed)      │ ← NEW badge
│                                               │
│ Born: April 5, 1889 - Salvador, Brazil       │
│ Passed: November 13, 1981 - Salvador, Brazil │
│                                               │
│ Biography:                                    │
│ Iconic figure of Capoeira Angola...          │
│                                               │
│ [Students] [Groups Founded] [Lineage]        │
└──────────────────────────────────────────────┘
```

### Search Integration

**Enhancement**: Include managed profiles in user search with optional filter

**Behavior**:
- Managed profiles are **publicly searchable** by default
- Search UI should include optional filter to exclude managed profiles
- Filter checkbox: "Include managed profiles" (checked by default)

**File**: `apps/quilombo/db/queries/users.ts`

```typescript
// Update searchUsers query to include managed profiles
export async function searchUsers(
  query: string,
  options?: {
    includeManagedProfiles?: boolean; // default: true
  }
): Promise<SelectUser[]> {
  const includeManagedProfiles = options?.includeManagedProfiles ?? true;

  // Build account status conditions
  const statusConditions = [eq(schema.users.accountStatus, 'active')];
  if (includeManagedProfiles) {
    statusConditions.push(eq(schema.users.accountStatus, 'managed_profile'));
  }

  return await db
    .select()
    .from(schema.users)
    .where(
      and(
        or(
          ilike(schema.users.name, `%${query}%`),
          ilike(schema.users.nickname, `%${query}%`)
        ),
        // Include active, optionally include managed profiles
        or(...statusConditions)
      )
    )
    .limit(50);
}
```

**UI Enhancement**:
- Add filter checkbox to search page: "Include managed profiles ✓"
- When unchecked, only show active accounts
- Filter state persists in URL query params

---

## Phase 2: Profile Claiming

### Database Migration

**File**: `apps/quilombo/db/migrations/NNNN_add_profile_claims.sql`

```sql
-- Create profile_claim_status enum
CREATE TYPE profile_claim_status AS ENUM ('pending', 'approved', 'rejected');

-- Create profile_claims table
CREATE TABLE profile_claims (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  claimed_profile_user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  claimer_user_id UUID NOT NULL REFERENCES users(id) ON DELETE SET NULL,

  -- Status
  status profile_claim_status NOT NULL DEFAULT 'pending',
  requested_at TIMESTAMP NOT NULL DEFAULT NOW(),
  processed_at TIMESTAMP,
  processed_by UUID REFERENCES users(id) ON DELETE SET NULL,

  -- Justification
  user_message TEXT NOT NULL,
  evidence_urls JSONB DEFAULT '[]',
  admin_notes TEXT,

  -- Metadata
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX profile_claim_claimed_idx ON profile_claims(claimed_profile_user_id);
CREATE INDEX profile_claim_claimer_idx ON profile_claims(claimer_user_id);
CREATE INDEX profile_claim_status_idx ON profile_claims(status);
CREATE INDEX profile_claim_date_idx ON profile_claims(requested_at);

-- Constraint: Can only claim managed profiles
ALTER TABLE profile_claims
ADD CONSTRAINT profile_claims_claimed_is_managed
CHECK (
  claimed_profile_user_id IN (
    SELECT id FROM users WHERE account_status = 'managed_profile'
  )
);

-- Constraint: Claimer must be active account
ALTER TABLE profile_claims
ADD CONSTRAINT profile_claims_claimer_is_active
CHECK (
  claimer_user_id IN (
    SELECT id FROM users WHERE account_status = 'active'
  )
);
```

### API Routes

#### 1. Submit Profile Claim

**Endpoint**: `POST /api/profiles/[userId]/claim`

**Access**: Any authenticated user

**Request Body**:
```typescript
{
  message: string;        // Required: Why they are this person
  evidenceUrls?: string[]; // Optional: Links to proof
}
```

**Validation**:
- User must be authenticated (`accountStatus = 'active'`)
- Target profile must be managed (`accountStatus = 'managed_profile'`)
- User cannot claim their own profile
- User cannot have pending claim for this profile already
- Message required, max 1000 chars
- EvidenceUrls must be valid URLs

**Response**:
```typescript
{
  claimId: string;
  message: string;
}
```

**Implementation**:
```typescript
// File: apps/quilombo/app/api/profiles/[userId]/claim/route.ts

export async function POST(
  req: NextRequest,
  { params }: { params: Promise<{ userId: string }> }
) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const { userId: claimedProfileUserId } = await params;
    const body = await req.json();

    // Validate input
    const validatedData = await profileClaimSchema.validate(body);

    // Check target profile exists and is managed
    const targetUser = await fetchUser(claimedProfileUserId);
    if (!targetUser) {
      return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
    }
    if (targetUser.accountStatus !== 'managed_profile') {
      return NextResponse.json({ error: 'Profile is not claimable' }, { status: 400 });
    }

    // Check user not claiming own profile
    if (session.user.id === claimedProfileUserId) {
      return NextResponse.json({ error: 'Cannot claim your own profile' }, { status: 400 });
    }

    // Check for existing pending claim
    const existingClaim = await db.query.profileClaims.findFirst({
      where: and(
        eq(schema.profileClaims.claimedProfileUserId, claimedProfileUserId),
        eq(schema.profileClaims.claimerUserId, session.user.id),
        eq(schema.profileClaims.status, 'pending')
      ),
    });

    if (existingClaim) {
      return NextResponse.json(
        { error: 'You already have a pending claim for this profile' },
        { status: 409 }
      );
    }

    // Create claim
    const claimId = await db
      .insert(schema.profileClaims)
      .values({
        claimedProfileUserId,
        claimerUserId: session.user.id,
        userMessage: validatedData.message,
        evidenceUrls: validatedData.evidenceUrls || [],
        status: 'pending',
      })
      .returning({ id: schema.profileClaims.id });

    // TODO: Send email to admins about new claim

    return NextResponse.json(
      {
        claimId: claimId[0].id,
        message: 'Claim submitted successfully. An admin will review your request.',
      },
      { status: 201 }
    );
  } catch (error) {
    console.error('Error submitting profile claim:', error);

    if (error instanceof ValidationError) {
      return NextResponse.json({ error: error.errors?.[0] }, { status: 400 });
    }

    return NextResponse.json(
      { error: generateErrorMessage(error, 'Failed to submit claim') },
      { status: 500 }
    );
  }
}
```

#### 2. Get Pending Profile Claims (Admin)

**Endpoint**: `GET /api/admin/claims/profiles`

**Access**: Global admin only

**Response**:
```typescript
{
  claims: Array<{
    id: string;
    claimedProfile: {
      userId: string;
      name: string;
      nickname: string;
      title: string;
    };
    claimer: {
      userId: string;
      name: string;
      nickname: string;
      email: string;
    };
    userMessage: string;
    evidenceUrls: string[];
    requestedAt: string;
  }>;
}
```

#### 3. Approve Profile Claim (Admin)

**Endpoint**: `PUT /api/admin/claims/profiles/[claimId]/approve`

**Access**: Global admin only

**Process**:
1. Fetch claim details
2. **Trigger account merge** (see Phase 3)
3. Mark claim as approved
4. Send email to claimer (success)

**Implementation**: See Phase 3 for merge logic

#### 4. Reject Profile Claim (Admin)

**Endpoint**: `PUT /api/admin/claims/profiles/[claimId]/reject`

**Access**: Global admin only

**Request Body**:
```typescript
{
  notes: string; // Required: Admin's reason for rejection
}
```

### UI Components

#### 1. Profile Claim Button (User-Facing)

**Location**: On managed profile page

**Conditions to show**:
- Viewing user is authenticated AND `accountStatus = 'active'`
- Profile being viewed has `accountStatus = 'managed_profile'`
- Viewing user has no pending claim for this profile

**Component**:
```tsx
// apps/quilombo/components/profiles/ClaimProfileButton.tsx

export function ClaimProfileButton({ profileUserId }: { profileUserId: string }) {
  const [isModalOpen, setIsModalOpen] = useState(false);

  return (
    <>
      <Button
        color="primary"
        variant="bordered"
        onPress={() => setIsModalOpen(true)}
      >
        Claim This Profile
      </Button>

      <ClaimProfileModal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        profileUserId={profileUserId}
      />
    </>
  );
}
```

#### 2. Claim Profile Modal

**Component**: `ClaimProfileModal`

**Form Fields**:
- **Message** (required, textarea, max 1000 chars)
  - Prompt: "Please explain why this profile represents you. Include details only you would know."
- **Evidence Links** (optional, multiple URL inputs)
  - Prompt: "Provide links to verify your identity (social media, group website, etc.)"
  - Add/remove fields dynamically

**Example Content**:
```
┌─────────────────────────────────────────────────────────┐
│ Claim Profile: Mestre João Silva                        │
├─────────────────────────────────────────────────────────┤
│                                                          │
│ Why is this you?                                        │
│ ┌──────────────────────────────────────────────────┐   │
│ │ I am Mestre João Silva. I founded Grupo ABC     │   │
│ │ in 1995 and have been teaching in São Paulo     │   │
│ │ for 30 years. My students created this profile  │   │
│ │ before I joined the app. I can verify my        │   │
│ │ identity through my group's website and my      │   │
│ │ Instagram account.                               │   │
│ └──────────────────────────────────────────────────┘   │
│                                                          │
│ Evidence (Optional)                                     │
│ [https://grupoabc.com/mestre-joao]                      │
│ [https://instagram.com/mestrejoao_abc]                  │
│ [+ Add another link]                                    │
│                                                          │
│               [Cancel]  [Submit Claim]                  │
└─────────────────────────────────────────────────────────┘
```

#### 3. Admin - Profile Claims Dashboard

**File**: `apps/quilombo/app/admin/claims/profiles/page.tsx`

**Layout**: Similar to group claims dashboard

**Columns**:
- Managed Profile (name, nickname, title)
- Claimed By (name, email)
- Requested Date
- Actions (View Details, Approve, Reject)

**Detail View** (modal or separate page):
- Show full managed profile info
- Show claimer's info
- Show justification message
- Show evidence links (clickable)
- Show approve/reject buttons

---

## Phase 3: Account Merging

### Merge Logic Overview

When a profile claim is approved, we need to merge the managed profile into the claimer's account:

```
BEFORE MERGE:
┌──────────────────┐           ┌──────────────────┐
│ Managed Profile  │           │ Claimer Account  │
│ (User ID: AAA)   │           │ (User ID: BBB)   │
├──────────────────┤           ├──────────────────┤
│ accountStatus:   │           │ accountStatus:   │
│  managed_profile │           │  active          │
│                  │           │                  │
│ person_profile:  │           │ person_profile:  │
│  biography: "..."│           │  biography: null │
│  birthDate: ...  │           │  birthDate: null │
│                  │           │                  │
│ Referenced by:   │           │ Referenced by:   │
│ - groups.leader  │           │ - invitations    │
│ - events         │           │ - groupAdmins    │
│ - relationships  │           │                  │
└──────────────────┘           └──────────────────┘

AFTER MERGE:
┌──────────────────┐
│ Claimer Account  │  (Managed profile deleted)
│ (User ID: BBB)   │
├──────────────────┤
│ accountStatus:   │
│  active          │
│                  │
│ person_profile:  │  ← Merged data from managed profile
│  biography: "..."│
│  birthDate: ...  │
│                  │
│ Referenced by:   │  ← All refs updated to BBB
│ - groups.leader  │
│ - events         │
│ - relationships  │
│ - invitations    │
│ - groupAdmins    │
└──────────────────┘
```

### Merge Algorithm

```typescript
// File: apps/quilombo/db/queries/profileClaims.ts

/**
 * Merges a managed profile into a claimer's account.
 * This is called when a profile claim is approved.
 *
 * Steps:
 * 1. Copy extended profile data from managed → claimer
 * 2. Update all foreign key references from managed → claimer
 * 3. Delete managed profile's user record
 * 4. Mark merge as completed
 *
 * @param managedUserId - ID of managed profile to merge FROM
 * @param claimerUserId - ID of active account to merge INTO
 * @throws Error if merge fails (transaction rolls back)
 */
export async function mergeProfileIntoAccount(
  managedUserId: string,
  claimerUserId: string
): Promise<void> {
  // Use transaction for atomicity
  await db.transaction(async (tx) => {
    // 1. Fetch both person_profiles
    const managedProfile = await tx.query.personProfiles.findFirst({
      where: eq(schema.personProfiles.userId, managedUserId),
    });

    const claimerProfile = await tx.query.personProfiles.findFirst({
      where: eq(schema.personProfiles.userId, claimerUserId),
    });

    // 2. Merge person_profile data (prefer managed profile's data)
    if (managedProfile) {
      if (claimerProfile) {
        // Update existing claimer profile with managed profile data
        await tx
          .update(schema.personProfiles)
          .set({
            // Copy biographical data (only if not already set in claimer profile)
            birthDate: claimerProfile.birthDate || managedProfile.birthDate,
            birthPlace: claimerProfile.birthPlace || managedProfile.birthPlace,
            passedDate: managedProfile.passedDate, // Should be null (claimer is alive)
            passedPlace: managedProfile.passedPlace,

            // Merge extended content (prefer claimer's if exists, else use managed)
            biography: claimerProfile.biography || managedProfile.biography,
            achievements: claimerProfile.achievements || managedProfile.achievements,
            style: claimerProfile.style || managedProfile.style,

            // Clear managed flags
            isManaged: false,
            managedBy: null,
            managedReason: null,

            // Update timestamps
            updatedAt: new Date(),
          })
          .where(eq(schema.personProfiles.userId, claimerUserId));
      } else {
        // Create claimer profile with managed profile data
        await tx.insert(schema.personProfiles).values({
          userId: claimerUserId,
          birthDate: managedProfile.birthDate,
          birthPlace: managedProfile.birthPlace,
          biography: managedProfile.biography,
          achievements: managedProfile.achievements,
          style: managedProfile.style,
          isManaged: false,
        });
      }
    }

    // 3. Update all foreign key references
    // Note: This must handle ALL tables that reference users.id

    // 3a. Groups
    await tx
      .update(schema.groups)
      .set({ leader: claimerUserId })
      .where(eq(schema.groups.leader, managedUserId));

    await tx
      .update(schema.groups)
      .set({ createdBy: claimerUserId })
      .where(eq(schema.groups.createdBy, managedUserId));

    await tx
      .update(schema.groups)
      .set({ claimedBy: claimerUserId })
      .where(eq(schema.groups.claimedBy, managedUserId));

    // 3b. Group Admins
    await tx
      .update(schema.groupAdmins)
      .set({ userId: claimerUserId })
      .where(eq(schema.groupAdmins.userId, managedUserId));

    // 3c. Events
    await tx
      .update(schema.events)
      .set({ creatorId: claimerUserId })
      .where(eq(schema.events.creatorId, managedUserId));

    // 3d. Update events.associatedUsers array (PostgreSQL array update)
    await tx.execute(sql`
      UPDATE events
      SET associated_users = array_replace(associated_users, ${managedUserId}, ${claimerUserId})
      WHERE ${managedUserId} = ANY(associated_users)
    `);

    // 3e. Invitations
    await tx
      .update(schema.invitations)
      .set({ createdBy: claimerUserId })
      .where(eq(schema.invitations.createdBy, managedUserId));

    await tx
      .update(schema.invitations)
      .set({ acceptedBy: claimerUserId })
      .where(eq(schema.invitations.acceptedBy, managedUserId));

    // 3f. Group Claims
    await tx
      .update(schema.groupClaims)
      .set({ userId: claimerUserId })
      .where(eq(schema.groupClaims.userId, managedUserId));

    await tx
      .update(schema.groupClaims)
      .set({ processedBy: claimerUserId })
      .where(eq(schema.groupClaims.processedBy, managedUserId));

    // 3g. Group Verifications
    await tx
      .update(schema.groupVerifications)
      .set({ userId: claimerUserId })
      .where(eq(schema.groupVerifications.userId, managedUserId));

    // 3h. Person Relationships (when Phase 4+ implemented)
    // await tx
    //   .update(schema.personRelationships)
    //   .set({ personId: claimerUserId })
    //   .where(eq(schema.personRelationships.personId, managedUserId));

    // await tx
    //   .update(schema.personRelationships)
    //   .set({ relatedPersonId: claimerUserId })
    //   .where(eq(schema.personRelationships.relatedPersonId, managedUserId));

    // 4. Delete managed profile's person_profile
    if (managedProfile) {
      await tx
        .delete(schema.personProfiles)
        .where(eq(schema.personProfiles.userId, managedUserId));
    }

    // 5. Delete managed profile's user record (CASCADE deletes related records)
    await tx.delete(schema.users).where(eq(schema.users.id, managedUserId));

    // Transaction commits automatically if no errors
  });
}
```

### Merge Validation & Safety

**Pre-Merge Checks**:
1. Verify managed profile exists and has `accountStatus = 'managed_profile'`
2. Verify claimer account exists and has `accountStatus = 'active'`
3. Check for conflicts (e.g., both have `groupId` set - which to keep?)

**Conflict Resolution Strategy**:
- **Biographical data**: Prefer managed profile (more complete)
- **Extended content**: Prefer claimer's if exists (they own it now)
- **Relationships**: Merge both (no conflicts)
- **Group memberships**: Keep both (user can belong to multiple groups over time)

**Rollback on Failure**:
- Use database transaction
- If any step fails, entire merge rolls back
- Log error with full context
- Notify admin of failure

### Admin Approve Flow

```typescript
// File: apps/quilombo/app/api/admin/claims/profiles/[claimId]/approve/route.ts

export async function PUT(
  _: NextRequest,
  { params }: { params: Promise<{ claimId: string }> }
) {
  const session = await getServerSession(nextAuthOptions);

  // Check auth & permissions
  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Global admin access required' }, { status: 403 });
  }

  try {
    const { claimId } = await params;

    // Fetch claim details
    const claim = await getProfileClaim(claimId);
    if (!claim) {
      return NextResponse.json({ error: 'Claim not found' }, { status: 404 });
    }

    // Verify claim is pending
    if (claim.status !== 'pending') {
      return NextResponse.json({ error: 'Claim already processed' }, { status: 400 });
    }

    // **CRITICAL: Merge accounts**
    await mergeProfileIntoAccount(claim.claimedProfileUserId, claim.claimerUserId);

    // Update claim status
    await db
      .update(schema.profileClaims)
      .set({
        status: 'approved',
        processedAt: new Date(),
        processedBy: session.user.id,
      })
      .where(eq(schema.profileClaims.id, claimId));

    // Fetch claimer details for email
    const claimer = await fetchUser(claim.claimerUserId);

    // Send success email
    if (claimer?.email) {
      try {
        const emailProvider = getEmailProvider();
        await emailProvider.sendProfileClaimApprovedEmail(
          claimer.email,
          claimer.name || claimer.nickname || claimer.email
        );
      } catch (emailError) {
        console.error('Failed to send approval email:', emailError);
        // Don't fail the request
      }
    }

    return NextResponse.json({
      message: 'Profile claim approved and accounts merged successfully.',
    });
  } catch (error) {
    console.error('Error approving profile claim:', error);

    return NextResponse.json(
      { error: generateErrorMessage(error, 'Failed to approve claim. Merge may have failed.') },
      { status: 500 }
    );
  }
}
```

---

## User Flows

### Flow 1: Admin Creates Managed Profile

```
1. Admin navigates to Admin Dashboard → Managed Profiles
2. Clicks "Create Profile" button
3. Fills out form:
   - Name: Manuel dos Reis Machado
   - Nickname: Mestre Bimba
   - Title: Mestre
   - Birth: November 23, 1900
   - Passed: February 5, 1974
   - Biography: "Founder of Capoeira Regional..."
   - Style: Regional
   - Reason: "Historical figure, founder of Capoeira Regional"
4. Clicks "Create"
5. System creates:
   - users record (accountStatus = 'managed_profile')
   - person_profiles record (isManaged = true)
6. Profile now appears in search and can be referenced
```

### Flow 2: User Claims Managed Profile

```
1. User searches for "Mestre João Silva"
2. Finds profile with "🏛 Managed Profile" badge
3. Clicks "Claim This Profile" button
4. Fills out claim form:
   - Message: "This is me. I founded Grupo ABC in 1995..."
   - Evidence: https://grupoabc.com/mestre, https://instagram.com/mestre_joao
5. Submits claim
6. System:
   - Creates profile_claims record (status = pending)
   - Sends email to admins
7. User sees: "Claim submitted. You'll be notified when reviewed."
```

### Flow 3: Admin Approves Claim

```
1. Admin receives email: "New profile claim requires review"
2. Navigates to Admin Dashboard → Profile Claims
3. Sees pending claim with details:
   - Managed Profile: Mestre João Silva
   - Claimed By: user@example.com (João Silva)
   - Message: "This is me..."
   - Evidence: [links]
4. Clicks "View Details"
5. Reviews information, clicks evidence links
6. Decides to approve, clicks "Approve Claim"
7. System:
   - Calls mergeProfileIntoAccount()
   - Copies biographical data
   - Updates all foreign key references
   - Deletes managed profile user record
   - Marks claim as approved
   - Sends success email to claimer
8. Admin sees: "Claim approved. Accounts merged successfully."
9. User receives email: "Your claim has been approved!"
10. User logs in, sees their profile now has all the biographical data
```

### Flow 4: Group References Managed Profile as Founder

```
1. Admin creates group "Capoeira Regional Bahia"
2. Sets leader: Mestre João Silva (managed profile, not yet claimed)
3. Group page shows:
   - Leader: Mestre João Silva 🏛
4. Users can click on Mestre João Silva → see full profile
5. Later, Mestre João Silva joins app and claims profile
6. Group.leader reference automatically points to his active account
7. Group page now shows:
   - Leader: Mestre João Silva ✓ (active account)
```

---

## Security & Permissions

### Permission Matrix

| Action | Global Admin | Designated Manager | Regular User | Anonymous |
|--------|-------------|-------------------|--------------|-----------|
| Create managed profile | ✅ | ❌ | ❌ | ❌ |
| Edit managed profile | ✅ | ✅ (assigned only) | ❌ | ❌ |
| Delete managed profile | ✅ | ❌ | ❌ | ❌ |
| View managed profile | ✅ | ✅ | ✅ | ✅ |
| Search managed profiles | ✅ | ✅ | ✅ | ✅ |
| Submit profile claim | ❌ | ❌ | ✅ (active only) | ❌ |
| Approve/reject claim | ✅ | ❌ | ❌ | ❌ |

### Access Control Implementation

**Check 1: Global Admin (Most Actions)**
```typescript
const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
if (!isUserGlobalAdmin) {
  return NextResponse.json({ error: 'Global admin required' }, { status: 403 });
}
```

**Check 2: Designated Manager (Edit Assigned Profile)**
```typescript
const profile = await fetchPersonProfile(profileUserId);
if (!isUserGlobalAdmin && profile.managedBy !== session.user.id) {
  return NextResponse.json({ error: 'Not authorized to edit this profile' }, { status: 403 });
}
```

**Check 3: Active User (Submit Claim)**
```typescript
const user = await fetchUser(session.user.id);
if (user.accountStatus !== 'active') {
  return NextResponse.json({ error: 'Only active accounts can claim profiles' }, { status: 403 });
}
```

### Security Considerations

**1. Prevent Claiming Own Account**
```typescript
if (session.user.id === claimedProfileUserId) {
  return NextResponse.json({ error: 'Cannot claim your own profile' }, { status: 400 });
}
```

**2. Prevent Multiple Pending Claims**
- Check for existing pending claim before creating new one
- User can only have one pending claim per profile

**3. Validate Managed Profile State**
```typescript
if (targetUser.accountStatus !== 'managed_profile') {
  return NextResponse.json({ error: 'Profile is not claimable' }, { status: 400 });
}
```

**4. Transaction-Safe Merging**
- Use database transactions for account merging
- If any step fails, entire merge rolls back
- Prevents partial merges that leave data inconsistent

**5. Audit Trail**
- `profile_claims` table keeps history of all claims
- `person_profiles.managedBy` tracks who manages profile
- All actions logged with `createdBy` / `processedBy` fields

---

## Edge Cases & Error Handling

### Edge Case 1: Managed Profile Deleted Before Claim Approved

**Scenario**: Admin deletes managed profile while claim is pending

**Handling**:
- Database cascade deletes `profile_claims` record (ON DELETE CASCADE)
- If admin tries to approve, API returns 404 "Claim not found"
- User notified via email that profile was removed

### Edge Case 2: Claimer Deletes Account Before Merge

**Scenario**: User submits claim, then deletes their account

**Handling**:
- Database sets `profile_claims.claimerUserId = NULL` (ON DELETE SET NULL)
- Claim stays in system with "Claimer deleted" status
- Admin can reject claim with note "Claimer account deleted"

### Edge Case 3: Multiple Users Claim Same Profile

**Scenario**: Two users both claim "Mestre João Silva"

**Handling**:
- Both claims enter pending queue
- Admin reviews both, approves the legitimate one
- Other claim gets rejected with note explaining decision
- First-come-first-served is NOT automatic (admin decides)

### Edge Case 4: Managed Profile Already Has Group Admin Role

**Scenario**: Managed profile is admin of Group X, claimer is admin of Group Y

**Handling**:
- Merge keeps both group admin relationships
- Claimer becomes admin of both Group X and Group Y
- No conflict (users can admin multiple groups)

### Edge Case 5: Claimer Already Has Biography

**Scenario**: Claimer wrote their own biography, managed profile also has one

**Handling**:
- Merge logic: Prefer claimer's biography (they own it now)
- Fallback to managed profile's biography if claimer's is empty
- Admin can review merge preview before approving (future enhancement)

### Edge Case 6: Nickname Conflict After Merge

**Scenario**: Can't happen - managed profile and claimer have different nicknames

**Handling**:
- Managed profile keeps its nickname until merged
- After merge, managed user record deleted, no conflict
- Claimer keeps their original nickname

### Edge Case 7: Network Error During Merge

**Scenario**: Database connection lost mid-merge

**Handling**:
- Transaction rolls back automatically
- Claim remains in "pending" state
- Admin sees error message: "Merge failed, please retry"
- Can retry approval (idempotent operation)

---

## Testing Strategy

### Unit Tests

**1. Database Queries**
- `createManagedProfile()` - creates user + person_profile correctly
- `mergeProfileIntoAccount()` - updates all foreign keys
- `isProfileClaimable()` - returns correct boolean
- `hasPendingClaim()` - detects existing claims

**2. Validation Schemas**
- `createManagedProfileSchema` - validates all fields
- `profileClaimSchema` - validates message & evidence URLs

### Integration Tests

**1. Create Managed Profile Flow**
```typescript
test('Admin can create managed profile', async () => {
  // Given: Logged in as global admin
  // When: POST /api/admin/profiles/managed
  // Then: User + person_profile created, accountStatus = managed_profile
});

test('Non-admin cannot create managed profile', async () => {
  // Given: Logged in as regular user
  // When: POST /api/admin/profiles/managed
  // Then: Returns 403 Forbidden
});
```

**2. Claim Profile Flow**
```typescript
test('User can claim managed profile', async () => {
  // Given: Managed profile exists, user is active
  // When: POST /api/profiles/[userId]/claim
  // Then: Claim created, status = pending
});

test('Cannot claim non-managed profile', async () => {
  // Given: Target profile is active account (not managed)
  // When: POST /api/profiles/[userId]/claim
  // Then: Returns 400 "Profile is not claimable"
});

test('Cannot submit duplicate claim', async () => {
  // Given: User already has pending claim for this profile
  // When: POST /api/profiles/[userId]/claim again
  // Then: Returns 409 "Already have pending claim"
});
```

**3. Merge Flow**
```typescript
test('Merge copies biographical data correctly', async () => {
  // Given: Managed profile with biography, claimer without
  // When: mergeProfileIntoAccount(managedId, claimerId)
  // Then: Claimer's person_profile has managed profile's biography
});

test('Merge updates all foreign key references', async () => {
  // Given: Managed profile is leader of group, creator of event
  // When: mergeProfileIntoAccount(managedId, claimerId)
  // Then: group.leader = claimerId, event.creatorId = claimerId
});

test('Merge deletes managed profile user record', async () => {
  // Given: Managed profile exists
  // When: mergeProfileIntoAccount(managedId, claimerId)
  // Then: Managed user record deleted, claimer exists
});

test('Merge rolls back on error', async () => {
  // Given: Database will throw error during merge
  // When: mergeProfileIntoAccount(managedId, claimerId)
  // Then: Transaction rolls back, both profiles still exist unchanged
});
```

**4. Approval Flow**
```typescript
test('Admin can approve claim', async () => {
  // Given: Pending claim exists
  // When: PUT /api/admin/claims/profiles/[claimId]/approve
  // Then: Claim status = approved, accounts merged, email sent
});

test('Non-admin cannot approve claim', async () => {
  // Given: Logged in as regular user
  // When: PUT /api/admin/claims/profiles/[claimId]/approve
  // Then: Returns 403 Forbidden
});
```

### Manual Testing Checklist

**Phase 1: Managed Profiles**
- [ ] Create managed profile as global admin
- [ ] Edit managed profile
- [ ] View managed profile in user search
- [ ] View managed profile page (shows "Managed" badge)
- [ ] Reference managed profile as group leader
- [ ] Try to create managed profile as non-admin (should fail)

**Phase 2: Profile Claims**
- [ ] Click "Claim This Profile" button as active user
- [ ] Fill out claim form with message + evidence
- [ ] Submit claim
- [ ] View pending claims in admin dashboard
- [ ] Try to submit duplicate claim (should fail)
- [ ] Try to claim non-managed profile (should fail)

**Phase 3: Merging**
- [ ] Approve claim as admin
- [ ] Verify claimer's profile now has biographical data
- [ ] Verify all references updated (group.leader, events, etc.)
- [ ] Verify managed profile deleted
- [ ] Verify claimer receives success email
- [ ] Try to approve already-processed claim (should fail)

---

## Future Enhancements

### Enhancement 1: Management Rights Request (Phase 4 Extension)

**Goal**: Allow students to request management rights for deceased mestres' profiles

**Use Case**: Student wants to maintain their deceased mestre's profile

**Implementation**:
- Similar to profile claims workflow
- User clicks "Request Management Rights" on managed profile
- Submits justification + evidence of relationship (student, family member, etc.)
- Admin reviews and approves/rejects
- Upon approval: `person_profiles.managedBy` set to requesting user
- Manager gains edit rights but NOT claiming rights (profile stays managed)
- Global admin can always revoke management rights if issues arise

**Table: Profile Management Requests**
```typescript
export const profileManagementRequests = pgTable('profile_management_requests', {
  id: uuid('id').defaultRandom().primaryKey(),
  profileUserId: uuid('profile_user_id').references(() => users.id).notNull(),
  requesterUserId: uuid('requester_user_id').references(() => users.id).notNull(),
  status: enum('status', ['pending', 'approved', 'rejected']).notNull().default('pending'),
  requestedAt: timestamp('requested_at').notNull().defaultNow(),
  processedAt: timestamp('processed_at'),
  processedBy: uuid('processed_by').references(() => users.id),
  userMessage: text('user_message').notNull(),
  evidenceUrls: json('evidence_urls').$type<string[]>(),
  adminNotes: text('admin_notes'),
});
```

**Permissions**:
- Manager can edit profile (biography, dates, etc.)
- Manager CANNOT delete profile
- Manager CANNOT transfer management to someone else
- Global admin can revoke management rights at any time
- If manager posts false information, admin can revoke rights

**Time Estimate**: 1 week (already planned as Phase 4)

### Enhancement 2: Merge Preview

**Goal**: Show admin what will happen before approving claim

**Features**:
- Side-by-side comparison of managed vs claimer profile
- List of all foreign key references that will be updated
- Conflict warnings (e.g., both have different birthDates)
- "Proceed with Merge" confirmation

**Time Estimate**: 1 week

### Enhancement 3: Bulk Import Historical Figures

**Goal**: Import all major mestres from JSON file

**Implementation**:
- Script to read `capoeira-lineage-with-descriptions.json`
- For each person:
  - Create managed profile
  - Create person_profile with biography
  - Create person_relationships (from `studentOf` array)
- Admin UI: "Import Lineage Data" button

**Time Estimate**: 1 week (includes relationship modeling from genealogy research)

### Enhancement 4: Community Verification

**Goal**: Allow community to verify biographical information

**Features**:
- "Suggest Edit" button on managed profiles
- Users submit proposed changes with sources
- Admin reviews and approves/rejects
- Track edit history and contributors

**Time Estimate**: 2 weeks

### Enhancement 5: Lineage Tree Visualization

**Goal**: Interactive genealogy tree showing teacher-student relationships

**Features**:
- D3.js or similar for tree rendering
- Click on person → expand their students/teachers
- Filter by style (Angola / Regional / Contemporânea)
- Search within tree
- Export tree as image

**Time Estimate**: 3 weeks

### Enhancement 6: Automated Claiming via OAuth

**Goal**: Streamline claiming for users with public profiles

**Features**:
- "Claim with Instagram" button
- OAuth login to Instagram
- Verify account matches managed profile
- Auto-approve if verification passes

**Time Estimate**: 2 weeks

---

## Implementation Checklist

### Phase 1: Managed Profiles (Week 1)
- [ ] Database migration: Add `person_profiles` table
- [ ] Database migration: Add `accountStatus = 'managed_profile'`
- [ ] API: POST /api/admin/profiles/managed (create)
- [ ] API: PUT /api/admin/profiles/managed/[userId] (edit)
- [ ] API: GET /api/admin/profiles/managed (list)
- [ ] DB queries: createManagedProfile, updateManagedProfile, listManagedProfiles
- [ ] Update searchUsers to include managed profiles
- [ ] UI: Admin dashboard - Managed Profiles section
- [ ] UI: Create/Edit Managed Profile modal
- [ ] UI: Profile page - Show "Managed" badge
- [ ] Validation: createManagedProfileSchema
- [ ] Tests: Unit + integration tests for create/edit
- [ ] Documentation: Update API docs

### Phase 2: Profile Claims (Week 2)
- [ ] Database migration: Add `profile_claims` table
- [ ] API: POST /api/profiles/[userId]/claim (submit claim)
- [ ] API: GET /api/admin/claims/profiles (list pending)
- [ ] API: PUT /api/admin/claims/profiles/[id]/approve
- [ ] API: PUT /api/admin/claims/profiles/[id]/reject
- [ ] DB queries: createProfileClaim, getPendingProfileClaims, etc.
- [ ] UI: "Claim This Profile" button on managed profiles
- [ ] UI: Claim Profile modal
- [ ] UI: Admin - Profile Claims dashboard
- [ ] UI: Claim detail view
- [ ] Email: Notify admins of new claims
- [ ] Email: Notify user of claim approval/rejection
- [ ] Validation: profileClaimSchema
- [ ] Tests: Unit + integration tests for claiming
- [ ] Documentation: Update API docs

### Phase 3: Account Merging (Week 3)
- [ ] DB function: mergeProfileIntoAccount with transaction
- [ ] Handle: Copy person_profile data
- [ ] Handle: Update all foreign key references (groups, events, etc.)
- [ ] Handle: Delete managed user record
- [ ] Handle: Error handling + rollback
- [ ] Integrate merge into approve flow
- [ ] UI: Show merge status in admin approval flow
- [ ] Tests: Comprehensive merge scenarios
- [ ] Tests: Rollback on failure
- [ ] Tests: Verify all references updated
- [ ] Documentation: Merge algorithm docs

### Phase 4: Polish & Documentation (Week 4)
- [ ] End-to-end testing: Complete flows
- [ ] Security audit: Permission checks
- [ ] Performance: Index optimization
- [ ] Documentation: User guide for claiming profiles
- [ ] Documentation: Admin guide for managing profiles
- [ ] Migration: Run on staging environment
- [ ] Deploy to production

---

## Appendix: Related Specifications

This specification builds on and relates to:

1. **[Capoeira Genealogy Research Report](./capoeira-genealogy-research.md)**
   - Comprehensive research on lineage structures
   - Database schema recommendations for relationships
   - Future roadmap for full genealogy tree

2. **Group Claims System** (existing)
   - Similar workflow used as pattern
   - Files: `apps/quilombo/db/queries/groupClaims.ts`
   - Files: `apps/quilombo/app/api/admin/claims/[claimId]/approve/route.ts`

---

**End of Specification**

**Status**: Ready for implementation
**Priority**: High (foundational for genealogy tree)
**Dependencies**: None (can start immediately)
