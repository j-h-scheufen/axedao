# Quilombo: Password-based Auth + Email Verification

## Context & Goal

Quilombo currently authenticates via Human Wallet + SIWE. This confuses non-technical users and is operationally fragile due to upstream downtime. Replace with a familiar email + password login as the primary auth mechanism, with optional Google OAuth and optional Human Wallet for web3 features. Email ownership is verified via magic link during onboarding. Maintain a simple, trustworthy UX with pragmatic security.

**User base**: ~10 existing users (manual password migration), growing to ~100 over next few months.

**Key Design Decision**: Email is **required** for all signup flows (email/password, Google, and Human Wallet). This simplifies notification logic throughout the app and ensures we can always contact users for password resets, security alerts, etc.

## Success Criteria

- New users can sign up with email/password and verify ownership via magic link in < 2 minutes
- Returning users can log in with email/password, Google OAuth, or Human Wallet (SIWE)
- "Forgot password" works end-to-end
- Human Wallet can be used as a primary login method (not just for web3 features)
- Active Human Wallet session auto-authenticates user with new next-auth token if needed

## Scope / Out of Scope

### In Scope (Phase 1)

- **Authentication flows**:
  - Email/password signup with magic link verification
  - Email/password login
  - Forgot/reset password flow
  - Google OAuth sign-in/up (via next-auth `GoogleProvider`)
  - Human Wallet + SIWE as a login option (preserved and elevated to primary auth method)
  
- **UI (HeroUI components)**:
  - Login page with **3 equal options**: email/password, Google, or Human Wallet
  - Signup page with **2 options**: email/password or Google (Human Wallet users must add email first)
  - Password reset request page
  - Password reset form page (from magic link)
  - Email verification pages (check inbox, expired link states)
  - Settings page: "Link Human Wallet" for users who signed up with email/password
  
- **Backend**:
  - DB schema changes (users table extensions, new verification_tokens table, new oauth_accounts table)
  - API routes for auth operations
  - Mailjet email integration with provider-agnostic interface
  - Password validation (12+ chars, complexity rules)
  - Token generation/validation (SHA-256 hashed storage)
  
- **Security**:
  - bcrypt password hashing (cost 12)
  - Single-use, expiring tokens for email verification & password reset
  - HTTPS-only, httpOnly cookies
  - Input validation with Yup schemas

### Out of Scope (Future Phases)

- **Deferred for later**:
  - Rate limiting infrastructure (note: may add later if abuse patterns emerge)
  - Account lockout mechanisms
  - HaveIBeenPwned password breach checking
  - Disposable email domain blocking
  - Email event tracking table (bounces, deliveries)
  - Session rotation on password reset
  - Telemetry dashboards
  - Admin UI tools
  - OTP verification (using magic link only)
  - Token metadata (IP, user agent forensics)
  - MX record validation for email addresses
  - Retrieving email from Human Wallet (complicates account linking, email remains required)
  
- **Not needed**:
  - Newsletter/marketing preferences
  - Social logins beyond Google
  - Advanced account recovery (TOTP, passkeys)
  - Wallet-only accounts without email (adds complexity for notifications/password-reset)

## Authentication Architecture

### Three Auth Methods, One Requirement: Email

| Auth Method | Email Source | Account Status After Signup | Requires Password? |
|-------------|--------------|----------------------------|-------------------|
| **Email/Password** | User enters | `pending_verification` → `active` after email verified | Yes |
| **Google OAuth** | From Google profile | `active` immediately (Google pre-verifies) | No (optional) |
| **Human Wallet (SIWE)** | User must provide during first-time wallet connection | `active` immediately (wallet signature proves ownership) | No (optional) |

### User Account Combinations

Users can have any combination of auth methods linked to their account:

```typescript
// Example 1: Email/password only user
{
  email: 'alice@example.com',
  password_hash: 'bcrypt...',
  wallet_address: null,
  account_status: 'active',
  email_verified_at: '2025-01-15'
}
// Can log in with: email/password
// Cannot log in with: Google, Human Wallet

// Example 2: Google-only user
{
  email: 'bob@gmail.com',
  password_hash: null,
  wallet_address: null,
  account_status: 'active',
  email_verified_at: '2025-01-15'
}
// + oauth_accounts entry (provider: 'google')
// Can log in with: Google
// Cannot log in with: email/password (no password set), Human Wallet

// Example 3: Human Wallet user (linked email during signup)
{
  email: 'charlie@example.com',
  password_hash: null,
  wallet_address: '0xABC...',
  account_status: 'active',
  email_verified_at: '2025-01-15'
}
// Can log in with: Human Wallet
// Cannot log in with: email/password (no password set), Google

// Example 4: Fully linked user (all three methods)
{
  email: 'dave@gmail.com',
  password_hash: 'bcrypt...',
  wallet_address: '0xDEF...',
  account_status: 'active',
  email_verified_at: '2025-01-15'
}
// + oauth_accounts entry (provider: 'google')
// Can log in with: email/password, Google, OR Human Wallet
```

### Account Linking Flows

Users can add additional auth methods after signup:

- **Email/password user** → Settings → "Link Google Account" or "Link Human Wallet"
- **Google user** → Settings → "Set a password" (in case they lose Google account access)
- **Human Wallet user** → Settings → "Set a password" or "Link Google Account"

## User Stories & Acceptance Criteria (Gherkin)

### Sign-up with Email/Password

```gherkin
Given a visitor on /auth/signup
When they enter an email and a compliant password
And submit the form
Then the system creates a user with account_status = 'pending_verification'
And sends an email with a magic link (30-min expiry)
And the UI shows "Check your inbox" with masked email and resend button

Given a pending user with an unexpired verification token
When they click the magic link
Then their account_status becomes 'active'
And email_verified_at is set to current timestamp
And they are signed in with a next-auth session
And redirected to their profile page

Given a pending user with an expired verification token
When they click the old magic link
Then the UI shows "Link expired"
And offers "Resend verification email" button
```

### Sign-up with Google OAuth

```gherkin
Given a visitor on /auth/signup
When they click "Continue with Google"
Then next-auth handles OAuth consent flow
And on callback:
  - If email doesn't exist: create user with account_status = 'active', email_verified_at = now()
  - If email exists: link OAuth account to existing user
  - Create entry in oauth_accounts table
And they are authenticated and redirected to profile
```

### Login with Email/Password

```gherkin
Given a verified user with email/password
When they submit correct credentials on /auth/login
Then they are authenticated via next-auth
And redirected to profile or callbackUrl

Given an unverified user
When they try to log in
Then the UI shows "Please verify your email first"
And offers to resend the verification email

Given a user with wrong password
When they try to log in
Then the UI shows "Invalid email or password"
And does not reveal whether email exists
```

