# Invite-Only Feature Implementation Plan

## Overview
Transform Quilombo into an invite-only app where existing members can invite new users via **two invitation types**:

1. **Email-bound invitations** - Single-use, remote invites via email/link (30-day expiry)
2. **Open invitations (QR codes)** - Multi-use, in-person invites for events (72-hour expiry)

Both types provide attribution tracking via `users.invitedBy`.

**Note**: This feature is always active when code is present. No feature flag needed. Removal is handled via future PR with `// TODO: TEMPORARY INVITE-ONLY` markers.

---

## Database Changes

### 1. New `invitations` table
```typescript
{
  id: uuid (primary key)
  code: uuid (unique, indexed) // The invitation token
  type: enum ['email_bound', 'open'] // NEW: Invitation type
  invitedEmail: text (nullable, lowercase, indexed) // NULL for open invites
  createdBy: uuid (foreign key → users.id)
  createdAt: timestamp
  expiresAt: timestamp // 30 days for email_bound, 72 hours for open
  status: enum ['pending', 'accepted', 'expired']
  acceptedAt: timestamp (nullable) // Only for email_bound (single-use)
  acceptedBy: uuid (nullable, foreign key → users.id) // Only for email_bound
}
```

**Notes**:
- **Email-bound**: Tied to specific email, single-use, 30-day expiry
- **Open**: Not tied to email, multi-use (unlimited), 72-hour expiry
- User can have only **one active open invite** at a time (generating new one invalidates old)
- Multiple email-bound invites can exist for same email (only latest valid one is used)

### 2. Update `users` table
```typescript
// Add column:
invitedBy: uuid (nullable, foreign key → users.id)
```

### 3. Add DB functions to `db/index.ts`
- `createInvitation(createdBy, type, invitedEmail?)` → Generate UUID code, insert record
  - For `type='email_bound'`: Replace pending invites for same email
  - For `type='open'`: Invalidate user's existing active open invite first
- `invalidateUserOpenInvites(userId)` → Mark user's pending open invites as expired
- `findValidInvitation(code, email?)` → Lookup pending, non-expired invite (email optional for open invites)
- `getUserActiveOpenInvite(userId)` → Get user's current active open invite (if any)
- `markInvitationAccepted(code, acceptedBy)` → Update status, acceptedAt, acceptedBy (email_bound only)
- `expireOldInvitations()` → Cron/cleanup job to mark expired invites

---

## API Routes

### 1. **POST `/api/invitations`** (Protected - requires auth)
Create new invitation code
```typescript
Request: {
  type: 'email_bound' | 'open',
  invitedEmail?: string,  // Required if type='email_bound', ignored if 'open'
  sendEmail?: boolean     // Only for email_bound (default: false)
}
Response: {
  code: string,          // UUID token
  type: 'email_bound' | 'open',
  invitedEmail?: string, // Only for email_bound
  expiresAt: string,     // ISO timestamp
  inviteLink: string     // Full signup URL with code (+ email param for email_bound)
}
```

**Logic**:
- **Email-bound**:
  - Replaces pending invites for same email
  - 30-day expiry
  - If `sendEmail=true`, sends invitation email via Mailjet
  - Link format: `https://quilombo.net/auth/signup?code={UUID}&email={email}`
- **Open**:
  - Invalidates user's existing active open invite
  - 72-hour expiry (perfect for weekend workshops)
  - No email sent
  - Link format: `https://quilombo.net/auth/signup?code={UUID}` (no email param)

**Notes**:
- TODO: TEMPORARY INVITE-ONLY - No rate limiting initially; consider if feature stays long-term

### 2. **POST `/api/invitations/validate`** (Public endpoint)
Validate invitation code
```typescript
Request: {
  code: string,
  email?: string  // Optional - only validated for email_bound invites
}
Response: {
  valid: boolean,
  type: 'email_bound' | 'open',
  inviterName: string,      // Calculated via getUserDisplayName() from utils
  expiresAt: string,
  invitedEmail?: string     // Only for email_bound
}
Error: 400 with { error: "Invalid or expired invitation" }
```

