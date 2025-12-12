# Invite-Only Enforcement - Login/Signup Flows

## Overview

Complete the invite-only feature by enforcing invitation requirements in login/signup flows. The invitation management UI (`/invites` page) is already complete and working in production. This spec focuses solely on blocking unauthorized signups.

**Reference**: See `docs/specs/done/invite-only-feature-plan.md` for the original comprehensive spec.

---

## Current State

### Working ✅
- `/invites` page with email invitations and QR code generation
- API routes: `POST /api/invitations`, `POST /api/invitations/validate`
- Database: `invitations` table, `users.invitedBy` column
- Email template: `invitation-email.tsx`
- DB queries: `findValidInvitation()`, `markInvitationAccepted()`, etc.

### Missing ❌
1. Signup page doesn't block users without invitation code
2. `invitationCode` is optional in validation schema (should be required)
3. `invitedBy` never set when creating users via email/password signup
4. Google OAuth creates users without invitation validation
5. Wallet/SIWE creates users without invitation validation
6. Login page missing invite-only info banner
7. Email field not disabled for email-bound invites on signup
8. No cookie-based invitation passing for OAuth/wallet flows

---

## Implementation Tasks

### Task 1: Update Signup Page UI

**File**: `apps/quilombo/components/auth/SignUpForm.tsx`

#### 1.1 Block signup without invitation code

When no `?code=` parameter is present, show invite-only message instead of signup form:

```tsx
// After extracting invitationCode from searchParams
const invitationCode = searchParams.get('code');
const invitedEmail = searchParams.get('email');

// Add state for invitation validation
const [invitationValid, setInvitationValid] = useState<boolean | null>(null);
const [inviterName, setInviterName] = useState<string>('');
const [invitationType, setInvitationType] = useState<'email_bound' | 'open' | null>(null);

// Validate invitation on mount
useEffect(() => {
  if (!invitationCode) {
    setInvitationValid(false);
    return;
  }

  // Call validation API
  fetch('/api/invitations/validate', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
  })
    .then(res => res.json())
    .then(data => {
      if (data.valid) {
        setInvitationValid(true);
        setInviterName(data.inviterName);
        setInvitationType(data.type);
      } else {
        setInvitationValid(false);
      }
    })
    .catch(() => setInvitationValid(false));
}, [invitationCode, invitedEmail]);
```

#### 1.2 Show invite-only message when no valid invitation

```tsx
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
if (invitationValid === false) {
  return (
    <div className="auth-container-py items-center text-center">
      <h2 className="text-2xl text-default-700 mb-4">Invite Only</h2>
      <div className="p-4 bg-default-100 rounded-lg border border-default-200 max-w-md">
        <p className="text-default-600 mb-4">
          Quilombo is currently invite-only. To join, you need an invitation from an existing member.
        </p>
        <p className="text-sm text-default-500">
          Already have an account?{' '}
          <Link href={PATHS.login} color="secondary">
            Sign in
          </Link>
        </p>
      </div>
    </div>
  );
}

// Show loading while validating
if (invitationValid === null && invitationCode) {
  return (
    <div className="auth-container-py items-center text-center">
      <Spinner />
      <p className="mt-2 text-default-500">Validating invitation...</p>
    </div>
  );
}
```

#### 1.3 Update invitation banner to show inviter name

```tsx
{invitationValid && (
  <div className="mb-4 p-3 bg-success-50 rounded-lg border border-success-200">
    <p className="text-sm text-success-700 text-center">
      {inviterName
        ? `You were invited by ${inviterName}`
        : "You're signing up with a valid invitation"}
      {invitedEmail && invitationType === 'email_bound' && ` for ${invitedEmail}`}
    </p>
  </div>
)}
```

#### 1.4 Disable email field for email-bound invitations

```tsx
<Field
  name="email"
  type="email"
  label="Email"
  placeholder="your@email.com"
  isRequired
  isDisabled={invitationType === 'email_bound'} // Disable for email-bound
  as={FieldInput}
/>
```

