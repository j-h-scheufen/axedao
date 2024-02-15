import { defineConfig } from '@wagmi/cli';
import { react } from '@wagmi/cli/plugins';
import { erc20Abi } from 'viem';
// import { gnosis, goerli } from 'wagmi/chains';

export default defineConfig({
  out: 'generated/index.ts',
  contracts: [
    {
      name: 'erc20',
      abi: erc20Abi,
    },
  ],
  plugins: [react()],
});
