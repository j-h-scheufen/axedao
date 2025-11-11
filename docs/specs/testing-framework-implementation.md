# Testing Framework Implementation Plan

## Overview
This document outlines the implementation plan for a comprehensive testing framework for the Quilombo app, including unit tests, API tests, and E2E tests with database support.

## Goals
- ✅ Fast unit tests for utilities and pure functions
- ✅ Integration tests for database functions with real PostgreSQL
- ✅ API route tests with full request/response validation
- ✅ E2E tests for critical user flows
- ✅ CI/CD integration via GitHub Actions
- ✅ Minimal test setup/teardown time
- ✅ Isolated test environments (no shared state between tests)

---

## Recommended Tech Stack

### 1. Vitest (Unit + Integration Tests)
**Why Vitest over Jest?**
- Native ESM support (Next.js 15 uses ESM)
- Significantly faster (Vite-powered)
- Compatible with Jest API (easy migration)
- Better TypeScript support out of the box
- Built-in coverage with c8

**Use Cases**:
- Unit tests for utilities (`utils/`, `config/`)
- Database function tests (`db/index.ts`)
- React component tests (with @testing-library/react)
- API route handler tests (with node-mocks-http or supertest)

### 2. Testcontainers (Real Database for Tests)
**Why Testcontainers?**
- Spins up real PostgreSQL in Docker
- No mocking - tests against actual database
- Automatic cleanup after tests
- PostGIS extension support
- Matches production environment exactly

**Alternative**: In-memory SQLite with Drizzle
- **Pros**: Faster, no Docker needed
- **Cons**: SQL dialect differences, no PostGIS, doesn't match production

**Recommendation**: Use Testcontainers for integration tests, skip for unit tests

### 3. Playwright (E2E Tests)
**Why Playwright over Cypress?**
- Better Next.js integration
- Faster parallel execution
- True multi-browser support (Chromium, Firefox, WebKit)
- Better debugging tools
- Auto-wait for elements (less flaky tests)

**Use Cases**:
- Complete user flows (signup → login → create group → verify)
- Form submissions with validation
- Modal interactions
- Authentication flows

### 4. GitHub Actions
**Use Cases**:
- Run tests on every PR
- Run tests on push to main/develop
- Cache dependencies (pnpm)
- Run E2E tests with database
- Generate coverage reports

---

## Implementation Phases

### Phase 1: Setup Vitest (Unit Tests)
**Effort**: ~4-6 hours

**Dependencies**:
```bash
pnpm add -D vitest @vitest/ui @vitest/coverage-v8 \
  @testing-library/react @testing-library/jest-dom \
  @testing-library/user-event happy-dom
```

**Files to Create**:
1. `vitest.config.ts` - Vitest configuration
2. `vitest.setup.ts` - Global test setup
3. `.env.test` - Test environment variables
4. `__tests__/utils/` - Example utility tests
5. Update `package.json` scripts

**Key Configuration**:
```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'happy-dom', // or 'jsdom'
    setupFiles: ['./vitest.setup.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      exclude: [
        'node_modules/',
        '.next/',
        'coverage/',
        '**/*.config.{js,ts}',
        '**/*.d.ts',
      ],
    },
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './'),
    },
  },
});
```

**Example Tests**:
- `utils/validation.test.ts` - Yup schema validation
- `utils/auth/jwt.test.ts` - JWT utilities
- `config/environment.test.ts` - Environment variable parsing
- `components/GroupCard.test.tsx` - React component snapshot

**Scripts**:
```json
{
  "test": "vitest",
  "test:ui": "vitest --ui",
  "test:coverage": "vitest --coverage",
  "test:unit": "vitest run --coverage"
}
```

---

### Phase 2: Database Testing with Testcontainers
**Effort**: ~6-8 hours

**Dependencies**:
```bash
pnpm add -D testcontainers @testcontainers/postgresql
```

**Files to Create**:
1. `__tests__/setup/db-container.ts` - PostgreSQL container setup
2. `__tests__/setup/test-db.ts` - Test database utilities
3. `__tests__/db/groups.test.ts` - Group DB functions tests
4. `__tests__/db/verifications.test.ts` - Verification DB tests
5. `__tests__/db/claims.test.ts` - Claims DB tests

**Database Setup Pattern**:
```typescript
// __tests__/setup/db-container.ts
import { PostgreSqlContainer, StartedPostgreSqlContainer } from '@testcontainers/postgresql';
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { migrate } from 'drizzle-orm/postgres-js/migrator';

let container: StartedPostgreSqlContainer;
let db: ReturnType<typeof drizzle>;

export async function setupTestDatabase() {
  // Start PostgreSQL container with PostGIS
  container = await new PostgreSqlContainer('postgis/postgis:16-3.4')
    .withExposedPorts(5432)
    .start();

  const connectionString = container.getConnectionUri();
  const client = postgres(connectionString);
  db = drizzle(client);

  // Run migrations
  await migrate(db, { migrationsFolder: './drizzle' });

  return { db, connectionString, container };
}

export async function teardownTestDatabase() {
  await container.stop();
}

export async function clearTestDatabase() {
  // Truncate all tables between tests
  await db.execute(`
    TRUNCATE TABLE group_verifications, group_claims, group_admins,
    groups, users CASCADE
  `);
}
```

