import '@testing-library/jest-dom/vitest';
import { beforeAll, afterEach, afterAll, vi } from 'vitest';
import { cleanup } from '@testing-library/react';

// Load test environment variables
import dotenv from 'dotenv';
import path from 'node:path';

dotenv.config({ path: path.resolve(__dirname, '.env.test') });

// Extend timeout for tests that might take longer (e.g., database operations)
beforeAll(() => {
  // Set up any global test configuration
});

// Cleanup after each test case (e.g., clearing DOM)
afterEach(() => {
  cleanup();
  vi.clearAllMocks();
});

// Global teardown
afterAll(() => {
  // Clean up any global resources
});

// Mock Next.js router
vi.mock('next/navigation', () => ({
  useRouter: () => ({
    push: vi.fn(),
    replace: vi.fn(),
    prefetch: vi.fn(),
  }),
  useSearchParams: () => ({
    get: vi.fn(),
  }),
  usePathname: () => '',
  notFound: vi.fn(() => {
    throw new Error('NEXT_NOT_FOUND');
  }),
}));

// Mock Next.js server functions
vi.mock('next/server', async () => {
  const actual = await vi.importActual('next/server');
  return {
    ...actual,
    NextRequest: vi.fn(),
    NextResponse: {
      json: vi.fn((data, init) => ({
        json: async () => data,
        status: init?.status || 200,
        ok: (init?.status || 200) < 400,
        headers: new Headers(init?.headers || {}),
      })),
      next: vi.fn(),
    },
  };
});
