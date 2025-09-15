import { type Config, createConfig, http, webSocket } from 'wagmi';
import { type Chain, gnosis, localhost, optimism, sepolia } from 'wagmi/chains';

import ENV, { getBaseUrl } from '@/config/environment';
import { silkInitOptions } from '@/config/silk';
import silk from '@/utils/silk.connector';

declare module 'wagmi' {
  interface Register {
    config: typeof wagmiConfig;
  }
}

// Get origin safely for both client and server environments
export const getOrigin = () => {
  if (typeof window !== 'undefined') {
    return window.location.origin;
  }

  return getBaseUrl();
};

export const configureChains = (): [Chain, ...Chain[]] => {
  let chains: [Chain, ...Chain[]] = [gnosis];
  if (ENV.environment === 'local') chains = [localhost];
  else if (ENV.environment === 'development') chains = [sepolia];
  console.info(`Chains configured for '${ENV.environment}' mode.`);
  return chains;
};

export const getDefaultChain = (): Chain => {
  switch (ENV.environment) {
    case 'local':
      return localhost;
    case 'development':
      return sepolia;
    default:
      return gnosis;
  }
};

export const getTransport = (chain: Chain | undefined) => {
  let url = '';
  switch (chain?.id) {
    case gnosis.id:
      url = ENV.gnosisProviderUrl;
      break;
    case optimism.id:
      url = ENV.optimismProviderUrl;
      break;
    case sepolia.id:
      url = ENV.sepoliaProviderUrl;
      break;
    case localhost.id:
      url = 'http://127.0.0.1:8545';
      break;
    case 31337:
      url = 'http://127.0.0.1:8545';
      break;
    default:
      url = '';
  }
  if (url.startsWith('wss')) return webSocket(url);
  return http(url);
};

/**
 * Default wagmi configuration
 */
const wagmiConfig: Config = createConfig({
  chains: configureChains(),
  connectors: [silk(silkInitOptions)],
  transports: {
    [gnosis.id]: http(ENV.gnosisProviderUrl),
    [sepolia.id]: http(ENV.sepoliaProviderUrl),
    [localhost.id]: http('http://127.0.0.1:8545'),
    [31337 as const]: http('http://127.0.0.1:8545'), // hardhat
  },
  ssr: true,
});

export default wagmiConfig;