**Example Test**:
```typescript
// __tests__/db/groups.test.ts
import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import { getUnclaimedGroups, createGroup } from '@/db';

describe('Group Database Functions', () => {
  beforeAll(async () => {
    await setupTestDatabase();
  });

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();
  });

  it('should return only unclaimed groups with no admins', async () => {
    // Seed test data
    const importedGroup = await createGroup({
      name: 'Imported Group',
      createdBy: null, // Imported
      claimedBy: null,  // Unclaimed
    });

    const userCreatedGroup = await createGroup({
      name: 'User Created Group',
      createdBy: 'user-123', // User created
      claimedBy: null,
    });
    // Add admin to user-created group
    await addGroupAdmin(userCreatedGroup.id, 'user-123');

    // Test
    const unclaimedGroups = await getUnclaimedGroups();

    // Assertions
    expect(unclaimedGroups).toHaveLength(1);
    expect(unclaimedGroups[0].id).toBe(importedGroup.id);
    expect(unclaimedGroups[0].claimedBy).toBeNull();
  });

  it('should enforce 30-day verification cooldown', async () => {
    const group = await createGroup({ name: 'Test Group' });
    const user = await createUser({ email: 'test@example.com' });

    // First verification should succeed
    await expect(verifyGroup(user.id, group.id, 'Test verification')).resolves.toBeTruthy();

    // Second verification within 30 days should fail
    const canVerify = await canVerifyGroup(group.id);
    expect(canVerify).toBe(false);
  });
});
```

**Scripts**:
```json
{
  "test:db": "vitest run __tests__/db --coverage",
  "test:integration": "vitest run --coverage"
}
```

**Note**: Testcontainers requires Docker running locally and in CI

---

### Phase 3: API Route Testing
**Effort**: ~8-10 hours

**Dependencies**:
```bash
pnpm add -D supertest node-mocks-http
pnpm add -D @types/supertest
```

**Challenge**: Next.js 15 App Router uses Route Handlers (not Express)
**Solution**: Use `next/server` mocking or test via HTTP with test server

**Approach A: Mock Request/Response (Fast, No Server)**
```typescript
// __tests__/api/groups/verify.test.ts
import { describe, it, expect, vi } from 'vitest';
import { POST } from '@/app/api/groups/[groupId]/verify/route';
import { NextRequest } from 'next/server';

describe('POST /api/groups/[groupId]/verify', () => {
  it('should verify group successfully', async () => {
    // Mock authenticated session
    vi.mock('@/utils/auth/session', () => ({
      getServerSession: () => ({ user: { id: 'user-123' } }),
    }));

    const request = new NextRequest('http://localhost/api/groups/group-123/verify', {
      method: 'POST',
      body: JSON.stringify({ notes: 'Verified contact info' }),
    });

    const response = await POST(request, { params: { groupId: 'group-123' } });
    const data = await response.json();

    expect(response.status).toBe(200);
    expect(data).toHaveProperty('success', true);
  });

  it('should return 429 if group verified within 30 days', async () => {
    // Mock recent verification
    vi.mock('@/db', () => ({
      canVerifyGroup: () => false,
    }));

    const request = new NextRequest('http://localhost/api/groups/group-123/verify', {
      method: 'POST',
    });

    const response = await POST(request, { params: { groupId: 'group-123' } });

    expect(response.status).toBe(429);
  });
});
```

**Approach B: Test with Real Server (Slower, More Realistic)**
```typescript
import { createServer } from 'http';
import { parse } from 'url';
import next from 'next';
import request from 'supertest';

const app = next({ dev: false, dir: '.' });
const handle = app.getRequestHandler();
let server: ReturnType<typeof createServer>;

beforeAll(async () => {
  await app.prepare();
  server = createServer((req, res) => {
    const parsedUrl = parse(req.url!, true);
    handle(req, res, parsedUrl);
  });
});

it('should verify group via HTTP', async () => {
  const response = await request(server)
    .post('/api/groups/group-123/verify')
    .set('Cookie', 'auth-token=...') // Set auth
    .send({ notes: 'Test verification' })
    .expect(200);

  expect(response.body).toHaveProperty('success', true);
});
```

**Recommendation**: Start with Approach A (mocked), add Approach B later if needed

