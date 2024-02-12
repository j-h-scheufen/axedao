export const vars = {
  WALLET_CONNECT_PROJECT_ID: 'NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID',
};

type ConfigType = {
  walletConnectProjectId: string;
  axeTokenAddress: string;
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
  axeTokenAddress: process.env.NEXT_PUBLIC_AXE_TOKEN_ADDRESS || '',
};

console.log('conig:', config);