**Logic**:
- For **email_bound**: Validates both code AND email match
- For **open**: Only validates code (email param ignored)
- Generic error messages to prevent user enumeration

**Notes**:
- TODO: TEMPORARY INVITE-ONLY - No rate limiting initially; consider if feature stays long-term

---

## Email Template

### New `invitation-email.tsx` (React Email component)
Location: `apps/quilombo/emails/invitation-email.tsx`

**Content**:
- Personalized greeting: "You've been invited by **[inviterName]** to join Quilombo"
  - Uses `getUserDisplayName()` from `/utils/index.ts` to calculate inviter name
- Brief intro about Quilombo (Capoeira community platform)
- Big CTA button: "Accept Invitation"
- Link format: `https://quilombo.net/auth/signup?code=[UUID]&email=[email]`
- Expiration notice: "This invitation expires in 30 days"
- Footer with support email

**Email Sender**:
- From: `join@quilombo.net` (needs to be created in Mailjet)
- Requires verified sender setup + SPF/DKIM records (same as support@quilombo.net)

---

## UI Changes

### 1. Settings Page - New "Invite Members" Section
Location: `app/(main)/settings/page.tsx` (add after Authentication Management)

**Component**: `InviteMemberForm.tsx` (`components/settings/InviteMemberForm.tsx`)

Two separate subsections:

#### Section 1: "Invite by Email"
- Email input field (Formik + Yup validation reusing existing email schema)
- Two action buttons:
  - **"Send Email Invite"** → Calls API with `type='email_bound', sendEmail=true`, shows success toast
  - **"Copy Link"** → Calls API with `type='email_bound', sendEmail=false`, shows link copy modal
- User can re-enter same email to generate new invitation (replaces old pending one)

#### Section 2: "Generate QR Code for Events"
- Description text:
  ```
  Generate a QR code for in-person events (workshops, rodas).
  Valid for 72 hours. Multiple people can scan the same code.
  Generating a new code will replace your current one.
  ```
- **"Generate QR Code"** button → Calls API with `type='open'`, shows QR modal

**Component**: `InviteQRModal.tsx` (`components/settings/InviteQRModal.tsx`)
- Display QR code (using `qrcode.react` library)
- Show "Valid until: [timestamp]"
- Show message: "Share this QR code at workshops and events"
- **NO copy link button** (QR only)
- **NO email address shown** (open invite)
- "Close" button

**Component**: `InviteLinkModal.tsx` (optional - for email-bound link copying)
- Show invite link with copy button
- Show invited email address
- "Close" button

**Removed**: No invitations list component (saves implementation time)

### 2. Signup Page - Invitation Mode
Location: `app/(main)/auth/signup/page.tsx`

**URL Detection (Option A - presence of email param determines type):**

#### Case 1: Email-bound invitation (`?code=UUID&email=test@example.com`)
```typescript
const code = searchParams.get('code');
const email = searchParams.get('email');

if (code && email) {
  // Validate email-bound invitation
  const validation = await fetch('/api/invitations/validate', {
    method: 'POST',
    body: JSON.stringify({ code, email })
  });

  if (validation.valid) {
    // Pre-fill and DISABLE email field
    // Show banner: "You were invited by {inviterName}"
    // Set cookie: invitationCode={code} (1 hour expiry, for OAuth/Wallet flows)
  } else {
    // Show error: "Invalid or expired invitation"
  }
}
```

#### Case 2: Open invitation (`?code=UUID` - no email param)
```typescript
if (code && !email) {
  // Validate open invitation
  const validation = await fetch('/api/invitations/validate', {
    method: 'POST',
    body: JSON.stringify({ code })
  });

  if (validation.valid) {
    // Email field is ENABLED (user enters their own)
    // Show banner: "You have an invitation to join Quilombo"
    // Set cookie: invitationCode={code} (1 hour expiry)
  } else {
    // Show error: "Invalid or expired invitation"
  }
}
```

