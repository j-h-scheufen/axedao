# Password Login Feature - Remaining Work

**Created:** 2025-10-29
**Status:** Parked pending completion of current work (wallet protection implementation)

---

## Pending Todos

### High Priority - Bugs

1. **Bug: Human Wallet signup not calling requestEmail() from SDK**
   - **Issue:** Email remains undefined in DB when users sign up with Human Wallet
   - **Screenshot:** `/Users/jan/Desktop/Screenshot 2025-10-29 at 1.34.37 PM.png` shows "undefined" for contact email
   - **Root Cause:** Not calling `requestEmail()` from silk-wallet-sdk during wallet signup flow
   - **Location:** `useAuth.ts` signIn() function, `config/next-auth-options.ts` Human Wallet provider

2. **Bug: Set Password form doesn't handle users without email**
   - **Issue:** Set Password dialog requires email but doesn't allow editing it
   - **Impact:** Users who somehow lack email cannot set password
   - **Solution:** Make email field visible and editable if user has no email

### High Priority - Features

3. **Fix: Match wallet users by email and link to existing accounts**
   - **Scenario:** User signs up with email/pwd but doesn't verify → logs in with Human Wallet
   - **Expected behavior:**
     1. Wallet connects → `requestEmail()` returns email
     2. Check if user with that email exists in DB
     3. If exists: Link wallet address, activate if pending, mark email verified
     4. If not exists: Create new user
   - **Key insight:** Match by email from `requestEmail()`, not just wallet address
   - **Benefits:** Seamlessly upgrades pending accounts, links wallets to email/pwd accounts

4. **Integrate MailJet for email sending**
   - **Purpose:** Test email/password sign-up scenario
   - **Status:** Account set up, credentials available
   - **Action:** Configure in environment, test verification emails

### Medium Priority

5. **Remove email field from Profile Edit and Profile view**
   - **Action:** Replace with read-only "contact email" field (as shown in Settings)
   - **Reason:** Email is identity credential, should be managed separately

6. **Feature: Implement email change with OTP verification**
   - **Gap:** Users cannot change their contact email after account creation
   - **Proposed flow:**
     1. User enters new email
     2. Send OTP to new email
     3. User confirms OTP
     4. Update email, set status to 'active'
   - **Notes:** Larger feature, requires OTP infrastructure

### Low Priority

7. **UI improvements for SignInForm and sign-up/login flows**
   - **Status:** Waiting for screenshots from user

8. **Architecture: Unify login/signup flows**
   - **Proposal:** Only email/pwd needs separate signup UI
   - **Details:** See "Login vs Signup Flow Architecture" section below

---

## Technical Analysis

### Human Wallet SDK Email Flow

The Human Wallet SDK stores **already verified** email addresses:

```typescript
// In silk.connector.ts
async requestEmail(): Promise<unknown> {
  const provider = await this.getProvider();
  return provider.requestEmail(); // Returns verified email from wallet
}
```

**Key Points:**
- Email is already verified by Human Wallet infrastructure
- No need for separate email input modal
- No email verification flow needed for wallet users
- One-click signup experience

### Implementation Approach: Match by Email

