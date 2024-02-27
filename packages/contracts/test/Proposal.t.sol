// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import { IBaal } from "@daohaus/baal-contracts/contracts/interfaces/IBaal.sol";

/**
 * @title
 * @author
 * @notice
 */
contract ProposalTest is Test {
  event AxeIssued(uint256 _amount);

  address shareholder = 0x6EF543d0Cce1171F696f82cB6f698133037d5b32;
  address dao = 0x1c3ac998b698206CD2fb22bb422Bf14367470866;
  // Multisend encoded bytes to issue 500 mil on AXESource at 0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895
  bytes proposalData =
    hex"8d80ff0a0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000007900aE8F6454fa13EbA1Be4ea60019d1bd34F9D0489500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000024cc872b660000000000000000000000000000000000000000019d971e4fe8401e7400000000000000000000";

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

  function test_IssueProposal() public {
    vm.startPrank(shareholder);
    IBaal baal = IBaal(dao);
    uint32 propId = uint32(baal.submitProposal(proposalData, 0, 16000000, "Show me the money!"));

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

    vm.expectEmit(true, false, false, false);

    emit AxeIssued(500000000000000000000000000);

    baal.processProposal(propId, proposalData);

    propStatus = baal.getProposalStatus(propId);
    assertTrue(propStatus[1]);

    vm.stopPrank();
  }
}
