import { createConfig, http } from 'wagmi';
import { localhost, sepolia, optimism, gnosis, Chain } from 'wagmi/chains';
import { injected } from 'wagmi/connectors';
import { metaMaskWallet, walletConnectWallet } from '@rainbow-me/rainbowkit/wallets';

import ENV from '@/config/environment';
import { connectorsForWallets } from '@rainbow-me/rainbowkit';

const configureChains = (): [Chain, ...Chain[]] => {
  let chains: [Chain, ...Chain[]] = [gnosis];
  const appEnv = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase();
  if (appEnv === 'local') chains = [localhost];
  else if (appEnv === 'test') chains = [sepolia];
  console.info(`Chains configured for '${appEnv}' mode.`);
  return chains;
};

const wagmiConfig = createConfig({
  chains: configureChains(),
  connectors: [
    injected(),
    ...connectorsForWallets(
      [
        {
          groupName: 'Recommended',
          wallets: [metaMaskWallet, walletConnectWallet],
        },
      ],
      {
        appName: 'Quilombo',
        projectId: ENV.walletConnectProjectId,
      },
    ),
    // safe(),
  ],
  transports: {
    [optimism.id]: http(ENV.optimismProviderUrl),
    [gnosis.id]: http(ENV.gnosisProviderUrl),
    [sepolia.id]: http(ENV.sepoliaProviderUrl),
    [localhost.id]: http('http://127.0.0.1:8545'),
  },
  ssr: true,
});

export default wagmiConfig;
