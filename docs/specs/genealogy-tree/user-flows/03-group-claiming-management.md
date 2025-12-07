# Flow 3: Group Claiming & Management

## Overview

Groups have a different relationship with genealogy than users because group information is inherently public. This document covers:

1. **Existing groups** (`public.groups`): Adding genealogy profiles
2. **Unmanaged genealogy groups**: Creating `public.groups` when claimed
3. **Group-genealogy data synchronization**: What stays where

## Key Principles

### Data Location

| Data | Location | Reason |
|------|----------|--------|
| Group name | `genealogy.group_profiles.name` | Public identity |
| Description | `genealogy.group_profiles.description` | Public documentation |
| Style | `genealogy.group_profiles.style` | Public identity |
| Logo | `genealogy.group_profiles.logo` | Public identity |
| Founded year | `genealogy.group_profiles.founded_year` | Historical data |
| Philosophy/History | `genealogy.group_profiles` | Public documentation |
| Lineage (predicates) | `genealogy.statements` | Relationship data |
| Locations | `public.groups` via `group_locations` | Operational data |
| Admins | `public.groups` via `group_admins` | App management |
| Members | `genealogy.statements` (member_of) | Public genealogy |
| Verification status | `public.groups.verified` | App trust signal |

### Relationship

```
genealogy.group_profiles          public.groups
├── id ◄─────────────────────── profile_id
├── name (source of truth)      ├── id
├── style                       ├── (created_by, admins)
├── founded_year                ├── locations[]
├── history                     └── verified
└── statements[]
```

## Flow 3A: Publish Existing Group to Genealogy

**Scenario**: Group already exists in `public.groups` (legacy group), admin wants to add it to genealogy.

### User Journey

#### Entry Point

Group admin views their group page:

```
[Group Name]
[Logo]

Style: [style]
Locations: [list]
Members: [count]

Genealogy Status: Not Published
[Publish to Genealogy]
```

#### Step 1: Review Current Data

```
Publish Group to Genealogy

Current group information:

Name: [name]
Style: [style]
Description: [description]

This information will be copied to the Capoeira Genealogy
as public historical data.

You can add more genealogy-specific information in the next step.

[Cancel] [Continue]
```

#### Step 2: Genealogy-Specific Data

```
Add Genealogy Details

Founding Information:
Founded Year: [input, optional]
Founded Location: [input, optional]

History & Philosophy:
Group History: [textarea]
Philosophy/Mission: [textarea]

Founder(s):
Search for founder in genealogy: [search]
[Add another founder]

[Skip for now] [Publish]
```

#### Step 3: Success

```
Group Published!

[Group Name] is now part of the Capoeira Genealogy.

Next steps:
- Add lineage connections (parent group, affiliations)
- Invite members to join the genealogy
- Add historical information

[View Genealogy Profile] [Manage Group]
```

### Technical Implementation

```sql
BEGIN;

-- 1. Create group_profile
INSERT INTO genealogy.group_profiles (
  name, description, style, logo, links, founded_year,
  founded_year_precision, founded_location, history, philosophy
) VALUES (
  $name, $description, $style, $logo, $links, $foundedYear,
  $precision, $foundedLocation, $history, $philosophy
) RETURNING id;

-- 2. Link to public.groups
UPDATE public.groups
SET profile_id = $profileId
WHERE id = $groupId;

-- 3. Create founder predicates
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id, confidence, created_by
) VALUES
  ('person', $founderId, 'founded', 'group', $profileId, 'unverified', $userId);

COMMIT;
```

## Flow 3B: Claim Unmanaged Genealogy Group

**Scenario**: Group exists only in genealogy (community-curated), user wants to manage it in the app.

### User Journey

#### Entry Point

User browses genealogy and finds their group:

```
[Group Name]
[Logo if any]

Style: Angola
Founded: 1980, Salvador
Founder: Mestre [Name]

Locations: None (not managed in app)
[Claim to Manage This Group]
```

#### Step 1: Claim Submission

```
Claim Group Management

You're requesting to manage "[Group Name]" in Quilombo.

This will allow you to:
- Add training locations to the map
- Manage group members
- Update group information
- Create events

Verification Required:
[ ] I am a leader/administrator of this group
[ ] I have authorization from group leadership

Your Role: [dropdown: founder, leader, coordinator, administrator, authorized representative]

Supporting Information:
[Textarea: optional notes for admin review]

[Submit Claim]
```

This uses the **existing group claims mechanism** (`public.group_claims`).

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

2. Invite members
   [Create Invite Link]

3. Complete your group profile
   [Edit Group]

[Skip Setup] [Continue]
```

### Technical Implementation (On Claim Approval)

```sql
BEGIN;