**Files to Create**:
1. `__tests__/api/groups/create.test.ts`
2. `__tests__/api/groups/verify.test.ts`
3. `__tests__/api/groups/claim.test.ts`
4. `__tests__/api/admin/claims/approve.test.ts`
5. `__tests__/api/admin/claims/reject.test.ts`
6. `__tests__/setup/api-helpers.ts` - Auth mocking utilities

**Scripts**:
```json
{
  "test:api": "vitest run __tests__/api --coverage"
}
```

---

### Phase 4: E2E Tests with Playwright
**Effort**: ~10-12 hours

**Dependencies**:
```bash
pnpm create playwright
# or
pnpm add -D @playwright/test
pnpm exec playwright install
```

**Files to Create**:
1. `playwright.config.ts` - Playwright configuration
2. `e2e/setup/db-seed.ts` - Seed test data for E2E
3. `e2e/auth.setup.ts` - Authenticate once, reuse across tests
4. `e2e/group-verification.spec.ts` - Verification flow E2E
5. `e2e/group-claiming.spec.ts` - Claiming flow E2E
6. `e2e/admin-claims.spec.ts` - Admin approval/rejection E2E

**Configuration**:
```typescript
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:8080',
    trace: 'on-first-retry',
  },

  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'Mobile Safari',
      use: { ...devices['iPhone 13'] },
    },
  ],

  webServer: {
    command: 'pnpm dev --port 8080',
    port: 8080,
    reuseExistingServer: !process.env.CI,
  },
});
```

**Example Test**:
```typescript
// e2e/group-verification.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Group Verification Flow', () => {
  test.beforeEach(async ({ page }) => {
    // Login (reuse auth state from setup)
    await page.goto('/groups/test-group-123');
  });

  test('should verify group successfully', async ({ page }) => {
    // Open three-dot menu
    await page.getByRole('button', { name: 'Group actions' }).click();

    // Click "Verify Group"
    await page.getByRole('menuitem', { name: 'Verify Group' }).click();

    // Modal should appear
    await expect(page.getByRole('dialog', { name: 'Verify Group Information' })).toBeVisible();

    // Fill optional notes
    await page.getByLabel('Notes (optional)').fill('Confirmed website is active');

    // Submit
    await page.getByRole('button', { name: 'Verify Group' }).click();

    // Success message should show
    await expect(page.getByText('Thanks for verifying!')).toBeVisible();

    // Modal should close automatically
    await expect(page.getByRole('dialog')).not.toBeVisible({ timeout: 3000 });

    // Verified badge should appear
    await expect(page.getByTitle('Verified Group')).toBeVisible();
  });

  test('should show cooldown message if recently verified', async ({ page }) => {
    // Assume group was just verified in previous test or seed data
    await page.getByRole('button', { name: 'Group actions' }).click();
    await page.getByRole('menuitem', { name: 'Verify Group' }).click();

    // Cooldown message should show
    await expect(page.getByText(/can be verified again in/i)).toBeVisible();

    // Verify button should be disabled
    await expect(page.getByRole('button', { name: 'Verify Group' })).toBeDisabled();
  });
});
```

**Authentication Setup** (run once, reuse):
```typescript
// e2e/auth.setup.ts
import { test as setup } from '@playwright/test';

const authFile = 'playwright/.auth/user.json';

setup('authenticate as regular user', async ({ page }) => {
  await page.goto('/login');
  await page.getByLabel('Email').fill('test@example.com');
  await page.getByLabel('Password').fill('password123');
  await page.getByRole('button', { name: 'Sign In' }).click();

  await page.waitForURL('/');
  await page.context().storageState({ path: authFile });
});
```

**Scripts**:
```json
{
  "test:e2e": "playwright test",
  "test:e2e:ui": "playwright test --ui",
  "test:e2e:debug": "playwright test --debug"
}
```

---

### Phase 5: GitHub Actions CI/CD Integration
**Effort**: ~3-4 hours

**File to Create**: `.github/workflows/test.yml`

```yaml
# .github/workflows/test.yml
name: Tests

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

env:
  NODE_VERSION: '20'
  PNPM_VERSION: '9.12.3'

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Run unit tests
        run: pnpm test:unit
        env:
          NODE_ENV: test

      - name: Upload coverage
        uses: codecov/codecov-action@v4
        with:
          files: ./coverage/coverage-final.json

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgis/postgis:16-3.4
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: quilombo_test
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432

    steps:
      - uses: actions/checkout@v4

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Run migrations
        run: pnpm db:migrate
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/quilombo_test

      - name: Run integration tests
        run: pnpm test:integration
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/quilombo_test
          NODE_ENV: test

  e2e-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgis/postgis:16-3.4
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: quilombo_test
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432

    steps:
      - uses: actions/checkout@v4

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Install Playwright Browsers
        run: pnpm exec playwright install --with-deps chromium

      - name: Run migrations
        run: pnpm db:migrate
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/quilombo_test

      - name: Seed test data
        run: pnpm db:local:seed
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/quilombo_test

      - name: Run E2E tests
        run: pnpm test:e2e
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/quilombo_test
          NEXTAUTH_SECRET: test-secret
          NEXTAUTH_URL: http://localhost:8080

      - name: Upload Playwright Report
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: playwright-report
          path: playwright-report/
          retention-days: 7
```

