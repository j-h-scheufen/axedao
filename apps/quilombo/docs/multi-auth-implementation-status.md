# Multi-Provider Authentication - Implementation Status

## Overview

This document tracks the implementation status of the multi-provider authentication system (Email/Password, Google OAuth, Human Wallet) for Quilombo.

---

## ✅ COMPLETED

### Core Authentication Features

- [x] Email/Password sign-up with verification flow
- [x] Email verification with 30-minute token expiry
- [x] Password reset flow with token-based security
- [x] Google OAuth sign-up and sign-in
- [x] Human Wallet (SIWE) sign-up with email collection
- [x] Human Wallet sign-in for existing accounts
- [x] Multi-provider account linking in Settings
- [x] Authentication method removal with safeguards
- [x] Session management (JWT, 5-day expiry)
- [x] Admin route protection via middleware

### Settings & UI

- [x] Authentication Management UI in Settings
- [x] Contact Email display (primary email for notifications)
- [x] Status badges for auth methods (Active, Linked, Connected)
- [x] Email indicators showing which is used for notifications
- [x] Mobile-first responsive design
- [x] Accordion UI for Settings sections
- [x] Error state handling across modals

### Security

- [x] Password hashing with bcrypt
- [x] Token hashing (store hash, send plain token)
- [x] Case-insensitive email lookups
- [x] CSRF token handling for SIWE
- [x] Prevent removing last auth method
- [x] Email uniqueness constraint in database schema (migration ready)

### Email System

- [x] Email provider interface (Mailjet production, Stub dev)
- [x] Verification email template (React Email)
- [x] Password reset email template
- [x] Welcome email template
- [x] PDF samples generated for Mailjet submission

### Documentation

- [x] API endpoint documentation (OpenAPI JSDoc)
- [x] CLAUDE.md updated with auth architecture
- [x] Database command documentation (env export hint)
- [x] Security review completed

---

## 🚧 IN PROGRESS / PENDING

### Database Migration

- [ ] **Run migration 0021_mute_iron_monger.sql** - Adds unique constraint to users.email
  - Migration generated and reviewed
  - Check for duplicate emails in staging DB first
  - Apply with: `pnpm db:migrate`

---

## 📋 TODO - NEW ITEMS

### 1. Duplicate Email Prevention on Sign-up Forms

**Issue**: A user with existing email/password account can attempt to sign up again using Google OAuth or Human Wallet with the same email.

**Current Behavior**:
- Email/Password sign-up: Checks for duplicate email ✓
- Google OAuth sign-up: Auto-links if email exists (no explicit warning)
- Human Wallet sign-up: May create duplicate or conflict

**Required Changes**:

#### 1.1 Sign-Up Form - Add Email Check Before OAuth/Wallet
**File**: `components/auth/SignUpForm.tsx`

When user clicks "Continue with Google" or attempts wallet sign-up:
- Check if email is already registered via API call
- Show modal: "Email Already Registered"
  - Message: "This email is already associated with an account. Please use the Sign In page instead."
  - Action: Redirect to login page

**New API Endpoint**:
```typescript
// /app/api/auth/check-email/route.ts
GET /api/auth/check-email?email=user@example.com
Response: { exists: boolean }
```

#### 1.2 Human Wallet Sign-up - Email Validation
**File**: `components/auth/WalletEmailModal.tsx`

Before submitting email:
- Call check-email API
- If exists, show error and suggest sign-in instead
- Don't allow form submission

#### 1.3 Google OAuth - Pre-check on Sign-up Page
**File**: `components/auth/SignUpForm.tsx`

