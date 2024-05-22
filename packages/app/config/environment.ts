import { Address } from 'viem';

type ConfigType = {
  walletConnectProjectId: string;
  sepoliaProviderUrl: string;
  gnosisProviderUrl: string;
  optimismProviderUrl: string;
  axeTokenAddress: Address;
  axeDaoAddress: Address;
  axeTreasuryAddress: Address;
  axeDaoSharesAddress: Address;
  axeDaoLootAddress: Address;
  axeSwapTokenAddress: Address;
  uniswapV2PairAddress: Address;
  uniswapV2RouterAddress: Address;
  databaseUrl: string;
};

const envMode = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase();

const ENV: ConfigType = {
  walletConnectProjectId: required(
    process.env.NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID,
    'NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID',
  ),
  sepoliaProviderUrl:
    envMode === 'test'
      ? required(process.env.NEXT_PUBLIC_SEPOLIA_PROVIDER, 'NEXT_PUBLIC_SEPOLIA_PROVIDER')
      : process.env.NEXT_PUBLIC_SEPOLIA_PROVIDER || '',
  gnosisProviderUrl:
    envMode === 'prod'
      ? required(process.env.NEXT_PUBLIC_GNOSIS_PROVIDER, 'NEXT_PUBLIC_GNOSIS_PROVIDER')
      : process.env.NEXT_PUBLIC_GNOSIS_PROVIDER || '',
  optimismProviderUrl:
    envMode === 'prod'
      ? required(process.env.NEXT_PUBLIC_OP_PROVIDER, 'NEXT_PUBLIC_OP_PROVIDER')
      : process.env.NEXT_PUBLIC_OP_PROVIDER || '',
  axeTokenAddress: required(process.env.NEXT_PUBLIC_AXE_TOKEN_ADDRESS, 'NEXT_PUBLIC_AXE_TOKEN_ADDRESS') as Address,
  axeDaoAddress: required(process.env.NEXT_PUBLIC_AXE_DAO_ADDRESS, 'NEXT_PUBLIC_AXE_DAO_ADDRESS') as Address,
  axeTreasuryAddress: required(
    process.env.NEXT_PUBLIC_AXE_TREASURY_ADDRESS,
    'NEXT_PUBLIC_AXE_TREASURY_ADDRESS',
  ) as Address,
  axeDaoSharesAddress: required(
    process.env.NEXT_PUBLIC_AXE_DAO_SHARES_ADDRESS,
    'NEXT_PUBLIC_AXE_DAO_SHARES_ADDRESS',
  ) as Address,
  axeDaoLootAddress: required(
    process.env.NEXT_PUBLIC_AXE_DAO_LOOT_ADDRESS,
    'NEXT_PUBLIC_AXE_DAO_LOOT_ADDRESS',
  ) as Address,
  axeSwapTokenAddress: required(
    process.env.NEXT_PUBLIC_AXE_SWAP_TOKEN_ADDRESS,
    'NEXT_PUBLIC_AXE_SWAP_TOKEN_ADDRESS',
  ) as Address,
  uniswapV2PairAddress: required(
    process.env.NEXT_PUBLIC_UNISWAPV2PAIR_ADDRESS,
    'NEXT_PUBLIC_UNISWAPV2PAIR_ADDRESS',
  ) as Address,
  uniswapV2RouterAddress: required(
    process.env.NEXT_PUBLIC_UNISWAPV2ROUTER_ADDRESS,
    'NEXT_PUBLIC_UNISWAPV2ROUTER_ADDRESS',
  ) as Address,
  databaseUrl: required(process.env.DATABASE_URL, 'DATABASE_URL'),
};

function required(value: string | undefined, name: string): string {
  if (!value) {
    throw new Error(`Missing required environment variable ${name}`);
  }
  return value;
}

export default ENV;
