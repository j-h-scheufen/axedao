# CLAUDE.md - Quilombo App

This file provides guidance to Claude Code when working with the Quilombo DApp.

## Code Quality Mantra

**Reduce code complexity and size to increase maintainability**

Always look for opportunities to:
- Extract reusable components from repeated patterns
- Use Formik Field components (FormikInput, FieldInput) instead of manually binding onChange, onBlur, isInvalid, errorMessage
- Centralize shared logic and validation schemas
- Follow DRY principles rigorously

## Overview

Quilombo is the main DApp for the Axé DAO ecosystem, providing community functions including user profiles, group management, events, and Web3 wallet integration.

## Common Commands

```bash
# Development server on port 8080
pnpm dev

# Database operations
pnpm db:generate  # Generate migrations from schema changes
pnpm db:migrate   # Apply migrations to database

# Local database (Docker)
pnpm db:local:up      # Start PostgreSQL container
pnpm db:local:down    # Stop PostgreSQL container
pnpm db:local:reset   # Reset database (destroys data, runs migrations)
pnpm db:local:seed    # Populate with test data
pnpm db:local:logs    # View database logs
pnpm db:local:psql    # Connect to PostgreSQL CLI

# Generate Wagmi hooks from contract ABIs
pnpm wagmi:generate

# Build for production
pnpm build

# Lint and format
pnpm lint
pnpm format
```

**Important**: Database commands (`db:generate`, `db:migrate`) require environment variables. Export them from `.env.local` first:

```bash
# Export all environment variables from .env.local
export $(grep -v '^#' .env.local | xargs)

# Then run database commands
pnpm db:generate
pnpm db:migrate
```

## Database Setup

### Local Development with Docker (Recommended)

The recommended approach for local development is using Docker Compose:

```bash
# First, update .env.local to use the local database:
# DATABASE_URL=postgres://postgres:mypassword@localhost:5433/postgres

# Start PostgreSQL + PostGIS container
pnpm db:local:up

# Run migrations to set up schema (REQUIRED on first run!)
pnpm db:migrate

# (Optional) Seed with test data
pnpm db:local:seed

# Or, use reset to do it all in one command:
pnpm db:local:reset  # Destroys data, recreates container, runs migrations
```

**Important**: On first run, the database is empty. You MUST run `pnpm db:migrate` after starting the container, or use `pnpm db:local:reset` which does both automatically.

**See `docs/LOCAL_DATABASE.md` for complete documentation** including:
- All available commands
- Test data details
- Switching between environments
- Troubleshooting
- Benefits and workflows

### Legacy Manual Setup

If you prefer not to use Docker, you can set up PostgreSQL manually:

```bash
# Pull and run PostgreSQL
docker pull postgis/postgis:17-3.5
docker run --name drizzle-postgres -e POSTGRES_PASSWORD=mypassword -d -p 5432:5432 postgis/postgis:17-3.5
```

**Important PostGIS Setup:**
- PostGIS extension is added to the `gis` schema
- The `gis` schema must be added to the `search_path` for migrations to work
- Add to DB user role:
  ```sql
  ALTER ROLE postgres SET search_path TO "$user", public, extensions, gis
  ```

### Manual Migrations

Some migrations are manually generated for features Drizzle doesn't support (functions, triggers, etc.):

1. Create a new numbered migration file with DB changes
2. Either:
   - Run `npx drizzle-kit push` to manually add the migration, OR
   - Add a new entry to `_journal.json` and run `npx drizzle-kit migrate`

## Architecture

### Technology Stack

- **Framework**: Next.js 15 App Router
- **Database**: PostgreSQL with PostGIS extension, Drizzle ORM 0.44.6
- **Authentication**: NextAuth 4.24.11 (multi-provider: SIWE, email/password, Google OAuth)
- **State Management**: Jotai 2.15.0 + React-Query (jotai-tanstack-query integration)
- **Web3**: Wagmi 2.18.0 + Viem 2.38.0 with Silk Wallet SDK 1.0.2
- **Forms**: Formik 2.4.6 + Yup 1.7.1 validation
- **UI**: HeroUI 2.8.5 + Tailwind CSS 4.1.14
- **Images**: Sharp 0.34.4
- **Styling**: Framer Motion 12.23.24

