# Database Layer Refactoring Plan

**Status:** Planning / Not Implemented
**Created:** 2025-01-11
**Last Updated:** 2025-01-11
**Related:** Phase 3 of group registration/claiming feature

## Problem Statement

The `apps/quilombo/db/index.ts` file has grown to over 1064 lines and continues to grow with each feature addition. This creates several maintainability issues:

### Current Issues

1. **Size & Navigation** - Over 1000 lines mixing concerns across multiple domains:
   - User management
   - Group CRUD operations
   - Group claims workflow
   - Group verifications
   - Group locations
   - Events
   - Invitations
   - Public statistics

2. **Merge Conflicts** - Multiple developers working on different features will increasingly conflict on this single file

3. **Testing Complexity** - Hard to write focused unit tests for a monolithic file; tests become large and unwieldy

4. **Code Review Burden** - Reviewers must wade through unrelated code when reviewing feature changes

5. **Import Bloat** - Every consumer imports the entire file even if they only need one function, affecting tree-shaking and bundle size

6. **Violates Single Responsibility** - File handles too many unrelated concerns

7. **Scalability** - Will only get worse as we add more features (API routes, UI components, email templates)

### Trend Analysis

```
Initial (Aug 2024):     ~300 lines  (users, groups, basic CRUD)
Events feature:         ~450 lines  (+150)
Invitations feature:    ~690 lines  (+240)
Group claiming (Phase2): 1064 lines  (+374)
Projected (Phase 3+):   1400+ lines
```

At current growth rate, this file will become unmanageable within 2-3 feature cycles.

## Proposed Solution: Domain-Based Module Organization

Refactor into smaller, focused modules organized by domain (bounded contexts):

```
apps/quilombo/db/
├── index.ts              # Re-exports all functions (public API)
├── connection.ts         # Database connection (already separate ✓)
├── schema.ts             # Schema definitions (already separate ✓)
└── queries/
    ├── users.ts          # User-related queries (~150 lines)
    ├── groups.ts         # Group CRUD operations (~200 lines)
    ├── groupClaims.ts    # Claim workflow functions (~170 lines)
    ├── groupVerifications.ts  # Verification functions (~140 lines)
    ├── groupLocations.ts # Location queries (~150 lines)
    ├── events.ts         # Event queries (~120 lines)
    ├── invitations.ts    # Invitation queries (~130 lines)
    └── stats.ts          # Public statistics (~30 lines)
```

### Benefits

1. **Smaller Files** - Each file ~100-200 lines, easier to understand and review
2. **Clear Boundaries** - Each domain is self-contained with related functions grouped
3. **Better Testing** - Can test `groupClaims.ts` independently without loading entire DB layer
4. **Parallel Development** - Multiple developers can work without conflicts
5. **Better Tree-Shaking** - Bundlers can eliminate unused code more effectively
6. **Easier Onboarding** - New developers can understand one domain at a time
7. **Clearer Dependencies** - Import statements show which domains are used

## Architecture

### Current Structure (Monolithic)

```typescript
// apps/quilombo/db/index.ts (1064 lines)
export const db = ...;
export async function isGlobalAdmin() { }
export async function searchUsers() { }
export async function fetchUser() { }
export async function searchGroups() { }
export async function fetchGroup() { }
export async function isGroupMember() { }
export async function isGroupAdmin() { }
// ... 100+ more functions
export async function registerGroup() { }
export async function verifyGroup() { }
export async function approveClaim() { }
// ... continues
```

**Problems:**
- Single file with 100+ exports
- Mixed concerns (users, groups, events, invitations)
- Hard to find specific functions
- Large git diffs on feature branches

### Proposed Structure (Modular)

```typescript
// apps/quilombo/db/index.ts (~50 lines - re-export only)
export { db, client } from './connection';
export * from './queries/users';
export * from './queries/groups';
export * from './queries/groupClaims';
export * from './queries/groupVerifications';
export * from './queries/groupLocations';
export * from './queries/events';
export * from './queries/invitations';
export * from './queries/stats';
```

**Benefits:**
- Thin public API layer
- No breaking changes to existing imports
- Clear module boundaries
- Easy to add new domains

### Domain Module Example

