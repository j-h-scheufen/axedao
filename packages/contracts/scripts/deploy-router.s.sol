// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";
import { UniswapV2Factory } from "@uniswap/v2-core/contracts/UniswapV2Factory.sol";
import { UniswapV2Router02 } from "@uniswap/v2-periphery/contracts/UniswapV2Router02.sol";

contract Deploy is Script {
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  address internal constant wethAddress = 0x7b79995e5f793A07Bc00c21412e50Ecae098E7f9;

  function run() external {
    vm.startBroadcast();
    console.log("AXE Deployer: %s", msg.sender);
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    require(block.chainid == 11155111, "This script is meant for test chains"); // Sepolia

    address factory = new UniswapV2Factory(axeDeployer);
    address router = new UniswapV2Router02(factory, wethAddress);

    console.log("Deployed UniswapV2Factory to address %s on network %s", factory, block.chainid);
    console.log("Deployed UniswapV2Router02 to address %s on network %s", router, block.chainid);

    vm.stopBroadcast();
  }
}
