# Password Login & Human Wallet Email Flow - Testing Plan

**Created:** 2025-10-29
**Feature:** Human Wallet email auto-fetch and account linking

---

## Overview

This testing plan covers the Human Wallet email flow implementation, specifically:
1. Auto-fetching email from Human Wallet SDK during signup
2. Linking wallets to existing email accounts
3. Activating pending accounts when users login with wallet

---

## Pre-Testing Setup

### Database Access
- Access to view `users` table in PostgreSQL database
- Ability to check: `email`, `walletAddress`, `accountStatus`, `emailVerifiedAt`

### Test Accounts Needed
- At least 2-3 different Human Wallet accounts with different emails
- Access to email inbox for email/password signup verification

### Environment
- Dev/staging environment with Human Wallet integration enabled
- Browser with dev tools open (to check console logs)

---

## Test Scenarios

### Scenario 1: New User Signup with Human Wallet

**Objective:** Verify that new wallet users automatically get their email from Human Wallet SDK

**Pre-conditions:**
- User has never signed up before (fresh wallet address)
- Human Wallet has verified email on file

**Steps:**
1. Navigate to login page
2. Click "Connect Human Wallet" button
3. Complete Human Wallet authentication (popup/redirect)
4. Sign SIWE message when prompted

**Expected Results:**
- ✅ User is logged in successfully (no email input modal)
- ✅ User redirected to profile or dashboard
- ✅ Database check: User record created with:
  - `email` populated (not null/undefined)
  - `walletAddress` populated
  - `accountStatus` = 'active'
  - `emailVerifiedAt` is set to current timestamp
- ✅ Success toast: "Signed in successfully" or similar

**Actual Results:**
- [x] Pass / [ ] Fail

**Notes:**
_Record any issues, error messages, or unexpected behavior_

---

### Scenario 2: Email/Password Signup → Wallet Login (Account Linking)

**Objective:** Verify that wallet login links to existing email/pwd account and activates it

**Pre-conditions:**
- User signed up with email/password but DID NOT verify email
- Account exists in DB with `accountStatus` = 'pending'
- User has Human Wallet with SAME email address

**Steps:**
1. **Part A: Create pending account**
   - Navigate to `/auth/signup`
   - Enter email and password
   - Submit form
   - DO NOT click verification link in email
   - Note: Account is now 'pending' in DB

2. **Part B: Login with wallet**
   - Navigate to `/auth/login`
   - Click "Connect Human Wallet"
   - Use Human Wallet account with SAME email as Part A
   - Complete authentication and sign SIWE message

**Expected Results:**
- ✅ User is logged in successfully
- ✅ No error about "email already exists"
- ✅ Database check for the SAME user ID:
  - `walletAddress` now populated with wallet address
  - `accountStatus` changed from 'pending' → 'active'
  - `emailVerifiedAt` now set (was null before)
- ✅ User sees success message

**Actual Results:**
- [x] Pass / [ ] Fail

**Notes:**
_Record DB user ID, before/after values_

---

### Scenario 3: Active Email/Password Account → Wallet Login (Add Wallet)

**Objective:** Verify that active email/pwd users can add wallet as additional auth method

**Pre-conditions:**
- User has active email/password account (verified email)
- Account exists in DB with `accountStatus` = 'active', no `walletAddress`
- User has Human Wallet with SAME email

**Steps:**
1. **Part A: Verify active account**
   - Login with email/password successfully
   - Note user ID from DB
   - Logout

2. **Part B: Login with wallet**
   - Navigate to `/auth/login`
   - Click "Connect Human Wallet"
   - Use Human Wallet with SAME email
   - Complete authentication and sign SIWE message

**Expected Results:**
- ✅ User is logged in successfully
- ✅ Same user ID as Part A (not a new account)
- ✅ Database check:
  - `walletAddress` now populated
  - `accountStatus` remains 'active'
  - `emailVerifiedAt` remains set (not overwritten)
  - Email unchanged