```typescript
// apps/quilombo/db/queries/groupClaims.ts
import { and, eq } from 'drizzle-orm';
import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';

import * as schema from '@/db/schema';
import { db } from '@/db/connection';
import { addGroupAdmin } from './groups';

/**
 * GROUP CLAIMS
 * Handles the workflow for users claiming ownership of groups
 */

/**
 * Creates a new group claim request.
 * @param userId - ID of the user claiming the group
 * @param groupId - ID of the group being claimed
 * @param message - User's explanation for why they should be admin
 * @returns The created claim ID
 */
export async function createGroupClaim(
  userId: string,
  groupId: string,
  message: string
): Promise<string> {
  // Implementation...
}

export async function getPendingClaims() { }
export async function approveClaim() { }
export async function rejectClaim() { }
export async function getGroupClaims() { }
```

**Structure:**
- Domain comment header
- Related imports
- JSDoc for all functions
- Focused, cohesive functionality
- Clear dependencies (imports from other modules)

## Module Organization

### Module: users.ts (~150 lines)

**Functions:**
- `isGlobalAdmin(userId)`
- `searchUsers(options)`
- `fetchSessionData(walletAddress)`
- `fetchUser(userId)`
- `insertUser(userValues)`
- `updateUser(user)`
- `searchUsersByAddresses(addresses)`

**Dependencies:**
- schema.ts (schema definitions)
- connection.ts (db instance)

### Module: groups.ts (~200 lines)

**Functions:**
- `searchGroups(options)`
- `fetchGroup(groupId)`
- `isGroupMember(groupId, userId)`
- `isGroupAdmin(groupId, userId)`
- `fetchGroupMembers(groupId)`
- `fetchGroupAdminIds(groupId)`
- `insertGroup(group)`
- `deleteGroup(groupId)`
- `removeGroupMember(memberId)`
- `updateGroup(group)`
- `addGroupAdmin(entry)`
- `removeGroupAdmin(groupId, adminId)`

**Dependencies:**
- schema.ts
- connection.ts

### Module: groupClaims.ts (~170 lines)

**Functions:**
- `createGroupClaim(userId, groupId, message)`
- `getPendingClaims()`
- `approveClaim(claimId, adminId)`
- `rejectClaim(claimId, adminId, notes)`
- `getGroupClaims(groupId)`

**Dependencies:**
- schema.ts
- connection.ts
- groups.ts (`addGroupAdmin`)

### Module: groupVerifications.ts (~140 lines)

**Functions:**
- `canUserVerifyGroup(userId, groupId)`
- `verifyGroup(userId, groupId, notes?)`
- `getGroupVerificationHistory(groupId)`
- `getUserVerificationCount(userId)`
- `getLatestGroupVerification(groupId)`

**Dependencies:**
- schema.ts
- connection.ts

### Module: groupLocations.ts (~150 lines)

**Functions:**
- `fetchGroupLocations(groupId)`
- `fetchGroupLocation(locationId)`
- `insertGroupLocation(location)`
- `updateGroupLocation(locationId, updates)`
- `deleteGroupLocation(locationId)`
- `isLocationInGroup(locationId, groupId)`
- `fetchAllGroupLocationsWithGroups()`

**Dependencies:**
- schema.ts
- connection.ts

### Module: events.ts (~120 lines)

**Functions:**
- `searchEvents(options)`
- `fetchEvent(eventId)`
- `insertEvent(event)`
- `updateEvent(eventId, updates)`
- `deleteEvent(eventId)`
- `isEventCreator(eventId, userId)`

**Dependencies:**
- schema.ts
- connection.ts

### Module: invitations.ts (~130 lines)

**Functions:**
- `createInvitation(createdBy, type, invitedEmail?)`
- `invalidateUserOpenInvites(userId)`
- `findValidInvitation(code, email?)`
- `getUserActiveOpenInvite(userId)`
- `markInvitationAccepted(code, acceptedBy)`
- `expireOldInvitations()`

**Dependencies:**
- schema.ts
- connection.ts

### Module: stats.ts (~30 lines)

**Functions:**
- `fetchPublicStats()`

**Dependencies:**
- schema.ts
- connection.ts

## Implementation Plan

### Phase 1: Preparation (No Code Changes)

**1.1 Create Migration Branch**
```bash
git checkout feat/create-groups-en-masse
git checkout -b refactor/db-layer-modularization
```

