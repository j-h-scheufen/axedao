# Group Registration & Claiming Feature - Manual Test Plan

## Overview
This document provides a comprehensive manual testing checklist for the Group Registration & Claiming feature. Since the Quilombo app doesn't have automated test infrastructure yet, this plan enables thorough manual verification of all functionality.

## Prerequisites
- Local development environment running (`pnpm dev --port 8080`)
- Database migrated with group verification and claims tables
- At least 2 test users created (one regular user, one global admin)
- Test groups in database:
  - 1 user-created group (has admin, createdBy set)
  - 2+ imported groups (no admin, createdBy NULL, claimedBy NULL)
  - 1 claimed group (has admin, createdBy NULL, claimedBy set)

## Test Setup Commands
```bash
# Start local database (if not running)
pnpm db:local:up

# Ensure migrations are applied
pnpm db:migrate

# Seed test data (if available)
pnpm db:local:seed

# Start dev server
pnpm dev --port 8080
```

---

## 1. Group Verification Tests

### 1.1 Basic Verification Flow
**Prerequisites**: Logged in as regular user, viewing any group that hasn't been verified in 30 days

**Steps**:
1. Navigate to a group profile page
2. Click the three-dot menu (⋮) in the top-right
3. Click "Verify Group" option
4. Verify modal appears with:
   - Title: "Verify Group Information"
   - Instructions about what verification confirms
   - Optional notes field
   - Cancel and "Verify Group" buttons
5. Click "Verify Group" (leave notes empty)
6. Verify success state shows
7. Modal closes automatically after 2 seconds
8. Refresh page and check that verified badge appears on group logo

**Expected Results**:
- ✅ Verification request succeeds
- ✅ Success message displays
- ✅ Modal auto-closes
- ✅ Verified badge shows immediately
- ✅ Inner circle of badge is darker green (primary-600)

### 1.2 Verification with Notes
**Steps**:
1. Navigate to a different unverified group
2. Open three-dot menu → Verify Group
3. Enter notes: "Confirmed website is active and contact info is correct"
4. Submit verification

**Expected Results**:
- ✅ Verification succeeds with notes
- ✅ Notes are stored (check in database or admin panel)

### 1.3 Verification Cooldown - Same User
**Prerequisites**: Just verified a group in test 1.1

**Steps**:
1. Immediately try to verify the same group again
2. Open three-dot menu → Verify Group
3. Check modal state

**Expected Results**:
- ✅ Modal shows cooldown message: "This group was verified X days ago. It can be verified again in Y days."
- ✅ Verify button should be disabled or show error on submit
- ✅ Cooldown calculation is accurate (30 days from last verification)

### 1.4 Verification Cooldown - Different User
**Prerequisites**: Group verified by User A in test 1.1

**Steps**:
1. Log out
2. Log in as User B (different user)
3. Navigate to the same group verified in test 1.1
4. Try to verify the group

**Expected Results**:
- ✅ User B also sees cooldown message (30-day global per-group cooldown)
- ✅ Cannot verify until 30 days have passed
- ✅ Message indicates when verification will be available again

### 1.5 Verifying Own Group
**Prerequisites**: Logged in as user who created a group

**Steps**:
1. Navigate to your own group's profile
2. Open three-dot menu
3. Verify "Verify Group" option is present
4. Submit verification

**Expected Results**:
- ✅ User CAN verify their own group
- ✅ Verification succeeds normally
- ✅ No special restrictions for own group

---

## 2. Group Claiming Tests

### 2.1 Claim Eligibility Check
**Prerequisites**: Browse to an unclaimed imported group (no admins, claimedBy NULL)

**Steps**:
1. Navigate to unclaimed group profile
2. Check three-dot menu
3. Verify "Claim Group" option appears
4. Navigate to a claimed group (claimedBy NOT NULL)
5. Check three-dot menu

