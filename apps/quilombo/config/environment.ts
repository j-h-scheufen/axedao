import type { Address } from 'viem';
import type { EnvType } from '@/types';

type ConfigType = {
  environment: EnvType;
  walletEnvironment: EnvType;
  chainEnvironment: EnvType;
  walletConnectProjectId: string;
  sepoliaProviderUrl: string;
  gnosisProviderUrl: string;
  graphApiKey: string;
  mapTilerKey: string;
  daoAddress: Address;
  daoTreasuryAddress: Address;
  daoSharesAddress: Address;
  daoLootAddress: Address;
  daoTreasuryShamanAddress: Address;
  axeTokenAddress: Address;
  axeTreasuryAddress: Address;
  axeSwapTokenAddress: Address;
  axeMembershipAddress: Address;
  axeMembershipCouncilAddress: Address;
  uniswapV2PairAddress: Address;
  uniswapV2RouterAddress: Address;
  pinataGatewayUrl: string;
  pinataJwt: string;
  pinataFileGroupId: string;
  databaseUrl: string;
  nextAuthSecret: string;
  axeDaoSiteUrl: string;
  axeDaoEmail: string;
  quilomboSignalGroup: string;
  mailjetApiKey: string;
  mailjetApiSecret: string;
  smtpHost: string;
  smtpPort: number;
  googleClientId: string;
  googleClientSecret: string;
};

const envMode: EnvType = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase() as EnvType;

const isServer = typeof window === 'undefined';

export const getBaseUrl = () => {
  let baseUrl: string | undefined;
  if (process.env.NEXT_PUBLIC_VERCEL_URL) {
    baseUrl = `https://${process.env.NEXT_PUBLIC_VERCEL_URL}`;
  } else if (process.env.NEXT_PUBLIC_APP_URL) {
    baseUrl = process.env.NEXT_PUBLIC_APP_URL;
  }
  if (!baseUrl) throw new Error('No base URL found');
  return baseUrl;
};