#### Case 3: No invitation
```typescript
if (!code) {
  // Show message: "Quilombo is invite-only. Please ask an existing member for an invitation."
  // Hide signup form entirely
}
```

**Modified `SignUpForm.tsx`:**
- Add hidden `invitationCode` field (from URL param, passed to API)
- Email field behavior:
  - **Email-bound**: Pre-filled and disabled
  - **Open**: Enabled for user input
- Password + confirmation fields work as normal
- Google OAuth button works (uses cookie for validation)
- Wallet "Connect" button works (uses cookie for validation)

### 3. Login Page - Info Banner
Location: `app/(main)/auth/login/page.tsx`

**Add banner at top:**
```
ℹ️ Quilombo is currently invite-only.
Don't have an account? Ask an existing member to send you an invitation.
```

---

## Authentication Flow Changes

**All three auth methods follow the same invitation validation pattern:**

### Common Validation Logic

```typescript
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public

// 1. Require invitation code
if (!invitationCode) {
  throw new Error('INVITATION_REQUIRED');
}

// 2. Find and validate invitation
const invitation = await findValidInvitation(invitationCode, email);

if (!invitation || invitation.status === 'expired') {
  throw new Error('INVALID_INVITATION');
}

// 3. Type-specific validation
if (invitation.type === 'email_bound') {
  // STRICT: Email must match exactly
  if (invitation.invitedEmail !== email.toLowerCase()) {
    throw new Error('INVITATION_EMAIL_MISMATCH');
    // Error message: "This invitation was sent to {invitedEmail}.
    //                 Please use that email address to sign up."
  }

  // Mark as accepted (single-use)
  await markInvitationAccepted(invitationCode, newUser.id);

} else if (invitation.type === 'open') {
  // OPEN: Any email accepted
  // No marking as accepted (multi-use, expires after 72 hours)
}

// 4. Create user with attribution (same for both types)
const newUser = await db.insert(users).values({
  email: email.toLowerCase(),
  invitedBy: invitation.createdBy, // Attribution tracking
  ...
});
```

### 1. Email/Password Signup (`/api/auth/signup/route.ts`)

```typescript
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public

const invitation = await findValidInvitation(invitationCode, email);

// ... validation logic from above ...

// Create user (existing logic, still requires email verification)
const newUser = await db.insert(users).values({
  email: email.toLowerCase(),
  passwordHash: hashedPassword,
  accountStatus: 'pending_verification', // Still pending for email/password
  invitedBy: invitation.createdBy,
  ...
});

// Mark invitation if email_bound
if (invitation.type === 'email_bound') {
  await markInvitationAccepted(invitationCode, newUser.id);
}

// Send verification email (existing logic)
// Redirect to verify-email page (existing logic)
```

### 2. Google OAuth Flow (`/config/next-auth-options.ts`)

```typescript
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public

// In Google OAuth callback (around line ~240):

const existingUser = await db.query.users.findFirst({
  where: sql`LOWER(${users.email}) = ${googleEmail.toLowerCase()}`
});

if (!existingUser) {
  // NEW USER - Require invitation code from cookie
  const invitationCode = cookies().get('invitationCode')?.value;

  if (!invitationCode) {
    throw new Error('INVITATION_REQUIRED');
  }

  const invitation = await findValidInvitation(invitationCode, googleEmail);

  if (!invitation || invitation.status === 'expired') {
    throw new Error('INVALID_INVITATION');
  }

  // Type-specific validation
  if (invitation.type === 'email_bound') {
    // STRICT: Google email must match invited email
    if (invitation.invitedEmail !== googleEmail.toLowerCase()) {
      throw new Error('INVITATION_EMAIL_MISMATCH');
    }
  }
  // Open invites accept any Google email

  // Create user (auto-verified via Google)
  const newUser = await db.insert(users).values({
    email: googleEmail.toLowerCase(),
    accountStatus: 'active',
    emailVerifiedAt: new Date(),
    invitedBy: invitation.createdBy,
    ...
  });

  // Mark invitation if email_bound
  if (invitation.type === 'email_bound') {
    await markInvitationAccepted(invitationCode, newUser.id);
  }

  // Clear cookie after successful signup
  cookies().delete('invitationCode');
}

// Existing user logic continues...
```