**Current flow in `next-auth-options.ts:61-88`:**
```typescript
if (!user) {
  // First-time wallet user - require email
  if (!credentials.email) {
    throw new Error(AUTH_ERRORS.EMAIL_REQUIRED);
  }

  // Check if email already exists
  const existingUser = await db.query.users.findFirst({
    where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`,
  });

  if (existingUser) {
    // Generic error to prevent user enumeration
    throw new Error(AUTH_ERRORS.REGISTRATION_FAILED);
  }

  // Create new user...
}
```

**Proposed fix:**
```typescript
if (!user) {
  // First-time wallet user - get email from SDK
  if (!credentials.email) {
    throw new Error(AUTH_ERRORS.EMAIL_REQUIRED); // Frontend calls requestEmail()
  }

  // Check if user exists by email (case-insensitive)
  const existingUser = await db.query.users.findFirst({
    where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`,
  });

  if (existingUser) {
    // Link wallet to existing account
    await db.update(users)
      .set({
        walletAddress: siwe.address,
        accountStatus: 'active', // Activate if pending
        emailVerifiedAt: new Date(), // Mark verified by wallet
      })
      .where(eq(users.id, existingUser.id));

    user = {
      id: existingUser.id,
      walletAddress: siwe.address,
      isGlobalAdmin: existingUser.isGlobalAdmin || false
    } as UserSession;
  } else {
    // Create new user with wallet + email
    const { id, walletAddress, isGlobalAdmin } = await insertUser({
      id: uuidv4(),
      walletAddress: siwe.address,
      email: credentials.email.toLowerCase(),
      accountStatus: 'active',
      emailVerifiedAt: new Date(),
    });
    user = { id, walletAddress, isGlobalAdmin: isGlobalAdmin || false } as UserSession;
  }
}
```

**Frontend changes in `useAuth.ts`:**
```typescript
const signIn = async (email?: string) => {
  try {
    if (!address || !chainId) return;

    // Get email from wallet if not provided
    if (!email) {
      const silkConnector = connectors.find((c) => c.id === 'silk');
      if (silkConnector) {
        const provider = await silkConnector.getProvider();
        email = await provider.requestEmail(); // Get verified email
      }
    }

    // Continue with SIWE flow...
  }
}
```

### Scenario Coverage

| Scenario | Current Behavior | Expected Behavior |
|----------|------------------|-------------------|
| New user with wallet | ❌ Email undefined | ✅ Call requestEmail(), create account |
| Pending email/pwd → wallet login (same email) | ❌ Registration failed error | ✅ Link wallet, activate account |
| Active email/pwd → wallet login | ❌ Registration failed error | ✅ Link wallet to account |
| Wallet with different email | ✅ Creates separate account | ✅ Correct - different identity |

---

## Login vs Signup Flow Architecture

### Current Problem

The system artificially separates "login" and "signup" when only email/password truly needs this distinction:

- **Email/Password** - Needs separate flows (password confirmation during signup)
- **Human Wallet** - Works identically for new and existing users
- **Google OAuth** - Works identically for new and existing users

### Proposed Unified Flow

```
┌─────────────────────────────────────────────────────┐
│  Sign In Page (single page)                        │
├─────────────────────────────────────────────────────┤
│                                                     │
│  [Connect Human Wallet]  ← Works for new + existing│
│  [Continue with Google]  ← Works for new + existing│
│                                                     │
│  ─────────── OR ───────────                        │
│                                                     │
│  Email: ___________                                 │
│  Password: ________                                 │
│  [Sign In]                                          │
│                                                     │
│  Don't have an account? [Sign up with Email/Pwd]   │
│                          └─→ Separate signup page   │
└─────────────────────────────────────────────────────┘
```

### Benefits

1. **Simpler UX**: One page for most auth methods
2. **Less confusion**: Users don't need to choose "login" vs "signup" for wallet/OAuth
3. **Natural flow**: Wallet and OAuth automatically detect new vs existing users
4. **Cleaner code**: Remove artificial separation, reduce duplicate logic

### Implementation Notes

- Keep separate `/signup` route only for email/password
- Update UI copy: "New user? Just use Human Wallet or Google to create your account"
- Backend automatically handles new user creation for wallet/OAuth
- Only email/pwd requires explicit "I want to create an account" decision

---

## Email Change Feature (Future)

**Current Gap:** Users cannot change their email after account creation

**Proposed OTP Flow:**

1. User enters new email in Settings
2. System sends OTP to new email
3. User enters OTP code
4. System updates email, sets `emailVerifiedAt`
5. User receives confirmation at both old and new email

**Implementation Requirements:**
- OTP generation and storage (temporary tokens table)
- OTP expiration (5-10 minutes)
- Rate limiting (prevent spam)
- Email templates for OTP delivery
- UI for OTP input

**Priority:** Medium - not blocking current feature, but important for user account management

---

## Files to Modify

### High Priority (Bugs)

1. `hooks/useAuth.ts` - Add `requestEmail()` call before SIWE
2. `config/next-auth-options.ts` - Update Human Wallet provider to match by email and link accounts
3. `components/auth/WalletEmailModal.tsx` - Remove (no longer needed with SDK email)
4. `components/settings/AuthenticationManagement.tsx` - Fix undefined email display
5. `components/settings/SetPasswordDialog.tsx` - Handle users without email

### Medium Priority (Features)

6. `components/profile/EditProfileForm.tsx` - Remove email field
7. `app/(main)/profile/page.tsx` - Remove email from display
8. `utils/email/mailjet.ts` - Configure MailJet integration
9. `config/environment.ts` - Add MailJet environment variables

### Low Priority (Architecture)

10. `components/auth/SignInForm.tsx` - Update UI messaging
11. `app/(main)/auth/login/page.tsx` - Consider renaming/restructuring
12. Create email change feature (new files needed)

---

## Next Steps

1. **Commit current work** (wallet protection implementation)
2. **Review this document** with team/stakeholders
3. **Prioritize** which bugs/features to tackle next
4. **Create PR** for current feature branch
5. **Start new branch** for next priority item

---

## Notes

- This document captures state as of 2025-10-29
- All analysis and proposals are based on current codebase understanding
- Implementation details may evolve during actual development
- Some edge cases may need further discussion
