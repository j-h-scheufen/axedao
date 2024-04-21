import { defineConfig } from '@wagmi/cli';
import { hardhat, react } from '@wagmi/cli/plugins';

export default defineConfig({
  out: 'generated/index.ts',
  plugins: [
    hardhat({
      project: '../contracts',
    }),
    react(),
  ],
});