#### 1.5 Set invitation cookie for OAuth/wallet flows

```tsx
// When invitation is validated, set cookie for OAuth/wallet flows
useEffect(() => {
  if (invitationValid && invitationCode) {
    // Set cookie with 1-hour expiry for OAuth roundtrip
    document.cookie = `invitationCode=${invitationCode}; path=/; max-age=3600; SameSite=Lax`;
  }
}, [invitationValid, invitationCode]);
```

---

### Task 2: Update Validation Schema

**File**: `apps/quilombo/config/validation-schema.ts`

Change `invitationCode` from optional to required:

```typescript
// TODO: TEMPORARY INVITE-ONLY - Remove invitationCode requirement when opening to public
export const signupSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
  password: passwordField(),
  invitationCode: string().uuid('Invalid invitation code').required('Invitation code is required'),
});
```

---

### Task 3: Set `invitedBy` in Email/Password Signup

**File**: `apps/quilombo/app/api/auth/signup/route.ts`

Update user creation to include `invitedBy`:

```typescript
// Line 128-135: Update user creation
const userId = uuidv4();
await db.insert(users).values({
  id: userId,
  email: email.toLowerCase(),
  passwordHash,
  accountStatus: 'pending_verification',
  invitedBy: invitation.createdBy, // ADD THIS LINE
});
```

---

### Task 4: Add Invitation Validation to Google OAuth

**File**: `apps/quilombo/config/next-auth-options.ts`

#### 4.1 Add imports

```typescript
import { findValidInvitation, markInvitationAccepted } from '@/db';
```

#### 4.2 Update new user creation section (around line 402-428)

Replace the "No existing user - create new account" block:

```typescript
// No existing user - create new account
// TODO: TEMPORARY INVITE-ONLY - Require invitation for new users
const cookieStore = await cookies();
const invitationCode = cookieStore.get('invitationCode')?.value;

if (!invitationCode) {
  // No invitation code - redirect to signup with error
  return `/auth/signup?error=${encodeURIComponent('Invitation required to create an account')}`;
}

// Validate invitation
const invitation = await findValidInvitation(invitationCode, email);

if (!invitation) {
  return `/auth/signup?error=${encodeURIComponent('Invalid or expired invitation')}`;
}

// For email-bound invitations, verify email matches
if (invitation.type === 'email_bound' && invitation.invitedEmail !== email) {
  return `/auth/signup?error=${encodeURIComponent(`This invitation was sent to ${invitation.invitedEmail}. Please use that email address.`)}`;
}

const newUser = await insertUser({
  id: uuidv4(),
  email,
  accountStatus: accountStatuses[1], // 'active'
  emailVerifiedAt: new Date(), // Google pre-verifies emails
  invitedBy: invitation.createdBy, // Track who invited this user
});

// Mark email-bound invitation as accepted
if (invitation.type === 'email_bound') {
  await markInvitationAccepted(invitationCode, newUser.id);
}

// Clear invitation cookie after successful signup
cookieStore.delete('invitationCode');

// Link OAuth account to new user (existing code continues...)
await db.insert(oauthAccounts).values({
  userId: newUser.id,
  provider: 'google',
  providerUserId: account.providerAccountId,
  providerEmail: email,
});

// ... rest of existing code (welcome email, etc.)
```

---

### Task 5: Add Invitation Validation to Wallet/SIWE

**File**: `apps/quilombo/config/next-auth-options.ts`

Update the SIWE new user creation section (around line 123-142):