**Expected Results**:
- ✅ Unclaimed groups show "Claim Group" option
- ✅ Claimed groups do NOT show "Claim Group" option
- ✅ User-created groups do NOT show "Claim Group" option

### 2.2 Basic Claim Submission
**Prerequisites**: Logged in, viewing unclaimed group

**Steps**:
1. Click three-dot menu → Claim Group
2. Verify modal appears with:
   - Title: "Claim Group"
   - Clear explainer text about what information to provide
   - Textarea with label "Why should you be the admin of this group?"
   - Character minimum (20 chars) enforced
3. Enter message: "I am a founder"  (too short - 16 chars)
4. Try to submit

**Expected Results**:
- ✅ Validation error shows: "Please provide at least 20 characters"
- ✅ Form does not submit

**Steps (continued)**:
5. Update message: "I am one of the founding members of this group and currently serve as treasurer. I can be reached at example@email.com"
6. Submit claim

**Expected Results**:
- ✅ Claim submission succeeds
- ✅ Success message: "Claim submitted! We'll review and email you."
- ✅ Modal closes after 2 seconds
- ✅ Claim record created in database with status='pending'

### 2.3 Multiple Claims - Same Group
**Prerequisites**: Just submitted claim in test 2.2

**Steps**:
1. Try to claim the same group again immediately
2. Check if "Claim Group" option still appears

**Expected Results**:
- ⚠️ **Implementation dependent**: Should either:
  - Hide "Claim Group" option if user has pending claim, OR
  - Show error message "You already have a pending claim for this group"
- ✅ Prevents duplicate claims from same user

### 2.4 Claim Already Admin Group
**Prerequisites**: User is already admin of a group

**Steps**:
1. Navigate to a group where you're already an admin
2. Check three-dot menu for "Claim Group" option

**Expected Results**:
- ✅ "Claim Group" option does NOT appear
- ✅ User cannot claim groups they already administer

### 2.5 Email Notification - Claim Submitted
**Prerequisites**: Email provider configured (SMTP or Mailjet)

**Steps**:
1. Submit a new claim (different group than test 2.2)
2. Check support@quilombo.net inbox

**Expected Results**:
- ✅ Email received at support@quilombo.net
- ✅ Subject: "New Group Claim Request"
- ✅ Body includes:
  - User information (name, email)
  - Group information (name, ID)
  - User's justification message
  - Link to admin panel to review claim
- ✅ Email is bilingual (English and Portuguese sections)

---

## 3. Admin Claim Management Tests

### 3.1 View Pending Claims
**Prerequisites**: Logged in as global admin, at least one pending claim exists

**Steps**:
1. Navigate to `/admin/claims` (or find Claims tab in admin panel)
2. Review claims table

**Expected Results**:
- ✅ Table displays all pending claims
- ✅ Columns show: Group Name, User (claimer), Requested Date, User Message, Actions
- ✅ Actions include "Approve" and "Reject" buttons
- ✅ Table is sortable/filterable (if implemented)

### 3.2 Approve Claim - Happy Path
**Prerequisites**: At least one pending claim visible in admin panel

**Steps**:
1. Click "Approve" button on a pending claim
2. Verify confirmation modal appears:
   - Clear confirmation message
   - Shows user name and group name
   - "Cancel" and "Approve" buttons
3. Click "Approve"
4. Wait for success message

**Expected Results**:
- ✅ Claim status updated to 'approved' in database
- ✅ User added as group admin (check `groupAdmins` table)
- ✅ Group `claimedBy` field set to user ID
- ✅ Group `claimedAt` timestamp recorded
- ✅ User added to group (`users.groupId` updated)
- ✅ Success message shows briefly
- ✅ Claims table refreshes (approved claim removed or status updated)

### 3.3 Approve Claim - Email Verification
**Prerequisites**: Just approved claim in test 3.2

**Steps**:
1. Check claimer's email inbox

