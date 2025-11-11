# Group Registration & Claiming Feature - Implementation Plan

## Overview
Track group lifecycle metadata (creator, claimer, verifications) and allow legitimate group members to claim ownership of unclaimed groups through a verification process.

**KEY DESIGN DECISIONS**:
1. **Mass data import**: 4000+ groups will be imported via database scripts (NOT through UI). No manual mass registration feature needed.
2. **Regular group creation**: Users can create their own group through existing UI. They automatically become admin and are recorded as creator (`createdBy`).
3. **Group verification**: Any user can verify/vouch for group information accuracy through "verify group" flow (30-day global cooldown per group).
4. **Group claiming**: Users can request to claim unclaimed groups (imported groups without admins) through admin-reviewed process.

## Phase 1: Database Schema Changes

### 1.1 Extend Groups Table
Add new fields to `groups` table in `db/schema.ts`:
- `createdBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who registered the group
- `claimedBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who claimed it
- `claimedAt` (timestamp, nullable) - when the group was claimed

**Derivation Logic:**
- **Claimable (truly unclaimed)**: `claimedBy IS NULL` AND no admins exist
- **Claimed**: `claimedBy IS NOT NULL` (someone claimed an imported group)
- **User-created**: `createdBy IS NOT NULL` AND `claimedBy IS NULL` AND has admins
- **Imported**: `createdBy IS NULL` to distinguish imports

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
- `claimGroupFormSchema` - userMessage (why claiming, min 20 chars), groupId
- `verifyGroupFormSchema` - notes (optional what was verified), groupId

**Note**: No registration form schema needed - mass import via scripts, regular creation uses existing form.

## Phase 2: Database Functions (db/index.ts)

### 2.1 Group Query Functions
- `getUnclaimedGroups()` - fetches truly claimable groups (`claimedBy IS NULL` AND no admins)
  - Excludes user-created groups (which have admins but claimedBy=NULL)
  - Only returns imported groups without admins

### 2.2 Verification Functions
- `canVerifyGroup(groupId)` - checks if group hasn't been verified by ANY user in last 30 days
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

### 3.1 Update Existing Group Creation
- **UPDATE** `/api/groups` POST endpoint - add `createdBy` field
  - Existing flow: user creates their own group and becomes admin
  - NEW: Set `createdBy` to the user's ID
  - NEW: Leave `claimedBy` and `claimedAt` NULL (claiming is only for imported groups)
  - Keep all existing validations and restrictions

### 3.2 Group Verification
- **POST** `/api/groups/[groupId]/verify` - verify a group
  - Auth required
  - Rate limit: one verification per group per 30 days (global cooldown, applies to all users)
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
- **PATCH** `/api/groups/[groupId]` - no changes needed (admin-only authorization remains)
  - `createdBy` is for historical tracking only, not for ongoing permissions

## Phase 4: UI Components

### 4.1 Group Creation Flow
- **No changes needed** - existing group creation UI stays as-is
- Backend will automatically set `createdBy`, `claimedBy`, `claimedAt` fields

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
    - Verify: All authenticated users (with 30-day global per-group cooldown check)
    - Claim: Only for unclaimed groups
    - Edit: Only for admins or createdBy user

- **Component**: `VerifyGroupModal.tsx`
  - Instructions: "By verifying, you confirm: 1) The group website/contact is valid, 2) The group is still active, 3) The information is accurate"
  - Optional notes field
  - Check verification eligibility before showing modal
  - If on cooldown: show "This group was verified X days ago. It can be verified again in Y days."
  - Submit → POST `/api/groups/[groupId]/verify`
  - Success: "Thanks for verifying! This group can be verified again in 30 days."

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
- **No changes needed** - existing "Create Group" flow remains unchanged

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

## Phase 6: Database Migration & Import

### 6.1 Generate Migration
- Generate Drizzle migration: `pnpm drizzle-kit generate` ✅ DONE
- **DO NOT RUN** `db:migrate` locally
- User will handle local migration manually
- Staging/Production: Use existing GitHub Actions workflows