### Login with Google OAuth

```gherkin
Given a user with a linked Google account
When they click "Continue with Google" on /auth/login
Then next-auth handles OAuth flow
And they are authenticated and redirected

Given a new visitor clicking "Continue with Google" on login page
When they complete OAuth flow
Then their account is created (treated as signup)
And redirected to profile
```

### Login with Human Wallet (SIWE)

```gherkin
Given a user who has previously linked their Human Wallet
When they click "Connect Human Wallet" on /auth/login
Then wagmi connects to wallet
And SIWE message is generated and signed
And next-auth verifies signature
And they are authenticated and redirected

Given a new visitor clicking "Connect Human Wallet" on login page
When they complete wallet connection and SIWE signature
Then the UI prompts: "Enter your email to complete signup"
And they enter their email
Then the system creates a user with account_status = 'active'
And wallet_address is saved
And email_verified_at is set to now() (wallet signature proves ownership)
And they are authenticated and redirected

Note: First-time wallet users skip email verification because:
- Wallet signature proves they control the wallet
- Email is for notifications only, not primary authentication
- They can always add password later via Settings if needed
```

### Forgot/Reset Password

```gherkin
Given a user on /auth/forgot-password
When they submit their email
Then they see "If this email exists, we sent password reset instructions"
And the system sends a reset magic link (60-min expiry) if email exists
And does nothing if email doesn't exist (no user enumeration)

Given a valid reset token
When they click the magic link
Then they see a password reset form
And they set a new compliant password
And submit the form
Then the token is consumed (consumed_at timestamp set)
And password_hash is updated (or created if user had no password before)
And they see "Password updated successfully. Please log in."
And old password no longer works (if there was one)
And new password works for login
```

### Account Linking

```gherkin
Given a logged-in user without a password (Google or wallet user)
When they visit Settings and click "Set a password"
Then they see a password creation form
And they enter and confirm a new password
Then password_hash is set
And they can now log in with email/password

Given a logged-in user without a wallet
When they visit Settings and click "Link Human Wallet"
Then wagmi initiates wallet connection
And SIWE signature flow completes
Then wallet_address is saved to their account
And they can now log in with Human Wallet

Given a logged-in user without Google OAuth
When they visit Settings and click "Link Google Account"
Then next-auth OAuth flow initiates
And on callback, oauth_accounts entry is created
And they can now log in with Google
```

### Auto-login from Active Wallet Session

```gherkin
Given a user with a linked Human Wallet
And their next-auth session has expired
When they visit the app and wallet is still connected (wagmi)
Then useAuth detects connected wallet but no session
And automatically triggers SIWE flow
And new next-auth token/session is issued
And user remains logged in seamlessly
```

## UX & UI (HeroUI)

### Login Page (`/auth/login`)

**Three equal authentication options**:

```
┌───────────────────────────────────┐
│       Welcome to Quilombo         │
├───────────────────────────────────┤
│                                   │
│  [Connect Human Wallet] 🔗        │
│                                   │
│  [Continue with Google] G         │
│                                   │
│  ────────── OR ──────────         │
│                                   │
│  Email: ___________________       │
│  Password: ________________       │
│  [Sign In]                        │
│  Forgot password?                 │
│                                   │
│  Don't have an account? Sign up   │
└───────────────────────────────────┘
```

**Interaction notes**:
- All three options are visually equal (no hierarchy)
- Human Wallet button triggers existing wagmi connection + SIWE flow
- Google button uses next-auth GoogleProvider
- Email/password form validated with Yup on submit

### Signup Page (`/auth/signup`)

**Two options** (Human Wallet requires email first, so users start with email/password or Google):

```
┌───────────────────────────────────┐
│      Create Your Account          │
├───────────────────────────────────┤
│                                   │
│  Email: ___________________       │
│  Password: ________________       │
│                                   │
│  Password Requirements:           │
│  ✓ At least 12 characters         │
│  ✓ At least 1 uppercase letter    │
│  ✓ At least 1 lowercase letter    │
│  ✓ At least 1 number              │
│  ✓ At least 1 special character   │
│                                   │
│  [Create Account]                 │
│                                   │
│  ────────── OR ──────────         │
│                                   │
│  [Continue with Google] G         │
│                                   │
│  Already have an account? Sign in │
└───────────────────────────────────┘
```

**Note**: Human Wallet users who want to "sign up" will:
1. Go to login page
2. Click "Connect Human Wallet"
3. If wallet not found in DB, prompt for email
4. Create account with wallet + email

### Human Wallet First-Time Flow (on Login page)

When a new wallet connects:

```
┌───────────────────────────────────┐
│   Welcome! We need your email     │
├───────────────────────────────────┤
│  To complete signup and enable    │
│  notifications, please provide    │
│  your email address:              │
│                                   │
│  Email: ___________________       │
│                                   │
│  [Complete Signup]                │
│                                   │
│  Why? Your wallet (0xAB...EF)     │
│  proves your identity, but we     │
│  need email for password resets   │
│  and important notifications.     │
└───────────────────────────────────┘
```

**After they submit email**:
- User is immediately logged in (wallet signature proves ownership)
- Email is saved with `email_verified_at = now()`
- No email verification needed (wallet is primary proof)

### Verification Screens

- **Check inbox** (`/auth/verify-email/sent`):
  - "Check your inbox" heading
  - "We sent a verification link to us**@ex*****.com"
  - "Didn't receive it?" with "Resend" button (5-second cooldown after click)
  
- **Verification success** (`/auth/verify-email/success`):
  - "Email verified! Redirecting..." (auto-redirect after 2 seconds)
  - Or "Return to app" button
  
- **Link expired** (`/auth/verify-email/expired`):
  - "This verification link has expired"
  - "Request a new verification email" with form to re-enter email

### Forgot Password Flow

- **Request page** (`/auth/forgot-password`):
  - Email input
  - Submit button: "Send reset instructions"
  - Always shows: "If this email exists, we sent reset instructions"
  
- **Reset form** (`/auth/reset-password?token=...`):
  - New password input with same live validation as signup
  - Confirm password input
  - Submit button: "Reset password"
  - On success: "Password updated! You can now sign in" with link to login

### Settings Page - Authentication Management

New section: **"Authentication Methods"**

This page allows users to:
- **View** all connected authentication methods
- **Add** new auth methods (link Google, link wallet, set password)
- **Remove** auth methods (with safeguards - must keep at least one)
- **Change password** (if password is set)