Before redirecting to Google:
- Cannot pre-check email (don't have it yet)
- Alternative: After Google returns, check in NextAuth callback
- If email exists and no OAuth account linked:
  - Show interstitial page: "Account Exists - Please Sign In"
  - Don't create new account or auto-link without warning

**Implementation Priority**: High
**Estimated Effort**: 2-3 hours
**Files to Modify**:
- `components/auth/SignUpForm.tsx`
- `components/auth/WalletEmailModal.tsx`
- `config/next-auth-options.ts` (Google OAuth callback)
- Create: `app/api/auth/check-email/route.ts`

---

### 2. Wallet Requirement Detection for /axe and /dao Pages

**Issue**: Users without a linked Human Wallet cannot perform blockchain transactions on /axe and /dao pages.

**Required Changes**:

#### 2.1 Create Reusable Wallet Requirement Modal
**File**: `components/WalletRequiredModal.tsx` (new)

```tsx
interface WalletRequiredModalProps {
  isOpen: boolean;
  onClose: () => void;
}

// Modal content:
// - Icon: Wallet icon
// - Title: "Wallet Required"
// - Message: "This feature requires a connected Human Wallet to perform blockchain transactions."
// - Action: "Go to Settings" button → navigate to /settings (with Authentication Methods accordion open)
// - Secondary: "Cancel" button → close modal
```

#### 2.2 Create useWalletCheck Hook
**File**: `hooks/useWalletCheck.ts` (new)

```tsx
export const useWalletCheck = () => {
  const { data: session } = useSession();
  const { address } = useAccount(); // Wagmi hook

  // Check if user has wallet linked in DB
  const { data: authMethods } = useQuery(['auth-methods', session?.user?.id]);

  return {
    hasWallet: !!authMethods?.hasWallet,
    isWalletConnected: !!address,
    requiresWalletSetup: !authMethods?.hasWallet,
  };
};
```

#### 2.3 Apply to /axe Pages
**Files**:
- `app/(main)/axe/page.tsx` - AXE token info and swap
- Any other /axe/* pages with transactions

Before rendering transaction buttons:
```tsx
const { hasWallet, requiresWalletSetup } = useWalletCheck();
const walletModal = useDisclosure();

useEffect(() => {
  if (requiresWalletSetup) {
    walletModal.onOpen();
  }
}, [requiresWalletSetup]);

// Show WalletRequiredModal if needed
```

#### 2.4 Apply to /dao Pages
**Files**:
- `app/(main)/dao/page.tsx` - DAO governance, proposals, voting
- Any other /dao/* pages with transactions

Same pattern as /axe pages.

#### 2.5 Optional: Add Wallet Status Indicator
Show wallet connection status in page header or toolbar:
- Green indicator: Wallet linked and connected
- Yellow indicator: Wallet linked but not connected (prompt to connect)
- Red indicator: No wallet linked (show modal)

**Implementation Priority**: Medium
**Estimated Effort**: 3-4 hours
**Files to Create**:
- `components/WalletRequiredModal.tsx`
- `hooks/useWalletCheck.ts`

**Files to Modify**:
- `app/(main)/axe/page.tsx`
- `app/(main)/dao/page.tsx`
- Any other pages with blockchain transactions

---

## 📊 IMPLEMENTATION SUMMARY

### Completed Items: 29
### Pending Items: 3
- Database migration (ready to apply)
- Duplicate email prevention
- Wallet requirement detection

### Estimated Remaining Effort: 6-8 hours

---

## 🔒 SECURITY NOTES

### Email as Primary Identifier
✅ **Resolved**: Unique constraint on `users.email` enforces single email per user
- Priority: `users.email` (primary) → `oauthAccounts.providerEmail` (fallback for Google-only accounts)
- Contact Email display shows users which email receives notifications

### Auth Method Management
✅ **Secure**:
- Cannot remove last auth method
- Error states properly cleared between modal interactions
- All API endpoints have proper validation and error handling

### Outstanding Security Considerations
1. **Email change notifications** (Future): Notify users when auth methods are linked/unlinked
2. **Session activity log** (Future): Show recent auth method changes in Settings
3. **2FA Support** (Future): Optional two-factor authentication

---

## 📝 NOTES

- Migration `0021_mute_iron_monger.sql` ready but not applied
- Check staging DB for duplicate emails before migrating
- All auth flows already handle email uniqueness at application level
- Database constraint adds enforcement layer

**Last Updated**: 2025-10-28
