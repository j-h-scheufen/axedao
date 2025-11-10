# Group Registration & Claiming Feature - Implementation Plan

## Overview
Enable users to register groups they don't belong to (data entry), track metadata about group lifecycle, and allow legitimate group members to claim ownership through a verification process.

**IMPORTANT CHANGE**: Users can NO LONGER create groups directly as "their" group. All groups must be registered (unclaimed) first, then claimed through verification. This ensures all group-user relationships are verified.

## Phase 1: Database Schema Changes

### 1.1 Extend Groups Table
Add new fields to `groups` table in `db/schema.ts`:
- `createdBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who registered the group
- `claimedBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who claimed it
- `claimedAt` (timestamp, nullable) - when the group was claimed

**Derivation Logic:**
- **Unclaimed**: `claimedBy IS NULL` (no admins assigned yet)
- **Claimed**: `claimedBy IS NOT NULL` OR has at least one group admin
- Legacy groups: `createdBy IS NULL` to distinguish imports

**Note**: Removed `lastVerifiedBy` and `lastVerifiedAt` fields - this is redundant with `groupVerifications` table. Latest verification can be queried when needed.

### 1.2 New Table: groupVerifications
Track complete verification history for future rewards:
```typescript
groupVerifications {
  id: uuid (PK)
  groupId: uuid (FK to groups.id, cascade delete)
  userId: uuid (FK to users.id, set null on delete)
  verifiedAt: timestamp (default now)
  notes: text (optional - what was verified)
}
```

### 1.3 New Table: groupClaims
Track all claim requests (pending, approved, rejected):
```typescript
groupClaims {
  id: uuid (PK)
  groupId: uuid (FK to groups.id, cascade delete)
  userId: uuid (FK to users.id, set null on delete)
  status: enum ('pending', 'approved', 'rejected')
  requestedAt: timestamp (default now)
  processedAt: timestamp (nullable)
  processedBy: uuid (FK to users.id, nullable, set null on delete)
  userMessage: text (why they should be admin)
  adminNotes: text (nullable - admin's decision notes)
}
```

### 1.4 Update Validation Schemas
Create new schemas in `config/validation-schema.ts`:
- `registerGroupFormSchema` - name (required), description (required), location (required), style (optional), links (at least one required - website or social media)
- `claimGroupFormSchema` - userMessage (why claiming, min 20 chars), groupId
- `verifyGroupFormSchema` - notes (optional what was verified)

**Note**: Removed email/phone as direct contact fields. Groups must provide at least one link (social media or website) instead. This is more reliable and doesn't require exposing potentially private contact info.

## Phase 2: Database Functions (db/index.ts)

### 2.1 Group Registration Functions
- `registerGroup(data, userId)` - creates group with `createdBy`, no admins
- `getUnclaimedGroups()` - fetches groups where `claimedBy IS NULL`
- `getUserRegisteredGroups(userId)` - groups created by this user

### 2.2 Verification Functions
- `canUserVerifyGroup(userId, groupId)` - checks if user hasn't verified in last 30 days
- `verifyGroup(userId, groupId, notes)` - adds record to `groupVerifications`
- `getGroupVerificationHistory(groupId)` - for admin review
- `getUserVerificationCount(userId)` - for future gamification
- `getLatestGroupVerification(groupId)` - returns most recent verification (replaces lastVerifiedBy/At fields)

### 2.3 Claim Functions
- `createGroupClaim(userId, groupId, message)` - creates pending claim
- `getPendingClaims()` - for admin panel
- `approveClaim(claimId, adminId)` - sets status, adds user as group admin, updates `claimedBy/At`
- `rejectClaim(claimId, adminId, notes)` - sets status, records admin notes
- `getGroupClaims(groupId)` - claim history for a group

## Phase 3: API Routes

### 3.1 Group Registration
- **POST** `/api/groups/register` - register new group (replaces `/api/groups` for user group creation)
  - Auth required
  - No restriction on user's current group membership
  - Sets `createdBy`, leaves `claimedBy` null
  - Does NOT add user as admin
  - Required fields: name, description, location (lat/lng), at least one link
  - Returns group ID

### 3.2 Group Verification
- **POST** `/api/groups/[groupId]/verify` - verify a group
  - Auth required
  - Rate limit: one verification per user per group per 30 days
  - Check eligibility inline (no separate status endpoint)
  - Adds verification record
  - Returns success with cooldown info

### 3.3 Group Claims
- **POST** `/api/groups/[groupId]/claim` - submit claim request
  - Auth required
  - Validates group is unclaimed or user is not already admin
  - Creates claim record with 'pending' status
  - Sends email notification to support@quilombo.net
  - Returns claim ID