#### Full Auth Management Example

User with all three methods linked:

```
┌─────────────────────────────────────────────────────┐
│  Authentication Methods                             │
├─────────────────────────────────────────────────────┤
│  Email: alice@example.com  ✓ Verified               │
│  (Email cannot be removed)                          │
├─────────────────────────────────────────────────────┤
│                                                     │
│  🔑 Email/Password                                  │
│  ✓ Active                                           │
│  Last changed: 2 weeks ago                          │
│  [Change Password]  [Remove Password Auth]          │
│                                                     │
│  🔗 Google Account                                  │
│  ✓ Linked to alice@gmail.com                        │
│  Linked: 3 months ago                               │
│  [Unlink Google Account]                            │
│                                                     │
│  💼 Human Wallet                                    │
│  ✓ Connected to 0xABCD...5678                       │
│  Connected: 1 week ago                              │
│  [Disconnect Wallet]                                │
│                                                     │
└─────────────────────────────────────────────────────┘
```

#### Partial Auth Examples

**User with only email/password** (needs at least one other method before removing password):

```
│  🔑 Email/Password                                  │
│  ✓ Active                                           │
│  [Change Password]  [Remove] ← disabled             │
│  ⚠️ Add another method before removing password     │
│                                                     │
│  🔗 Google Account                                  │
│  ✗ Not linked                                       │
│  [Link Google Account]                              │
│                                                     │
│  💼 Human Wallet                                    │
│  ✗ Not connected                                    │
│  [Connect Wallet]                                   │
```

**User with Google only** (can add password for backup):

```
│  🔑 Email/Password                                  │
│  ✗ No password set                                  │
│  [Set Password] ← useful as backup if Google fails  │
│                                                     │
│  🔗 Google Account                                  │
│  ✓ Linked to bob@gmail.com                          │
│  [Unlink] ← disabled (must have 2+ methods)         │
│                                                     │
│  💼 Human Wallet                                    │
│  ✗ Not connected                                    │
│  [Connect Wallet]                                   │
```

**User with wallet only** (prompted to add backup):

```
│  🔑 Email/Password                                  │
│  ✗ No password set                                  │
│  [Set Password]                                     │
│  💡 Recommended: Set a password as backup           │
│                                                     │
│  🔗 Google Account                                  │
│  ✗ Not linked                                       │
│  [Link Google Account]                              │
│                                                     │
│  💼 Human Wallet                                    │
│  ✓ Connected to 0xABCD...5678                       │
│  [Disconnect] ← disabled (must have 2+ methods)     │
```

#### Business Rules for Auth Management

**Adding methods** (always allowed):
- ✅ User with password can add Google
- ✅ User with password can add wallet
- ✅ User with Google can set password
- ✅ User with Google can add wallet
- ✅ User with wallet can set password
- ✅ User with wallet can add Google

**Removing methods** (requires ≥ 2 methods):
- ❌ Cannot remove if only 1 method active (disabled button + warning)
- ✅ User with 2+ methods can remove any (except email)
- ❌ Email cannot be removed (core requirement for notifications)

**Changing password** (when password exists):
- Redirects to password change form (requires current password)
- Or can use "Forgot password" flow if they forgot current password

#### Change Password Flow

When user clicks "Change Password":

```
┌─────────────────────────────────────────┐
│  Change Your Password                   │
├─────────────────────────────────────────┤
│  Current Password:                      │
│  ___________________________            │
│                                         │
│  New Password:                          │
│  ___________________________            │
│  ✓ At least 12 characters               │
│  ✓ At least 1 uppercase letter          │
│  ... (same validation as signup)        │
│                                         │
│  Confirm New Password:                  │
│  ___________________________            │
│                                         │
│  [Update Password]  [Cancel]            │
│                                         │
│  Forgot current password?               │
│  Use password reset instead             │
└─────────────────────────────────────────┘
```

#### Remove Auth Method Confirmation

When user clicks "Remove Password Auth" (and has 2+ methods):

```
┌─────────────────────────────────────────┐
│  Remove Password Authentication?        │
├─────────────────────────────────────────┤
│  Are you sure you want to remove        │
│  password-based login?                  │
│                                         │
│  You will still be able to log in with: │
│  • Google Account                       │
│  • Human Wallet (0xABCD...5678)         │
│                                         │
│  You can always add a password back     │
│  later from Settings.                   │
│                                         │
│  [Cancel]  [Yes, Remove Password]       │
└─────────────────────────────────────────┘
```

Same confirmation flow for unlinking Google or disconnecting wallet.

### Accessibility

- Proper `<label>` elements with `htmlFor` attributes
- Focus management (e.g., focus on email input on page load)
- Keyboard-only navigation support
- ARIA labels for screen readers
- Error messages announced to screen readers
- High-contrast error states

## Data Model (DB Changes)

### Modifications to Existing Tables

#### `users` table (apps/quilombo/db/schema.ts)

Add these fields:

```typescript
passwordHash: text('password_hash'), // nullable (Google/wallet users may not have password)
emailVerifiedAt: timestamp('email_verified_at'), // null until email verified
accountStatus: accountStatusEnum('account_status').default('active').notNull(),
```

Add enum:

```typescript
export const accountStatusEnum = pgEnum('account_status', [
  'pending_verification', // Only for email/password signups before email verified
  'active',               // All other signups (Google, wallet) and verified email users
  'disabled'              // Admin-disabled accounts (future use)
]);
```

**Migration notes**:
- Existing 10 users: manually set `passwordHash` (admin-provided hashes), `accountStatus = 'active'`, `emailVerifiedAt = now()`
- `email` field already exists (nullable) - **keep nullable** to support future flexibility, but require it in signup flows
- `walletAddress` remains nullable (only set when user links wallet)

### New Tables

#### `verification_tokens`

```typescript
export const tokenTypeEnum = pgEnum('token_type', [
  'email_verification',
  'password_reset'
]);

export const verificationTokens = pgTable('verification_tokens', {
  id: uuid('id').defaultRandom().primaryKey(),
  userId: uuid('user_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' }),
  tokenHash: text('token_hash').notNull(), // SHA-256 hash of token
  type: tokenTypeEnum('type').notNull(),
  expiresAt: timestamp('expires_at').notNull(),
  consumedAt: timestamp('consumed_at'), // null = unused, timestamp = consumed
  createdAt: timestamp('created_at').notNull().defaultNow(),
}, (t) => [
  index('token_hash_idx').on(t.tokenHash),
  index('user_token_type_idx').on(t.userId, t.type),
]);
```