### Form Handling with Formik

**Pattern**: Use Formik with `<Field as={FieldInput}>` / `<Field as={FieldTextarea}>` for automatic binding and error handling via `useField` hook.

**Reference Implementations**:
- `/components/forms/profile/ProfileForm.tsx` - Complete form with validation
- `/components/groups/GroupProfile/ClaimGroupModal.tsx` - Modal with Formik
- `/components/forms/FieldTextarea.tsx` - Auto-binding component using `useField` hook

**Key Points**:
- Use `<Formik>` + `<Form>` + `<Field as={FieldInput/FieldTextarea}>`
- **CRITICAL**: Field components must extract both `field` and `meta` from `useField()`. The `meta` object contains validation state (touched, error) which must be passed to HeroUI components as `isInvalid` and `errorMessage` props.
- Submit button: `type="submit"` inside `<Form>` (NOT `onPress={() => formik.handleSubmit()}`)
- For simple confirmation modals without inputs, use direct button handlers with useState instead of Formik

### Multi-Provider Authentication

**Three authentication methods** via NextAuth Credentials providers:

1. **SIWE Wallet Authentication** (`/utils/auth/siwe.ts`)
   - Sign-In-With-Ethereum with signature verification
   - First-time users must provide email (verified via signature)
   - **CSRF workaround**: NextAuth v4 has CSRF token mismatch issues - nonce extracted from cookies directly instead of headers
   - **Critical**: Must call `provider.logout()` after wagmi disconnect for proper logout

2. **Email/Password Authentication** (`/utils/auth/password.ts`)
   - Bcrypt password hashing (bcrypt@6.0.0)
   - Account status flow: `pending_verification` → `active`
   - Verification tokens with 30-minute expiry
   - Password reset flow with token hashing (store hash, send plain token)

3. **Google OAuth** (`/config/next-auth-options.ts`)
   - Auto-verifies email, creates account or links existing
   - Stored in `oauthAccounts` table for provider mapping

**Session Management**:
- JWT strategy with 5-day max age
- `UserSession` type: `{ id, walletAddress, isGlobalAdmin }`
- Middleware protects `/admin/*` routes via `isGlobalAdmin` flag
- Session refresh via `triggerCurrentUserIdAtom` in Jotai

**Key Files**:
- `/config/next-auth-options.ts` - Centralized auth provider configuration
- `/app/api/auth/*` - Auth endpoints (signup, verify-email, forgot-password, reset-password, change-password, methods, link-wallet, remove-method)
- `/middleware.ts` - Admin route protection
- `/utils/auth/` - Password, token, and SIWE utilities

### Database Architecture (Drizzle ORM)

**Pattern**: Database query functions organized by domain in `/db/queries/` (server-side only)

**Module Structure**:
- `db/index.ts` - Thin re-export layer (30 lines)
- `db/connection.ts` - Database connection factory
- `db/queries/` - Domain-based query modules:
  - `users.ts` - User management and authentication (~140 lines)
  - `groups.ts` - Group CRUD and membership (~260 lines)
  - `groupClaims.ts` - Group ownership claiming workflow (~220 lines)
  - `groupVerifications.ts` - Group verification system (~110 lines)
  - `groupLocations.ts` - Geographic locations and mapping (~130 lines)
  - `events.ts` - Event creation and querying (~170 lines)
  - `invitations.ts` - Email-bound and open (QR code) invitations (~165 lines)
  - `stats.ts` - Public statistics for homepage (~60 lines)

**Adding New Database Functions**:
1. Identify the appropriate domain module in `db/queries/`
2. Add function with JSDoc documentation
3. Export from the module file
4. No need to update `db/index.ts` (re-exports automatically)
5. If creating a new domain, create new module and add re-export to `db/index.ts`