- ✅ User can now login with EITHER email/pwd OR wallet

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_Verify user ID remains the same_

---

### Scenario 4: Wallet with Different Email (Separate Account)

**Objective:** Verify that different emails create separate accounts (no linking)

**Pre-conditions:**
- User A has email/pwd account with email `userA@example.com`
- User tries to login with wallet using email `userB@example.com`

**Steps:**
1. **Part A: Create first account**
   - Signup with email/password using `userA@example.com`
   - Verify email, login successfully
   - Note user ID from DB
   - Logout

2. **Part B: Login with different wallet email**
   - Navigate to `/auth/login`
   - Click "Connect Human Wallet"
   - Use wallet with email `userB@example.com` (different!)
   - Complete authentication

**Expected Results:**
- ✅ New account created (different user ID)
- ✅ Database check:
  - Two separate user records
  - User A: has email `userA@example.com`, no wallet
  - User B: has email `userB@example.com`, has wallet
  - Both are 'active'
- ✅ Accounts remain independent

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_This is expected behavior - different identities_

---

### Scenario 5: Wallet User Without Email (Edge Case)

**Objective:** Verify fallback behavior if Human Wallet doesn't provide email

**Pre-conditions:**
- Wallet account without email in Human Wallet (may be difficult to create)
- OR mock `requestEmail()` to return null/undefined

**Steps:**
1. Navigate to login page
2. Click "Connect Human Wallet"
3. Complete authentication (wallet has no email)
4. Sign SIWE message

**Expected Results:**
- ✅ User sees modal/prompt asking for email input
- ✅ User can manually enter email
- ✅ Account created after email provided
- ✅ Console shows warning: "Could not fetch email from Human Wallet"

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_This scenario may be hard to test without mocking_

---

### Scenario 6: Wallet Login → Use Wallet-Protected Features

**Objective:** Verify wallet users can immediately use web3 features without re-connecting

**Pre-conditions:**
- User logs in with Human Wallet (Scenario 1)

**Steps:**
1. After login, navigate to `/axe` page (token swap)
2. Try to perform a swap or transfer
3. Navigate to `/dao` page
4. Try to join DAO or vote

**Expected Results:**
- ✅ No "Connect Wallet" modal appears (wallet already connected)
- ✅ User can immediately interact with web3 features
- ✅ Session includes wallet address
- ✅ No errors about missing wallet

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_Tests integration with wallet protection feature_

---

### Scenario 7: Email/Pwd User → Add Wallet → Use Web3 Features

**Objective:** Verify email/pwd users who add wallet can use web3 features

**Pre-conditions:**
- User has email/password account (no wallet)

**Steps:**
1. Login with email/password
2. Navigate to `/axe` or `/dao` page
3. Try to perform web3 action (triggers wallet modal)
4. Click "Connect Wallet" in modal
5. Authenticate with Human Wallet (same email)
6. After wallet connected, try web3 action again

**Expected Results:**
- ✅ First attempt shows "Wallet Required" modal
- ✅ Wallet connection succeeds
- ✅ Wallet linked to account (DB check)
- ✅ Second attempt works without modal
- ✅ Session updated with wallet address

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_Tests wallet protection + account linking integration_

---

### Scenario 8: Case-Insensitive Email Matching

**Objective:** Verify email matching works regardless of case

**Pre-conditions:**
- User signed up with `UserA@Example.com` (mixed case)

**Steps:**
1. Create email/pwd account with `UserA@Example.com`
2. Logout
3. Login with Human Wallet where email is `usera@example.com` (lowercase)

**Expected Results:**
- ✅ Wallet links to existing account
- ✅ Same user ID (not new account)
- ✅ Email matching worked despite case difference

**Actual Results:**
- [ ] Pass / [ ] Fail

**Notes:**
_Tests SQL case-insensitive query_

