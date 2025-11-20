import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
import path from 'node:path';

export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'happy-dom',
    setupFiles: ['./vitest.setup.ts'],
    // Only include integration tests
    include: ['**/*.integration.test.{ts,tsx}'],
    // Longer timeout for integration tests (Docker startup, etc.)
    testTimeout: 120_000, // 2 minutes per test
    hookTimeout: 120_000, // 2 minutes for before/after hooks
    // Run test files sequentially to avoid global.database conflicts
    fileParallelism: false,
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './'),
    },
  },
});