**Expected Results**:
- ✅ Email received with subject "Your group claim has been approved!"
- ✅ Body includes:
  - Group name
  - Link to group management page
  - Clear CTA button: "Manage Your Group"
- ✅ Email is bilingual (English and Portuguese)

### 3.4 Reject Claim - With Notes
**Prerequisites**: At least one pending claim visible

**Steps**:
1. Click "Reject" button on a pending claim
2. Verify rejection modal appears:
   - Title indicates rejection
   - Textarea for "Reason for rejection (sent to user)"
   - Minimum character requirement (if any)
   - "Cancel" and "Reject" buttons
3. Enter admin notes: "We need more information about your relationship to this group."
4. Submit rejection

**Expected Results**:
- ✅ Claim status updated to 'rejected' in database
- ✅ Admin notes saved to claim record
- ✅ User does NOT become admin
- ✅ Group `claimedBy` remains NULL
- ✅ Success message shows briefly
- ✅ Claims table refreshes

### 3.5 Reject Claim - Email Verification
**Prerequisites**: Just rejected claim in test 3.4

**Steps**:
1. Check claimer's email inbox

**Expected Results**:
- ✅ Email received with subject "Group claim update"
- ✅ Supportive, non-harsh tone
- ✅ Body includes:
  - Group name
  - Admin's reason/notes
  - Information about how to appeal or reapply (if applicable)
- ✅ Email is bilingual (English and Portuguese)

### 3.6 Authorization - Non-Admin Access
**Prerequisites**: Logged out or logged in as non-admin user

**Steps**:
1. Try to access `/admin/claims` directly via URL
2. Try to call API endpoints:
   - GET `/api/admin/claims`
   - PUT `/api/admin/claims/[claimId]/approve`
   - PUT `/api/admin/claims/[claimId]/reject`

**Expected Results**:
- ✅ Page redirects to login or shows 403 Forbidden
- ✅ API endpoints return 401 Unauthorized or 403 Forbidden
- ✅ No sensitive data exposed

---

## 4. UI Component Tests

### 4.1 Group Status Badges - Visual Check
**Prerequisites**: View different types of groups

**Test Groups**:
1. **Unclaimed, unverified** (imported group, no verification)
   - Expected: Gray outer ring + gray inner circle
2. **Unclaimed, verified** (imported group, verified)
   - Expected: Gray outer ring + darker green inner circle (primary-600)
3. **Claimed, unverified** (claimed group, not verified recently)
   - Expected: Green outer ring (primary) + gray inner circle
4. **Claimed, verified** (claimed group, verified)
   - Expected: Green outer ring (primary) + darker green inner circle (primary-600)

**Steps**:
1. Navigate to each group type
2. Check badge appearance on group logo
3. Hover over badges to see tooltips

**Expected Results**:
- ✅ Nested badges display correctly
- ✅ 1px black border separates inner and outer badges
- ✅ Claimed status uses outer ring
- ✅ Verified status uses inner circle
- ✅ Tooltips show on hover:
  - Inner badge: "Verified Group"
  - Outer badge: "Claimed Group"
- ✅ Icons match status (CheckCircle for verified, ShieldCheck for claimed)

### 4.2 Three-Dot Menu - Responsive Behavior
**Prerequisites**: Test on different screen sizes

**Steps**:
1. Desktop: Navigate to group profile
2. Check three-dot menu position and appearance
3. Mobile: Resize browser to mobile width
4. Check three-dot menu still accessible

**Expected Results**:
- ✅ Three-dot menu appears on all screen sizes
- ✅ Menu opens on click
- ✅ Menu items show based on permissions:
  - "Verify Group" - always (if not on cooldown)
  - "Claim Group" - only if unclaimed
  - "Edit Group" - only if admin
  - "Leave Group" - if member (not implemented in claiming feature)
- ✅ Menu closes on selection or outside click

### 4.3 Group Cards - Badge Display
**Prerequisites**: View groups list/grid page

