import { Address } from 'viem';

type ConfigType = {
  walletConnectProjectId: string;
  axeTokenAddress: Address;
  axeDaoAddress: Address;
  axeTreasuryAddress: Address;
  axeDaoSharesAddress: Address;
  axeDaoLootAddress: Address;
};

const ENV: ConfigType = {
  walletConnectProjectId: required(
    process.env.NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID,
    'NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID',
  ),
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
};

function required(value: string | undefined, name: string): string {
  if (!value) {
    throw new Error(`Missing required environment variable ${name}`);
  }
  return value;
}

export default ENV;
