// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4 <0.9.0;

import { CreatorBoundCreate3 } from "./utils/CreatorBoundCreate3.sol";
import { MainAXE } from "./MainAXE.sol";
import { AXE } from "./AXE.sol";

contract MainAXESingleUseFactory {
  string internal constant _NAME = unicode"Axé";
  string internal constant _SYMBOL = unicode"AXÉ";
  string internal constant _SALT =
    unicode"Iê Maior é Deus - Maior é Deus, pequeno sou eu - (Tudo) O que eu tenho foi Deus que me deu - (Tudo) O que eu tenho foi Deus que me deu - Na roda da capoeira (Hahá!) Grande e pequeno sou eu - Camará…";
  address public instance;
  address internal creator;

  constructor() {
    creator = msg.sender;
  }

  /**
   * @notice Deploys AXE or MainAXE using CREATE3
   * @param _governor - the DAO's multisig
   * @param _governorTreasury - the DAO's treasury
   * @param _founder - the founder's address for vesting
   */
  function deploy(address _governor, address _governorTreasury, address _founder) external {
    bool main = block.chainid == 100; // Gnosis
    bytes32 _salt = keccak256(abi.encodePacked(_NAME, _SYMBOL, _SALT));
    bytes memory _creation = main ? type(MainAXE).creationCode : type(AXE).creationCode;
    bytes memory _initParams = main
      ? abi.encode(_governor, _governorTreasury, _founder)
      : abi.encode(_governor, _governorTreasury);
    bytes memory _bytecode = abi.encodePacked(_creation, _initParams);
    instance = CreatorBoundCreate3.create3(_salt, _bytecode);
  }
}
