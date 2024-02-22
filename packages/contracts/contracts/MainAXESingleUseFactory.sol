// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4 <0.9.0;

import { CREATE3 } from "solmate/src/utils/CREATE3.sol";

import { MainAXE } from "./MainAXE.sol";

contract MainAXESingleUseFactory {
  string internal constant _NAME = unicode"Axé";
  string internal constant _SYMBOL = unicode"AXÉ";
  address public instance;

  /**
   * @notice Deploys an XERC20 contract using CREATE3
   * @param _governor - the DAO's multisig
   * @param _governorTreasury - the DAO's treasury
   * @param _founder - the founder's address for vesting
   */

  constructor(address _governor, address _governorTreasury, address _founder) {
    bytes32 _salt = keccak256(abi.encodePacked(_NAME, _SYMBOL, msg.sender));
    bytes memory _creation = type(MainAXE).creationCode;
    bytes memory _bytecode = abi.encodePacked(
      _creation,
      // constructor arguments
      abi.encode(_governor, _governorTreasury, _founder)
    );
    instance = CREATE3.deploy(_salt, _bytecode, 0);
  }
}
