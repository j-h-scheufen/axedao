# Flow 3: Group Claiming & Management

## Overview

Groups have a different relationship with genealogy than users: **all groups must have a genealogy profile**. Unlike users (where a genealogy profile is optional), group identity data lives exclusively in genealogy.

This document covers:

1. **Flow 3A**: Register a new group (not in genealogy) via claim request
2. **Flow 3B**: Claim an existing genealogy group to manage in app
3. **Flow 3C**: Profile management (post-linking)

## Key Principles

### All Groups Require Genealogy Profile

Unlike users, groups cannot exist in `public.groups` without a corresponding `genealogy.group_profiles` entry. The genealogy profile is the **source of truth** for group identity.

### Data Location

| Data | Location | Reason |
|------|----------|--------|
| Group name | `genealogy.group_profiles.name` | Public identity |
| Description | `genealogy.group_profiles.description_en/pt` | Public documentation |
| Style | `genealogy.group_profiles.style` | Public identity |
| Logo | `genealogy.group_profiles.logo` | Public identity |
| Links | `genealogy.group_profiles.links` | Public references |
| Founded year | `genealogy.group_profiles.founded_year` | Historical data |
| Philosophy/History | `genealogy.group_profiles` | Public documentation |
| Lineage (predicates) | `genealogy.statements` | Relationship data |
| Locations | `public.group_locations` | Operational data |
| Admins | `public.group_admins` | App management |
| Members | `genealogy.statements` (member_of) | Public genealogy |
| Verification status | `public.groups.verified` | App trust signal |
| Banner | `public.groups.banner` | App-specific display |
| Email | `public.groups.email` | Operational contact |

### Relationship

```
genealogy.group_profiles          public.groups
├── id ◄─────────────────────── profile_id (required)
├── name (source of truth)      ├── id
├── style                       ├── created_by
├── logo                        ├── email
├── founded_year                ├── banner
├── history_en/pt               ├── verified
├── philosophy_en/pt            └── (group_locations, group_admins)
└── statements[]
```

## Flow 3A: Register New Group (Not in Genealogy)

**Scenario**: User wants to register a group that doesn't exist in the genealogy database.

### User Journey

#### Entry Point

User navigates to "Register a Group" from groups page or navigation:

```
Register a New Group

Is your group already in the Capoeira Genealogy?
[Search Genealogy] - Find and claim an existing group

Or register a new group:
[Register New Group]
```

#### Step 1: Search Confirmation

Before allowing new registration, prompt user to search:

```
Search Existing Groups

Before registering a new group, please search to see if
your group is already in the genealogy database.

Group Name: [search input]
[Search]

No results found? You can register a new group below.
[Register New Group]
```

#### Step 2: Claim Submission (New Group)

```
Register Group

Group Information:
Name: [input, required]
Website: [input, helps verify legitimacy]
Style: [dropdown, optional]

Your Connection:
[ ] I am a founder/leader of this group
[ ] I am an administrator of this group
[ ] I have authorization from group leadership

Supporting Information:
[Textarea: Describe your role and why you should manage this group]

This request will be reviewed by our team to verify the group
is a legitimate, active capoeira organization.

[Submit Registration Request]
```

#### Step 3: Pending Review

```
Registration Submitted!

Your request to register "[Group Name]" has been submitted.

What happens next:
- Our team will review your request
- We'll verify this is an active capoeira group
- You'll be notified when approved

Typical review time: 1-3 business days

[View My Pending Claims]
```

### Admin Review

Admin sees claim in `/admin/group-claims`:

```
New Group Registration

Submitted by: [User Name]
Requested: [date]

Proposed Group:
  Name: [name]
  Website: [url]
  Style: [style]

User's Message:
"[their justification]"

User Role: Administrator

Actions:
[Approve] [Reject] [Request More Info]

Admin Notes:
[Textarea for admin notes]
```

### Technical Implementation (On Claim Approval)

```sql
BEGIN;

-- 1. Create genealogy profile
INSERT INTO genealogy.group_profiles (
  name, style, links
) VALUES (
  $proposedName, $style, ARRAY[$website]
) RETURNING id AS profile_id;

-- 2. Create public.groups entry linked to profile
INSERT INTO public.groups (
  id, profile_id, created_by, claimed_by, claimed_at, verified
) VALUES (
  gen_random_uuid(), $profileId, $userId, $userId, now(), false
) RETURNING id AS group_id;

-- 3. Add claimant as admin
INSERT INTO public.group_admins (group_id, user_id)
VALUES ($groupId, $userId);

-- 4. Update claim status
UPDATE public.group_claims
SET
  status = 'approved',
  processed_by = $adminId,
  processed_at = now(),
  admin_notes = $notes
WHERE id = $claimId;

COMMIT;
```

## Flow 3B: Claim Existing Genealogy Group

**Scenario**: Group exists in genealogy (community-curated data), user wants to manage it in the app.

### User Journey

#### Entry Point

User browses genealogy and finds their group:

```
[Group Name]
[Logo if any]

Style: Angola
Founded: 1980, Salvador
Founder: Mestre [Name]

Status: Not managed in Quilombo
[Claim This Group]
```

Or from search results:

```
Search Results for "Senzala"

1. Grupo Senzala
   Style: Regional
   Founded: 1963
   Status: Not managed
   [Claim]

2. Senzala de Santos
   Style: Contemporânea
   Founded: 1985
   Status: Managed by @username
   [View]
```

#### Step 1: Claim Submission

```
Claim Group Management

You're requesting to manage "[Group Name]" in Quilombo.

This will allow you to:
- Add training locations to the map
- Manage group membership
- Update group information
- Create events

Your Connection:
[ ] I am a founder/leader of this group
[ ] I am an administrator of this group
[ ] I have authorization from group leadership

Your Role: [dropdown: founder, leader, coordinator, administrator, authorized representative]

Supporting Information:
[Textarea: Why should you manage this group?]

[Submit Claim]
```

#### Step 2: Admin Review

Same as existing group claims flow:
- Admin reviews claim
- Approves or rejects
- On approval: Creates `public.groups` entry linked to genealogy

#### Step 3: Post-Approval Setup

```
Claim Approved!

You now manage "[Group Name]" in Quilombo.

Let's set up your group:

1. Add your training locations
   [Add Location]

2. Complete operational details
   [Edit Group Settings]

3. View your genealogy profile
   [View Genealogy Profile]

[Skip Setup] [Continue]
```

### Technical Implementation (On Claim Approval)

```sql
BEGIN;

-- 1. Create public.groups entry linked to existing profile
INSERT INTO public.groups (
  id, profile_id, created_by, claimed_by, claimed_at, verified
) VALUES (
  gen_random_uuid(), $genealogyProfileId, $userId, $userId, now(), false
) RETURNING id AS group_id;

-- 2. Add claimant as admin
INSERT INTO public.group_admins (group_id, user_id)
VALUES ($groupId, $userId);

-- 3. Update claim status
UPDATE public.group_claims
SET
  status = 'approved',
  processed_by = $adminId,
  processed_at = now(),
  admin_notes = $notes
WHERE id = $claimId;

COMMIT;
```

## Flow 3C: Profile Management (Post-Linking)

**Scenario**: Group exists in both schemas (profile_id is set), admin manages data.

### Two Edit Contexts

#### 1. App Group Settings (Operational)

```
/groups/[groupId]/edit

Group Settings

Contact & Display:
Email: [input]
Banner Image: [upload]

Locations:
[List of locations with edit/delete]
[Add Location]

Administrators:
[List of admins with remove]
[Add Admin]

Verification Status: [Verified/Unverified]
[Request Verification]

[Save Changes]
```

#### 2. Genealogy Profile (Identity & Historical)

```
/groups/[groupId]/genealogy

Genealogy Profile

Basic Information:
Name: [input]
Style: [dropdown]
Logo: [upload]
Website/Links: [multi-input]

Founding Information:
Founded Year: [input]
Founded Location: [input]

Description:
English: [textarea]
Portuguese: [textarea]

History:
English: [textarea]
Portuguese: [textarea]

Philosophy:
English: [textarea]
Portuguese: [textarea]

Lineage Connections:
- Parent Group: [search/select]
- Split from: [search/select]
- Affiliations: [list with add/remove]

Founders:
[list with search/add from person_profiles]

Current Leaders:
[list with search/add from person_profiles]

[Save Changes]
```

## Database Schema Changes

### Updates to `group_claims` Table

The existing `group_claims` table needs modification to support both scenarios:

```sql
ALTER TABLE public.group_claims
  -- For claiming existing genealogy groups
  ADD COLUMN profile_id UUID REFERENCES genealogy.group_profiles(id),
  -- For registering new groups
  ADD COLUMN proposed_name VARCHAR(255),
  ADD COLUMN proposed_style style,
  ADD COLUMN website VARCHAR(500),
  -- Remove group_id column (groups cannot exist without genealogy profile)
  DROP COLUMN group_id;

-- Add constraint: either profile_id OR proposed_name must be set
ALTER TABLE public.group_claims
ADD CONSTRAINT group_claims_target_check CHECK (
  (profile_id IS NOT NULL) OR
  (proposed_name IS NOT NULL)
);

-- Index for genealogy profile claims
CREATE INDEX group_claims_profile_idx ON public.group_claims(profile_id);
```

### Claim Types

| Scenario | profile_id | proposed_name |
|----------|------------|---------------|
| Claim genealogy group (Flow 3B) | set | null |
| Register new group (Flow 3A) | null | set |

Note: There is no "claim existing `public.groups`" scenario because groups cannot exist without a genealogy profile.

## API Endpoints

### POST /api/groups/claims

Submit a claim request (handles both scenarios).

**Request Body**:
```typescript
// Claim genealogy group (Flow 3B)
{ profileId: string; userMessage: string }

// Register new group (Flow 3A)
{
  proposedName: string;
  website?: string;
  style?: Style;
  userMessage: string;
}
```