**1.2 Document Current Exports**
```bash
# Extract all exported functions for verification
grep "^export async function\|^export function\|^export interface" db/index.ts > exports-before.txt
```

**1.3 Run Full Test Suite (Baseline)**
```bash
pnpm test
# Document: All tests passing before refactor
```

### Phase 2: Create Module Files (No Breaking Changes Yet)

**2.1 Create Directory Structure**
```bash
mkdir -p apps/quilombo/db/queries
```

**2.2 Create Empty Module Files**
```bash
touch apps/quilombo/db/queries/users.ts
touch apps/quilombo/db/queries/groups.ts
touch apps/quilombo/db/queries/groupClaims.ts
touch apps/quilombo/db/queries/groupVerifications.ts
touch apps/quilombo/db/queries/groupLocations.ts
touch apps/quilombo/db/queries/events.ts
touch apps/quilombo/db/queries/invitations.ts
touch apps/quilombo/db/queries/stats.ts
```

**2.3 Extract Connection Logic**

Create `apps/quilombo/db/connection.ts` (if not already separate):

```typescript
import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';
import ENV from '@/config/environment';
import * as schema from '@/db/schema';
import { createDatabaseConnection } from './connection-factory';

const { client: postgresClient, db: drizzleClient } = createDatabaseConnection(ENV.databaseUrl);

export const client = postgresClient;

declare global {
  var database: PostgresJsDatabase<typeof schema> | undefined;
}

export const db = global.database || drizzleClient;
if (process.env.NODE_ENV !== 'production') global.database = db;
```

**2.4 Move Functions to Modules (One Domain at a Time)**

Start with smallest/simplest module:

```bash
# Example: stats.ts (smallest, no dependencies)
# 1. Copy function from index.ts to queries/stats.ts
# 2. Add imports
# 3. Verify TypeScript compiles
pnpm tsc --noEmit

# Repeat for each module
```

**Order of migration (dependency-first):**
1. `stats.ts` (no dependencies)
2. `users.ts` (no domain dependencies)
3. `groups.ts` (no domain dependencies)
4. `groupLocations.ts` (depends on groups schema)
5. `events.ts` (no domain dependencies)
6. `invitations.ts` (no domain dependencies)
7. `groupVerifications.ts` (depends on groups)
8. `groupClaims.ts` (depends on groups - calls `addGroupAdmin`)

### Phase 3: Update index.ts Re-Exports

**3.1 Replace index.ts with Re-Exports**

```typescript
// apps/quilombo/db/index.ts
/**
 * Database Query Layer
 *
 * This file re-exports all database query functions from domain-specific modules.
 * All DB functions can only be run server-side. If you need to retrieve DB data from
 * a client component, use the API route handlers.
 *
 * Modules:
 * - users: User management and authentication
 * - groups: Group CRUD and membership
 * - groupClaims: Group ownership claiming workflow
 * - groupVerifications: Group verification system
 * - groupLocations: Geographic locations for groups
 * - events: Event management
 * - invitations: Invitation system (email + QR codes)
 * - stats: Public statistics
 */

// Database connection (used by API routes)
export { db, client } from './connection';

// Domain modules
export * from './queries/users';
export * from './queries/groups';
export * from './queries/groupClaims';
export * from './queries/groupVerifications';
export * from './queries/groupLocations';
export * from './queries/events';
export * from './queries/invitations';
export * from './queries/stats';
```

**3.2 Verify No Breaking Changes**

```bash
# Verify all exports are available
grep "^export async function\|^export function\|^export interface" db/index.ts > exports-after.txt

# Compare
diff exports-before.txt exports-after.txt
# Should show NO differences in function names
```

### Phase 4: Testing & Validation

**4.1 Run TypeScript Compiler**
```bash
cd apps/quilombo
pnpm tsc --noEmit
# Should have ZERO errors
```

**4.2 Run Test Suite**
```bash
pnpm test
# All tests should pass (same as baseline)
```

**4.3 Run Linter**
```bash
pnpm lint
# Should pass or show only auto-fixable issues
```

**4.4 Run Build**
```bash
pnpm build
# Should build successfully
```

**4.5 Test API Routes (Manual)**

