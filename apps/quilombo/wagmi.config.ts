import { defineConfig } from '@wagmi/cli';
import { foundry, react } from '@wagmi/cli/plugins';

export default defineConfig({
  out: 'generated/index.ts',
  plugins: [
    foundry({
      project: '../../packages/contracts',
    }),
    react(),
  ],
});
