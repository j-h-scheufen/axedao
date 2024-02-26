import { createConfig, http } from 'wagmi';
import { localhost, sepolia, optimism, gnosis, Chain } from 'wagmi/chains';
import { injected, walletConnect } from 'wagmi/connectors';

import ENV from '@/config/environment';

const configureChains = (): [Chain, ...Chain[]] => {
  let chains: [Chain, ...Chain[]] = [gnosis];
  const appEnv = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase();
  if (appEnv === 'local') chains = [localhost];
  else if (appEnv === 'test') chains = [sepolia];
  console.log(`Chains configured for '${appEnv}' mode.`);
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
    [optimism.id]: http(),
    [gnosis.id]: http(),
    [sepolia.id]: http(),
    [localhost.id]: http(),
  },
  ssr: true,
});

export default wagmiConfig;
