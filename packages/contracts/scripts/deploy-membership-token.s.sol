// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";

import { AxeMembership } from "../contracts/tokens/AxeMembership.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

contract Deploy is Script {
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  string internal constant ipfsUrl = "ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json";

  function run() external {
    address owner = vm.envAddress("DAO_TREASURY_ADDRESS");
    address receiver = vm.envAddress("AXE_TREASURY_ADDRESS");
    address donationToken = vm.envAddress("AXE_SWAP_TOKEN_ADDRESS");
    uint256 donationAmount = 10 * 10 ** IERC20Metadata(donationToken).decimals(); // should be a USD stable coin $10
    // uint256 nativeDonationAmount = 10 ether; // 10 XDAI on Gnosis
    uint256 nativeDonationAmount = 0.0001 ether; // test ETH on Sepolia

    require(owner != address(0), "ENV var for owner is not set!");
    require(receiver != address(0), "ENV var for receiver is not set!");
    require(donationToken != address(0), "ENV var for donation token is not set!");
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    console.log("AXE Deployer: %s", msg.sender);
    console.log("Owner: %s", owner);
    console.log("Receiver: %s", receiver);
    console.log("Donation token: %s", donationToken);
    console.log("Donation amount: %s", donationAmount);
    console.log("Native donation amount: %s", nativeDonationAmount);

    vm.startBroadcast();
    AxeMembership instance = new AxeMembership(
      owner,
      receiver,
      donationToken,
      donationAmount,
      nativeDonationAmount,
      ipfsUrl
    );
    vm.stopBroadcast();

    console.log("Deployed MembershipToken to address %s on network %s", address(instance), block.chainid);
  }
}
