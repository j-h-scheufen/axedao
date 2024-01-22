import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
import '@nomicfoundation/hardhat-foundry';
import '@nomicfoundation/hardhat-ethers';
import '@typechain/hardhat';

const config: HardhatUserConfig = {
  solidity: '0.8.23',
};

export default config;
