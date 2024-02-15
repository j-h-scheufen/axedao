import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
import '@nomicfoundation/hardhat-foundry';
import '@nomicfoundation/hardhat-ethers';
import '@typechain/hardhat';

import * as dotenv from 'dotenv';
dotenv.config({ path: ['.env.local', '.env'] });

const config: HardhatUserConfig = {
  solidity: '0.8.23',
  networks: {
    hardhat: {
      chainId: 1337,
      forking:
        process.env.FORK?.toLowerCase() === 'true'
          ? {
              url: `${process.env.HTTPS_PROVIDER_URL_GOERLI}`,
              blockNumber: 10542207,
            }
          : undefined,
    },
    goerli: {
      url: `${process.env.HTTPS_PROVIDER_URL_GOERLI}`,
    },
  },
};

export default config;