**Response**: `{ claimId: string; status: 'pending' }`

### GET /api/admin/group-claims

List pending claims (existing endpoint, now includes all claim types).

**Response** includes claim type indicator:
```typescript
{
  claims: Array<{
    id: string;
    type: 'genealogy_group' | 'new_group';
    profileId?: string;
    proposedName?: string;
    website?: string;
    style?: string;
    user: { id: string; name: string };
    userMessage: string;
    requestedAt: string;
  }>
}
```

### PUT /api/admin/group-claims/:claimId/approve

Approve a claim (handles both scenarios).

**For new group (Flow 3A)**:
1. Create `genealogy.group_profiles`
2. Create `public.groups` with `profile_id`, set `claimed_by` and `claimed_at`
3. Add claimant as admin

**For genealogy group (Flow 3B)**:
1. Create `public.groups` with `profile_id`, set `claimed_by` and `claimed_at`
2. Add claimant as admin

### PUT /api/admin/group-claims/:claimId/reject

Reject a claim with admin notes.

### PATCH /api/genealogy/groups/:profileId

Update genealogy-specific group data.

**Request Body**:
```typescript
{
  name?: string;
  descriptionEn?: string;
  descriptionPt?: string;
  style?: Style;
  logo?: string;
  links?: string[];
  foundedYear?: number;
  foundedLocation?: string;
  historyEn?: string;
  historyPt?: string;
  philosophyEn?: string;
  philosophyPt?: string;
}
```

## Component Structure

```
/components/groups/
  claims/
    RegisterGroupForm.tsx     # Flow 3A: New group registration
    ClaimGroupModal.tsx       # Flow 3B: Claim existing genealogy group
    ClaimStatusBadge.tsx      # Shows pending/approved/rejected
    PostApprovalSetup.tsx     # Setup wizard after approval

  GenealogyProfile/
    index.tsx                 # Main genealogy profile editor
    BasicInfoForm.tsx         # Name, style, logo, links
    FoundingForm.tsx          # Founded year, location
    ContentForm.tsx           # Description, history, philosophy (bilingual)
    LineageConnections.tsx    # Parent group, affiliations
    FoundersList.tsx          # Founder relationships
    LeadersList.tsx           # Current leader relationships

  GroupSettings/
    index.tsx                 # Operational settings editor
    ContactForm.tsx           # Email
    BannerUpload.tsx          # Banner image
    LocationsList.tsx         # Training locations
    AdminsList.tsx            # Group administrators
```

## Page Routes

| Route | Purpose |
|-------|---------|
| `/groups/register` | Flow 3A: Register new group |
| `/groups/[groupId]` | Group profile view |
| `/groups/[groupId]/edit` | Group settings (operational) |
| `/groups/[groupId]/genealogy` | Genealogy profile editor (Flow 3C) |
| `/genealogy/groups/[profileId]` | Genealogy-only group view (no app entry) |
| `/genealogy/groups/[profileId]/claim` | Flow 3B: Claim genealogy group |
| `/admin/group-claims` | Admin review of all claims |

## Special Cases

### Genealogy-Only Groups

Valid state for:
- Historical groups (dissolved, no longer active)
- Groups not yet managed in app
- International groups with no local representation

These groups:
- Appear in genealogy views
- Show "Claim This Group" button
- Do NOT appear on the app's group map

### Group Without App Entry (Genealogy Only)

```
/genealogy/groups/[profileId]

[Group Name]
[Logo]

Style: Angola
Founded: 1980, Salvador

This group is not yet managed in Quilombo.
[Claim to Manage This Group]

Lineage:
- Founder: Mestre [Name]
- Parent Group: [linked]

History:
[historical text]
```

### Legacy Groups (1 in production)

Production has only 1 existing group without `profile_id`:
- Will be migrated in Flow 4 (trivial single-row migration)
- Until then, existing group continues to work

## Migration Considerations

### New Groups

All new groups created via this flow will have:
- `genealogy.group_profiles` entry (always)
- `public.groups` entry with `profile_id` set (always)

### Existing Groups

**Deferred to Flow 4**: Migration of the 1 existing production group to have a genealogy profile (trivial).

Until Flow 4:
- The one existing group continues to work without `profile_id`
- New groups follow the new flow
- Group edit form shows genealogy fields only if `profile_id` is set

## Success Metrics

- New group registrations submitted and processed
- Genealogy group claims submitted and processed
- Average claim review time
- Claim approval rate
- Post-approval setup completion rate

## Dependencies

- **Flow 1 & 2**: Person profiles must exist for founder/leader relationships
- **Genealogy schema**: `genealogy.group_profiles` and `genealogy.statements` tables

## Future Work (Flow 4)

The following will be addressed in Flow 4 (Groups Schema Migration):

1. Migrate existing groups to have genealogy profiles
2. Remove duplicate columns from `public.groups`
3. Update all queries to JOIN to genealogy
4. Convert leader/founder to predicate-based queries