**Import Pattern**:
```typescript
// Consumers import from db/index.ts (re-export layer)
import { fetchUser, searchGroups, createGroupClaim } from '@/db';

// NOT from individual modules (internal implementation detail)
// ❌ import { fetchUser } from '@/db/queries/users';
```

**Schema** (`/db/schema.ts`):
- PostgreSQL with drizzle-orm 0.44.6
- **Tables**:
  - `users` - Core user with wallet, email, password hash, avatar, social links
  - `groups` - DAO groups with verified status, logo, banner, leader
  - `groupAdmins` - Composite key join table
  - `groupLocations` - PostGIS geography type for location data
  - `events` - Group events with location
  - `groupMembers` - Join table for group membership
  - `verificationTokens` - Email verification and password reset tokens
  - `oauthAccounts` - OAuth provider mappings
- **Enums**: accountStatus, tokenType, oauthProvider, titles, linkTypes, styles, eventTypes
- **Indexes**: On nickname, email, wallet_address (unique), group_id, title
- **Email handling**: All lowercase for case-insensitive lookups

**Key Functions** (`/db/index.ts`):
- `fetchSessionData(walletAddress)` - Quick session fetch for auth
- `searchUsers()`, `searchGroups()` - Paginated search with SQL window functions
- `fetchGroup()` - Single group with country code aggregation
- Uses raw SQL for complex queries: `.select().from().leftJoin()`

**Important Patterns**:
- **Window function count**: `sql<number>\`count(*) over()\`` - Single query for data + total count
- **SQL aggregation**: `ARRAY_REMOVE(ARRAY_AGG(...))` for country codes
- **Email lookups**: Always use `sql\`LOWER(${users.email})\`` and lowercase on insert
- **Global singleton**: Prevents reconnection issues
  ```typescript
  export const db = global.database || drizzleClient;
  if (process.env.NODE_ENV !== 'production') global.database = db;
  ```

### State Management (Jotai + React-Query)

**Opinionated Data Fetching Strategy**:
- Records are pre-fetched server-side to hydrate the QueryClient
- Available for SSR in pages AND via react hooks without additional API calls
- Jotai atoms use queries to fetch state from already-populated QueryClient
- Client components access atoms which query the client-side cache
- Updates via react-query automatically invalidate cache, atoms reflect latest state

**Jotai Atoms** (`/hooks/state/*.ts`):
- `atomWithQuery` for server queries (jotai-tanstack-query integration)
- Derived atoms for computed values (read-only)
- Examples:
  - `currentUserAtom` - Queries `/api/profile`
  - `currentUserIdAtom`, `currentUserDisplayNameAtom` (derived)
  - `publicClientAtom` - Viem public client for blockchain reads
  - `triggerCurrentUserIdAtom` - Force session refetch

**React-Query** (`/query/*.ts`):
- **CRITICAL**: Run ALL API calls through react-query with best-practice caching and query invalidation
- Strict key naming: `QUERY_KEYS.category.operation`
- Query options pattern: `{ queryKey, queryFn, enabled }`
- Mutations auto-invalidate on success
- Example: `joinGroup()` invalidates `groupMembers` after updating `currentUser`

**Session Management**:
- `useSession()` from NextAuth provides initial userId
- Careful lazy-loading: `enabled: !!userId` prevents queries without session

### Wallet Integration (Wagmi + Silk Wallet)

**Wagmi Configuration** (`/config/wagmi.ts`):
- Single connector: Silk Wallet (custom wrapper in `/utils/silk.connector.ts`)
- Chains: Gnosis (mainnet), Sepolia (dev), Localhost (local fork)
- Environment-based via `NEXT_PUBLIC_CHAIN_ENV`
- Dual transport: HTTP for Gnosis/Sepolia, WebSocket option
- SSR-enabled for Next.js

**Silk Wallet Integration**:
- `@silk-wallet/silk-wallet-sdk@1.0.2`
- Custom connector with auto-reconnect on page refresh
- **Critical**: Must explicitly call `provider.logout()` after wagmi disconnect for proper logout

**Key Utilities**:
- `getDefaultChain()` - Environment-aware chain selection
- `getTransport()` - Dynamic RPC URL selection
- `useInitializePublicClient()` - Sets up viem PublicClient for blockchain reads

