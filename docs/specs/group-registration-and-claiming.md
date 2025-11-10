# Group Registration & Claiming Feature - Implementation Plan

## Overview
Enable users to register groups they don't belong to (data entry), track metadata about group lifecycle, and allow legitimate group members to claim ownership through a verification process.

## Phase 1: Database Schema Changes

### 1.1 Extend Groups Table
Add new fields to `groups` table in `db/schema.ts`:
- `createdBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who registered the group
- `claimedBy` (uuid, nullable, FK to users.id, set null on delete) - tracks who claimed it
- `claimedAt` (timestamp, nullable) - when the group was claimed
- `lastVerifiedBy` (uuid, nullable, FK to users.id, set null on delete) - most recent verifier
- `lastVerifiedAt` (timestamp, nullable) - most recent verification timestamp

**Derivation Logic:**
- **Unclaimed**: `claimedBy IS NULL` (no admins assigned yet)
- **Claimed**: `claimedBy IS NOT NULL` OR has at least one group admin
- Legacy groups: `createdBy IS NULL` to distinguish imports

### 1.2 New Table: groupVerifications
Track complete verification history for future rewards:
```typescript
groupVerifications {
  id: uuid (PK)
  groupId: uuid (FK to groups.id, cascade delete)
  userId: uuid (FK to users.id, set null on delete)
  verifiedAt: timestamp
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
  requestedAt: timestamp
  processedAt: timestamp (nullable)
  processedBy: uuid (FK to users.id, nullable, set null on delete)
  userMessage: text (why they should be admin)
  adminNotes: text (nullable - admin's decision notes)
}
```

### 1.4 Update Validation Schemas
Create new schemas in `config/validation-schema.ts`:
- `registerGroupFormSchema` - name, location (lat/lng), contact (email or website required)
- `claimGroupFormSchema` - userMessage (why claiming), groupId
- `verifyGroupFormSchema` - notes (optional what was verified)

## Phase 2: Database Functions (db/index.ts)

### 2.1 Group Registration Functions
- `registerGroup(data, userId)` - creates group with `createdBy`, no admins
- `getUnclaimedGroups()` - fetches groups where `claimedBy IS NULL`
- `getUserRegisteredGroups(userId)` - groups created by this user

### 2.2 Verification Functions
- `canUserVerifyGroup(userId, groupId)` - checks if user hasn't verified in last 30 days
- `verifyGroup(userId, groupId, notes)` - adds record to `groupVerifications`, updates `lastVerifiedBy/At`
- `getGroupVerificationHistory(groupId)` - for admin review
- `getUserVerificationCount(userId)` - for future gamification

### 2.3 Claim Functions
- `createGroupClaim(userId, groupId, message)` - creates pending claim
- `getPendingClaims()` - for admin panel
- `approveClaim(claimId, adminId)` - sets status, adds user as group admin, updates `claimedBy/At`
- `rejectClaim(claimId, adminId, notes)` - sets status, records admin notes
- `getGroupClaims(groupId)` - claim history for a group

## Phase 3: API Routes

### 3.1 Group Registration
- **POST** `/api/groups/register` - register new group (different from `/api/groups`)
  - Auth required
  - No restriction on user's current group membership
  - Sets `createdBy`, leaves `claimedBy` null
  - Does NOT add user as admin
  - Returns group ID

### 3.2 Group Verification
- **POST** `/api/groups/[groupId]/verify` - verify a group
  - Auth required
  - Rate limit: one verification per user per group per 30 days
  - Adds verification record
  - Returns success with cooldown info

- **GET** `/api/groups/[groupId]/verify/status` - check if user can verify
  - Returns: `canVerify: boolean`, `lastVerifiedAt: timestamp | null`, `cooldownEndsAt: timestamp | null`

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
- **PATCH** `/api/groups/[groupId]` - add authorization for `createdBy` user (not just admins)
  - Allow the user who registered an unclaimed group to edit it

## Phase 4: UI Components

### 4.1 Register Group Flow
- **New page**: `/groups/register` - separate from `/groups/new`
- **Component**: `RegisterGroupForm.tsx`
  - Fields: name, description, location picker (map), email, website, social links, logo upload
  - Required: name, location (lat/lng), at least one contact method (email OR website)
  - Submit → POST `/api/groups/register`
  - Success: redirect to group profile with "Group registered! Want to claim it?" message

### 4.2 Claim Group UI
- **Component**: `ClaimGroupButton.tsx` (on group profile page)
  - Only shows for unclaimed groups
  - Only shows for authenticated users
  - Opens `ClaimGroupModal.tsx`

- **Component**: `ClaimGroupModal.tsx`
  - Form with textarea: "Why should you be the admin of this group?"
  - Submit → POST `/api/groups/[groupId]/claim`
  - Success message: "Claim submitted! We'll review and email you."

### 4.3 Verify Group UI
- **Component**: `VerifyGroupButton.tsx` (on group profile page)
  - Shows for all authenticated users
  - Fetches verification status from `/api/groups/[groupId]/verify/status`
  - If can verify: shows "Verify this group" button
  - If on cooldown: shows "Verified X days ago" (disabled)
  - Opens `VerifyGroupModal.tsx`

- **Component**: `VerifyGroupModal.tsx`
  - Instructions: "By verifying, you confirm: 1) The group website/contact is valid, 2) The group is still active, 3) The information is accurate"
  - Optional notes field
  - Submit → POST `/api/groups/[groupId]/verify`
  - Success: "Thanks for verifying! You can verify again in 30 days."

### 4.4 Group Status Indicators
- **Update**: `GroupProfile/GroupView.tsx`
  - Add status badges:
    - "Unclaimed" badge (orange) if `claimedBy IS NULL`
    - "Claimed" badge (green) if `claimedBy IS NOT NULL`
    - Show last verification date if exists
  - Show "Claim this group" button if unclaimed
  - Show "Verify this group" button

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
- Add "Register a Group" link in appropriate navigation (e.g., main menu, map page)
- Keep existing "Create Group" on user profile

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

## Phase 6: Migration & Data Import

### 6.1 Database Migration
- Generate Drizzle migration for schema changes
- Run migration: `pnpm --filter quilombo db:migrate`

### 6.2 Legacy Data Import Script
- Create script: `apps/quilombo/scripts/import-legacy-groups.ts`
- Read CSV/JSON of 4000+ groups
- For each group:
  - Create group record with `createdBy = NULL`
  - Set `verified = false` initially
  - Map fields from legacy data to new schema
- Log import results (success/failures)

## Phase 7: Testing

### 7.1 API Route Tests
- Test group registration flow
- Test verification rate limiting (30-day cooldown)
- Test claim submission, approval, rejection
- Test authorization (admin-only routes)

### 7.2 Edge Cases to Test
- User tries to claim group they're already admin of
- Multiple users claim same group simultaneously
- User tries to verify same group within 30 days
- Unclaimed group with `createdBy = NULL` (imported)
- Claim approval when user is already in another group

### 7.3 Email Testing
- Use SMTPProvider in development to test email templates
- Verify all email triggers work correctly

## Implementation Order

1. **Database (Phase 1)**: Schema changes, migration
2. **Backend (Phases 2-3)**: DB functions, API routes
3. **Emails (Phase 5)**: Templates and provider methods
4. **Frontend (Phase 4)**: UI components, forms, admin panel
5. **Import (Phase 6)**: Legacy data import script
6. **Testing (Phase 7)**: End-to-end testing

## Out of Scope (Future Phases)

- Gamification UI (counts, badges, rewards)
- Reward distribution for past registrations/verifications
- Advanced fraud detection
- Bulk group operations
- Public API for group registration

## Questions/Decisions Made

✅ Separate "Register Group" flow from "Create Group"
✅ Auto-assign claimer when claim approved
✅ Track all verifications and claim attempts in DB
✅ Show all groups on map (claimed and unclaimed)
✅ Simple verify button with instructional modal
✅ Users can register multiple groups (no membership restriction)
✅ In-app claim form (not Google Form) for better integration
✅ Required fields: name, location, contact (email or website)
✅ Plan data structure for gamification, implement UI later
✅ Legacy imports have `createdBy = NULL`

## Estimated Complexity

- **Database**: Medium (3 new tables, several new fields)
- **Backend**: Medium-High (new endpoints, email integration, claim workflow)
- **Frontend**: Medium-High (several new components, forms, admin panel)
- **Total**: ~2-3 weeks of development for full implementation
