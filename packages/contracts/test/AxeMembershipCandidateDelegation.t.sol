// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { console } from "forge-std/console.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import { AxeMembership, IAxeMembership } from "../contracts/tokens/AxeMembership.sol";
import { AxeMembershipCouncil, IAxeMembershipCouncil } from "../contracts/baal/AxeMembershipCouncil.sol";
import { MockERC20 } from "./MockERC20.sol";
import { AxeMembershipBase } from "./AxeMembershipBase.sol";

contract AxeMembershipCandidateDelegationTest is AxeMembershipBase {
  function setUp() public {
    // Deploy the MockERC20 token
    paymentToken = new MockERC20("Payment Token", "PTK");
    tokenDonationAmount = 10 ** 10 * IERC20Metadata(address(paymentToken)).decimals();

    // Deploy the MembershipToken NFT
    membership = new AxeMembership(
      address(this),
      address(this),
      address(paymentToken),
      tokenDonationAmount,
      0.00001 ether,
      "ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json"
    );

    // Set up test users
    initiateTestUsers(address(this), 100);
  }

  function test_EnlistAndResign() public {
    address candidate = testUsers[0];
    vm.prank(candidate);
    membership.enlistAsCandidate();

    // Assert the candidate is enlisted
    IAxeMembership.Candidate memory structCandidate = membership.getCandidate(candidate);
    assertTrue(structCandidate.available, "Candidate should be enlisted");
    assertEq(structCandidate.delegationCount, 1, "Candidate should have 1 delegation");

    assertEq(
      membership.getNumberOfRankedGroups(),
      1,
      "There should be 1 delegation group. Candidate auto self-delegated on enlistment."
    );

    // Verify the candidate is in the correct group
    address[] memory group = membership.getRankedGroupAtIndex(0);
    assertEq(group.length, 1, "Group should have 1 candidate");
    assertEq(group[0], candidate, "Candidate should be in group");

    vm.prank(testUsers[1]);
    membership.delegate(candidate);

    assertEq(
      membership.getNumberOfRankedGroups(),
      1,
      "There should still be 1 delegation group after other user delegates to single candidate."
    );

    vm.prank(testUsers[2]);
    membership.enlistAsCandidate();

    assertEq(
      membership.getNumberOfRankedGroups(),
      2,
      "There should be 2 sorted groups after second candidate enlisted."
    );

    vm.prank(candidate);
    membership.resignAsCandidate();
    structCandidate = membership.getCandidate(candidate);
    assertFalse(structCandidate.available);

    assertEq(
      membership.getNumberOfRankedGroups(),
      1,
      "There should be 1 sorted group. One of the candidates resigned."
    );
  }

  function test_DelegateUndelegate() public {
    address delegator = testUsers[0];
    address delegatee = testUsers[1];
    vm.prank(delegatee);
    membership.enlistAsCandidate();

    vm.startPrank(delegator);
    membership.delegate(delegatee);
    assertEq(membership.delegations(delegator), delegatee);

    membership.undelegate();
    assertEq(membership.delegations(delegator), address(0));
  }

  /**
   * @notice Test a complex delegation scenario with multiple candidates and delegations
   * @dev This test covers a variety of delegation patterns, including:
   * - Multiple candidates enlisting and delegating
   * - Delegations to multiple candidates
   * - Undelegations and their effects on sorting
   * - Group merging and sorting integrity
   */
  function test_ComplexDelegationScenario() public {
    // Set up initial candidates (first 5 users become candidates)
    _setUpCandidates(5);
    // Verify initial state (5 self-delegations)
    _verifyState("Initial", "1:0-1-2-3-4");

    // First wave of delegations: 10 members delegate to candidate 0
    _delegateUsers(testUsers[0], 10, 20);

    // Verify candidate 0 is now the top candidate with 11 delegations
    _verifyState("Wave1", "11:0,1:1-2-3-4");

    // Second wave: 5 members delegate to candidate 1 and 7 delegate to candidate 2
    _delegateUsers(testUsers[1], 20, 25);
    _delegateUsers(testUsers[2], 25, 32);

    // Verify state after second wave
    _verifyState("Wave2", "11:0,8:2,6:1,1:3-4");

    // Candidate 2 resigns
    vm.prank(testUsers[2]);
    membership.resignAsCandidate();

    // Candidate 2's delegators undelegate, except 2
    // The delegatee later re-enlists where the 2 remaining delegations are counted again.
    _undelegateUsers(25, 30);

    // Verify state after resignation of candidate 2 and undelegation of 5 users
    _verifyState("Resign1", "11:0,6:1,1:3-4");

    // New candidate enlists (user 5) and gets more delegations than current top
    vm.prank(testUsers[5]);
    membership.enlistAsCandidate();

    _delegateUsers(testUsers[5], 32, 50); // 18 delegations

    _verifyState("Wave3", "19:5,11:0,6:1,1:3-4");

    // 5 delegators of candidate 0 undelegate
    _undelegateUsers(10, 15);

    _verifyState("Undelegate1", "19:5,6:1-0,1:3-4");

    // Wave Four: Multiple candidates (including candidate 2 again) enlist and get same number of delegations
    vm.prank(testUsers[2]);
    membership.enlistAsCandidate();
    vm.prank(testUsers[6]);
    membership.enlistAsCandidate();
    vm.prank(testUsers[7]);
    membership.enlistAsCandidate();

    // Give new candidates a total of 4 delegations each
    _delegateUsers(testUsers[6], 53, 56);
    _delegateUsers(testUsers[7], 56, 59);
    _delegateUsers(testUsers[2], 59, 60); // Rejoining candidate 2 has 2 delegations from previous wave + self-delegation + 1 new delegation

    // Add 5 more candidates
    for (uint256 i = 8; i < 13; i++) {
      vm.prank(testUsers[i]);
      membership.enlistAsCandidate();
    }

    _verifyState("Wave4", "19:5,6:0-1,4:2-6-7,1:3-4-8-9-10-11-12");

    // Fifth wave: Complex delegation patterns
    // Group/Users here: 19:5, 6:0-1, 4:6-7-2, 1:3-4-8-9-10-11-12
    // Some users from previous groups move to new candidates using undelegation and delegation
    _delegateUsers(testUsers[8], 32, 37); // 5 supporters of candidate 5 now delegate to user 8

    // New delegations to multiple candidates
    _delegateUsers(testUsers[9], 60, 66); // 6 delegations to user 9
    _delegateUsers(testUsers[10], 66, 70); // 4 delegations to user 10

    // Some more users undelegate
    _undelegateUsers(53, 55); // Remove 2 delegations from user 6
    // Some users redelegate
    _delegateUsers(testUsers[11], 56, 58); // 2 supporters of candidate 7 now support candidate 11

    // New Counts/Users here: 14:5, 7:9, 6:8-0-1, 5:10, 4:2, 3:11, 2:6-7, 1:3-4-12
    _verifyState("Wave5", "14:5,7:9,6:8-0-1,5:10,4:2,3:11,2:6-7,1:3-4-12");

    // Sixth wave: More complex delegation and various actions
    // Candidate 8 resigns
    vm.startPrank(testUsers[8]);
    membership.resignAsCandidate();
    membership.undelegate();
    vm.stopPrank();
    _undelegateUsers(32, 33); // Remove 1 delegations from candidate 8
    _delegateUsers(testUsers[3], 33, 35); // 2 delegations from candidate 8 to candidate 3, candidate 8 has 2 other delegations left
    assertEq(membership.getCandidate(testUsers[8]).delegationCount, 2, "Candidate 8 should have 2 delegations left");
    // New delegations to multiple candidates
    _delegateUsers(testUsers[0], 70, 75); // 5 delegations to user 0
    _delegateUsers(testUsers[12], 75, 80); // 5 delegations to user 12
    _delegateUsers(testUsers[4], 80, 88); // 8 delegations to user 4
    _delegateUsers(testUsers[7], 88, 90); // 2 delegations to user 7
    vm.prank(testUsers[11]);
    membership.delegate(testUsers[6]); // candidate 11 delegates their own membership to candidate 6
    vm.prank(testUsers[8]);
    membership.enlistAsCandidate(); // candidate 8 rejoins, gets 1 auto-self-delegation and had 2 delegations left

    // Verify state after Wave Six
    _verifyState("Wave6", "14:5,11:0,9:4,7:9,6:1-12,5:10,4:2-7,3:3-6-8,2:11");
  }

  /**
   * @notice Test the getTopCandidates function with different scenarios
   */
  function testGetTopCandidates() public {
    _setUpCandidates(5);
    // Give some candidates different numbers of delegations
    _delegateUsers(testUsers[0], 10, 21); // 11 delegations
    _delegateUsers(testUsers[2], 21, 27); // 6 delegations
    _delegateUsers(testUsers[4], 27, 30); // 3 delegations
    // testUsers[1] and testUsers[3] have only self-delegation

    _verifyState("Initial", "12:0,7:2,4:4,1:1-3");

    // Test first page (3 candidates)
    address[] memory expectedPage1 = new address[](3);
    expectedPage1[0] = testUsers[0]; // 12 delegations
    expectedPage1[1] = testUsers[2]; // 7 delegations
    expectedPage1[2] = testUsers[4]; // 4 delegations
    _verifyTopCandidates("Page1", 0, 3, expectedPage1, 5);

    // Test second page (2 candidates with only self-delegation)
    address[] memory expectedPage2 = new address[](2);
    expectedPage2[0] = testUsers[1]; // 0 delegations (just self)
    expectedPage2[1] = testUsers[3]; // 0 delegations (just self)
    _verifyTopCandidates("Page2", 3, 5, expectedPage2, 5);

    // // Test offset into middle of ranking
    // address[] memory expectedOffset = new address[](2);
    // expectedOffset[0] = testUsers[4]; // 3 delegations
    // expectedOffset[1] = testUsers[1]; // 0 delegations (just self)
    // _verifyTopCandidates("Offset", 2, 2, expectedOffset, 5);

    // // Test oversized page
    // address[] memory expectedOversize = new address[](10);
    // expectedOversize[0] = testUsers[0]; // 11 delegations
    // expectedOversize[1] = testUsers[2]; // 6 delegations
    // expectedOversize[2] = testUsers[4]; // 3 delegations
    // expectedOversize[3] = testUsers[1]; // 0 delegations (just self)
    // expectedOversize[4] = testUsers[3]; // 0 delegations (just self)
    // _verifyTopCandidates("Oversize", 0, 10, expectedOversize, 5);

    // // Test offset beyond available candidates
    // address[] memory expectedEmpty = new address[](3);
    // _verifyTopCandidates("Beyond", 10, 3, expectedEmpty, 5);

    // // Test after resignation
    // vm.prank(testUsers[0]);
    // membership.resignAsCandidate();

    // address[] memory expectedAfterResign = new address[](4);
    // expectedAfterResign[0] = testUsers[2]; // 6 delegations
    // expectedAfterResign[1] = testUsers[4]; // 3 delegations
    // expectedAfterResign[2] = testUsers[1]; // 0 delegations (just self)
    // expectedAfterResign[3] = testUsers[3]; // 0 delegations (just self)
    // _verifyTopCandidates("AfterResign", 0, 4, expectedAfterResign, 4);
  }

  /**
   * @notice Verify the top candidates for a given stage
   * @param stage The stage name
   * @param offset The offset of the page
   * @param pageSize The size of the page
   * @param expected The expected candidates
   * @param totalCandidateCount The total number of candidates
   */
  function _verifyTopCandidates(
    string memory stage,
    uint256 offset,
    uint256 pageSize,
    address[] memory expected,
    uint256 totalCandidateCount
  ) internal {
    (address[] memory topCandidates, bool hasMore) = membership.getTopCandidates(offset, pageSize);

    console.log("topCandidates", topCandidates.length);
    console.log("hasMore", hasMore);

    // Verify length matches pageSize (may include 0x0 addresses at the end)
    assertEq(topCandidates.length, pageSize, string.concat("Wrong page size at stage: ", stage));

    // Verify expected addresses match
    uint256 expectedLength = expected.length;
    for (uint256 i = 0; i < pageSize; i++) {
      if (i < expectedLength) {
        assertEq(
          topCandidates[i],
          expected[i],
          string.concat("Wrong candidate at index: ", vm.toString(i), ", stage: ", stage)
        );
      } else {
        assertEq(
          topCandidates[i],
          address(0),
          string.concat("Expected address(0) at index: ", vm.toString(i), ", stage: ", stage)
        );
      }
    }

    // Verify hasMore flag
    bool shouldHaveMore = offset + pageSize < totalCandidateCount;
    assertEq(hasMore, shouldHaveMore, string.concat("Wrong hasMore value at stage: ", stage));
  }
}