**Token lifecycle**:
- Issuing a new token of the same type for a user invalidates (deletes) any unconsumed prior tokens
- Tokens are single-use: once `consumedAt` is set, token cannot be reused
- Expired tokens (`expiresAt < now()`) are rejected even if unconsumed

#### `oauth_accounts`

**Why this table is needed**:
- Prevents duplicate accounts when user tries multiple auth methods with same email
- Handles OAuth provider user ID changes (rare but possible)
- Enables multi-provider support (Google today, Facebook/GitHub later)
- Standard next-auth pattern for account linking

```typescript
export const oauthProviderEnum = pgEnum('oauth_provider', ['google']);

export const oauthAccounts = pgTable('oauth_accounts', {
  id: uuid('id').defaultRandom().primaryKey(),
  userId: uuid('user_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' }),
  provider: oauthProviderEnum('provider').notNull(),
  providerUserId: text('provider_user_id').notNull(), // Google's internal user ID
  providerEmail: text('provider_email'), // Stored for debugging/admin purposes
  createdAt: timestamp('created_at').notNull().defaultNow(),
}, (t) => [
  uniqueIndex('oauth_provider_user_idx').on(t.provider, t.providerUserId),
  index('oauth_user_idx').on(t.userId),
]);
```

**Example flow without this table** (problematic):
1. User signs up with `john@gmail.com` + password
2. Later clicks "Continue with Google" with same email
3. System only checks `users.email` → "Email exists, error!"
4. User confused: "I want to link my Google account, not create a new one"

**With `oauth_accounts` table** (correct):
1. User signs up with `john@gmail.com` + password
2. Later clicks "Continue with Google" with same email
3. System checks `oauth_accounts` → no entry for this Google user ID
4. System checks `users.email` → exists!
5. System creates `oauth_accounts` entry linking Google to existing user
6. User can now log in with either password OR Google

### Indexes Summary

