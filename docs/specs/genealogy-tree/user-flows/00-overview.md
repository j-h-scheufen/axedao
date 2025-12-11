# Genealogy User Flows Overview

## Architectural Decision: Separate Data Domains

After careful analysis, we've decided to keep user profile data and genealogy data as **separate concerns** rather than merging them via database JOINs.

### Core Insight

The genealogy schema represents **public knowledge** - a community-curated database of capoeira history. The users schema represents **private accounts** - personal data with privacy expectations. These are fundamentally different data domains with different consent models.

### The Two Data Domains

| Aspect | `public.users` | `genealogy.person_profiles` |
|--------|---------------|----------------------------|
| Purpose | Private account data | Public historical record |
| Visibility | Logged-in users only | Public genealogy |
| Consent model | Privacy settings (hideEmail) | Explicit opt-in publishing |
| Data examples | Email, phone, wallet, personal social links | Apelido, lineage, portrait, public links |
| Ownership | Always linked to a user | May exist without linked user (historical) |

### Key Fields Comparison

| Field | In `users` | In `person_profiles` | Reasoning |
|-------|-----------|---------------------|-----------|
| Full name | Yes (private) | Yes (public) | Different consent models |
| Nickname/Apelido | Yes (private) | Yes (public) | Same value, different contexts |
| Avatar/Portrait | Yes (private) | Yes (public, renamed to `portrait`) | User may want different images |
| Links | Yes (personal social media) | Yes (renamed to `public_links`, Wikipedia/articles) | Different audiences |
| Title | Yes | Yes | Both need it |
| Email | Yes (private) | No | Never public |
| Phone | Yes (private) | No | Never public |
| Wallet address | Yes (private) | No | Never public |
| Bio | No | Yes | Genealogy-specific |
| Birth/Death years | No | Yes | Historical data |
| Style | No | Yes | Capoeira identity |

## User Flows

### 1. Publish Profile to Genealogy

**File**: `01-publish-profile-to-genealogy.md`

For users who want to join the public genealogy by creating a new profile.

**Trigger**: User doesn't have `profile_id` and wants to be in genealogy

**Flow**:
1. Introduction (explain what publishing means)
2. Profile information (select what to share)
3. Lineage declaration (optional: who taught you)
4. Review & confirm
5. Success

**Result**: New `person_profiles` entry, `users.profile_id` set

### 2. Claim Existing Genealogy Profile

**File**: `02-claim-existing-genealogy-profile.md`

For users who find their profile already exists in genealogy (community-created).

**Trigger**: User browses genealogy, finds themselves, clicks "Is this you?"

**Flow**:
1. Verification check (not deceased, not already claimed)
2. Claim confirmation
3. Optional: Provide verification details
4. Admin review (using existing claims mechanism)
5. Approval/rejection

**Result**: `users.profile_id` linked to existing profile

### 3. Group Claiming & Management

**File**: `03-group-claiming-management.md`

Covers three scenarios:
- **3A**: Existing `public.groups` publishing to genealogy
- **3B**: Claiming unmanaged genealogy group (creates `public.groups`)
- **3C**: Managing linked groups (separate app vs genealogy contexts)

**Key insight**: Groups are inherently public, so the flow is simpler than for users. Operational data (locations, admins) stays in `public.groups`; identity data (name, style, history) lives in genealogy.

## Profile Management After Publishing/Claiming

### User Profile Edit (`/profile/edit`)

Shows private user data:
- Personal information (name, nickname, avatar)
- Contact (email, phone)
- Social links (personal)
- Privacy settings

If user has `profile_id`:
- Link: "Manage your Genealogy Profile →"

### Genealogy Profile Edit (`/genealogy/profile/edit`)

Shows public genealogy data:
- Name, Apelido, Title
- Portrait
- Bio
- Public links
- Style
- Lineage connections

Note: "Changes here are visible in the public genealogy"

### Sync Prompts

When user changes key fields (name, nickname) in private profile:
- Prompt: "Update your genealogy profile too?"
- Options: Yes / No / Always sync

## Schema Changes Made

### Column Renames in `genealogy.person_profiles`

- `avatar` → `portrait` (clearer genealogy context)
- `links` → `public_links` (distinguishes from private user links)

### Migration

New migration file: `20251207220000_rename_person_profile_columns.sql`

## What Was NOT Implemented (Reverted)

### JOIN-Based User Queries

Initially attempted to have `fetchUser()` JOIN with `person_profiles` to return combined data. This was reverted because:

1. Conflates private and public data
2. Forces all users to have genealogy data (wrong consent model)
3. Complicates updates (which table to update?)
4. Breaks privacy expectations

### Automatic Data Migration

Initially planned to copy user fields to `person_profiles`. Reverted because:

1. PII concern (names, links could be personal)
2. No user consent for publishing
3. Personal social links ≠ public references

## Implementation Order

### Phase 1: Foundation
1. Column renames (DONE)
2. Person claims table/API (mirrors group claims)
3. Basic claim flow UI

### Phase 2: Publish Flow
4. Publish wizard components
5. Publish API endpoint
6. Lineage selection UI

### Phase 3: Group Integration
7. Group publish to genealogy
8. Extend group claims for genealogy
9. Separate group edit contexts

### Phase 4: Polish
10. Sync prompts for field changes
11. Profile status indicators
12. Admin tools for claim management

## Related Documents

- `genealogy-architecture-proposal.md` - Original architecture (needs update)
- `genealogy-data-model-proposal.md` - EAV model for predicates
- `genealogy-prototype-plan.md` - Initial prototype scope
