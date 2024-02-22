// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import { MainAXE } from "../contracts/MainAXE.sol";

contract MyScript is Script {
  string internal constant _NAME = unicode"Axé";
  string internal constant _SYMBOL = unicode"AXÉ";
  string internal constant _SALT =
    unicode"Iê Maior é Deus - Maior é Deus, pequeno sou eu - (Tudo) O que eu tenho foi Deus que me deu - (Tudo) O que eu tenho foi Deus que me deu - Na roda da capoeira (Hahá!) Grande e pequeno sou eu - Camará…";

  function run() external {
    uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
    vm.startBroadcast(deployerPrivateKey);

    MainAXE = new MainAXE();
    vm.stopBroadcast();
  }
}