**Cookie Handling:**
- Signup page sets cookie when `?code=` param present: `invitationCode={code}`
- Cookie expires in 1 hour (sufficient for OAuth roundtrip)
- Cookie cleared after successful account creation

### 3. Human Wallet (SIWE) Flow (`/config/next-auth-options.ts`)

```typescript
// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public

// In SIWE authorize function when user provides email:

const existingUser = await db.query.users.findFirst({
  where: eq(users.walletAddress, credentials.address)
});

if (!existingUser) {
  // NEW USER - Require invitation code from cookie (set on signup page)
  const invitationCode = cookies().get('invitationCode')?.value;

  if (!invitationCode) {
    throw new Error('INVITATION_REQUIRED');
  }

  const invitation = await findValidInvitation(
    invitationCode,
    credentials.email  // Email from WalletEmailModal
  );

  if (!invitation || invitation.status === 'expired') {
    throw new Error('INVALID_INVITATION');
  }

  // Type-specific validation
  if (invitation.type === 'email_bound') {
    // STRICT: Wallet email must match invited email
    if (invitation.invitedEmail !== credentials.email.toLowerCase()) {
      throw new Error('INVITATION_EMAIL_MISMATCH');
    }
  }
  // Open invites accept any email

  // Create user (auto-verified via wallet signature)
  const newUser = await db.insert(users).values({
    walletAddress: credentials.address,
    email: credentials.email.toLowerCase(),
    accountStatus: 'active',
    emailVerifiedAt: new Date(),
    invitedBy: invitation.createdBy,
    ...
  });

  // Mark invitation if email_bound
  if (invitation.type === 'email_bound') {
    await markInvitationAccepted(invitationCode, newUser.id);
  }

  // Clear cookie after successful signup
  cookies().delete('invitationCode');
}
```

**WalletEmailModal Changes** (`components/auth/WalletEmailModal.tsx`):
- **NO invitation code input field** (uses cookie like OAuth)
- Email field behavior (receives `invitedEmail` prop from signup page):
  - **Email-bound**: Pre-filled with `invitedEmail`, can be disabled/read-only
  - **Open**: Pre-filled but editable (or empty for user input)
- **NO client-side validation needed** (backend validates via cookie)
- Modal just collects email, backend handles rest via cookie

---

## Validation Schema Changes
Location: `apps/quilombo/config/validation-schema.ts`

**Follow DRY principles** - Reuse existing email validation patterns from the file.

### Extract reusable email field (if not already extracted):
```typescript
// Reusable email field definition (appears 8+ times in file)
const emailField = () =>
  string()
    .email('Invalid email address')
    .required('Email is required')
    .lowercase()
    .trim();
```

### Add new invitation type constants:
```typescript
// Invitation types (for DRY principle)
export const invitationTypes = ['email_bound', 'open'] as const;
export type InvitationType = (typeof invitationTypes)[number];
```

### Add new schemas (reusing existing patterns):
```typescript
// For creating invitations via Settings UI
export const invitationSchema = object({
  type: string()
    .oneOf(invitationTypes, 'Invalid invitation type')
    .required('Invitation type is required'),
  invitedEmail: string()
    .email('Invalid email address')
    .lowercase()
    .trim()
    .when('type', {
      is: 'email_bound',
      then: (schema) => schema.required('Email is required for email-bound invitations'),
      otherwise: (schema) => schema.optional(),
    }),
  sendEmail: boolean().optional(), // Only for email_bound
});

// For validating invitation codes (public endpoint)
export const validateInvitationSchema = object({
  code: string()
    .uuid('Invalid invitation code')
    .required('Invitation code is required'),
  email: string()
    .email('Invalid email address')
    .lowercase()
    .trim()
    .optional(), // Optional - only validated for email_bound
});

export type InvitationForm = InferType<typeof invitationSchema>;
export type ValidateInvitationForm = InferType<typeof validateInvitationSchema>;
```

