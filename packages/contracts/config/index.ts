import 'dotenv/config';

export const vars = {
  DEPLOYER_KEY: 'DEPLOYER_PRIVATE_KEY',
  DAO_ADDRESS: 'DAO_ADDRESS',
  TREASURY_ADDRESS: 'TREASURY_ADDRESS',
  FOUNDER_ADDRESS: 'FOUNDER_ADDRESS',
};

export const getEnvironmentVariable = (environmentVariable: string): string => {
  const unvalidatedEnvironmentVariable = process.env[environmentVariable];
  if (!unvalidatedEnvironmentVariable) {
    throw new Error(`Couldn't find environment variable: ${environmentVariable}`);
  }
  return unvalidatedEnvironmentVariable;
};

export const config = {
  httpsProviderUrlGoerli: getEnvironmentVariable('HTTPS_PROVIDER_URL_GOERLI'),
};
