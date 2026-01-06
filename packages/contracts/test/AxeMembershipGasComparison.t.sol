// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { console } from "forge-std/console.sol";
import { MockERC20 } from "./MockERC20.sol";

import { AxeMembership, IAxeMembership } from "../contracts/tokens/AxeMembership.sol";
import { AxeMembershipBase } from "./AxeMembershipBase.sol";

contract AxeMembershipGasComparisonTest is AxeMembershipBase {
  function setUp() public {
    paymentToken = new MockERC20("Payment Token", "PTK");

    // Deploy DaoConfig proxy with payment token
    daoConfig = deployDaoConfig(address(this), address(paymentToken), TOKEN_RATE);

    // Set native token rate in config
    daoConfig.setNativeTokenRate(NATIVE_TOKEN_RATE);

    // Deploy the MembershipToken NFT with DaoConfig
    membership = new AxeMembership(
      address(this),
      address(this),
      address(daoConfig),
      MEMBERSHIP_MULTIPLIER,
      "ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json"
    );

    initiateTestUsers(address(this), 500);

    _setUpCandidates(5); // First 5 candidates

    // Give different delegation counts to create realistic groups
    _delegateUsers(testUsers[0], 10, 21); // 11 delegations
    _delegateUsers(testUsers[1], 21, 25); // 4 delegations
    _delegateUsers(testUsers[2], 25, 35); // 10 delegations
    _delegateUsers(testUsers[3], 35, 38); // 3 delegations
    _delegateUsers(testUsers[4], 38, 40); // 2 delegations
  }

  function testGasComparison_ArrayVsIterator() public view {
    uint256 maxSeats = 3;

    // Method 1: Using getRankedGroupAtIndex
    uint256 gasStart1 = gasleft();
    uint256 seatsFound1 = 0;
    uint256 groupIndex = 0;

    while (seatsFound1 < maxSeats && groupIndex < membership.getNumberOfRankedGroups()) {
      address[] memory group = membership.getRankedGroupAtIndex(groupIndex);
      for (uint256 i = 0; i < group.length && seatsFound1 < maxSeats; i++) {
        seatsFound1++;
      }
      groupIndex++;
    }
    uint256 gasUsed1 = gasStart1 - gasleft();

    // Method 2: Using getNextRankedCandidate
    uint256 gasStart2 = gasleft();
    uint256 seatsFound2 = 0;
    address candidate = membership.getNextRankedCandidate(address(0));

    while (candidate != address(0) && seatsFound2 < maxSeats) {
      seatsFound2++;
      candidate = membership.getNextRankedCandidate(candidate);
    }
    uint256 gasUsed2 = gasStart2 - gasleft();

    // Method 3: Using getTopCandidates with large page size
    uint256 gasStart3 = gasleft();
    uint256 seatsFound3 = 0;
    uint256 offset = 0;
    uint256 pageSize = 100;

    while (seatsFound3 < maxSeats) {
      (address[] memory candidates, bool hasMore) = membership.getTopCandidates(offset, pageSize);
      for (uint256 i = 0; i < candidates.length && seatsFound3 < maxSeats; i++) {
        if (candidates[i] == address(0)) break;
        seatsFound3++;
      }
      if (!hasMore) break;
      offset += pageSize;
    }
    uint256 gasUsed3 = gasStart3 - gasleft();

    console.log("Gas used with getRankedGroupAtIndex:", gasUsed1);
    console.log("Gas used with getNextRankedCandidate:", gasUsed2);
    console.log("Gas used with getTopCandidates:", gasUsed3);
    console.log("Max difference:", maxDifference(gasUsed1, gasUsed2, gasUsed3));
  }

  function maxDifference(uint256 a, uint256 b, uint256 c) internal pure returns (uint256) {
    uint256 max = a > b ? a : b;
    max = max > c ? max : c;
    uint256 min = a < b ? a : b;
    min = min < c ? min : c;
    return max - min;
  }

  function testGasComparison_LargerDataset() public {
    // Set up more candidates (e.g., 20) with various delegation patterns
    for (uint256 i = 5; i < 20; i++) {
      vm.prank(testUsers[i]);
      membership.enlistAsCandidate();

      // Create varying delegation counts
      uint256 delegations = (i * 7) % 15; // Some pattern to distribute delegations
      if (delegations > 0) {
        _delegateUsers(testUsers[i], 90 + i * 5, 90 + i * 5 + delegations);
      }
    }

    // Now run the same comparison
    testGasComparison_ArrayVsIterator();
  }
}