- **GET** `/api/admin/claims` - list all pending claims (global admin only)
  - Returns claims with group info and user info

- **PUT** `/api/admin/claims/[claimId]/approve` - approve claim (global admin only)
  - Updates claim status to 'approved'
  - Adds user as group admin via `addGroupAdmin()`
  - Sets `groups.claimedBy` and `groups.claimedAt`
  - Adds user to group (`users.groupId`)
  - Sends approval email to claimer
  - Returns success

- **PUT** `/api/admin/claims/[claimId]/reject` - reject claim (global admin only)
  - Updates claim status to 'rejected'
  - Records admin notes
  - Sends rejection email to claimer
  - Returns success

### 3.4 Update Existing Routes
- **REMOVE** `/api/groups` POST endpoint (users can no longer create "their" group directly)
- **PATCH** `/api/groups/[groupId]` - add authorization for `createdBy` user (not just admins)
  - Allow the user who registered an unclaimed group to edit it

## Phase 4: UI Components

### 4.1 Register Group Flow
- **New page**: `/groups/register` - replaces direct group creation
- **Component**: `RegisterGroupForm.tsx`
  - Required fields: name, description, location picker (map), at least one link (social/website)
  - Optional: style, logo upload
  - No email/phone fields (use links instead)
  - Submit → POST `/api/groups/register`
  - Success: redirect to group profile with "Group registered! Want to claim it?" message

### 4.2 Claim Group UI
- **Component**: `ClaimGroupButton.tsx` (on group profile page)
  - Only shows for unclaimed groups
  - Note: All pages require auth, no need for separate auth check
  - Opens `ClaimGroupModal.tsx`

- **Component**: `ClaimGroupModal.tsx`
  - Clear explainer text about what information to provide:
    - Your relationship to the group
    - Who leads the group
    - Other organizers
    - How to contact you (email or phone, if comfortable sharing)
  - Form with textarea: "Why should you be the admin of this group?" (min 20 chars)
  - Submit → POST `/api/groups/[groupId]/claim`
  - Success message: "Claim submitted! We'll review and email you."
  - Note: Consider PII cleanup workflow in future phase

### 4.3 Verify Group UI
- **Component**: `GroupActionsMenu.tsx` (three-dot menu)
  - Mobile: Three-dot menu with actions (Verify, Claim, Edit)
  - Desktop: Consistent three-dot menu OR separate buttons (implementation choice)
  - Saves mobile screen space
  - Actions shown based on context:
    - Verify: All authenticated users (with 30-day cooldown check)
    - Claim: Only for unclaimed groups
    - Edit: Only for admins or createdBy user

- **Component**: `VerifyGroupModal.tsx`
  - Instructions: "By verifying, you confirm: 1) The group website/contact is valid, 2) The group is still active, 3) The information is accurate"
  - Optional notes field
  - Check verification eligibility before showing modal
  - If on cooldown: show "You verified this group X days ago. You can verify again in Y days."
  - Submit → POST `/api/groups/[groupId]/verify`
  - Success: "Thanks for verifying! You can verify again in 30 days."

### 4.4 Group Status Indicators
- **Update**: `GroupProfile/GroupView.tsx` and `GroupCard.tsx`
  - Keep existing "verified" badge on group logo/card
  - Add "unclaimed/claimed" status badge:
    - "Unclaimed" badge (orange/gray) if `claimedBy IS NULL`
    - "Claimed" badge (green) if `claimedBy IS NOT NULL`
  - Explore overlapping badges in different sizes or different badge positions
  - Show last verification date (query from `groupVerifications` table)

- **Component**: `ClaimStatusBadge.tsx` - reusable badge component

### 4.5 Map Display Updates
- **Update**: Map component (find in codebase)
  - Show ALL groups (claimed and unclaimed)
  - Visual indicators:
    - Unclaimed groups: different marker color (e.g., gray/orange)
    - Claimed groups: current marker color
    - Verified recently: additional indicator (e.g., checkmark)

### 4.6 Admin Panel - Claims Management
- **New page**: `/admin/claims` or add tab to `/admin`
- **Component**: `AdminClaimsTable.tsx`
  - Columns: Group Name, User (claimer), Requested Date, User Message, Actions
  - Actions per row:
    - "View Group" link
    - "Approve" button → opens confirmation modal
    - "Reject" button → opens rejection modal with notes field