### Update existing signup schema (line 243-252):
```typescript
export const signupSchema = object({
  email: emailField(), // REUSE existing email validation
  password: string()
    .min(12, 'Password must be at least 12 characters')
    .matches(/[A-Z]/, 'Password must contain at least one uppercase letter')
    .matches(/[a-z]/, 'Password must contain at least one lowercase letter')
    .matches(/[0-9]/, 'Password must contain at least one number')
    .matches(/[!@#$%^&*(),.?":{}|<>]/, 'Password must contain at least one special character')
    .required('Password is required'),
  invitationCode: string() // NEW: Required for invite-only mode
    .uuid('Invalid invitation code')
    .required('Invitation code is required'),
});
```

### Update WalletSignupEmailSchema (line 287-289):
```typescript
// Note: WalletEmailModal doesn't need invitationCode field
// Invitation code comes from cookie (set on signup page)
export const walletSignupEmailSchema = object({
  email: emailField(), // REUSE existing email validation
});
```

---

## Environment Variables
Add to `.env.example` (apps/quilombo):
```bash
# Invitation System (TEMPORARY - See invite-only-feature-plan.md)
# Email sender for invitations
INVITATION_FROM_EMAIL=join@quilombo.net
INVITATION_FROM_NAME=Quilombo Community
```

**Removed**: `INVITE_ONLY_MODE` env var - feature is always active when code is present.

---

## Security Considerations

### 1. Server-side validation everywhere
- **Never trust client-side invitation validation**
- Always re-validate invitation code in API routes before user creation
- Use database transactions to prevent race conditions

### 2. Email verification still required
- Email/password signups still go through existing verification flow
- Google/Wallet signups auto-verify (existing behavior)

### 3. Strict email matching for email_bound invitations
- Email-bound invitations enforce strict email matching
- Google OAuth: Must use exact Google email from invitation
- Wallet/SIWE: Must provide exact email from invitation
- Prevents invitation code sharing abuse

### 4. Open invitation constraints
- Multi-use but time-limited (72 hours)
- Only one active per user (generating new one invalidates old)
- No usage counting (unlimited within time window)
- Designed for controlled in-person event scenarios

### 5. Error messages
- Generic errors to prevent user enumeration
- "Invalid or expired invitation" instead of "Code not found" vs "Email mismatch"
- For email mismatch: "This invitation was sent to {email}. Please use that email address."

### 6. Edge case: Invitation expires during signup
- Backend validates at account creation time, not page load
- If code expires mid-signup, user gets clear error message
- 72-hour window for open invites is generous enough to minimize this

### 7. Future access control (not implemented initially)
- TODO: Future - Require verified user status to send invitations
- TODO: TEMPORARY INVITE-ONLY - Consider rate limiting if feature stays long-term

---

## Implementation Order

### Phase 1: Database & Backend (1-2 days)
1. Create migration for `invitations` table + `users.invitedBy` column
   - Include `type` enum field ('email_bound', 'open')
   - `invitedEmail` nullable for open invites
2. Add DB functions to `db/index.ts`:
   - `createInvitation(createdBy, type, invitedEmail?)` - handles both types
   - `invalidateUserOpenInvites(userId)` - for replacing open invites
   - `findValidInvitation(code, email?)` - email optional for open
   - `getUserActiveOpenInvite(userId)` - get current QR code
   - `markInvitationAccepted(code, acceptedBy)` - email_bound only
   - `expireOldInvitations()` - cron cleanup
3. Update validation schemas in `config/validation-schema.ts`:
   - Extract reusable `emailField()` if not already done
   - Add `invitationTypes` constant and type
   - Add `invitationSchema` with conditional email validation
   - Add `validateInvitationSchema` with optional email
   - Update `signupSchema` (add `invitationCode` field)
4. Create API routes:
   - `POST /api/invitations` - create both types, optionally send email
   - `POST /api/invitations/validate` - validate with optional email