---

## Database Verification Queries

### Check User Account After Test
```sql
SELECT
  id,
  email,
  "walletAddress",
  "accountStatus",
  "emailVerifiedAt",
  "createdAt"
FROM users
WHERE email = 'test@example.com';  -- Replace with test email
```

### Check Account Linking
```sql
-- Before and after wallet login
SELECT
  id,
  email,
  "walletAddress",
  "accountStatus",
  "emailVerifiedAt"
FROM users
WHERE id = 'user-uuid-here';  -- Replace with actual user ID
```

### Find Duplicate Accounts (Should be empty)
```sql
-- Check if wallet linking created duplicates
SELECT
  email,
  COUNT(*) as account_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

---

## Browser Console Checks

### Expected Console Logs

**During wallet signin:**
- `"User signed in: [user-id]"` - Success message
- NO errors about "EMAIL_REQUIRED"
- NO errors about "REGISTRATION_FAILED"

**If requestEmail() fails:**
- `"Could not fetch email from Human Wallet: [error]"` - Warning (expected fallback)

**During account linking:**
- `"User signed in: [user-id]"` - Should show SAME user ID as before

---

## Error Messages to Watch For

### Should NOT see:
- ❌ "Unable to create account. If you already have an account..." (REGISTRATION_FAILED)
- ❌ Email shows as "undefined" in profile/settings
- ❌ "Wallet address already in use" (unless truly already linked)

### Should see:
- ✅ "Signed in successfully" or similar
- ✅ "Wallet connected successfully" (when adding wallet to existing account)

---

## Edge Cases & Known Issues

### Things to Watch:
1. **Session propagation delay**: After linking wallet, session may take 1-2 seconds to update
2. **Duplicate linking attempts**: If user clicks "Connect Wallet" twice quickly
3. **Browser cache**: Clear cookies between tests to avoid cached sessions
4. **Human Wallet popup blocked**: Ensure popups are allowed for testing

### Not Covered in This Test:
- Unlinking wallet from account (future feature)
- Changing email after account creation (future feature)
- Multiple wallets per account (not currently supported)

---

## Test Results Summary

| Scenario | Status | Tester | Date | Notes |
|----------|--------|--------|------|-------|
| 1. New user wallet signup | [ ] Pass / [ ] Fail | | | |
| 2. Email/pwd → wallet linking | [ ] Pass / [ ] Fail | | | |
| 3. Active account → add wallet | [ ] Pass / [ ] Fail | | | |
| 4. Different email → separate | [ ] Pass / [ ] Fail | | | |
| 5. Wallet without email | [ ] Pass / [ ] Fail | | | |
| 6. Immediate web3 access | [ ] Pass / [ ] Fail | | | |
| 7. Email user → add wallet → web3 | [ ] Pass / [ ] Fail | | | |
| 8. Case-insensitive matching | [ ] Pass / [ ] Fail | | | |

---

## Regression Testing

After these tests pass, verify existing functionality still works:

- [ ] Email/password login still works
- [ ] Email/password signup still works
- [ ] Email verification flow still works
- [ ] Google OAuth login still works
- [ ] Password reset flow still works
- [ ] Settings page shows correct auth methods
- [ ] Logout works correctly

---

## Sign-Off

**Tester Name:** ___________________________

**Date:** ___________________________

**Overall Result:** [ ] All Pass / [ ] Some Failures / [ ] Blocked

**Blockers/Issues:**
_List any critical issues found_

---

## Appendix: Rollback Plan

If critical issues are found:

1. Revert commits related to:
   - `hooks/useAuth.ts` - requestEmail() changes
   - `config/next-auth-options.ts` - account linking logic

2. Known safe rollback point: Commit before Human Wallet email flow changes

3. Issues to escalate immediately:
   - Users unable to login with any method
   - Data corruption (duplicate accounts, lost data)
   - Security concerns (unauthorized account access)
