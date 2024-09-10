import { Transport } from 'viem';
import { Config, createConfig, http } from 'wagmi';
import { Chain, gnosis, localhost, optimism, sepolia } from 'wagmi/chains';
import { injected } from 'wagmi/connectors';

import ENV from '@/config/environment';

export const configureChains = (): [Chain, ...Chain[]] => {
  let chains: [Chain, ...Chain[]] = [gnosis];
  const appEnv = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase();
  if (appEnv === 'local') chains = [localhost];
  else if (appEnv === 'test') chains = [sepolia];
  console.info(`Chains configured for '${appEnv}' mode.`);
  return chains;
};

export const getTransport = (chain: Chain): Transport => {
  switch (chain.id) {
    case gnosis.id:
      return http(ENV.gnosisProviderUrl);
    case optimism.id:
      return http(ENV.optimismProviderUrl);
    case sepolia.id:
      return http(ENV.sepoliaProviderUrl);
    case localhost.id:
      return http('http://127.0.0.1:8545');
    default:
      return http();
  }
};

export const createSilkConfig = (): Config => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const isSilkAvailable = typeof window !== 'undefined' && typeof (window as any).silk !== 'undefined';
  return createConfig({
    chains: configureChains(),
    connectors: isSilkAvailable
      ? [
          injected({
            target() {
              return {
                id: 'silkProvider',
                name: 'Silk Secure Provider',
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                provider: (window as any).silk,
              };
            },
          }),
        ]
      : [],
    transports: {
      [optimism.id]: http(ENV.optimismProviderUrl),
      [gnosis.id]: http(ENV.gnosisProviderUrl),
      [sepolia.id]: http(ENV.sepoliaProviderUrl),
      [localhost.id]: http('http://127.0.0.1:8545'),
    },
  });
};

/**
 * Default wagmi configuration
 */
const wagmiConfig: Config = createConfig({
  chains: configureChains(),
  connectors: [],
  transports: {
    [optimism.id]: http(ENV.optimismProviderUrl),
    [gnosis.id]: http(ENV.gnosisProviderUrl),
    [sepolia.id]: http(ENV.sepoliaProviderUrl),
    [localhost.id]: http('http://127.0.0.1:8545'),
  },
  ssr: true,
});

export default wagmiConfig;
