// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/**
 * @title IAxeMembership
 * @notice IAxeMembership is the interface for the Axe Membership token.
 */
interface IAxeMembership is IERC721 {
  struct Candidate {
    /// @notice The number of delegations this candidate currently has
    uint248 delegationCount;
    /// @notice Whether this candidate is available for council membership
    bool available;
    /// @notice The next candidate in the linked list with the same delegation count
    address next;
  }

  error NotAMemberError();
  error AlreadyMemberError(address member);
  error InsufficientDonationError(uint256 amount, uint256 requiredAmount);
  error DonationOptionNotAvailable();

  event ERC20DonationReceived(address indexed from, uint256 amount);
  event NativeDonationReceived(address indexed from, uint256 amount);
  event ObrigadoMuitoAxe(address indexed member, uint256 memberId);
  event CandidateEnlisted(address indexed candidate);
  event CandidateResigned(address indexed candidate);
  event VoteDelegated(address indexed delegator, address indexed candidate);
  event VoteUndelegated(address indexed delegator, address indexed candidate);

  function donate() external;

  function isMember(address user) external view returns (bool);

  function getMemberCount() external view returns (uint256);

  function getMemberId(address user) external view returns (uint256);

  function enlistAsCandidate() external;

  function resignAsCandidate() external;

  function delegate(address candidate) external;

  function undelegate() external;

  function getCandidate(address candidate) external view returns (Candidate memory);

  /**
   * @notice Get a page of candidates from the delegation ranking.
   * @param offset The number of candidates to skip.
   * @param pageSize The maximum number of candidates to return.
   * @return The array of candidate addresses for the requested page.
   * @return hasMore True if there are more candidates after this page.
   */
  function getTopCandidates(uint256 offset, uint256 pageSize) external view returns (address[] memory, bool hasMore);

  function getNumberOfRankedGroups() external view returns (uint256);

  function getRankedGroupAtIndex(uint256 index) external view returns (address[] memory);

  function getDelegationCountForGroupAtIndex(uint256 index) external view returns (uint256);

  function getNativeDonationAmount() external view returns (uint256);

  function setNativeDonationAmount(uint256 amount) external;

  function getTokenDonationAmount() external view returns (uint256);

  function setTokenDonationAmount(uint256 amount) external;

  function setDonationToken(address token) external;

  function setDonationReceiver(address receiver) external;

  /**
   * @notice Get the next ranked candidate after the given candidate.
   * @param _current The current candidate address, or address(0) to get the highest ranked candidate
   * @return The next candidate in the ranking, or address(0) if no more candidates
   */
  function getNextRankedCandidate(address _current) external view returns (address);
}
