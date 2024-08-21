import { metaMaskWallet, walletConnectWallet } from '@rainbow-me/rainbowkit/wallets';
import { createConfig, http } from 'wagmi';
import { Chain, gnosis, localhost, optimism, sepolia } from 'wagmi/chains';
import { MetaMaskParameters, injected, metaMask } from 'wagmi/connectors';

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

const metaMaskConfig: MetaMaskParameters = {
  dappMetadata: {
    name: 'Axé DAO',
  },
  // infuraAPIKey: "YOUR-API-KEY",
};

const wagmiConfig = createConfig({
  chains: configureChains(),
  connectors: [
    injected(),
    metaMask(metaMaskConfig),
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
