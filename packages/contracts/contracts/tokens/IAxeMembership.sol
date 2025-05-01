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

  /**
   * @notice Donate native tokens to the DAO.
   */
  function donate() external;

  /**
   * @notice Check if an address is a member of the DAO.
   * @param user The address to check.
   * @return True if the address is a member, false otherwise.
   */
  function isMember(address user) external view returns (bool);

  /**
   * @notice Get the number of members in the DAO.
   * @return The number of members.
   */
  function getMemberCount() external view returns (uint256);

  /**
   * @notice Get the member ID of a member.
   * @param user The address of the member.
   * @return The member ID.
   */
  function getMemberId(address user) external view returns (uint256);

  /**
   * @notice Enlist the caller as a candidate.
   */
  function enlistAsCandidate() external;

  /**
   * @notice Remove the caller as a candidate.
   */
  function resignAsCandidate() external;

  /**
   * @notice Delegate the caller's membership to a specified other candidate.
   * @param candidate The address of the candidate to delegate to.
   */
  function delegate(address candidate) external;

  /**
   * @notice Undelegate the caller's membership.
   */
  function undelegate() external;

  /**
   * @notice Get the candidate information for a specified candidate.
   * @param candidate The address of the candidate.
   * @return The candidate as Candidate struct.
   */
  function getCandidate(address candidate) external view returns (Candidate memory);

  /**
   * @notice Retrieves a page of candidates from the delegation ranking.
   * @param offset The number of candidates to skip.
   * @param pageSize The maximum number of candidates to return.
   * @return The array of candidate addresses for the requested page.
   * @return hasMore True if there are more candidates after this page.
   */
  function getTopCandidates(uint256 offset, uint256 pageSize) external view returns (address[] memory, bool hasMore);

  /**
   * @notice Get the number of ranked groups in the delegation ranking, i.e. the number of unique delegation counts.
   * @return The number of ranking groups.
   */
  function getNumberOfRankedGroups() external view returns (uint256);

  /**
   * @notice Get the candidates in the group at the specified index of the group ranking.
   * @param index The index of the ranked group.
   * @return The array of candidate addresses in the ranked group.
   */
  function getRankedGroupAtIndex(uint256 index) external view returns (address[] memory);

  /**
   * @notice Get the number of delegations for a ranked group at the specified index of the group ranking.
   * All candidates in the ranked group have the same number of delegations.
   * @param index The index of the ranked group.
   * @return The number of delegations for the ranked group.
   */
  function getDelegationCountForGroupAtIndex(uint256 index) external view returns (uint256);

  /**
   * @notice Returns the amount of native tokens to donate to the DAO in order to become a member.
   * @return The amount of native tokens to donate.
   */
  function getNativeDonationAmount() external view returns (uint256);

  /**
   * @notice Sets the amount of native tokens to donate to the DAO in order to become a member.
   * @param amount The amount of native tokens to donate.
   */
  function setNativeDonationAmount(uint256 amount) external;

  /**
   * @notice Returns the amount of ERC20 tokens to donate to the DAO in order to become a member.
   * @return The amount of ERC20 tokens to donate.
   */
  function getTokenDonationAmount() external view returns (uint256);

  /**
   * @notice Sets the amount of ERC20 tokens to donate to the DAO in order to become a member.
   * @param amount The amount of ERC20 tokens to donate.
   */
  function setTokenDonationAmount(uint256 amount) external;

  /**
   * @notice Sets the ERC20 token used for membership donations.
   * @param token The address of the ERC20 token to donate.
   */
  function setDonationToken(address token) external;

  /**
   * @notice Sets the address of the receiver of the donations.
   * @param receiver The address of the receiver of the donations.
   */
  function setDonationReceiver(address receiver) external;

  /**
   * @notice Returns the next ranked candidate after the given candidate.
   * @param candidate The candidate address, or address(0) to get the top-ranked candidate
   * @return The next candidate in the ranking, or address(0) if no more candidates
   */
  function getNextRankedCandidate(address candidate) external view returns (address);
}