**Steps**:
1. Navigate to groups listing page
2. Check that badges appear on GroupCard components
3. Compare badges with group profile page

**Expected Results**:
- ✅ Badges show consistently on cards and profile pages
- ✅ Badge size appropriate for card layout
- ✅ Status accurately reflects database values

---

## 5. Edge Cases & Error Handling

### 5.1 Verify Recently Verified Group
**Test**: Try to verify a group that was verified 29 days ago

**Expected**:
- ✅ Cooldown message shows "can be verified in 1 day"
- ✅ Verification blocked

### 5.2 Claim Group That Was Just Claimed
**Test**: Two users try to claim same group simultaneously

**Steps**:
1. User A opens claim modal
2. Admin approves another user's claim for same group
3. User A submits claim

**Expected**:
- ✅ User A's claim rejected or shows error
- ✅ "Claim Group" option disappears after page refresh

### 5.3 Missing Justification in Claim
**Test**: Submit claim with empty message

**Expected**:
- ✅ Validation error: "This field is required"
- ✅ Form does not submit

### 5.4 Special Characters in Messages
**Test**: Submit claim with special characters, emojis, HTML tags

**Steps**:
1. Enter message: "I am the founder! <script>alert('xss')</script> 😊"
2. Submit claim

**Expected**:
- ✅ Message saves correctly
- ✅ HTML tags escaped/sanitized (no XSS vulnerability)
- ✅ Emojis render correctly in admin panel and emails

### 5.5 Deleted User Scenarios
**Test**: Check behavior when users are deleted

**Database Manipulation**:
1. Create claim
2. Delete the claimer user from database
3. View claims in admin panel

**Expected**:
- ✅ Claim still shows (userId set NULL on delete)
- ✅ UI handles NULL user gracefully (shows "Unknown User" or similar)

### 5.6 Network Errors
**Test**: Simulate network failure

**Steps**:
1. Open browser dev tools → Network tab
2. Throttle to "Offline"
3. Try to submit verification or claim

**Expected**:
- ✅ Error message shows: "Network error. Please try again."
- ✅ Form doesn't reset
- ✅ User can retry after reconnecting

---

## 6. Email Testing Checklist

### 6.1 Email Provider Configuration
**Prerequisites**: Verify email provider is configured

**Steps**:
1. Check `.env` file for email provider settings:
   - `EMAIL_PROVIDER=smtp` or `mailjet`
   - SMTP credentials or Mailjet API keys
2. Trigger test email (claim submission)

**Expected**:
- ✅ No SMTP/API connection errors in server logs
- ✅ Email delivers successfully

### 6.2 Bilingual Email Content
**Test All Email Templates**:

**Claim Submitted** (to support@quilombo.net):
- ✅ English section present
- ✅ Portuguese section present
- ✅ Both sections contain all required information
- ✅ Formatting/styling consistent

**Claim Approved** (to claimer):
- ✅ English section present
- ✅ Portuguese section present
- ✅ CTA button works in both languages
- ✅ Group link is correct

**Claim Rejected** (to claimer):
- ✅ English section present
- ✅ Portuguese section present
- ✅ Tone is supportive in both languages
- ✅ Admin notes included

### 6.3 Email Links
**Test**: Click all links in emails

**Expected**:
- ✅ All links open correct pages
- ✅ Links work with proper authentication
- ✅ No broken or localhost links in production

---

## 7. Database Integrity Tests

### 7.1 Foreign Key Constraints
**Test**: Verify ON DELETE behaviors

**Steps** (use database client):
1. Create test claim
2. Delete the group referenced by claim
3. Check if claim was cascade deleted

**Expected**:
- ✅ Claim deleted when group deleted (cascade delete)
- ✅ No orphaned records

**Steps** (continued):
4. Create another test claim
5. Delete the user who submitted claim
6. Check claim record

**Expected**:
- ✅ Claim persists (userId set to NULL)
- ✅ processedBy can also be NULL if admin deleted

