// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import { IBaal } from "@daohaus/baal-contracts/contracts/interfaces/IBaal.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { IAXE } from "../contracts/interfaces/IAXE.sol";

/**
 * @notice Tests the lifecycle of an issuance proposal, i.e. a DAO proposal to
 */
contract ProposalIssuance is Test {
  event AxeIssued(uint256 _amount);
  event LiquidationSettingsChanged(address router, address swapToken, address pair);

  // The below addresses are available on Sepolia after block 5411000
  address axeToken = 0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895;
  address shareholder = 0x6EF543d0Cce1171F696f82cB6f698133037d5b32;
  address dao = 0x1c3ac998b698206CD2fb22bb422Bf14367470866;
  address treasury = 0x114D5F3904dB2b4635528C08b1687ECB5468EE17;
  address router = 0xB26B2De65D07eBB5E54C7F6282424D3be670E1f0;
  address swapToken = 0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B;

  enum ProposalState {
    Unborn /* 0 - can submit */,
    Submitted /* 1 - can sponsor -> voting */,
    Voting /* 2 - can be cancelled, otherwise proceeds to grace */,
    Cancelled /* 3 - terminal state, counts as processed */,
    Grace /* 4 - proceeds to ready/defeated */,
    Ready /* 5 - can be processed */,
    Processed /* 6 - terminal state */,
    Defeated /* 7 - terminal state, yes votes <= no votes, counts as processed */
  }

  function setUp() public {}

  function test_IssuanceProposal() public {
    // Multisend encoded bytes to issue 500 mil on AXESource at 0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895
    bytes
      memory issuanceProposalData = hex"8d80ff0a0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000007900aE8F6454fa13EbA1Be4ea60019d1bd34F9D0489500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000024cc872b660000000000000000000000000000000000000000019d971e4fe8401e7400000000000000000000";

    vm.startPrank(shareholder);
    IBaal baal = IBaal(dao);
    uint32 propId = uint32(
      baal.submitProposal(issuanceProposalData, 0, 16000000, "Show me the money!")
    );

    // [cancelled, processed, passed, actionFailed]
    bool[4] memory propStatus;

    vm.warp(block.timestamp + 60);
    baal.submitVote(propId, true);

    propStatus = baal.getProposalStatus(propId);
    assertFalse(propStatus[2]);

    // jump to process ready
    vm.warp(block.timestamp + baal.votingPeriod() + baal.gracePeriod() + 60);

    (bool success, bytes memory data) = address(baal).call{ value: 0, gas: 5000 }(
      abi.encodeWithSignature("state(uint32)", propId)
    );
    assertTrue(success);
    uint256 decodedState = abi.decode(data, (uint256));
    assertEq(decodedState, uint(ProposalState.Ready));

    console.log("State of prop #%s: %s", propId, decodedState);

    uint256 balanceBefore = IERC20(axeToken).balanceOf(treasury);

    vm.expectEmit(false, false, false, true);

    emit AxeIssued(500000000000000000000000000);

    baal.processProposal(propId, issuanceProposalData);

    propStatus = baal.getProposalStatus(propId);
    assertTrue(propStatus[1]);

    uint256 balanceAfter = IERC20(axeToken).balanceOf(treasury);
    assertEq(
      balanceAfter,
      balanceBefore + 500_000_000 * (10 ** 18),
      "Issued amount not in treasury"
    );

    vm.stopPrank();
  }

  function test_LiquidityProposal() public {
    // Multi-call proposal executed from the treasury to use an existing ERC20 (AxeUSD) and Axé tokens to set up liquidity
    bytes
      memory liquidityProposalData = hex"8d80ff0a00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000539001c3ac998b698206cd2fb22bb422bf14367470866000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e4b3c98bbb000000000000000000000000114d5f3904db2b4635528c08b1687ecb5468ee17000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000444468721a7000000000000000000000000998739bfdaadde7c933b942a68053933098f9eda00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000003848d80ff0a0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000032400d44eb94380bff68a827604fdb2da7b0a3ec6ad0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044095ea7b3000000000000000000000000b26b2de65d07ebb5e54c7f6282424d3be670e1f000000000000000000000000000000000000000000000003635c9adc5dea0000000ae8f6454fa13eba1be4ea60019d1bd34f9d0489500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044095ea7b3000000000000000000000000b26b2de65d07ebb5e54c7f6282424d3be670e1f0000000000000000000000000000000000000000000084595161401484a00000000ae8f6454fa13eba1be4ea60019d1bd34f9d0489500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044cc969acb000000000000000000000000b26b2de65d07ebb5e54c7f6282424d3be670e1f0000000000000000000000000d44eb94380bff68a827604fdb2da7b0a3ec6ad0b00b26b2de65d07ebb5e54c7f6282424d3be670e1f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000104e8e33700000000000000000000000000ae8f6454fa13eba1be4ea60019d1bd34f9d04895000000000000000000000000d44eb94380bff68a827604fdb2da7b0a3ec6ad0b000000000000000000000000000000000000000000084595161401484a00000000000000000000000000000000000000000000000000003635c9adc5dea0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000114d5f3904db2b4635528c08b1687ecb5468ee170000000000000000000000000000000000000000000000000000000065ffeb5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    vm.startPrank(shareholder);
    IBaal baal = IBaal(dao);
    uint32 propId = 14;
    // uint32 propId = uint32(
    //   baal.submitProposal(liquidityProposalData, 0, 16000000, "Make it rain!")
    // );

    // [cancelled, processed, passed, actionFailed]
    bool[4] memory propStatus;

    vm.warp(block.timestamp + 60);
    // baal.submitVote(propId, true);

    propStatus = baal.getProposalStatus(propId);
    assertFalse(propStatus[2]);

    // jump to process ready
    vm.warp(block.timestamp + baal.votingPeriod() + baal.gracePeriod() + 60);

    (bool success, bytes memory data) = address(baal).call{ value: 0, gas: 20000 }(
      abi.encodeWithSignature("state(uint32)", propId)
    );
    assertTrue(success);
    uint256 decodedState = abi.decode(data, (uint256));
    assertEq(decodedState, uint(ProposalState.Ready));

    console.log("State of prop #%s: %s", propId, decodedState);

    vm.expectEmit(false, false, false, false);

    emit LiquidationSettingsChanged(router, swapToken, address(0));

    baal.processProposal(propId, liquidityProposalData);

    propStatus = baal.getProposalStatus(propId);
    assertTrue(propStatus[1]);

    vm.stopPrank();
  }
}