-- 1. Get genealogy profile info
SELECT name, style, logo, links, description
FROM genealogy.group_profiles
WHERE id = $genealogyProfileId;

-- 2. Create public.groups entry
INSERT INTO public.groups (
  name, style, logo, links, description, profile_id, created_by, verified
) VALUES (
  $name, $style, $logo, $links, $description, $genealogyProfileId, $userId, false
) RETURNING id;

-- 3. Add claimant as admin
INSERT INTO public.group_admins (group_id, user_id)
VALUES ($newGroupId, $userId);

-- 4. Update claim status
UPDATE public.group_claims
SET status = 'approved', reviewed_by = $adminId, reviewed_at = now()
WHERE id = $claimId;

COMMIT;
```

## Flow 3C: Profile Management (Post-Linking)

**Scenario**: Group exists in both schemas, admin manages data.

### Two Edit Contexts

#### 1. App Group Settings (Operational)

```
/groups/[groupId]/edit

Group Settings

Locations:
[List of locations with edit/delete]
[Add Location]

Administrators:
[List of admins with remove]
[Add Admin]

Invite Settings:
- Open invitations: [toggle]
- Invite link: [copy button]

Verification Status: [Verified/Unverified]
[Request Verification]
```

#### 2. Genealogy Profile (Historical)

```
/groups/[groupId]/genealogy

Genealogy Profile

Basic Information:
Name: [input]
Style: [dropdown]
Founded Year: [input]
Founded Location: [input]

Description:
[textarea]

History:
[textarea]

Philosophy:
[textarea]

Lineage Connections:
- Parent Group: [search/select]
- Split from: [search/select]
- Affiliations: [list with add/remove]

Founder(s):
[list with search/add]

[Save Changes]
```

### Sync Prompts

When user edits shared fields (name, style, logo, description) in one context:

```
Update Genealogy Profile?

You've changed the group name. Would you like to
update the genealogy record as well?

[Yes, update genealogy] [No, keep different] [Always sync]
```

## Special Cases

### Unmanaged Groups with Locations

**Current state**: ~250 groups in `public.groups` with locations but not in genealogy.

**Migration approach**:
1. Keep these groups as-is in `public.groups`
2. When genealogy data is curated, create `genealogy.group_profiles`
3. Link via `profile_id`
4. No user action required; admin/curator process

### Group Without App Entry (Genealogy Only)

Valid state for:
- Historical groups (dissolved, no longer active)
- Groups not yet managed in app
- International groups with no local representation

These groups appear in genealogy but not on the app's group map.

### Membership via Predicates

When a user publishes their profile and declares group membership:

```sql
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id, confidence
) VALUES (
  'person', $personProfileId, 'member_of', 'group', $groupProfileId, 'unverified'
);
```

This replaces the `public.group_members` for genealogy purposes (though both may coexist during transition).

## API Endpoints

### POST /api/groups/:groupId/publish-genealogy

Create genealogy profile for existing `public.groups` entry.

### POST /api/genealogy/groups/:profileId/claim

Submit claim to manage an unmanaged genealogy group.

### GET /api/admin/group-claims

Existing endpoint, now includes genealogy claims.

### PUT /api/admin/group-claims/:claimId/approve

Extended to create `public.groups` when approving genealogy claims.

### PATCH /api/genealogy/groups/:profileId

Update genealogy-specific group data.

## Component Structure

```
/components/groups/
  PublishToGenealogy/
    index.tsx
    ReviewStep.tsx
    DetailsStep.tsx
    SuccessStep.tsx

  GenealogyProfile/
    index.tsx
    BasicInfoForm.tsx
    HistoryForm.tsx
    LineageConnections.tsx
    FoundersList.tsx

  ClaimGroup/
    index.tsx               # For unmanaged genealogy groups
    ClaimModal.tsx
    SetupWizard.tsx        # Post-approval setup
```

## Migration Considerations

### Existing Groups (~250)

1. Initially: `profile_id = NULL` (not in genealogy)
2. Curator creates `genealogy.group_profiles` entries
3. Links via `UPDATE public.groups SET profile_id = ...`
4. No impact on existing locations, admins, members

### Future Schema Cleanup

After genealogy is fully adopted:
- `public.groups.name` → derived from genealogy
- `public.groups.style` → derived from genealogy
- `public.groups.description` → derived from genealogy
- `public.groups.logo` → derived from genealogy

Keep in `public.groups`:
- `id`, `created_by`, `verified`, `profile_id`
- Relationships: `group_locations`, `group_admins`

## Success Metrics

- Groups published to genealogy
- Claims submitted vs approved
- Genealogy completeness (% with founded year, history, etc.)
- Member declarations (member_of predicates)
