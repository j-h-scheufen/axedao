import { Address } from 'viem';

export const vars = {
  WALLET_CONNECT_PROJECT_ID: 'NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID',
};

type ConfigType = {
  walletConnectProjectId: string;
  axeTokenAddress: Address;
  axeDaoAddress: Address;
  axeTreasuryAddress: Address;
  axeDaoSharesAddress: Address;
  axeDaoLootAddress: Address;
};

export const getEnvironmentVariable = (environmentVariable: string): string => {
  const unvalidatedEnvironmentVariable = process.env[environmentVariable];
  if (!unvalidatedEnvironmentVariable) {
    throw new Error(
      `Couldn't find environment variable: ${environmentVariable}`
    );
  } else {
    return unvalidatedEnvironmentVariable;
  }
};

export const config: ConfigType = {
  walletConnectProjectId:
    process.env.NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID || '',
  axeTokenAddress: process.env.NEXT_PUBLIC_AXE_TOKEN_ADDRESS as Address,
  axeDaoAddress: process.env.NEXT_PUBLIC_AXE_DAO_ADDRESS as Address,
  axeTreasuryAddress: process.env.NEXT_PUBLIC_AXE_TREASURY_ADDRESS as Address,
  axeDaoSharesAddress: process.env
    .NEXT_PUBLIC_AXE_DAO_SHARES_ADDRESS as Address,
  axeDaoLootAddress: process.env.NEXT_PUBLIC_AXE_DAO_LOOT_ADDRESS as Address,
};

console.log('CONFIG:', config);