### 7.2 Verification History
**Test**: Multiple verifications create history

**Steps**:
1. Verify a group (User A)
2. Wait 30+ days (or manipulate timestamp in DB for testing)
3. Verify same group (User B)
4. Query `groupVerifications` table

**Expected**:
- ✅ Two separate records exist
- ✅ Both verifications preserved
- ✅ Timestamps accurate
- ✅ Can query "latest verification" separately

---

## 8. Performance & UX Tests

### 8.1 Modal Auto-Close Timing
**Test**: Success modals close automatically

**Steps**:
1. Submit successful verification
2. Count seconds until modal closes

**Expected**:
- ✅ Modal closes after exactly 2 seconds
- ✅ User has time to read success message

### 8.2 Large Justification Messages
**Test**: Submit very long claim message (1000+ characters)

**Expected**:
- ✅ Message saves completely
- ✅ UI displays long messages properly (scrollable, truncated, etc.)
- ✅ Email includes full message

### 8.3 Admin Claims Table - Many Claims
**Test**: Create 50+ test claims

**Expected**:
- ✅ Table loads quickly (<2 seconds)
- ✅ Pagination works (if implemented)
- ✅ No UI layout breaks

---

## 9. Regression Tests

### 9.1 Existing Group Creation Still Works
**Test**: Create new group via existing UI

**Steps**:
1. Navigate to Create Group page
2. Fill out form with all required fields
3. Submit

**Expected**:
- ✅ Group created successfully
- ✅ `createdBy` field set to current user
- ✅ `claimedBy` and `claimedAt` are NULL
- ✅ User automatically becomes admin
- ✅ User automatically joins group

### 9.2 Existing Group Editing Still Works
**Test**: Edit group as admin

**Steps**:
1. Navigate to your group's profile
2. Click three-dot menu → Edit Group
3. Update group information
4. Save changes

**Expected**:
- ✅ Edits save correctly
- ✅ `createdBy` value unchanged
- ✅ No permission errors

---

## Test Summary Template

After completing all tests, summarize results:

### Test Results
- **Date**: [YYYY-MM-DD]
- **Tester**: [Name]
- **Environment**: Local / Staging / Production
- **Total Tests**: X
- **Passed**: X
- **Failed**: X
- **Blocked**: X

### Critical Issues Found
1. [Description] - Severity: High/Medium/Low

### Non-Critical Issues Found
1. [Description] - Severity: Low

### Notes
[Any additional observations]

---

## Quick Smoke Test Checklist

For rapid verification after deployments:

- [ ] Verify group (not on cooldown)
- [ ] Verify cooldown message shows correctly
- [ ] Submit claim for unclaimed group
- [ ] Approve claim as admin
- [ ] Reject claim as admin
- [ ] Check verified badge shows
- [ ] Check claimed badge shows
- [ ] Verify claim submitted email received
- [ ] Verify claim approved email received
- [ ] Verify claim rejected email received
- [ ] Non-admin cannot access `/admin/claims`

---

## Automated Testing Recommendations (Future)

When setting up automated testing infrastructure, prioritize:

1. **API Route Tests** (Jest + Supertest):
   - POST `/api/groups/[groupId]/verify`
   - POST `/api/groups/[groupId]/claim`
   - PUT `/api/admin/claims/[claimId]/approve`
   - PUT `/api/admin/claims/[claimId]/reject`
   - GET `/api/admin/claims`

2. **Database Function Tests** (Jest):
   - `canVerifyGroup()` cooldown logic
   - `getUnclaimedGroups()` filtering
   - `approveClaim()` side effects (admin assignment, claimedBy update)

3. **UI Component Tests** (React Testing Library):
   - GroupStatusBadge rendering variants
   - ClaimGroupModal validation
   - VerifyGroupModal cooldown message

4. **E2E Tests** (Playwright/Cypress):
   - Complete claim submission → approval → email workflow
   - Verification cooldown enforcement