5. Create invitation email template: `emails/invitation-email.tsx`
6. Install `qrcode.react` dependency: `pnpm add qrcode.react @types/qrcode.react`

### Phase 2: Settings UI (0.5-1 day)
1. Create `InviteMemberForm` component with two sections:
   - "Invite by Email" section (email_bound)
   - "Generate QR Code for Events" section (open)
2. Create `InviteQRModal` component (uses qrcode.react, shows expiry)
3. Create `InviteLinkModal` component (optional - for email_bound copy link)
4. Add "Invite Members" section to settings page

### Phase 3: Signup Flow Changes (1-2 days)
1. Modify signup page to detect invitation type via URL params:
   - `?code=UUID&email=X` → email_bound
   - `?code=UUID` → open
   - No params → show invite-only message
2. Validate invitation and set cookie for all types
3. Update `SignUpForm` component:
   - Add hidden `invitationCode` field
   - Email field: disabled for email_bound, enabled for open
   - Show appropriate banner based on type
4. Update `/api/auth/signup` route:
   - Validate invitation (type-aware)
   - Strict email matching for email_bound
   - Mark accepted for email_bound only
   - Track `invitedBy` for both types
5. Update Google OAuth flow in `config/next-auth-options.ts`:
   - Read cookie for invitation code
   - Validate with type-aware logic
   - Strict email matching for email_bound
   - Clear cookie after signup
6. Update SIWE flow in `config/next-auth-options.ts`:
   - Read cookie for invitation code
   - Validate with type-aware logic
   - Strict email matching for email_bound
   - Clear cookie after signup
7. Update `WalletEmailModal` component:
   - Receive `invitedEmail` prop from signup page
   - Pre-fill email appropriately (disabled for email_bound)
   - NO invitation code field (uses cookie)

### Phase 4: Login Page & Info (0.25 day)
1. Add invite-only banner to login page
2. Update signup page to show invite-only message when no code present

### Phase 5: Testing (1 day)
1. Test **email_bound** invitations:
   - Create via "Send Email" and "Copy Link"
   - Receive email, click link
   - Signup with all 3 auth methods (email/password, Google, wallet)
   - Verify strict email matching (try different email, should fail)
   - Verify single-use (try reusing code, should fail)
2. Test **open** invitations:
   - Generate QR code
   - Scan QR (or visit link manually)
   - Signup with all 3 auth methods using different emails
   - Verify multi-use (multiple people can use same code)
   - Generate new QR, verify old one is invalidated
3. Test edge cases:
   - Expired invites (both types)
   - Email mismatch for email_bound (should fail with clear error)
   - QR code expiring during signup (72-hour window)
4. Test attribution tracking (verify `invitedBy` populated for both types)

### Phase 6: Documentation (0.25 day)
1. Add `// TODO: TEMPORARY INVITE-ONLY` comments to all new code
2. Update `apps/quilombo/.claude/CLAUDE.md` with invite-only feature notes
3. Add environment variables to `.env.example`

**Total Estimated Time: 3.5-5 days** (simplified with one QR per user + auto-replacement)

---

## Important Considerations & Questions Answered

### Business Logic Clarified:
✅ **Two invitation types** - Email-bound (remote) and Open (in-person QR codes)
✅ **Invite-only is always active** - No feature flag, controlled by code presence only
✅ **UUID-based tokens** - Secure, unguessable invitation codes
✅ **Strict email matching** - Email-bound invitations enforce exact email match
✅ **Email verification still applies** - Password signups remain "pending" until verified
✅ **Display names calculated** - Uses existing `getUserDisplayName()` from `/utils/index.ts`
✅ **No invitations list UI** - Saves implementation time
✅ **One QR per user** - Generating new QR replaces old one automatically

### Technical Details:

**Two Invitation Types:**

| Feature | Email-Bound | Open (QR Code) |
|---------|-------------|----------------|
| Use case | Remote invites via email/link | In-person events (workshops, rodas) |
| Email required | Yes (strict match) | No (user enters own) |
| Usage | Single-use | Multi-use (unlimited) |
| Expiry | 30 days | 72 hours |
| URL format | `?code=UUID&email=X` | `?code=UUID` |
| Copy link | Yes | No (QR only) |
| Re-sending | Enter same email again | Generate new QR (replaces old) |

