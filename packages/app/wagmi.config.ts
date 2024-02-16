import { defineConfig } from '@wagmi/cli';
import { hardhat, react } from '@wagmi/cli/plugins';
// import { gnosis, goerli } from 'wagmi/chains';

export default defineConfig({
  out: 'generated/index.ts',
  plugins: [
    hardhat({
      project: '../contracts',
    }),
    react(),
  ],
});