Start dev server and test key endpoints:
```bash
pnpm dev

# Test endpoints that use each module:
# - GET /api/users (users.ts)
# - GET /api/groups (groups.ts)
# - POST /api/groups/[id]/claim (groupClaims.ts)
# - POST /api/groups/[id]/verify (groupVerifications.ts)
# - GET /api/events (events.ts)
# etc.
```

### Phase 5: Documentation & Cleanup

**5.1 Update CLAUDE.md**

Add to `apps/quilombo/.claude/CLAUDE.md`:

```markdown
## Database Layer Architecture

Database query functions are organized by domain in `db/queries/`:

- **users.ts** - User management and authentication
- **groups.ts** - Group CRUD and membership operations
- **groupClaims.ts** - Group ownership claiming workflow
- **groupVerifications.ts** - Group verification system (30-day cooldown)
- **groupLocations.ts** - Geographic locations and mapping
- **events.ts** - Event creation and querying
- **invitations.ts** - Email-bound and open (QR code) invitations
- **stats.ts** - Public statistics for homepage

**Adding New Database Functions:**
1. Identify the appropriate domain module in `db/queries/`
2. Add function with JSDoc documentation
3. Export from the module file
4. No need to update `db/index.ts` (re-exports automatically)
5. If creating a new domain, create new module and add re-export to `db/index.ts`

**Import Pattern:**
```typescript
// Consumers import from db/index.ts (re-export layer)
import { fetchUser, searchGroups, createGroupClaim } from '@/db';

// NOT from individual modules (internal implementation detail)
// ❌ import { fetchUser } from '@/db/queries/users';
```
```

**5.2 Update Package Documentation**

Update `apps/quilombo/README.md` (if exists) with new structure.

**5.3 Clean Up**

```bash
# Remove temporary files
rm exports-before.txt exports-after.txt
```

### Phase 6: Commit & Review

**6.1 Git Status Check**

```bash
git status
# Should show:
# - new files in db/queries/
# - modified: db/index.ts (now much smaller)
# - modified: apps/quilombo/.claude/CLAUDE.md
```

**6.2 Commit**

```bash
git add apps/quilombo/db/
git add apps/quilombo/.claude/CLAUDE.md

git commit -S -m "refactor: modularize database layer into domain-based modules

Splits monolithic db/index.ts (1064 lines) into focused domain modules:

Modules created:
- db/queries/users.ts - User management (~150 lines)
- db/queries/groups.ts - Group CRUD (~200 lines)
- db/queries/groupClaims.ts - Claim workflow (~170 lines)
- db/queries/groupVerifications.ts - Verifications (~140 lines)
- db/queries/groupLocations.ts - Locations (~150 lines)
- db/queries/events.ts - Events (~120 lines)
- db/queries/invitations.ts - Invitations (~130 lines)
- db/queries/stats.ts - Statistics (~30 lines)

db/index.ts now serves as thin re-export layer (~50 lines).

Benefits:
- Easier to navigate and maintain
- Better for parallel development (reduced merge conflicts)
- Clearer separation of concerns
- Improved tree-shaking potential
- No breaking changes to existing imports"
```

**6.3 Push & Open PR**

```bash
git push -u origin refactor/db-layer-modularization

# Create PR with description:
# - Link to this spec
# - Screenshot showing file size reduction
# - Note: zero breaking changes
# - Request review from team
```

## Module Template

Use this template when creating new domain modules:

```typescript
/**
 * [DOMAIN NAME] QUERIES
 * [Brief description of domain responsibility]
 */

import { and, eq, gte, lte, sql } from 'drizzle-orm';
import type { PostgresJsDatabase } from 'drizzle-orm/postgres-js';

import * as schema from '@/db/schema';
import { db } from '@/db/connection';
import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';

// Import from other domain modules if needed
// import { addGroupAdmin } from './groups';

/**
 * [Function description]
 *
 * @param paramName - Description
 * @returns Description of return value
 * @throws Error description if applicable
 */
export async function functionName(
  params: Type
): Promise<ReturnType> {
  // Implementation
}

// Additional functions...
```

## Cross-Module Dependencies

### Current Dependencies (from analysis)

