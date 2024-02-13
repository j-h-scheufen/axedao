import { createConfig, http } from 'wagmi';
import { optimism, gnosis, goerli, localhost } from 'wagmi/chains';
import { injected, safe, walletConnect } from 'wagmi/connectors';

import { config as env } from '@/config/environment';

const wagmiConfig = createConfig({
  chains: [optimism, gnosis, goerli, localhost],
  connectors: [
    injected(),
    walletConnect({ projectId: env.walletConnectProjectId }),
    safe(),
  ],
  transports: {
    [optimism.id]: http(),
    [gnosis.id]: http(),
    [goerli.id]: http(),
    [localhost.id]: http(),
  },
});

export default wagmiConfig;
