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
      forking: !process.env.FORK
        ? undefined
        : {
            url: `${process.env.HTTPS_PROVIDER_URL_GOERLI}`,
            blockNumber: 10447855,
          },
    },
    goerli: {
      url: `${process.env.HTTPS_PROVIDER_URL_GOERLI}`,
    },
  },
};

export default config;
