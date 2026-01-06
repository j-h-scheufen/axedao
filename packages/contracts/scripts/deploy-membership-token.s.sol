// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";

import { AxeMembership } from "../contracts/tokens/AxeMembership.sol";

contract Deploy is Script {
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  string internal constant ipfsUrl = "ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json";

  function run() external {
    address owner = vm.envAddress("DAO_TREASURY_ADDRESS");
    address receiver = vm.envAddress("AXE_TREASURY_ADDRESS");
    address daoConfig = vm.envAddress("DAO_CONFIG_ADDRESS");
    uint256 multiplier = vm.envOr("MEMBERSHIP_MULTIPLIER", uint256(10e18)); // Default: 10 base units

    require(owner != address(0), "ENV var for owner is not set!");
    require(receiver != address(0), "ENV var for receiver is not set!");
    require(daoConfig != address(0), "ENV var for DaoConfig is not set!");
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    console.log("AXE Deployer: %s", msg.sender);
    console.log("Owner: %s", owner);
    console.log("Receiver: %s", receiver);
    console.log("DaoConfig: %s", daoConfig);
    console.log("Multiplier: %s", multiplier);

    vm.startBroadcast();
    AxeMembership instance = new AxeMembership(owner, receiver, daoConfig, multiplier, ipfsUrl);
    vm.stopBroadcast();

    console.log("Deployed MembershipToken to address %s on network %s", address(instance), block.chainid);
  }
}