**Key Features**:
- Separate jobs for unit, integration, and E2E tests
- PostgreSQL service container for integration/E2E tests
- Caching for faster runs
- Coverage upload to Codecov
- Playwright report artifacts
- Runs on PRs and pushes to main/develop

---

## Effort Estimation

| Phase | Description | Effort | Complexity |
|-------|-------------|--------|------------|
| **Phase 1** | Vitest setup + 10-15 unit tests | 4-6 hours | Low |
| **Phase 2** | Testcontainers + DB function tests | 6-8 hours | Medium |
| **Phase 3** | API route tests (10-15 routes) | 8-10 hours | Medium-High |
| **Phase 4** | Playwright + 5-7 E2E flows | 10-12 hours | High |
| **Phase 5** | GitHub Actions CI/CD | 3-4 hours | Medium |
| **Total** | Full testing infrastructure | **31-40 hours** | **~1 week** |

---

## Phased Rollout (Recommended)

### Week 1: Foundation (Phase 1 + 2)
- Setup Vitest
- Write 10-15 utility unit tests
- Setup Testcontainers
- Write database function tests
- **Deliverable**: Unit + integration tests running locally

### Week 2: API & CI (Phase 3 + 5)
- Write API route tests
- Setup GitHub Actions
- **Deliverable**: Tests running in CI on every PR

### Week 3: E2E (Phase 4)
- Setup Playwright
- Write 3-5 critical E2E flows
- Add E2E to GitHub Actions
- **Deliverable**: Full E2E coverage in CI

---

## Alternative: Minimal Setup (8-10 hours)

If you want to start small:

1. **Vitest only** (4-6 hours)
   - Unit tests for utilities
   - Skip database tests initially

2. **GitHub Actions** (2-3 hours)
   - Run unit tests only

3. **Manual E2E** (2-3 hours)
   - Use the manual test plan we created
   - No Playwright setup

**Expand later**: Add database tests and E2E when time permits

---

## Database Strategy: Testcontainers vs In-Memory

### Option A: Testcontainers (Recommended)
**Pros**:
- Real PostgreSQL with PostGIS
- Exact production match
- Tests complex queries accurately

**Cons**:
- Requires Docker
- Slower (1-2 seconds startup per test suite)
- More complex CI setup

### Option B: In-Memory SQLite
**Pros**:
- Fast (no Docker)
- Simple setup

**Cons**:
- SQL dialect differences (PostgreSQL → SQLite)
- No PostGIS support
- May miss production bugs

**Recommendation**: Use Testcontainers. The confidence gain outweighs setup complexity.

---

## Coverage Goals

### Realistic Targets:
- **Unit Tests**: 70%+ coverage
- **Integration Tests**: All DB functions
- **API Tests**: All API routes (20+ routes)
- **E2E Tests**: 5-7 critical flows

### Priority Test Coverage:

**High Priority**:
- Authentication (SIWE, email/password, OAuth)
- Group creation/editing
- Group verification (cooldown logic)
- Group claiming (approval/rejection)
- Authorization checks (admin-only routes)

**Medium Priority**:
- User profile management
- Event creation/editing
- File uploads (logo, images)
- Email sending

**Low Priority**:
- UI component snapshots
- Utility functions (date formatting, etc.)

---

## Cost Considerations

### Development Time:
- **Full setup**: 31-40 hours (~$3,000-$5,000 at contractor rates)
- **Minimal setup**: 8-10 hours (~$800-$1,200)

### CI/CD Costs:
- **GitHub Actions**: Free for public repos, ~$0.008/minute for private
- **Codecov**: Free for open source
- **Testcontainers Cloud** (optional): $29/month for faster CI tests

### ROI:
- Prevents production bugs (invaluable)
- Faster refactoring (confidence to change code)
- Better onboarding (tests as documentation)
- Reduced manual QA time

---

## Next Steps

If you want to proceed, I recommend:

1. **Start with Phase 1** (Vitest + unit tests) - Low risk, high value
2. **Add Phase 2** (Testcontainers) if Docker is acceptable
3. **Integrate Phase 5** (GitHub Actions) early for immediate CI benefits
4. **Defer Phase 4** (Playwright) until critical flows are stable

Would you like me to:
- **A)** Implement Phase 1 (Vitest + unit tests) now?
- **B)** Create detailed setup files for all phases (you implement later)?
- **C)** Focus on something else (Phase 6.2 import script, etc.)?