### 6.2 Legacy Data Import Script
Create import script in `scripts/import-groups.ts`:
- Read group data from CSV/JSON file (4000+ groups)
- Insert groups with `createdBy = NULL` and `claimedBy = NULL` (unclaimed state)
- Use batch inserts for performance
- Handle duplicates (check by name or external ID)
- Log import progress and errors
- Run via: `tsx scripts/import-groups.ts`

**Note**: User will provide data format and run script manually

## Phase 7: Testing

### 7.1 API Route Tests
- Test group registration flow
- Test verification rate limiting (30-day global per-group cooldown)
- Test claim submission, approval, rejection
- Test authorization (admin-only routes)
- Test that direct group creation is disabled

### 7.2 Edge Cases to Test
- User tries to claim group they're already admin of
- Multiple users claim same group simultaneously
- User tries to verify group within 30 days of ANY user's verification
- Unclaimed group with `createdBy = NULL` (imported)
- Claim approval when user is already in another group
- Registration without links (should fail validation)
- Registration without description (should fail validation)

### 7.3 Email Testing
- Use SMTPProvider in development to test email templates
- Verify all email triggers work correctly

## Implementation Order

1. **Database (Phase 1)**: ✅ Schema changes complete
2. **Backend (Phases 2-3)**: ✅ DB functions complete, ⚠️ API routes partially complete
   - ✅ Verification routes done
   - ✅ Claim routes done
   - ⬜ Update POST /api/groups to set createdBy/claimedBy/claimedAt
   - ⬜ Remove unused POST /api/groups/register route
3. **Emails (Phase 5)**: Templates and provider methods
4. **Frontend (Phase 4)**: UI components, verify/claim flows, admin panel
5. **Migration (Phase 6)**: ✅ Migration generated (user handles execution)
6. **Import Script (Phase 6.2)**: Create script for 4000+ groups import
7. **Testing (Phase 7)**: End-to-end testing

## Out of Scope (Future Phases)

- Gamification UI (counts, badges, rewards)
- Reward distribution for past registrations/verifications
- Advanced fraud detection
- Bulk group operations
- Public API for group registration
- PII cleanup workflow for claim messages
- Legacy data import (4000+ groups)

## Key Decisions & Changes

✅ **KEPT** existing "Create Group" flow - users create their own group and become admin
✅ **NEW** track creator via `createdBy` field on all new groups (historical tracking only)
✅ **NEW** Leave `claimedBy/claimedAt` NULL for user-created groups (claiming is only for imports)
✅ **REMOVED** manual mass registration UI - use database import scripts instead
✅ Auto-assign claimer when claim approved (for imported unclaimed groups)
✅ `createdBy` does NOT grant edit permissions - only current admins can edit groups
✅ Track all verifications and claim attempts in DB
✅ Show all groups on map (claimed and unclaimed)
✅ Simple verify action via three-dot menu (saves mobile space)
✅ Any user can verify any group (including their own) with 30-day global per-group cooldown
✅ In-app claim form (not Google Form) for better integration
✅ **REMOVED** lastVerifiedBy/At from groups table (query from groupVerifications)
✅ **REMOVED** separate verify status endpoint (check inline)
✅ Plan data structure for gamification, implement UI later
✅ Imported groups have `createdBy = NULL` and `claimedBy = NULL`
✅ Three-dot menu for mobile actions (Verify, Claim, Edit)
✅ Overlapping or multi-position badges for verified/claimed status
✅ Database migration generated but not executed (user handles)

## Estimated Complexity

- **Database**: Medium (3 new tables, 3 new fields on groups) ✅ DONE
- **Backend**: Medium (claim/verify endpoints, email integration) - REDUCED from Medium-High
- **Frontend**: Medium (three-dot menu, claim UI, verify UI, admin panel) - REDUCED from High
- **Total**: ~1-2 weeks of development (reduced from 2-3 weeks due to removal of registration UI)