```
groupClaims.ts
  └─> groups.ts (calls addGroupAdmin)

groupVerifications.ts
  └─> (no cross-module dependencies)

groupLocations.ts
  └─> (no cross-module dependencies)

events.ts
  └─> (no cross-module dependencies)

invitations.ts
  └─> (no cross-module dependencies)

users.ts
  └─> (no cross-module dependencies)

stats.ts
  └─> (no cross-module dependencies)
```

### Dependency Guidelines

**Allowed:**
- ✅ Domain modules can import from other domain modules
- ✅ All modules import from `connection.ts` and `schema.ts`
- ✅ Use of shared utilities from `@/config` and `@/utils`

**Not Allowed:**
- ❌ Circular dependencies (module A imports B, B imports A)
- ❌ Importing from parent `db/index.ts` (creates circular reference)
- ❌ Direct database access outside of modules (use functions)

**Best Practices:**
- Keep cross-module dependencies minimal
- Document dependencies in module header comments
- Consider extracting shared logic to separate utility functions
- If module becomes too dependent on others, may indicate wrong boundaries

## Testing Strategy

### During Refactor

**1. Continuous Validation:**
```bash
# After moving each module, run:
pnpm tsc --noEmit  # Type checking
pnpm lint          # Linting
```

**2. Incremental Testing:**
```bash
# Test each module individually as you create it
# Example: after creating users.ts
pnpm test -- users
```

**3. Full Test Suite:**
```bash
# Before committing
pnpm test
```

### After Refactor

**1. Integration Tests:**
- Test API routes that use multiple modules
- Verify complex workflows (claim approval, verification)

**2. Performance Testing:**
- No performance regression expected (same functions, different files)
- Bundle size should be same or smaller (better tree-shaking)

**3. Manual QA:**
- Run dev server
- Test key user flows:
  - User signup/login
  - Group creation/search
  - Event creation
  - Invitation generation

## Rollback Plan

If issues are discovered post-merge:

### Option 1: Revert Commit
```bash
git revert <commit-hash>
git push
```

### Option 2: Fix Forward
- Identify the specific module causing issues
- Fix in isolation
- Deploy fix

### Option 3: Feature Flag (If Needed)
```typescript
// Temporary: Allow fallback to old code path
if (process.env.USE_LEGACY_DB_LAYER === 'true') {
  // Keep old index.ts as index.legacy.ts
  // Import from legacy version
}
```

## Success Criteria

### Quantitative Metrics

- ✅ Zero breaking changes (all exports available)
- ✅ All tests passing (same as before refactor)
- ✅ No TypeScript errors
- ✅ No linting errors
- ✅ Build succeeds
- ✅ Each module < 250 lines
- ✅ index.ts < 100 lines

### Qualitative Metrics

- ✅ Clear module boundaries (easy to explain)
- ✅ Logical function grouping (related functions together)
- ✅ Easy to find functions (domain-based navigation)
- ✅ Minimal cross-module dependencies
- ✅ Improved code review experience
- ✅ Better developer onboarding

## Future Considerations

### When to Create New Modules

Create a new domain module when:
1. **Size threshold:** Module would exceed 250 lines
2. **Cohesion:** Functions have shared domain concepts
3. **Independence:** Can be tested/maintained separately
4. **Team ownership:** Different team might own domain

### When to Split Existing Modules

Split a module when:
1. **Size bloat:** Module exceeds 300-400 lines
2. **Multiple concerns:** Handling unrelated concepts
3. **High coupling:** Too many dependencies on other modules
4. **Team growth:** Multiple teams working in same module

### Potential Future Modules

As the application grows, consider:

```
db/queries/
├── notifications.ts       # User notifications
├── permissions.ts         # RBAC and permissions
├── audit.ts              # Audit logging
├── analytics.ts          # Usage analytics
├── billing.ts            # Subscription/billing (if added)
├── messaging.ts          # In-app messaging (if added)
└── workflows.ts          # Complex multi-step workflows
```

## Anti-Patterns to Avoid

### 1. Over-Modularization
```typescript
// ❌ DON'T: Too many tiny modules
db/queries/users/fetch.ts         (20 lines)
db/queries/users/search.ts        (25 lines)
db/queries/users/update.ts        (18 lines)

// ✅ DO: Reasonable module size
db/queries/users.ts               (150 lines)
```

