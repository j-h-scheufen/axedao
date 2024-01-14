// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";

import {AXE2} from "../contracts/AXE2.sol";

contract CounterTest is Test {
    AXE2 public axe;

    function setUp() public {
        axe = new AXE2();
    }

    function test_Fee() public {
        axe.setFee(0);
        assertEq(axe.swapFee(), 0);
        vm.expectRevert();
        axe.setFee(10005);
    }

    // function testFuzz_SetFee(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
