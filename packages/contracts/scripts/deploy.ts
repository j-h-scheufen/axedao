import { ethers, network } from 'hardhat';

import { getEnvironmentVariable, vars } from '../config';

async function main() {
  const daoAddress = getEnvironmentVariable(vars.DAO_ADDRESS);
  const treasuryAddress = getEnvironmentVariable(vars.TREASURY_ADDRESS);
  const founderAddress = getEnvironmentVariable(vars.FOUNDER_ADDRESS);
  let deployer;
  if (network.name == 'hardhat') {
    console.log('HARDHAT Deployment');
    [deployer] = await ethers.getSigners();
  } else {
    console.log('Network Deployment:', network.name);
    deployer = await new ethers.Wallet(getEnvironmentVariable(vars.DEPLOYER_KEY), ethers.provider);
  }

  const deployerBalance = await ethers.provider.getBalance(deployer.address);
  if (deployerBalance === BigInt(0)) {
    throw new Error(`Deployer account ${deployer.address} has a zero balance. Make sure you\'re on the right network!`);
  }

  const axe = await ethers.deployContract('AXE', [founderAddress, daoAddress, treasuryAddress], {
    signer: deployer,
  });

  await axe.waitForDeployment();

  console.log(`AXE deployed to address: ${axe.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