- **Component**: `ApproveClaimModal.tsx`
  - Confirms: "Approve [user] as admin of [group]?"
  - Submit → PUT `/api/admin/claims/[claimId]/approve`

- **Component**: `RejectClaimModal.tsx`
  - Notes field: "Reason for rejection (sent to user)"
  - Submit → PUT `/api/admin/claims/[claimId]/reject`

### 4.7 Navigation Updates
- **REMOVE** "Create Group" from user profile navigation
- Add "Register a Group" link in appropriate navigation (e.g., main menu, map page)
- All users must use register → claim workflow

## Phase 5: Email Templates

### 5.1 New Email Templates (in `utils/email/templates/`)

- **claim-submitted-email.tsx** - sent to support@quilombo.net when claim submitted
  - Subject: "New Group Claim Request"
  - Content: user info, group info, message, link to admin panel

- **claim-approved-email.tsx** - sent to claimer when approved
  - Subject: "Your group claim has been approved!"
  - Content: group name, link to group management page
  - CTA: "Manage Your Group"

- **claim-rejected-email.tsx** - sent to claimer when rejected
  - Subject: "Group claim update"
  - Content: group name, admin notes (reason)
  - Supportive tone

### 5.2 Update EmailProvider Interface
Add methods:
- `sendClaimSubmittedEmail(to, claimInfo)`
- `sendClaimApprovedEmail(to, groupName, groupId)`
- `sendClaimRejectedEmail(to, groupName, reason)`

Implement in both SMTPProvider and MailjetProvider.

## Phase 6: Database Migration

### 6.1 Generate Migration
- Generate Drizzle migration: `pnpm drizzle-kit generate`
- **DO NOT RUN** `db:migrate` locally
- User will handle local migration manually
- Staging/Production: Use existing GitHub Actions workflows

### 6.2 Legacy Data Import
**SKIPPED** - Will handle in separate feature context when needed

## Phase 7: Testing

### 7.1 API Route Tests
- Test group registration flow
- Test verification rate limiting (30-day cooldown)
- Test claim submission, approval, rejection
- Test authorization (admin-only routes)
- Test that direct group creation is disabled

### 7.2 Edge Cases to Test
- User tries to claim group they're already admin of
- Multiple users claim same group simultaneously
- User tries to verify same group within 30 days
- Unclaimed group with `createdBy = NULL` (imported)
- Claim approval when user is already in another group
- Registration without links (should fail validation)
- Registration without description (should fail validation)

### 7.3 Email Testing
- Use SMTPProvider in development to test email templates
- Verify all email triggers work correctly

## Implementation Order

1. **Database (Phase 1)**: ✅ Schema changes complete
2. **Backend (Phases 2-3)**: DB functions, API routes
3. **Emails (Phase 5)**: Templates and provider methods
4. **Frontend (Phase 4)**: UI components, forms, admin panel
5. **Migration (Phase 6)**: Generate migration (user handles execution)
6. **Testing (Phase 7)**: End-to-end testing

## Out of Scope (Future Phases)

- Gamification UI (counts, badges, rewards)
- Reward distribution for past registrations/verifications
- Advanced fraud detection
- Bulk group operations
- Public API for group registration
- PII cleanup workflow for claim messages
- Legacy data import (4000+ groups)

## Key Decisions & Changes

✅ **REMOVED** direct "Create Group" - all groups must be registered then claimed
✅ Separate "Register Group" flow from claim workflow
✅ Auto-assign claimer when claim approved
✅ Track all verifications and claim attempts in DB
✅ Show all groups on map (claimed and unclaimed)
✅ Simple verify action via three-dot menu (saves mobile space)
✅ Users can register multiple groups (no membership restriction)
✅ In-app claim form (not Google Form) for better integration
✅ Required fields: name, description, location, at least one link
✅ **REMOVED** email/phone as direct contact fields (use links instead)
✅ **REMOVED** lastVerifiedBy/At from groups table (query from groupVerifications)
✅ **REMOVED** separate verify status endpoint (check inline)
✅ Plan data structure for gamification, implement UI later
✅ Legacy imports have `createdBy = NULL`
✅ Three-dot menu for mobile actions (Verify, Claim, Edit)
✅ Overlapping or multi-position badges for verified/claimed status
✅ Description field now required for registration
✅ Database migration generated but not executed (user handles)

## Estimated Complexity

- **Database**: Medium (3 new tables, 3 new fields on groups)
- **Backend**: Medium-High (new endpoints, email integration, claim workflow)
- **Frontend**: High (several new components, three-dot menu, forms, admin panel, remove existing create flow)
- **Total**: ~2-3 weeks of development for full implementation
