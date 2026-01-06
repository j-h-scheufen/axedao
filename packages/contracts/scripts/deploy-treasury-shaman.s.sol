// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";

import { TreasuryShaman } from "../contracts/baal/TreasuryShaman.sol";

contract Deploy is Script {
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;

  function run() external {
    address owner = vm.envAddress("DAO_TREASURY_ADDRESS");
    address baal = vm.envAddress("DAO_ADDRESS");
    address daoConfig = vm.envAddress("DAO_CONFIG_ADDRESS");
    address depositReceiver = vm.envAddress("DAO_TREASURY_ADDRESS");
    uint256 multiplier = vm.envOr("TREASURY_SHAMAN_MULTIPLIER", uint256(1e18)); // Default: 1:1

    require(owner != address(0), "ENV var for owner is not set!");
    require(baal != address(0), "ENV var for Baal is not set!");
    require(daoConfig != address(0), "ENV var for DaoConfig is not set!");
    require(depositReceiver != address(0), "ENV var for deposit receiver is not set!");
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    console.log("AXE Deployer: %s", msg.sender);
    console.log("Baal: %s", baal);
    console.log("Owner: %s", owner);
    console.log("DaoConfig: %s", daoConfig);
    console.log("Deposit Receiver: %s", depositReceiver);
    console.log("Multiplier: %s", multiplier);

    vm.startBroadcast();
    TreasuryShaman instance = new TreasuryShaman(baal, daoConfig, depositReceiver, multiplier, owner);
    vm.stopBroadcast();

    console.log("Deployed TreasuryShaman to address %s on network %s", address(instance), block.chainid);
  }
}
