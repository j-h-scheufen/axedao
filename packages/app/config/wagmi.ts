import { createConfig, http } from 'wagmi';
import { localhost, Chain } from 'wagmi/chains';
import { injected, walletConnect } from 'wagmi/connectors';

import ENV from '@/config/environment';

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
    walletConnect({ projectId: ENV.walletConnectProjectId }),
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