const ENV: ConfigType = {
  environment: required(envMode, 'NEXT_PUBLIC_APP_ENV') as EnvType,
  walletEnvironment: required(process.env.NEXT_PUBLIC_WALLET_ENV, 'NEXT_PUBLIC_WALLET_ENV') as EnvType,
  chainEnvironment: required(process.env.NEXT_PUBLIC_CHAIN_ENV, 'NEXT_PUBLIC_CHAIN_ENV') as EnvType,
  walletConnectProjectId: required(
    process.env.NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID,
    'NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID'
  ),
  sepoliaProviderUrl:
    envMode === 'development'
      ? required(process.env.NEXT_PUBLIC_SEPOLIA_PROVIDER, 'NEXT_PUBLIC_SEPOLIA_PROVIDER')
      : process.env.NEXT_PUBLIC_SEPOLIA_PROVIDER || '',
  gnosisProviderUrl:
    envMode === 'production'
      ? required(process.env.NEXT_PUBLIC_GNOSIS_PROVIDER, 'NEXT_PUBLIC_GNOSIS_PROVIDER')
      : process.env.NEXT_PUBLIC_GNOSIS_PROVIDER || '',
  axeTokenAddress: required(process.env.NEXT_PUBLIC_AXE_TOKEN_ADDRESS, 'NEXT_PUBLIC_AXE_TOKEN_ADDRESS') as Address,
  daoAddress: required(process.env.NEXT_PUBLIC_DAO_ADDRESS, 'NEXT_PUBLIC_DAO_ADDRESS') as Address,
  axeTreasuryAddress: required(
    process.env.NEXT_PUBLIC_AXE_TREASURY_ADDRESS,
    'NEXT_PUBLIC_AXE_TREASURY_ADDRESS'
  ) as Address,
  daoTreasuryAddress: required(
    process.env.NEXT_PUBLIC_DAO_TREASURY_ADDRESS,
    'NEXT_PUBLIC_DAO_TREASURY_ADDRESS'
  ) as Address,
  daoSharesAddress: required(process.env.NEXT_PUBLIC_DAO_SHARES_ADDRESS, 'NEXT_PUBLIC_DAO_SHARES_ADDRESS') as Address,
  daoLootAddress: required(process.env.NEXT_PUBLIC_DAO_LOOT_ADDRESS, 'NEXT_PUBLIC_DAO_LOOT_ADDRESS') as Address,
  daoTreasuryShamanAddress: required(
    process.env.NEXT_PUBLIC_DAO_TREASURY_SHAMAN_ADDRESS,
    'NEXT_PUBLIC_DAO_TREASURY_SHAMAN_ADDRESS'
  ) as Address,
  axeSwapTokenAddress: required(
    process.env.NEXT_PUBLIC_AXE_SWAP_TOKEN_ADDRESS,
    'NEXT_PUBLIC_AXE_SWAP_TOKEN_ADDRESS'
  ) as Address,
  axeMembershipAddress: required(
    process.env.NEXT_PUBLIC_AXE_MEMBERSHIP_ADDRESS,
    'NEXT_PUBLIC_AXE_MEMBERSHIP_ADDRESS'
  ) as Address,
  axeMembershipCouncilAddress: required(
    process.env.NEXT_PUBLIC_AXE_MEMBERSHIP_COUNCIL_ADDRESS,
    'NEXT_PUBLIC_AXE_MEMBERSHIP_COUNCIL_ADDRESS'
  ) as Address,
  uniswapV2PairAddress: required(
    process.env.NEXT_PUBLIC_UNISWAPV2PAIR_ADDRESS,
    'NEXT_PUBLIC_UNISWAPV2PAIR_ADDRESS'
  ) as Address,
  uniswapV2RouterAddress: required(
    process.env.NEXT_PUBLIC_UNISWAPV2ROUTER_ADDRESS,
    'NEXT_PUBLIC_UNISWAPV2ROUTER_ADDRESS'
  ) as Address,
  pinataGatewayUrl: required(process.env.NEXT_PUBLIC_PINATA_GATEWAY_URL, 'NEXT_PUBLIC_PINATA_GATEWAY_URL'),
  pinataJwt: isServer ? required(process.env.PINATA_JWT, 'PINATA_JWT') : '',
  pinataFileGroupId: required(process.env.NEXT_PUBLIC_PINATA_FILE_GROUP_ID, 'NEXT_PUBLIC_PINATA_FILE_GROUP_ID'),
  databaseUrl: isServer ? required(process.env.DATABASE_URL, 'DATABASE_URL') : '',
  nextAuthSecret: isServer ? required(process.env.NEXTAUTH_SECRET, 'NEXTAUTH_SECRET') : '',
  graphApiKey: isServer ? required(process.env.GRAPH_API_KEY, 'GRAPH_API_KEY') : '',
  mapTilerKey: required(process.env.NEXT_PUBLIC_MAPTILER_KEY, 'NEXT_PUBLIC_MAPTILER_KEY'),
  axeDaoSiteUrl: required(process.env.NEXT_PUBLIC_DAO_SITE_URL, 'NEXT_PUBLIC_DAO_SITE_URL'),
  axeDaoEmail: required(process.env.NEXT_PUBLIC_DAO_EMAIL, 'NEXT_PUBLIC_DAO_EMAIL'),
  quilomboSignalGroup: required(process.env.NEXT_PUBLIC_SIGNAL_GROUP, 'NEXT_PUBLIC_SIGNAL_GROUP'),
  mailjetApiKey:
    isServer && envMode !== 'local' && envMode !== 'development'
      ? required(process.env.MAILJET_API_KEY, 'MAILJET_API_KEY')
      : '',
  mailjetApiSecret:
    isServer && envMode !== 'local' && envMode !== 'development'
      ? required(process.env.MAILJET_API_SECRET, 'MAILJET_API_SECRET')
      : '',
  smtpHost: isServer && envMode === 'local' ? required(process.env.SMTP_HOST, 'SMTP_HOST') : 'localhost',
  smtpPort: isServer && envMode === 'local' ? Number(required(process.env.SMTP_PORT, 'SMTP_PORT')) : 2500,
  googleClientId: isServer ? required(process.env.GOOGLE_CLIENT_ID, 'GOOGLE_CLIENT_ID') : '',
  googleClientSecret: isServer ? required(process.env.GOOGLE_CLIENT_SECRET, 'GOOGLE_CLIENT_SECRET') : '',
};

function required(value: string | undefined, name: string): string {
  if (!value) {
    throw new Error(`Missing required environment variable ${name}`);
  }
  return value;
}

export default ENV;