**Viem + Wagmi Hooks**:
- `useAccount()` - Current wallet address and chainId
- `useConnect()`, `useDisconnect()`, `useSignMessage()` - Wallet operations
- `usePublicClient()` - Read-only contract calls

### API Routes

**Location**: `/app/api/*` using Next.js App Router

**Pattern**:
```typescript
export async function POST(request: Request) {
  // 1. Parse and validate with Yup schema
  const data = await schema.validate(body);

  // 2. DB operations via centralized db functions
  const result = await db.someFunction(data);

  // 3. Send email if needed (via email provider)

  // 4. Return JSON response
  return NextResponse.json({ message: "Success" });
}
```

**Error Response Format**: Always `{ error: string }` with HTTP status codes
- 400: Validation errors - return **first error only** `error.errors?.[0]`
- 401/403: Authentication/authorization
- 404: Not found
- 409: Conflict (e.g., email exists)
- 500: Server errors (always `console.error()` before returning)

**Documentation**: All API handlers MUST have OpenAPI-style JSDoc comments
- Use `@openapi` tags for compatibility with generators
- Document: summary, tags, parameters, requestBody, responses (including errors)
- Include schema definitions for request/response bodies
- Document all possible HTTP status codes

### API Endpoints

| Method | Path                                | Request Body           | Response        | Details      |
|--------|-------------------------------------|------------------------|-----------------|--------------|
| GET    | groups/                             |                        | Groups[]        | Group Search |
| POST   | groups/                             | CreateNewGroupForm     | Group           |              |
| GET    | groups/[groupId]                    |                        | Group           |              |
| PATCH  | groups/[groupId]                    | UpdateGroupForm        | Group           |              |
| DELETE | groups/[groupId]                    |                        | null, 204       |              |
| GET    | groups/[groupId]/members            |                        | User[]          |              |
| DELETE | groups/[groupId]/members/[userId]   |                        | User[]          |              |
| GET    | groups/[groupId]/admins             |                        | string[]        |              |
| PUT    | groups/[groupId]/admins/[userId]    |                        | string[]        |              |
| DELETE | groups/[groupId]/admins/[userId]    |                        | string[]        |              |
| GET    | users/                              |                        | User[]          | User Search  |
| GET    | users/[userId]                      |                        | User            |              |
| GET    | profile                             |                        | User            |              |
| PATCH  | profile                             | ProfileForm            | User            |              |
| PUT    | profile/group/[groupId]             |                        | User            |              |
| DELETE | profile/group/[groupId]             |                        | User            |              |
| POST   | images/                             | FormData               | { url: string } |              |
| GET    | location/countries                  |                        | Country[]       |              |
| GET    | location/cities                     | URL params             | City[]          |              |
| PUT    | admin/groups/[groupId]/verification |                        | Group           |              |
| DELETE | admin/groups/[groupId]/verification |                        | Group           |              |

### Form Handling & Validation

**Formik + Yup** (`/config/validation-schema.ts`):
- **Centralized schema definitions** - ALL validation schemas live here
- Schema pattern: `object().shape({ field: string().required().email() })`
- Type extraction: `type MyForm = InferType<typeof mySchema>`
- **Type Deduplication Pattern**: If a type union (e.g., `'password' | 'google' | 'wallet'`) appears 3+ times:
  1. Extract as a const array: `export const authMethods = ['password', 'google', 'wallet'] as const`
  2. Derive type from it: `export type AuthMethod = (typeof authMethods)[number]`
  3. Use in Yup schema: `.oneOf(authMethods, 'Invalid value')`
  4. Import and reuse the type across components/API routes
- Validation approach:
  - Use `validate()` or `validateSync()` based on context (async vs sync)
  - Return **first validation error only**: `error.errors?.[0]`
  - Validation errors are user-facing and should be descriptive
  - **Never expose** internal system details, database constraints, or stack traces

**Custom Validators**:
- `isValidUrl()`, `isValidFileType()`, `isValidISO8601()`
- IPFS hash validation, image upload size limits
- Social link URL validation (Twitter, Instagram patterns)