### 2. Circular Dependencies
```typescript
// ❌ DON'T: Circular imports
// groups.ts
import { getUserGroups } from './users';

// users.ts
import { getGroupMembers } from './groups';

// ✅ DO: One-way dependencies or shared utilities
// users.ts
import { getGroupMembers } from './groups';  // OK

// groups.ts
// No import from users.ts
```

### 3. God Module
```typescript
// ❌ DON'T: One module with everything
db/queries/core.ts  (800 lines)

// ✅ DO: Focused modules
db/queries/users.ts    (150 lines)
db/queries/groups.ts   (200 lines)
```

### 4. Leaky Abstractions
```typescript
// ❌ DON'T: Expose internal implementation
export { db } from './connection';  // in every module

// ✅ DO: Export only domain functions
export async function fetchUser() { }
// db is internal to module
```

## Migration Checklist

Use this checklist during implementation:

### Pre-Refactor
- [ ] Create feature branch `refactor/db-layer-modularization`
- [ ] Document all current exports (`exports-before.txt`)
- [ ] Run full test suite (baseline)
- [ ] Create `db/queries/` directory

### Per Module
- [ ] Create module file
- [ ] Copy functions from `index.ts`
- [ ] Add proper imports
- [ ] Add JSDoc if missing
- [ ] Verify TypeScript compiles
- [ ] Run tests for that domain
- [ ] Commit checkpoint (optional)

### Post-Refactor
- [ ] Update `db/index.ts` with re-exports
- [ ] Verify exports match (`diff exports-before.txt exports-after.txt`)
- [ ] Run TypeScript compiler (`pnpm tsc --noEmit`)
- [ ] Run linter (`pnpm lint`)
- [ ] Run full test suite (`pnpm test`)
- [ ] Run build (`pnpm build`)
- [ ] Manual testing (API routes)
- [ ] Update `.claude/CLAUDE.md`
- [ ] Create PR with comprehensive description
- [ ] Request team review
- [ ] Merge after approval

## Questions & Answers

**Q: Will this break existing imports?**
A: No. All functions remain exported from `db/index.ts` via re-exports. Consumers continue importing from `@/db` as before.

**Q: Do we need to update API routes?**
A: No. API routes import from `@/db`, which continues to work.

**Q: What about performance?**
A: No performance impact. Re-exports are zero-cost at runtime (bundler resolves them).

**Q: Can we do this incrementally?**
A: Yes, but not recommended. Better to do all at once to maintain consistency and avoid confusion.

**Q: How long will this take?**
A: Estimated 2-4 hours for experienced developer. Can be done in one sitting.

**Q: What if tests fail?**
A: Likely a copy-paste error or missing import. Fix immediately before proceeding.

**Q: Should we update existing code to import from modules directly?**
A: No. Keep using `@/db` imports. Module structure is internal implementation detail.

## References

### Internal
- **Current file:** `apps/quilombo/db/index.ts` (1064 lines)
- **Project conventions:** `apps/quilombo/.claude/CLAUDE.md`
- **Related issue:** N/A (not yet created)

### External
- **Module Pattern:** https://www.patterns.dev/vanilla/module-pattern
- **Domain-Driven Design:** https://martinfowler.com/bliki/BoundedContext.html
- **TypeScript Modules:** https://www.typescriptlang.org/docs/handbook/modules.html

## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2025-01-11 | Use domain-based modules | Clear boundaries, easier maintenance |
| 2025-01-11 | Keep re-export layer | No breaking changes, backward compatible |
| 2025-01-11 | ~200 lines per module max | Balance between granularity and overhead |
| 2025-01-11 | Do all at once | Avoid confusion of mixed approach |

## Next Steps

1. **Team Review:** Discuss this spec, get approval
2. **Schedule Work:** Allocate 4-hour block for refactor
3. **Create Branch:** `refactor/db-layer-modularization`
4. **Implement:** Follow phase-by-phase plan
5. **Test & Validate:** Comprehensive testing
6. **PR & Merge:** Get team review, merge to feature branch
7. **Monitor:** Watch for any issues in dev/staging

---

**Author:** Claude (AI Assistant)
**Reviewer:** [Team Member]
**Status:** Awaiting Approval
**Estimated Effort:** 2-4 hours
**Risk Level:** Low (no breaking changes)
**Priority:** Medium (improves maintainability, not urgent)
