// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/console.sol";
import { Script } from "forge-std/Script.sol";
import { ICREATE3Factory } from "create3-factory/ICREATE3Factory.sol";

import { MainAXE } from "../contracts/MainAXE.sol";
import { AXE } from "../contracts/AXE.sol";

contract Deploy is Script {
  address internal constant create3Factory = 0x93FEC2C00BfE902F733B57c5a6CeeD7CD1384AE1;
  address internal constant axeDeployer = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  address internal constant axeTarget = 0x6F03d8D0c9c2660A1D228f1f33cD34a6c47457E3;
  string internal constant _LADAINHA =
    unicode"Iê Maior é Deus - Maior é Deus, pequeno sou eu - (Tudo) O que eu tenho foi Deus que me deu - (Tudo) O que eu tenho foi Deus que me deu - Na roda da capoeira (Hahá!) Grande e pequeno sou eu - Camará…";

  function run() external {
    address governor = vm.envAddress("DAO_ADDRESS");
    address governorTreasury = vm.envAddress("TREASURY_ADDRESS");
    address founder = vm.envAddress("FOUNDER_ADDRESS");

    vm.startBroadcast();
    console.log("AXE Deployer: %s", msg.sender);
    require(msg.sender == axeDeployer, "Wrong AXE deployer account!");

    bool main = block.chainid == 100; // Gnosis
    // The creation of AXE is salted with a ladainha and the msg.sender
    bytes32 _salt = keccak256(abi.encodePacked(_LADAINHA, msg.sender));
    bytes memory _creation = main ? type(MainAXE).creationCode : type(AXE).creationCode;
    bytes memory _initParams = main
      ? abi.encode(governor, governorTreasury, founder)
      : abi.encode(governor, governorTreasury);
    bytes memory _bytecode = abi.encodePacked(_creation, _initParams);

    address instance = ICREATE3Factory(create3Factory).deploy(_salt, _bytecode);
    require(instance == axeTarget, "CREATE3 did not generate the expected target address!");

    string memory axeType = main ? "MainAXE" : "AXE";
    console.log("Deployed %s to address %s on network %s", axeType, instance, block.chainid);

    vm.stopBroadcast();
  }
}
