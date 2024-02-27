// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Test, console2 } from "forge-std/Test.sol";

import { AXE } from "../contracts/AXE.sol";

contract CounterTest is Test {
  AXE public axe;

  function setUp() public {
    axe = new AXE(address(this));
  }

  function test_Fee() public {
    // axe.setBuyTax(30);
    // assertEq(axe.buyTax(), 30);
    // vm.expectRevert();
    // axe.setBuyTax(10005);
  }

  // function testFuzz_SetFee(uint256 x) public {
  //     counter.setNumber(x);
  //     assertEq(counter.number(), x);
  // }
}