```typescript
} else {
  // Create new user with wallet + email
  // TODO: TEMPORARY INVITE-ONLY - Require invitation for new users
  const cookieStore = await cookies();
  const invitationCode = cookieStore.get('invitationCode')?.value;

  if (!invitationCode) {
    throw new Error('INVITATION_REQUIRED');
  }

  // Validate invitation
  const invitation = await findValidInvitation(invitationCode, credentials.email);

  if (!invitation) {
    throw new Error('INVALID_INVITATION');
  }

  // For email-bound invitations, verify email matches
  if (invitation.type === 'email_bound' && invitation.invitedEmail !== credentials.email.toLowerCase()) {
    throw new Error('INVITATION_EMAIL_MISMATCH');
  }

  const { id, walletAddress, isGlobalAdmin } = await insertUser({
    id: uuidv4(),
    walletAddress: siwe.address,
    email: credentials.email.toLowerCase(),
    accountStatus: accountStatuses[1], // 'active'
    emailVerifiedAt: new Date(), // Wallet signature proves ownership
    invitedBy: invitation.createdBy, // Track who invited this user
  });

  // Mark email-bound invitation as accepted
  if (invitation.type === 'email_bound') {
    await markInvitationAccepted(invitationCode, id);
  }

  // Clear invitation cookie after successful signup
  cookieStore.delete('invitationCode');

  // Send welcome email for new user (existing code continues...)
  // ...
}
```

#### 5.1 Add error constants

**File**: `apps/quilombo/config/constants.ts`

Add new auth error constants if not present:

```typescript
export const AUTH_ERRORS = {
  // ... existing errors
  INVITATION_REQUIRED: 'INVITATION_REQUIRED',
  INVALID_INVITATION: 'INVALID_INVITATION',
  INVITATION_EMAIL_MISMATCH: 'INVITATION_EMAIL_MISMATCH',
};
```

#### 5.2 Handle new errors in useAuth hook

**File**: `apps/quilombo/hooks/useAuth.ts`

Update error handling to show user-friendly messages for invitation errors.

---

### Task 6: Add Invite-Only Banner to Login Page

**File**: `apps/quilombo/components/auth/SignInForm.tsx`

Add banner after the heading:

```tsx
<h2 className="text-3xl text-default-700 sm:text-default-800 mb-2 text-center">Login</h2>

{/* TODO: TEMPORARY INVITE-ONLY - Remove when opening to public */}
<div className="mb-4 p-3 bg-default-100 rounded-lg border border-default-200">
  <p className="text-sm text-default-600 text-center">
    Quilombo is currently invite-only. Don't have an account?{' '}
    Ask an existing member to send you an invitation.
  </p>
</div>
```

---

### Task 7: Handle Wallet Signup with Invitations

**Background**: The wallet (SIWE) flow currently works as follows:
1. User connects wallet
2. `useAuth.signIn()` tries to auto-fetch email from Human Wallet SDK via `provider.requestEmail()`
3. If SDK returns email → trust it (Human Wallet verified it) → account is `active`
4. If no email available → backend returns `EMAIL_REQUIRED` → `WalletEmailModal` opens
5. User provides email manually → currently creates account as `active` (no verification)

**Critical insight for invitations**: The email source determines whether verification is needed:

| Email Source | Trusted? | Email Verification |
|--------------|----------|-------------------|
| Human Wallet SDK (`provider.requestEmail()`) | YES | Not needed |
| URL param from invite (`?email=xxx`) | NO | **Required** |
| Manual entry in `WalletEmailModal` | NO | **Required** |

**Current code problem**: The SIWE flow at `next-auth-options.ts:129-131` sets `accountStatus: 'active'` and `emailVerifiedAt: new Date()` for ALL new wallet users, even when email comes from manual entry. This is a pre-existing bug that becomes more important with invitations.

#### 7.1 Update SIWE flow to track email source

**File**: `apps/quilombo/config/next-auth-options.ts`

The SIWE authorize function needs to know if the email came from the SDK or from manual entry. Add a new credential field:

```typescript
credentials: {
  message: { ... },
  signature: { ... },
  email: { ... },
  emailFromSdk: {  // NEW: Track if email was auto-fetched from SDK
    label: 'Email From SDK',
    type: 'text',
  },
},
```

Update the new user creation logic:

```typescript
} else {
  // Create new user with wallet + email
  // TODO: TEMPORARY INVITE-ONLY - Require invitation for new users
  const cookieStore = await cookies();
  const invitationCode = cookieStore.get('invitationCode')?.value;

  if (!invitationCode) {
    throw new Error('INVITATION_REQUIRED');
  }

  const invitation = await findValidInvitation(invitationCode, credentials.email);

  if (!invitation) {
    throw new Error('INVALID_INVITATION');
  }

  if (invitation.type === 'email_bound' && invitation.invitedEmail !== credentials.email.toLowerCase()) {
    throw new Error('INVITATION_EMAIL_MISMATCH');
  }

  // Determine if email needs verification
  // Email is trusted ONLY if it came from Human Wallet SDK
  const emailFromSdk = credentials.emailFromSdk === 'true';
  const emailIsTrusted = emailFromSdk;

  const { id, walletAddress, isGlobalAdmin } = await insertUser({
    id: uuidv4(),
    walletAddress: siwe.address,
    email: credentials.email.toLowerCase(),
    accountStatus: emailIsTrusted ? accountStatuses[1] : accountStatuses[0], // 'active' or 'pending_verification'
    emailVerifiedAt: emailIsTrusted ? new Date() : null,
    invitedBy: invitation.createdBy,
  });

  // Mark email-bound invitation as accepted
  if (invitation.type === 'email_bound') {
    await markInvitationAccepted(invitationCode, id);
  }

  // Clear invitation cookie
  cookieStore.delete('invitationCode');

  // If email needs verification, send verification email
  if (!emailIsTrusted) {
    const token = generateToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000); // 30 minutes

    await db.insert(verificationTokens).values({
      userId: id,
      tokenHash,
      type: 'email_verification',
      expiresAt,
    });

    const emailProvider = getEmailProvider();
    await emailProvider.sendVerificationEmail(credentials.email.toLowerCase(), token);

    // Return null to prevent session creation - user must verify email first
    // Or throw a specific error that frontend can handle
    throw new Error('EMAIL_VERIFICATION_REQUIRED');
  }

  // Send welcome email for verified users
  try {
    const emailProvider = getEmailProvider();
    await emailProvider.sendWelcomeEmail(credentials.email);
  } catch (emailError) {
    console.error('Failed to send welcome email:', emailError);
  }

  user = { id, walletAddress, isGlobalAdmin: isGlobalAdmin || false } as UserSession;
}
```

#### 7.2 Update useAuth to pass emailFromSdk flag

**File**: `apps/quilombo/hooks/useAuth.ts`

Track whether email came from SDK:

```typescript
const signIn = async (email?: string) => {
  // ... existing code ...

  let emailFromSdk = false;

  // Auto-fetch email from Human Wallet SDK if not provided
  if (!email) {
    try {
      const silkConnector = connectors.find((c) => c.id === 'silk');
      if (silkConnector) {
        const provider = (await silkConnector.getProvider()) as SilkEthereumProviderInterface;
        email = (await provider.requestEmail()) as string;
        emailFromSdk = true;  // Mark as SDK-sourced
      }
    } catch (error) {
      console.warn('Could not fetch email from Human Wallet:', error);
    }
  }

  // ... create SIWE message ...

  const res = await nextAuthSignIn('ethereum', {
    message: JSON.stringify(message),
    signature,
    email: email || undefined,
    emailFromSdk: emailFromSdk ? 'true' : 'false',  // Pass to backend
    callbackUrl,
    redirect: false,
  });

  // Handle new error type
  if (res?.error === 'EMAIL_VERIFICATION_REQUIRED') {
    // Redirect to verification page
    router.push(`${PATHS.verifyEmail}/sent?email=${encodeURIComponent(email || '')}`);
    setState((x) => ({ ...x, loading: false }));
    return;
  }

  // ... rest of existing code ...
};
```

#### 7.3 Update SignUpForm for wallet signup with invites

**File**: `apps/quilombo/components/auth/SignUpForm.tsx`

For email-bound invites, pass the email but mark it as NOT from SDK:

```tsx
// The existing signIn() in useAuth will be called
// For email-bound: email comes from URL (not trusted)
// For open: SDK will try to fetch, or modal will open

// No special handling needed in SignUpForm - the emailFromSdk flag
// in useAuth handles the trust distinction automatically
```