**QR Code Library:**
- Using: `qrcode.react` (React component, well-maintained)
- Install: `pnpm add qrcode.react @types/qrcode.react`

**Invitation Expiration:**
- Email-bound: 30 days from creation
- Open: 72 hours (perfect for weekend workshops)
- Cleanup via `expireOldInvitations()` cron job

**Attribution Tracking:**
- `users.invitedBy` tracks direct inviter (UUID foreign key) - works for both types
- `invitations.acceptedBy` tracks who accepted (email_bound only, for single-use enforcement)
- Can generate reports: "User X invited Y people", "Invitation tree depth"

**Display Name Calculation:**
- Reuses existing `getUserDisplayName()` utility (apps/quilombo/utils/index.ts:77)
- Logic: nickname → name → abbreviated wallet address
- Used in: invitation emails, validation response, signup banner

**Email Sender Address:**
- Requires creating `join@quilombo.net` in Mailjet
- Add to verified sender addresses
- Set SPF/DKIM records (same as support@quilombo.net)

**Blocking Public Signups:**
- All three auth methods require valid invitation (both types supported)
- No way to create account without invitation code
- Existing users can still log in normally

**URL Detection (Option A):**
- Presence of `email` param determines type
- `?code=UUID&email=X` → email_bound
- `?code=UUID` → open
- Simple, no explicit type parameter needed

**Future Removal Plan:**
- All invite-related code marked with `// TODO: TEMPORARY INVITE-ONLY`
- To remove: Drop invitations table, remove invitation checks, restore public signup
- Keep attribution data (`users.invitedBy`) for historical records
- No environment variable to toggle - removal is via code deletion

---

## Risks & Mitigations

**Risk 1:** Users lose email-bound invitation emails
**Mitigation:** User can re-enter same email in settings to generate new invitation

**Risk 2:** QR codes hard to scan in poor lighting
**Mitigation:** QR codes are for controlled in-person scenarios; 72-hour expiry allows retry

**Risk 3:** OAuth/Wallet flow loses invitation code in cookies
**Mitigation:** Cookie set with 1-hour expiry, sufficient for auth roundtrip

**Risk 4:** Accidental permanent lockout if all members leave
**Mitigation:** Global admin can always create invitations (no rate limits)

**Risk 5:** Email delivery failures for invitations
**Mitigation:** Show success message with invitation link, user can copy/share manually

**Risk 6:** User forgets which email they used for invitation (email-bound)
**Mitigation:** Error message guides user to check email or contact existing member

**Risk 7:** QR code expires during signup (72 hours)
**Mitigation:** 72-hour window is generous; error message guides user to ask for new QR

**Risk 8:** User shares open invitation link instead of QR
**Mitigation:** Acceptable - still requires inviter trust, expires in 72 hours, attribution tracked

**Risk 9:** Email mismatch confusion for email-bound invitations
**Mitigation:** Clear error message shows invited email, guides user to correct auth method

---

## Summary

This plan provides a complete, secure, and user-friendly invite-only system with **two invitation types**:

**Email-Bound Invitations (Remote):**
- Single-use, 30-day expiry
- Strict email matching across all auth methods
- Send via email or copy link
- Perfect for inviting specific people remotely

**Open Invitations (In-Person QR Codes):**
- Multi-use, 72-hour expiry
- No email restriction (user provides own)
- One active QR per user (auto-replacement)
- Perfect for workshops and events

**Key Features:**
- **Blocks all new signups** across 3 auth methods (email/password, Google OAuth, wallet/SIWE)
- **Tracks attribution** for future reward calculations via `users.invitedBy`
- **Reuses existing code** (validation schemas, display name utilities)
- **Is designed for removal** - all code marked with TODO comments, no feature flags
- **Saves implementation time** - no invitations list UI, simple workflows

**Estimated time: 3.5-5 days**
