// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";

contract Deploy is Script {
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  address internal constant wethAddress = 0x7b79995e5f793A07Bc00c21412e50Ecae098E7f9;

  function run() external {
    vm.startBroadcast();
    console.log("AXE Deployer: %s", msg.sender);
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    require(block.chainid == 11155111, "This script is meant for test chains"); // Sepolia

    address factory = deployContract(
      abi.encodePacked(
        getBytecode("../../node_modules/@uniswap/v2-core/build/UniswapV2Factory.json"),
        abi.encode(axeDeployer)
      )
    );
    address router = deployContract(
      abi.encodePacked(
        getBytecode("../../node_modules/@uniswap/v2-periphery/build/UniswapV2Router02.json"),
        abi.encode(factory, wethAddress)
      )
    );

    console.log("Deployed UniswapV2Factory to address %s on network %s", factory, block.chainid);
    console.log("Deployed UniswapV2Router02 to address %s on network %s", router, block.chainid);

    vm.stopBroadcast();
  }

  function deployContract(bytes memory code) internal returns (address addr) {
    assembly {
      addr := create(0, add(code, 0x20), mload(code))
      if iszero(addr) {
        revert(0, 0)
      }
    }
  }

  function getBytecode(string memory filePath) internal returns (bytes memory) {
    string[] memory cmds = new string[](4);
    cmds[0] = "jq";
    cmds[1] = "-j";
    cmds[2] = ".bytecode";
    cmds[3] = filePath;

    return vm.ffi(cmds);
  }
}