#### 7.4 Handle WalletEmailModal submissions

When user manually enters email in the modal, it's not from SDK, so `emailFromSdk` will be `false` and verification will be required.

**File**: `apps/quilombo/components/auth/WalletEmailModal.tsx`

Add optional pre-fill for open invites:

```tsx
interface WalletEmailModalProps {
  // ... existing props
  initialEmail?: string; // Pre-fill for convenience (still requires verification)
}

// In Formik:
<Formik
  initialValues={{ email: initialEmail || '' }}
  // ...
>
```

---

## Testing Checklist

### Email/Password Signup
- [ ] Without invitation code: Shows "invite-only" message, no form
- [ ] With invalid code: Shows error message
- [ ] With expired code: Shows error message
- [ ] With valid email-bound code: Pre-fills email, email field disabled, creates user with `invitedBy`
- [ ] With valid open code: Email field editable, creates user with `invitedBy`
- [ ] Email mismatch on email-bound: Shows error about correct email
- [ ] Email verification email IS sent (existing behavior - account status `pending_verification`)

### Google OAuth Signup
- [ ] Without invitation cookie: Redirects to signup with error
- [ ] With valid invitation cookie: Creates user with `invitedBy`, clears cookie
- [ ] Email mismatch on email-bound: Shows error

### Wallet/SIWE Signup
- [ ] Without invitation cookie: Shows INVITATION_REQUIRED error
- [ ] With email from SDK (trusted): Creates `active` user with `invitedBy`, no verification needed
- [ ] With email from invite URL (untrusted): Creates `pending_verification` user, sends verification email
- [ ] With email from modal (untrusted): Creates `pending_verification` user, sends verification email
- [ ] Email mismatch on email-bound: Shows INVITATION_EMAIL_MISMATCH error
- [ ] After email verification: Account becomes `active`, can login normally

### Login Page
- [ ] Shows invite-only banner
- [ ] Existing users can still login normally (all 3 methods)

### Attribution
- [ ] `users.invitedBy` correctly set for all signup methods
- [ ] Email-bound invitations marked as accepted after signup
- [ ] Open invitations remain pending (multi-use)

---

## Files to Modify

1. `apps/quilombo/components/auth/SignUpForm.tsx` - Main signup UI changes
2. `apps/quilombo/config/validation-schema.ts` - Make invitationCode required
3. `apps/quilombo/app/api/auth/signup/route.ts` - Set invitedBy
4. `apps/quilombo/config/next-auth-options.ts` - OAuth and SIWE invitation checks + email verification fix
5. `apps/quilombo/components/auth/SignInForm.tsx` - Add invite-only banner
6. `apps/quilombo/components/auth/WalletEmailModal.tsx` - Support initialEmail pre-fill
7. `apps/quilombo/config/constants.ts` - Add error constants: `INVITATION_REQUIRED`, `INVALID_INVITATION`, `INVITATION_EMAIL_MISMATCH`, `EMAIL_VERIFICATION_REQUIRED`
8. `apps/quilombo/hooks/useAuth.ts` - Pass `emailFromSdk` flag, handle new error types

---

## Pre-existing Bug Fixed

**Issue**: The current SIWE flow at `next-auth-options.ts:129-131` sets `accountStatus: 'active'` and `emailVerifiedAt: new Date()` for ALL new wallet users, even when email comes from manual entry in `WalletEmailModal`. This means users who manually enter an email (not fetched from SDK) get a verified account without proving email ownership.

**Fix**: Task 7 introduces the `emailFromSdk` flag to distinguish trusted (SDK) vs untrusted (manual/URL) email sources. Only SDK-sourced emails skip verification.

---

## Removal Plan

All code added for invite-only enforcement is marked with:
```
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
```

To remove invite-only mode:
1. Search for `TODO: TEMPORARY INVITE-ONLY`
2. Remove/revert the marked code blocks
3. Change `invitationCode` back to optional in signupSchema
4. Remove invitation cookie handling
5. Keep `invitedBy` column for historical attribution data