- `verification_tokens.token_hash` (for fast token lookups)
- `verification_tokens.user_id + type` (for finding user's active tokens)
- `oauth_accounts.provider + provider_user_id` (unique, prevent duplicate OAuth links)
- `oauth_accounts.user_id` (for finding user's OAuth connections)

## API Routes (Next.js 15 App Router)

All routes under `apps/quilombo/app/api/auth/`:

### `POST /api/auth/signup`

**Request**:
```typescript
{
  email: string, // validated with Yup
  password: string // min 12 chars, complexity rules
}
```

**Response**:
- `201 Created`: User created, verification email sent
  ```json
  { "message": "Account created. Check your email to verify." }
  ```
- `400 Bad Request`: Invalid email or weak password
  ```json
  { "error": "Password must be at least 12 characters..." }
  ```
- `409 Conflict`: Email already registered
  ```json
  { "error": "An account with this email already exists" }
  ```

**Logic**:
1. Validate input (Yup schema)
2. Check if email already exists (case-insensitive): `SELECT * FROM users WHERE LOWER(email) = LOWER($1)`
3. Hash password with bcrypt (cost 12)
4. Create user with `account_status = 'pending_verification'`
5. Generate verification token (32 random bytes, base64url)
6. Store SHA-256 hash of token in `verification_tokens` (type = 'email_verification', expires in 30 min)
7. Send email via Mailjet with magic link: `https://quilombo.app/auth/verify-email?token={plaintext_token}`
8. Return 201

### `POST /api/auth/verify-email`

**Request**:
```typescript
{
  token: string // plaintext token from email link
}
```

**Response**:
- `200 OK`: Email verified, user logged in
  ```json
  { "message": "Email verified successfully" }
  ```
  Also sets next-auth session cookie
- `400 Bad Request`: Invalid or expired token
  ```json
  { "error": "Invalid or expired verification link" }
  ```
- `410 Gone`: Token already consumed
  ```json
  { "error": "This verification link has already been used" }
  ```

**Logic**:
1. Hash provided token with SHA-256
2. Find token in DB where `token_hash = hash` AND `type = 'email_verification'` AND `consumed_at IS NULL`
3. Check if expired (`expires_at < now()`)
4. If valid:
   - Update user: `account_status = 'active'`, `email_verified_at = now()`
   - Update token: `consumed_at = now()`
   - Sign in user with next-auth (create session)
   - Return 200
5. If invalid/expired: return 400

### `POST /api/auth/resend-verification`

**Request**:
```typescript
{
  email: string
}
```

**Response**:
- `204 No Content`: Always returns this (no user enumeration)

**Logic**:
1. Find user by email (case-insensitive)
2. If user doesn't exist: return 204 (silent fail)
3. If user already verified (`email_verified_at IS NOT NULL`): return 204 (silent fail)
4. Delete any existing unconsumed email_verification tokens for this user
5. Generate new token, store hash, send email
6. Return 204

### `POST /api/auth/forgot-password`

**Request**:
```typescript
{
  email: string
}
```

**Response**:
- `204 No Content`: Always returns this (no user enumeration)

**Logic**:
1. Find user by email (case-insensitive)
2. If user doesn't exist: return 204 (silent fail)
3. If user exists:
   - Delete any existing unconsumed password_reset tokens for this user
   - Generate new token (32 random bytes, base64url)
   - Store SHA-256 hash in `verification_tokens` (type = 'password_reset', expires in 60 min)
   - Send email with magic link: `https://quilombo.app/auth/reset-password?token={plaintext_token}`
4. Return 204

### `POST /api/auth/reset-password`

**Request**:
```typescript
{
  token: string, // plaintext token from email link
  newPassword: string // min 12 chars, complexity rules
}
```

**Response**:
- `200 OK`: Password updated
  ```json
  { "message": "Password updated successfully" }
  ```
- `400 Bad Request`: Invalid/expired token or weak password
  ```json
  { "error": "Invalid or expired reset link" }
  ```

**Logic**:
1. Validate new password (Yup schema)
2. Hash provided token with SHA-256
3. Find token in DB where `token_hash = hash` AND `type = 'password_reset'` AND `consumed_at IS NULL`
4. Check if expired
5. If valid:
   - Hash new password with bcrypt
   - Update user: `password_hash = new_hash` (sets it even if previously null for Google/wallet users)
   - Update token: `consumed_at = now()`
   - Return 200
6. If invalid/expired: return 400

**Note**: No session rotation (out of scope). User must log in again after password reset.

### Google OAuth & SIWE (handled by next-auth)

No custom API routes needed. next-auth's built-in providers handle:
- `GET /api/auth/signin/google` (redirects to Google consent)
- `GET /api/auth/callback/google` (handles OAuth callback)
- `POST /api/auth/callback/credentials` (handles SIWE and email/password)

**Configuration in `next-auth-options.ts`**:

```typescript
import GoogleProvider from 'next-auth/providers/google';
import CredentialsProvider from 'next-auth/providers/credentials';
import { SiweMessage } from 'siwe';
import { verifyPassword } from '@/lib/auth/password';

providers: [
  // Method 1: Human Wallet (SIWE)
  CredentialsProvider({
    id: 'ethereum',
    name: 'Ethereum',
    credentials: {
      message: { type: 'text' },
      signature: { type: 'text' },
      email: { type: 'text' } // Optional, only for first-time wallet users
    },
    async authorize(credentials) {
      if (!credentials) return null;
      
      try {
        const siwe = new SiweMessage(JSON.parse(credentials.message));
        const result = await siwe.verify({ 
          signature: credentials.signature,
          domain: nextAuthHost,
          nonce: /* get from cookie */
        });
        
        if (!result.success) return null;
        
        // Check if user exists by wallet address
        let user = await db.query.users.findFirst({
          where: eq(users.walletAddress, siwe.address)
        });
        
        if (!user) {
          // First-time wallet user - require email
          if (!credentials.email) {
            throw new Error('EMAIL_REQUIRED'); // Frontend catches this and prompts for email
          }
          
          // Create new user with wallet + email
          user = await insertUser({
            id: uuidv4(),
            walletAddress: siwe.address,
            email: credentials.email.toLowerCase(),
            accountStatus: 'active',
            emailVerifiedAt: new Date(), // Wallet signature proves ownership
          });
        }
        
        return user;
      } catch (e) {
        console.error('SIWE auth error:', e);
        return null;
      }
    }
  }),
  
  // Method 2: Email/Password
  CredentialsProvider({
    id: 'email-password',
    name: 'Email',
    credentials: {
      email: { type: 'text' },
      password: { type: 'password' }
    },
    async authorize(credentials) {
      if (!credentials?.email || !credentials?.password) return null;
      
      // Find user by email (case-insensitive)
      const user = await db.query.users.findFirst({
        where: sql`LOWER(${users.email}) = LOWER(${credentials.email})`
      });
      
      if (!user || !user.passwordHash) return null;
      
      // Verify password
      const isValid = await verifyPassword(credentials.password, user.passwordHash);
      if (!isValid) return null;
      
      // Check if email verified
      if (user.accountStatus === 'pending_verification') {
        throw new Error('EMAIL_NOT_VERIFIED');
      }
      
      return user;
    }
  }),
  
  // Method 3: Google OAuth
  GoogleProvider({
    clientId: process.env.GOOGLE_CLIENT_ID!,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
  })
],

callbacks: {
  async signIn({ user, account, profile }) {
    if (account?.provider === 'google') {
      const email = profile?.email?.toLowerCase();
      if (!email) return false;
      
      // Check if oauth account already exists
      const existingOAuth = await db.query.oauthAccounts.findFirst({
        where: and(
          eq(oauthAccounts.provider, 'google'),
          eq(oauthAccounts.providerUserId, account.providerAccountId)
        )
      });
      
      if (existingOAuth) {
        // User already linked, allow sign-in
        return true;
      }
      
      // Check if user exists by email
      let existingUser = await db.query.users.findFirst({
        where: sql`LOWER(${users.email}) = LOWER(${email})`
      });
      
      if (!existingUser) {
        // Create new user
        existingUser = await insertUser({
          id: uuidv4(),
          email,
          accountStatus: 'active',
          emailVerifiedAt: new Date(), // Google pre-verifies emails
        });
      }
      
      // Link OAuth account
      await db.insert(oauthAccounts).values({
        userId: existingUser.id,
        provider: 'google',
        providerUserId: account.providerAccountId,
        providerEmail: email,
      });
      
      // Update user object for session
      user.id = existingUser.id;
      return true;
    }
    
    return true;
  },
  
  async jwt({ token, user }) {
    // Initial sign in persists the UserSession in the token
    if (user) return { ...token, user };
    return token;
  },
  
  async session({ session, token }) {
    // Forward properties to the client
    if (token.user) {
      session.user = { ...session.user, ...token.user };
    }
    return session;
  },
}
```

## Email Integration (Mailjet)

### Setup

- Create Mailjet account (free tier)
- Verify sender domain (DKIM/SPF/DMARC configuration)
- Get API key and secret

### Provider-Agnostic Interface

Create `/lib/email/provider.ts`:

```typescript
export interface EmailProvider {
  sendVerificationEmail(to: string, token: string, userName?: string): Promise<void>;
  sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void>;
}
```

### Mailjet Implementation

Create `/lib/email/mailjet.ts`:

```typescript
import Mailjet from 'node-mailjet';

export class MailjetProvider implements EmailProvider {
  private client: Mailjet;
  
  constructor() {
    this.client = Mailjet.apiConnect(
      process.env.MAILJET_API_KEY!,
      process.env.MAILJET_API_SECRET!
    );
  }
  
  async sendVerificationEmail(to: string, token: string, userName?: string) {
    const verifyUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/verify-email?token=${token}`;
    
    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [{
        From: { Email: 'noreply@quilombo.app', Name: 'Quilombo' },
        To: [{ Email: to, Name: userName }],
        Subject: 'Verify your Quilombo account',
        TextPart: `Click this link to verify your email: ${verifyUrl}`,
        HTMLPart: `
          <h2>Welcome to Quilombo!</h2>
          <p>Click the button below to verify your email address:</p>
          <a href="${verifyUrl}" style="display: inline-block; padding: 12px 24px; background: #007bff; color: white; text-decoration: none; border-radius: 4px;">
            Verify Email
          </a>
          <p><small>This link expires in 30 minutes.</small></p>
        `
      }]
    });
  }
  
  async sendPasswordResetEmail(to: string, token: string, userName?: string) {
    const resetUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/reset-password?token=${token}`;
    
    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [{
        From: { Email: 'noreply@quilombo.app', Name: 'Quilombo' },
        To: [{ Email: to, Name: userName }],
        Subject: 'Reset your Quilombo password',
        TextPart: `Click this link to reset your password: ${resetUrl}`,
        HTMLPart: `
          <h2>Password Reset Request</h2>
          <p>Click the button below to reset your password:</p>
          <a href="${resetUrl}" style="display: inline-block; padding: 12px 24px; background: #dc3545; color: white; text-decoration: none; border-radius: 4px;">
            Reset Password
          </a>
          <p><small>This link expires in 60 minutes. If you didn't request this, please ignore this email.</small></p>
        `
      }]
    });
  }
}
```

### Stub Provider for Development

Create `/lib/email/stub.ts`:

```typescript
export class StubEmailProvider implements EmailProvider {
  async sendVerificationEmail(to: string, token: string, userName?: string) {
    console.log('📧 [STUB] Verification email:', {
      to,
      url: `${process.env.NEXT_PUBLIC_APP_URL}/auth/verify-email?token=${token}`
    });
  }
  
  async sendPasswordResetEmail(to: string, token: string, userName?: string) {
    console.log('📧 [STUB] Password reset email:', {
      to,
      url: `${process.env.NEXT_PUBLIC_APP_URL}/auth/reset-password?token=${token}`
    });
  }
}
```

### Factory

Create `/lib/email/index.ts`:

```typescript
import { MailjetProvider } from './mailjet';
import { StubEmailProvider } from './stub';
import type { EmailProvider } from './provider';

export const getEmailProvider = (): EmailProvider => {
  if (process.env.NODE_ENV === 'development' || !process.env.MAILJET_API_KEY) {
    return new StubEmailProvider();
  }
  return new MailjetProvider();
};
```

## Validation (Yup Schemas)

Create `/lib/validation/auth.ts`:

```typescript
import * as Yup from 'yup';

export const signupSchema = Yup.object({
  email: Yup.string()
    .email('Invalid email address')
    .required('Email is required')
    .lowercase()
    .trim(),
  password: Yup.string()
    .required('Password is required')
    .min(12, 'Password must be at least 12 characters')
    .matches(/[A-Z]/, 'Password must contain at least one uppercase letter')
    .matches(/[a-z]/, 'Password must contain at least one lowercase letter')
    .matches(/[0-9]/, 'Password must contain at least one number')
    .matches(/[!@#$%^&*(),.?":{}|<>]/, 'Password must contain at least one special character'),
});

export const loginSchema = Yup.object({
  email: Yup.string()
    .email('Invalid email address')
    .required('Email is required')
    .lowercase()
    .trim(),
  password: Yup.string()
    .required('Password is required'),
});

export const forgotPasswordSchema = Yup.object({
  email: Yup.string()
    .email('Invalid email address')
    .required('Email is required')
    .lowercase()
    .trim(),
});

export const resetPasswordSchema = Yup.object({
  token: Yup.string().required('Token is required'),
  newPassword: Yup.string()
    .required('New password is required')
    .min(12, 'Password must be at least 12 characters')
    .matches(/[A-Z]/, 'Password must contain at least one uppercase letter')
    .matches(/[a-z]/, 'Password must contain at least one lowercase letter')
    .matches(/[0-9]/, 'Password must contain at least one number')
    .matches(/[!@#$%^&*(),.?":{}|<>]/, 'Password must contain at least one special character'),
});

export const walletSignupEmailSchema = Yup.object({
  email: Yup.string()
    .email('Invalid email address')
    .required('Email is required')
    .lowercase()
    .trim(),
});
```

## Security Implementation

### Password Hashing

```typescript
import bcrypt from 'bcrypt';

const BCRYPT_ROUNDS = 12;

export async function hashPassword(password: string): Promise<string> {
  return bcrypt.hash(password, BCRYPT_ROUNDS);
}

export async function verifyPassword(password: string, hash: string): Promise<boolean> {
  return bcrypt.compare(password, hash);
}
```

### Token Generation & Hashing

```typescript
import crypto from 'crypto';

export function generateToken(): string {
  return crypto.randomBytes(32).toString('base64url'); // URL-safe base64
}

export function hashToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}

export function compareTokens(plaintext: string, hash: string): boolean {
  const plaintextHash = hashToken(plaintext);
  return crypto.timingSafeEqual(
    Buffer.from(plaintextHash),
    Buffer.from(hash)
  );
}
```

### Token Expiry

- Email verification: 30 minutes
- Password reset: 60 minutes

### Environment Variables

Add to `.env`:

```
MAILJET_API_KEY=your_api_key
MAILJET_API_SECRET=your_api_secret
GOOGLE_CLIENT_ID=your_google_oauth_client_id
GOOGLE_CLIENT_SECRET=your_google_oauth_client_secret
```

## Migration Strategy for Existing Users

### Manual Process for 10 Existing Users

1. Generate temporary passwords for each user (e.g., `TempPass123!@#`)
2. Hash passwords with bcrypt (cost 12)
3. Update database:

```sql
UPDATE users 
SET 
  password_hash = '{bcrypt_hash}',
  account_status = 'active',
  email_verified_at = NOW()
WHERE id = '{user_id}';
```

4. Send each user an email (manual, not via system) with their temporary password and instructions to reset it on first login
5. Optional: Add a `force_password_reset` boolean flag for first login prompt

## useAuth.ts Integration

### Updated Hook Structure

```typescript
const useAuth = () => {
  const [state, setState] = useState<{
    loading?: boolean;
    nonce?: string;
    error?: Error;
  }>({});
  const setCurrentUserId = useSetAtom(triggerCurrentUserIdAtom);
  const { address, chainId, isConnected } = useAccount();
  const { connect: wagmiConnect, connectors } = useConnect();
  const { disconnect } = useDisconnect();
  const { signMessageAsync } = useSignMessage();
  const queryClient = useQueryClient();
  const params = useSearchParams();
  const callbackUrl = params.get('callbackUrl') || PATHS.profile;

  const fetchNonce = async () => {
    try {
      const nonce = await getCsrfToken();
      setState((x) => ({ ...x, nonce }));
    } catch (error) {
      setState((x) => ({ ...x, error: error as Error }));
    }
  };

  useEffect(() => {
    fetchNonce();
  }, []);

  // Existing SIWE sign-in (now primary login method, not just for web3)
  const signIn = async () => {
    try {
      if (!address || !chainId) return;

      setState((x) => ({ ...x, loading: true, error: undefined }));
      
      const message = new SiweMessage({
        domain: window.location.host,
        address,
        statement: 'Quilombo Login - Please sign this message to log in to the app.',
        uri: window.location.origin,
        version: '1',
        chainId,
        nonce: state.nonce,
      });

      const preparedMessage = message.prepareMessage();
      const signature = await signMessageAsync({ message: preparedMessage });

      // Check if this is first-time wallet user
      // If EMAIL_REQUIRED error, prompt user for email
      const res = await nextAuthSignIn('ethereum', {
        message: JSON.stringify(message),
        signature,
        // email: userProvidedEmail, // Add if first-time
        callbackUrl,
      });

      if (res?.error === 'EMAIL_REQUIRED') {
        // Show modal/prompt to collect email
        // Then retry with email parameter
        setState((x) => ({ ...x, loading: false, error: new Error('Please provide your email to complete signup') }));
        return;
      }

      if (res?.ok && !res.error) {
        const session = await getSession();
        setCurrentUserId(session?.user?.id);
      } else {
        setState((x) => ({ ...x, error: new Error(res?.error || 'Unable to authenticate') }));
      }

      setState((x) => ({ ...x, loading: false }));
    } catch (error) {
      setState((x) => ({ ...x, loading: false, error: error as Error, nonce: undefined }));
      fetchNonce();
    }
  };

  // New email/password sign-in
  const signInWithPassword = async (email: string, password: string) => {
    setState((x) => ({ ...x, loading: true, error: undefined }));
    
    const res = await nextAuthSignIn('email-password', {
      email,
      password,
      callbackUrl,
      redirect: false,
    });
    
    if (res?.ok && !res.error) {
      const session = await getSession();
      setCurrentUserId(session?.user?.id);
    } else if (res?.error === 'EMAIL_NOT_VERIFIED') {
      setState((x) => ({ 
        ...x, 
        loading: false, 
        error: new Error('Please verify your email before logging in') 
      }));
    } else {
      setState((x) => ({ 
        ...x, 
        loading: false, 
        error: new Error('Invalid email or password') 
      }));
    }
  };

  // Existing logout
  const logout = async () => {
    const silkConnector = connectors.find((connector) => connector.id === 'silk');
    disconnect();
    if (silkConnector) {
      const provider = await silkConnector.getProvider();
      await (provider as SilkEthereumProviderInterface).logout();
    }
    setCookie('quilombo.skipOnboarding', false);
    nextAuthSignOut().then(() => {
      setCurrentUserId(undefined);
      setState({});
      queryClient.clear();
    });
  };

  // Existing connect
  const connect = async () => {
    setState((x) => ({ ...x, loading: true, error: undefined }));
    const silkConnector = connectors.find((connector) => connector.id === 'silk');
    const defaultChain = getDefaultChain();
    
    try {
      const connectorToUse = silkConnector || silk(silkInitOptions);
      wagmiConnect({ connector: connectorToUse, chainId: defaultChain.id });
      setState((x) => ({ ...x, loading: false }));
    } catch (error) {
      if (error instanceof UserRejectedRequestError) {
        enqueueSnackbar('Operation cancelled by user.', { variant: 'info' });
      } else {
        setState((x) => ({ ...x, loading: false, error: error as Error }));
      }
    }
  };

  return { 
    signIn,            // SIWE (Human Wallet) 
    signInWithPassword, // Email/password
    logout, 
    connect, 
    state 
  };
};

export default useAuth;
```

### Auto-login from Active Wallet Session

In a layout component:

```typescript
useEffect(() => {
  const { address, isConnected } = useAccount();
  const { data: session } = useSession();
  
  if (address && isConnected && !session) {
    // Wallet is connected but no session - auto-reauthenticate
    signIn();
  }
}, [address, isConnected, session]);
```

## Testing Strategy

### Unit Tests

- **Password validation**: Test all regex rules, edge cases (exactly 12 chars, special chars, etc.)
- **Token generation/hashing**: Verify randomness, proper SHA-256 hashing, timing-safe comparison
- **Yup schemas**: Test validation error messages for email/password

### Integration Tests (API Routes)

- **Signup**:
  - Success: creates user, sends email, returns 201
  - Duplicate email: returns 409
  - Weak password: returns 400 with specific error
- **Verify email**:
  - Valid token: updates user, sets session, returns 200
  - Expired token: returns 400
  - Already consumed token: returns 410
  - Invalid token: returns 400
- **Login (email/password)**:
  - Correct credentials: returns session
  - Wrong password: returns 401
  - Unverified user: returns 423
- **Login (SIWE)**:
  - Existing wallet user: returns session
  - New wallet user without email: returns EMAIL_REQUIRED error
  - New wallet user with email: creates account and returns session
- **Login (Google)**:
  - Existing OAuth link: returns session
  - New user: creates account and returns session
  - Existing email match: links OAuth account and returns session
- **Forgot password**:
  - Existing email: sends email, returns 204
  - Non-existing email: returns 204 (no enumeration)
- **Reset password**:
  - Valid token: updates password, consumes token, returns 200
  - Invalid token: returns 400
  - Weak new password: returns 400
  - Google/wallet user with no password: creates password_hash

### E2E Tests (Playwright)

- **Happy path (email/password)**:
  1. Visit signup page
  2. Enter email/password (valid)
  3. Submit form
  4. See "check your inbox" message
  5. Intercept email (use test mailbox or mock)
  6. Click verification link
  7. Verify redirected to profile and logged in
  
- **Happy path (Google)**:
  1. Visit signup page
  2. Click "Continue with Google"
  3. Mock OAuth flow
  4. Verify account created and logged in
  
- **Happy path (Human Wallet)**:
  1. Visit login page
  2. Click "Connect Human Wallet"
  3. Mock wallet connection
  4. Enter email when prompted
  5. Sign SIWE message
  6. Verify account created and logged in
  
- **Password reset**:
  1. Visit forgot password page
  2. Enter email
  3. Intercept reset email
  4. Click reset link
  5. Enter new password
  6. Submit
  7. Verify can log in with new password, old password fails
  
- **Expired link**:
  1. Create verification token manually with past expiry
  2. Visit verification link
  3. See "link expired" message
  4. Click resend
  5. New link works
  
- **Account linking**:
  1. Sign up with email/password
  2. Log in
  3. Go to Settings
  4. Click "Link Human Wallet"
  5. Connect wallet and sign
  6. Verify wallet_address saved
  7. Log out
  8. Log in with wallet - should work

### Edge Cases

- Email case-insensitivity (`Test@Example.com` == `test@example.com`)
- Multiple resend clicks (cooldown UI)
- Token replay (consumed token rejected)
- Password exactly 12 chars (boundary)
- Special characters in password (HTML escaping)
- User tries to sign up with email that's already linked to a wallet account
- User with Google account tries to reset password (should work, creates password_hash)

## Definition of Done

- [ ] Database migrations created and applied (local, staging, production)
- [ ] Existing 10 users migrated (manual password hashes, email_verified_at set)
- [ ] `oauth_accounts` table created (prevents duplicate account issues)
- [ ] API routes implemented (`/api/auth/signup`, `/verify-email`, `/resend-verification`, `/forgot-password`, `/reset-password`)
- [ ] next-auth providers configured (`ethereum` for SIWE, `email-password`, `GoogleProvider`)
- [ ] SIWE provider handles first-time wallet users (prompts for email)
- [ ] Google OAuth callback handles account linking by email
- [ ] Mailjet integration complete with stub provider for development
- [ ] Yup validation schemas implemented and tested
- [ ] Password hashing (bcrypt cost 12) and token hashing (SHA-256) implemented
- [ ] HeroUI components built:
  - [ ] Login page with 3 equal options (wallet, Google, email/password)
  - [ ] Signup page with 2 options (email/password, Google)
  - [ ] Wallet first-time email prompt modal
  - [ ] Verification pages (check inbox, expired, success)
  - [ ] Reset password pages
  - [ ] Settings page "Connected Accounts" section
- [ ] Live password validation checklist in signup form
- [ ] Email masking on "check your inbox" page
- [ ] Resend button with 5-second cooldown
- [ ] Google OAuth "Continue with Google" button functional
- [ ] Human Wallet "Connect Human Wallet" button on login page (elevated to primary auth)
- [ ] Auto-login from active wallet session implemented
- [ ] Account linking flows work (add password, add wallet, add Google)
- [ ] Unit tests for password validation, token logic (≥ 80% coverage)
- [ ] Integration tests for all API routes and auth flows (≥ 80% coverage)
- [ ] E2E tests for happy paths and edge cases (Playwright)
- [ ] Error messages user-friendly and don't leak sensitive info
- [ ] HTTPS-only cookies configured in next-auth
- [ ] Environment variables documented in `.env.example`
- [ ] Migration runbook documented (how to hash passwords, update users)
- [ ] Security review: HTTPS, httpOnly cookies, password hashing, token expiry, no user enumeration
- [ ] Email requirement documented (all auth methods require email for notifications)

## Out of Scope Items (Future Considerations)

The following were identified as too complex for initial rollout given the small user base (~10-100 users). Document here for future reference:

### Rate Limiting
**Why deferred**: No abuse patterns observed yet, infrastructure overhead  
**When to add**: If login/signup abuse detected or user base > 500  
**Approach**: Vercel Edge Middleware or `@upstash/ratelimit` (Redis-based)

### Account Lockout
**Why deferred**: Complex state management, risk of locking out legitimate users  
**When to add**: If targeted brute-force attacks observed  
**Approach**: Track failed login attempts per user, temporary lock after N failures

### HaveIBeenPwned Integration
**Why deferred**: External API dependency, rate limits, caching complexity  
**When to add**: If weak passwords are a recurring issue  
**Approach**: Offline breach list or async API check on signup

### Disposable Email Blocking
**Why deferred**: Email verification itself prevents most abuse  
**When to add**: If throwaway email abuse patterns emerge  
**Approach**: Maintain list of disposable domains or use an API service

### Session Rotation on Password Reset
**Why deferred**: JWT strategy makes true revocation complex (need token versioning or blocklist)  
**When to add**: If security audit requires it  
**Approach**: Add `tokenVersion` to users table, increment on password reset, validate in JWT callback

### Email Event Tracking
**Why deferred**: Webhook infrastructure, storage overhead  
**When to add**: If compliance/auditing requires delivery proof  
**Approach**: `email_events` table, Mailjet webhook endpoint

### Telemetry Dashboard
**Why deferred**: Analytics pipeline overhead  
**When to add**: When metrics inform product decisions  
**Approach**: Log events to DB, build simple admin dashboard or use external analytics tool

### Admin UI
**Why deferred**: RBAC complexity, small user base manageable via SQL  
**When to add**: When support volume justifies it (manual SQL becomes bottleneck)  
**Approach**: Admin pages with user search, force verify, resend email actions

### OTP Verification
**Why deferred**: Additional UI/UX surface area, magic link simpler  
**When to add**: If users prefer code entry over email clicks  
**Approach**: Generate 6-digit code, send via email, verification input form

### Token Metadata (IP, User Agent)
**Why deferred**: Privacy concerns (GDPR), forensics not needed at current scale  
**When to add**: If fraud detection becomes necessary  
**Approach**: Store IP/UA in `meta` jsonb field on token creation

### MX Record Validation
**Why deferred**: DNS lookups add latency, email verification catches invalid emails anyway  
**When to add**: If bounce rate becomes a problem  
**Approach**: Async DNS lookup on signup, warn if MX missing

### Retrieving Email from Human Wallet
**Why deferred**: Complicates account linking (email might not match existing account), adds optional logic branches throughout app  
**When to add**: If users demand it and we build robust email conflict resolution UX  
**Approach**: Request email from wallet iframe, prompt user if mismatch with existing account

---

## Implementation Checklist

### Phase 1: Database & Backend (Week 1)
- [ ] Create DB schema changes (enums, users fields, new tables)
- [ ] Write and test migration scripts
- [ ] Implement password hashing utilities (bcrypt)
- [ ] Implement token generation/hashing utilities (crypto)
- [ ] Create Yup validation schemas
- [ ] Set up Mailjet account and configure sender domain
- [ ] Implement email provider interface + Mailjet provider + stub provider
- [ ] Write unit tests for utilities

### Phase 2: API Routes (Week 1-2)
- [ ] Implement `/api/auth/signup`
- [ ] Implement `/api/auth/verify-email`
- [ ] Implement `/api/auth/resend-verification`
- [ ] Implement `/api/auth/forgot-password`
- [ ] Implement `/api/auth/reset-password`
- [ ] Configure next-auth providers (ethereum/SIWE, email-password, Google)
- [ ] Handle first-time wallet user email collection
- [ ] Handle Google OAuth account linking by email
- [ ] Write integration tests for all routes

### Phase 3: Frontend (Week 2)
- [ ] Build signup page with live password validation
- [ ] Build login page (email/password + Google + Human Wallet buttons - all equal)
- [ ] Build wallet first-time email prompt modal
- [ ] Build verification pages (check inbox, expired, success)
- [ ] Build forgot password page
- [ ] Build reset password page
- [ ] Build Settings page "Connected Accounts" section
- [ ] Update `useAuth.ts` hook (add signInWithPassword, update signIn for email prompt)
- [ ] Implement auto-login from wallet session

### Phase 4: Testing & Deployment (Week 2-3)
- [ ] Write E2E tests (Playwright) for all 3 auth methods
- [ ] Manual QA on all flows including account linking
- [ ] Migrate existing 10 users (manual password setup)
- [ ] Deploy to staging
- [ ] Final security review
- [ ] Deploy to production
- [ ] Monitor for issues (email delivery, login success rate, OAuth linking)

**Estimated total effort**: ~55-60 hours (~2 weeks for one developer)