### Environment Configuration

**Pattern** (`/config/environment.ts`):
- Server-side vars (without NEXT_PUBLIC_) in `isServer` check
- Client-side (NEXT_PUBLIC_) accessible everywhere
- `required()` function throws on missing env vars at runtime
- Export as singleton: `ENV`

**Environment Modes**:
- `NEXT_PUBLIC_APP_ENV` / `NEXT_PUBLIC_WALLET_ENV` / `NEXT_PUBLIC_CHAIN_ENV` can differ
- Example: Production app on Gnosis, staging app on Sepolia

**Important**: Never use `process.env.X` directly - always use centralized `/config/environment.ts`

### Email System

**Interface Pattern** (`/utils/email/provider.ts`):
- Abstract `EmailProvider` interface
- Implementations: Mailjet (production), Stub (development)
- Methods: `sendVerificationEmail()`, `sendPasswordResetEmail()`
- Uses root-level node-mailjet dependency

### Component & Hook Conventions

**Components**:
- Const functional components with named exports
- Props as single object parameter (RORO pattern)
- **Minimize** `use client`, `useEffect`, `setState` - favor RSC
- HeroUI for components, Tailwind for styling
- Mobile-first responsive design
- Content variables for static content outside render functions
- Dynamic loading for non-critical components

**Custom Hooks** (`/hooks/*`):
- Separate query hooks in `/query/`
- State hooks in `/hooks/state/`
- Named `useXXX()` pattern
- Often combine Jotai atoms + React-Query

**Example Patterns**:
- `useAuth()` - Manages auth state with single error/loading
- `useCurrentUser()` - Wraps Jotai atom + session
- `useAdmin()` - Checks admin status
- `useGroup()` - Fetch single group via query

## Critical Non-Obvious Patterns

1. **SIWE Nonce Workaround**: NextAuth v4 CSRF token mismatch - extract nonce from cookies directly instead of headers

2. **Silk Wallet Logout**: Must explicitly call `provider.logout()` after wagmi disconnect for proper logout

3. **Database Singleton**: Global variable with dev caching prevents reconnection issues

4. **Admin Middleware**: Uses JWT token from middleware (Edge runtime constraints prevent DB fetch)

5. **Query Pagination**: Uses window function for count instead of separate COUNT query for efficiency

6. **Error-First API Responses**: Validate and return first error only (user-facing, no stack traces)

7. **Email Case Insensitivity**: All lookups use `LOWER(${users.email})` and lowercase on insert

8. **Token Security**: Store hash in DB, send plain token to user (one-way verification)

9. **Multi-Environment Support**: Chain, wallet, and app environments can differ via env vars

10. **Nuqs for URL State**: URL search params managed by Nuqs adapter for pagination/filters

11. **Server-Side Query Hydration**: Pre-populate QueryClient server-side, access via Jotai atoms client-side

## Key File Locations

- Auth config: `/config/next-auth-options.ts`
- DB layer: `/db/index.ts` (functions), `/db/schema.ts` (tables)
- Providers setup: `/app/_providers/index.tsx`
- State atoms: `/hooks/state/*.ts`
- Queries: `/query/*.ts`
- Utils: `/utils/*` (organized by feature: auth/, email/, images/)
- Validation: `/config/validation-schema.ts`
- Environment: `/config/environment.ts`
- Wagmi config: `/config/wagmi.ts`

## Safety Hooks

This project uses a bash safety hook to prevent accidental execution of dangerous commands. The hook blocks:

- **Database operations**: `drizzle-kit migrate`, `drizzle-kit push`, direct SQL execution
- **Package publishing**: `npm/yarn/pnpm publish`
- **Force operations**: `git push --force`
- **Production deployments**: `vercel --prod`, `netlify deploy --prod`
- **Destructive operations**: `kubectl delete`, `docker-compose down`, `rm -rf` on critical paths

The hook is context-aware and only blocks actual command execution (not documentation or code examples).

Hook location: `~/.claude/hooks/bash-safety-check.sh`
