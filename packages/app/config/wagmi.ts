import { createConfig, http } from 'wagmi';
import { optimism, gnosis, goerli, localhost, Chain } from 'wagmi/chains';
import { injected, safe, walletConnect } from 'wagmi/connectors';

import { config as env } from '@/config/environment';

const configureChains = (): [Chain, ...Chain[]] => {
  const chains: [Chain, ...Chain[]] = [localhost];
  // if (process.env.NEXT_PUBLIC_CHAINS_ENABLE_TESTNETS?.toLowerCase() === 'true')
  //   chains.concat([goerli]);
  // if (process.env.NEXT_PUBLIC_CHAINS_ENABLE_LOCALHOST?.toLowerCase() === 'true')
  //   chains.concat([localhost]);
  return chains;
};

const wagmiConfig = createConfig({
  chains: configureChains(),
  connectors: [
    injected(),
    // walletConnect({ projectId: env.walletConnectProjectId }),
    // safe(),
  ],
  transports: {
    // [optimism.id]: http(),
    // [gnosis.id]: http(),
    // [goerli.id]: http(),
    [localhost.id]: http(),
  },
  ssr: true,
});

export default wagmiConfig;
