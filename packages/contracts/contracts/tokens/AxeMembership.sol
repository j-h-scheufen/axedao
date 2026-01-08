// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { Ownable2Step, Ownable } from "@openzeppelin/contracts/access/Ownable2Step.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ReentrancyGuard } from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

import { IAxeMembership } from "./IAxeMembership.sol";
import { IDaoConfig } from "../config/IDaoConfig.sol";

/**
 * @title MembershipToken
 * @notice A soul-bound ERC721 membership token representing life-time DAO membership. The NFT can be minted by userds donating
 * either a fixed amount of ERC20 tokens or native tokens. The amounts are controlled by the DAO and donations are forwarded
 * to a designated receiver, e.g. a DAO treasury.
 *
 * After becoming a member, members can enlist/resign as candidates for a seat on Axé Membership Council. Any member, including enlisted
 * candidates, can delegate their membership to another candidate of their choice including themselves. The contract keeps track of
 * delegations and candidate availability and maintains a sorted list of delegation counts to allow for efficient querying of the top candidates.
 */
contract AxeMembership is IAxeMembership, ERC721, Ownable2Step, ReentrancyGuard {
  using SafeERC20 for IERC20;

  /// @notice The DAO-wide config contract for token rates
  IDaoConfig public daoConfig;
  /// @notice The membership multiplier in base units (18 decimals). E.g., 10e18 = 10 base units.
  uint256 public multiplier;
  address internal donationReceiver;
  uint256 internal memberCount = 0;
  mapping(address => uint256) public members; // tokenId => member address
  string private baseTokenURI;

  /// @notice A mapping from a candidate to their candidacy details.
  mapping(address => Candidate) public candidates;
  /// @notice A mapping from a delegator to their delegatee.
  mapping(address => address) public delegations;
  /// @notice The sorted list of delegation counts higher than 0. Highest count at index 0.
  uint256[] private sortedGroups;
  /// @notice Maps delegation count to first candidate in that group
  mapping(uint256 => address) internal groupHeads;
  /// @notice Maps delegation count to number of candidates in that group
  mapping(uint256 => uint256) internal groupSizes;

  /**
   * @notice Modifier blocking callers who are not members.
   */
  modifier memberOnly() {
    if (!isMember(_msgSender())) revert NotAMemberError();
    _;
  }

  /**
   * @notice Modifier for functions that need to verify and register a new member before proceeding.
   */
  modifier registerNewMember() {
    address sender = _msgSender();
    if (isMember(sender)) revert AlreadyMemberError(sender);
    members[sender] = ++memberCount;
    _;
  }

  /**
   * @notice Constructor for the AxéMembership Token.
   * @param _owner The owner of the contract who can control attributes like donation amounts.
   * @param _donationReceiver The address receiving the donations.
   * @param _daoConfig The DAO config contract address for token rates.
   * @param _multiplier The membership multiplier in base units (18 decimals). E.g., 10e18 = 10 base units.
   * @param _baseTokenURI The base URI for the membership NFT metadata.
   */
  constructor(
    address _owner,
    address _donationReceiver,
    address _daoConfig,
    uint256 _multiplier,
    string memory _baseTokenURI
  ) ERC721(unicode"Axé DAO Membership", "AXDM") Ownable(_owner) {
    if (_daoConfig == address(0)) revert InvalidAddress();
    if (_multiplier == 0) revert InvalidMultiplier();
    daoConfig = IDaoConfig(_daoConfig);
    multiplier = _multiplier;
    donationReceiver = _donationReceiver;
    baseTokenURI = _baseTokenURI;
  }

  /**
   * @notice Donate ERC20 tokens to receive a membership NFT. Remember to approve the required donation amount before calling this function.
   * @param _token The address of the ERC20 token to donate.
   */
  function donate(address _token) external override registerNewMember nonReentrant {
    uint8 tokenDecimals = IERC20Metadata(_token).decimals();
    uint256 amount = daoConfig.calculateTokenAmount(_token, multiplier, tokenDecimals);
    address sender = _msgSender();
    _mint(sender, memberCount);
    IERC20(_token).safeTransferFrom(sender, donationReceiver, amount);
    emit ERC20DonationReceived(sender, _token, amount);
    emit ObrigadoMuitoAxe(sender, memberCount);
  }

  /**
   * @notice Donate native tokens to receive a membership NFT by sending the donation amount to the contract.
   */
  receive() external payable registerNewMember nonReentrant {
    if (!daoConfig.isNativeTokenSupported()) revert DonationOptionNotAvailable();
    uint256 requiredAmount = daoConfig.calculateNativeTokenAmount(multiplier);
    address sender = _msgSender();
    _mint(sender, memberCount);
    _handleNativeDonation(requiredAmount);
    emit NativeDonationReceived(sender, requiredAmount);
    emit ObrigadoMuitoAxe(sender, memberCount);
  }

  /**
   * @notice Check if the given account is a member.
   * @param _user The address to check.
   * @return True if the account is a member, false otherwise.
   */
  function isMember(address _user) public view override returns (bool) {
    return members[_user] != 0;
  }

  /**
   * @notice Enlists the msg.sender as a candidate for the Axé Membership Council.
   * The candidate must be a member of the DAO and not already a candidate.
   * Enlisting candidates automatically delegate to themselves, unless a prior delegation exists. In that case, the
   * existing delegation is left untouched. The member should undelegate before enlisting or can undelegate afterwards and then
   * delegate to themselves.
   */
  function enlistAsCandidate() external memberOnly {
    address sender = _msgSender();
    if (candidates[sender].available) revert AlreadyEnlisted();

    candidates[sender].available = true;
    // Self-delegate for convenience
    if (delegations[sender] == address(0)) {
      delegations[sender] = sender;
      candidates[sender].delegationCount++;
    }
    uint256 groupIndex = candidates[sender].delegationCount;
    bool newGroup = addCandidateToGroup(sender, groupIndex) == 1;
    if (newGroup) {
      insertSortedGroup(groupIndex);
    }
    emit CandidateEnlisted(sender);
  }

  /**
   * @notice Removes the msg.sender as available candidate for the Axé Membership Council.
   * The sender must be an enlisted candidate.
   * Even though the candidate resigns, the record of current delegations is left untouched, so that candidates
   * who enlist again later would maintain their delegation count, in none of their delegators have changed
   * their delegations in the meantime.
   */
  function resignAsCandidate() external {
    address sender = _msgSender();
    if (!candidates[sender].available) revert NotACandidate();

    candidates[sender].available = false;
    uint256 groupIndex = candidates[sender].delegationCount;
    bool groupDepleted = removeCandidateFromGroup(sender, groupIndex) == 0;
    if (groupDepleted) {
      removeSortedGroup(groupIndex);
    }
    emit CandidateResigned(sender);
  }

  /**
   * @notice Delegates the msg.sender's membership vote to the given candidate.
   * The candidate must be enlisted and available as a candidate.
   * Delegating to oneself as a candidate is allowed.
   * @param _candidate The address of the candidate to delegate to.
   */
  function delegate(address _candidate) external memberOnly {
    address sender = _msgSender();
    if (_candidate == address(0)) revert InvalidAddress();
    if (!candidates[_candidate].available) revert CandidateNotAvailable(_candidate);

    address currentDelegate = delegations[sender];
    if (currentDelegate == _candidate) return;
    if (currentDelegate != address(0)) {
      moveCandidate(currentDelegate, false);
      emit VoteUndelegated(sender, currentDelegate);
    }
    moveCandidate(_candidate, true);
    delegations[sender] = _candidate;
    emit VoteDelegated(sender, _candidate);
  }

  /**
   * @notice Undelegates the msg.sender's membership vote from their current delegate.
   * The sender must be a member and have a delegate.
   */
  function undelegate() external memberOnly {
    address sender = _msgSender();
    address candidate = delegations[sender];
    if (candidate == address(0)) revert NoDelegation();

    moveCandidate(candidate, false);
    delegations[sender] = address(0);
    emit VoteUndelegated(sender, candidate);
  }

  /**
   * @notice Get the candidate details for the given candidate address.
   * @param _candidate The address of the candidate.
   * @return The candidate details.
   */
  function getCandidate(address _candidate) external view returns (Candidate memory) {
    return candidates[_candidate];
  }

  /**
   * @notice Get a page of candidates from the delegation ranking.
   * @param offset The number of candidates to skip.
   * @param pageSize The maximum number of candidates to return.
   * @return The array of candidate addresses for the requested page. The array may contain 0x0 addresses if there are less candidates than requested.
   * @return hasMore True if there are more candidates after this page.
   */
  function getTopCandidates(uint256 offset, uint256 pageSize) external view returns (address[] memory, bool) {
    address[] memory result = new address[](pageSize);
    uint256 count;
    uint256 total;
    uint256 totalGroups = sortedGroups.length;

    // Early return if no candidates
    if (totalGroups == 0) {
      return (new address[](0), false);
    }

    // Try to find one more than requested to determine hasMore
    uint256 plusOneCount = pageSize + 1;

    for (uint256 i = 0; i < totalGroups && count < plusOneCount; ) {
      uint256 groupIndex = sortedGroups[i];
      uint256 groupSize = groupSizes[groupIndex];
      // skip to the group closest to the offset
      if (total + groupSize <= offset) {
        total += groupSize;
        unchecked {
          i++;
        }
        continue;
      }

      address current = groupHeads[groupIndex];

      while (current != address(0) && count < plusOneCount) {
        if (total++ < offset) {
          current = candidates[current].next;
          continue;
        }

        if (count < pageSize) {
          result[count] = current;
        }
        count++;
        current = candidates[current].next;
      }
      unchecked {
        i++;
      }
    }

    // If we couldn't fill the page, or if the last position is address(0),
    // we definitely don't have more results
    if (count < pageSize || result[pageSize - 1] == address(0)) {
      return (result, false);
    }

    return (result, count > pageSize);
  }

  /**
   * @notice The base URI for the membership NFT metadata.
   * @return The base URI.
   */
  function _baseURI() internal view override returns (string memory) {
    return baseTokenURI;
  }

  /**
   * @notice The token URI for the membership NFT metadata.
   * @return The token URI.
   */
  function tokenURI(uint256 /* tokenId */) public view override returns (string memory) {
    return _baseURI();
  }

  /**
   * @dev Override to make the token soul-bound (non-transferable).
   * Only minting (from == 0) and burning (to == 0) are allowed.
   */
  function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
    address from = _ownerOf(tokenId);
    // Allow minting and burning, block transfers
    if (from != address(0) && to != address(0)) {
      revert SoulBoundTransferNotAllowed();
    }
    return super._update(to, tokenId, auth);
  }

  /**
   * @notice Get the number of members.
   * @return The number of members = the number of minted NFTs.
   */
  function getMemberCount() external view override returns (uint256) {
    return memberCount;
  }

  /**
   * @notice Get the member ID for a given address.
   * @param _user The address of the member.
   * @return The minted token ID as the member ID.
   */
  function getMemberId(address _user) external view returns (uint256) {
    return members[_user];
  }

  /**
   * @notice Get the membership multiplier in base units (18 decimals).
   * @return The multiplier.
   */
  function getMultiplier() external view override returns (uint256) {
    return multiplier;
  }

  /**
   * @notice Set the membership multiplier in base units (18 decimals).
   * @param _multiplier The new multiplier.
   */
  function setMultiplier(uint256 _multiplier) external override onlyOwner {
    if (_multiplier == 0) revert InvalidMultiplier();
    uint256 oldMultiplier = multiplier;
    multiplier = _multiplier;
    emit MultiplierUpdated(oldMultiplier, _multiplier);
  }

  /**
   * @notice Get the calculated donation amount for a specific token.
   * @param _token The address of the ERC20 token.
   * @return The token amount required for donation.
   */
  function getDonationAmount(address _token) external view override returns (uint256) {
    uint8 tokenDecimals = IERC20Metadata(_token).decimals();
    return daoConfig.calculateTokenAmount(_token, multiplier, tokenDecimals);
  }

  /**
   * @notice Get the native donation amount required to mint a membership NFT.
   * Calculated from multiplier and native token rate in DaoConfig.
   * @return The donation amount (in 18 decimals). Returns 0 if native token not supported.
   */
  function getNativeDonationAmount() external view override returns (uint256) {
    if (!daoConfig.isNativeTokenSupported()) return 0;
    return daoConfig.calculateNativeTokenAmount(multiplier);
  }

  /**
   * @notice Set the address receiving the donations.
   * @param _donationReceiver The new donation receiver.
   */
  function setDonationReceiver(address _donationReceiver) external onlyOwner {
    if (_donationReceiver == address(0)) revert InvalidAddress();
    donationReceiver = _donationReceiver;
  }

  /**
   * @notice Get the number of groups that are ranked by delegation count.
   * @return The number of currently tracked groups in the ranking.
   */
  function getNumberOfRankedGroups() external view returns (uint256) {
    return sortedGroups.length;
  }

  /**
   * @notice Get the candidates from the group ranked at the given index.
   * @param _index The index of the group in the ranking.
   * @return The candidate addresses in the specified group.
   */
  function getRankedGroupAtIndex(uint256 _index) external view returns (address[] memory) {
    uint256 delegationCount = sortedGroups[_index];
    address[] memory result = new address[](groupSizes[delegationCount]);
    address current = groupHeads[delegationCount];

    for (uint256 i = 0; current != address(0); ) {
      result[i] = current;
      current = candidates[current].next;
      unchecked {
        i++;
      }
    }
    return result;
  }

  /**
   * @notice Get the delegation count from the group ranked at the given index.
   * @param _index The index of the group in the ranking.
   * @return The delegation count of the group.
   */
  function getDelegationCountForGroupAtIndex(uint256 _index) external view returns (uint256) {
    return sortedGroups[_index];
  }

  /**
   * @dev Handle the native donation. If more native tokens were sent than required, the excess is refunded.
   * @param _requiredAmount The required donation amount in native tokens.
   */
  function _handleNativeDonation(uint256 _requiredAmount) internal {
    address sender = _msgSender();
    if (msg.value < _requiredAmount) {
      revert InsufficientDonationError(msg.value, _requiredAmount);
    }
    uint256 refundAmount = msg.value - _requiredAmount;
    (bool success, ) = donationReceiver.call{ value: _requiredAmount }("");
    if (!success) revert TransferFailed();
    if (refundAmount > 0) {
      (bool refundSuccess, ) = sender.call{ value: refundAmount }("");
      if (!refundSuccess) revert TransferFailed();
    }
  }

  /**
   * @dev Up- or down-votes a candidate depending on the boolean parameter. True for up, false for down.
   * The candidate's delegation count is incremented or decremented and the candidate is moved between groups accordingly.
   * This function handles the adjustment of the sortedGroups array, if necessary as a result of the move.
   * @param _candidate The candidate to move.
   * @param _up Whether to move the candidate up or down.
   */
  function moveCandidate(address _candidate, bool _up) internal {
    Candidate storage candidate = candidates[_candidate];
    uint256 oldCount = _up ? candidate.delegationCount++ : candidate.delegationCount--;
    // if the candidate resigned, they were already removed from the groups
    if (candidate.available) {
      uint256 newCount = _up ? oldCount + 1 : oldCount - 1;
      bool oldDepleted = removeCandidateFromGroup(_candidate, oldCount) == 0;
      bool newCreated = addCandidateToGroup(_candidate, newCount) == 1;
      if (oldDepleted && newCreated) {
        renameSortedGroup(oldCount, newCount);
      } else if (oldDepleted && !newCreated) {
        removeSortedGroup(oldCount);
      } else if (!oldDepleted && newCreated) {
        insertSortedGroup(newCount);
      }
    }
  }

  /**
   * @notice Remove a candidate from a delegation group.
   * @dev This function reverts on input that threatens the integrity of the sortedGroups array. Strictly, this is not needed
   * as the logic of calling the internal functions should not misuse the internal functions, but better to leave as insurance.
   * @param _candidate The candidate to remove.
   * @param _groupIndex The index of the group to remove the candidate from.
   * @return The new size of the group.
   */
  function removeCandidateFromGroup(address _candidate, uint256 _groupIndex) internal returns (uint256) {
    address head = groupHeads[_groupIndex];
    require(head != address(0), "Group not found");

    // If candidate is head, return early
    if (head == _candidate) {
      groupHeads[_groupIndex] = candidates[_candidate].next;
      candidates[_candidate].next = address(0);
      return --groupSizes[_groupIndex];
    }

    address current = head;
    while (current != address(0) && candidates[current].next != _candidate) {
      current = candidates[current].next;
    }
    require(current != address(0), "Candidate not found in group");

    // Remove from list
    candidates[current].next = candidates[_candidate].next;
    candidates[_candidate].next = address(0);

    return --groupSizes[_groupIndex];
  }

  /**
   * @notice Add a candidate to a delegation group according to the delegation count.
   * @param _candidate The candidate to add.
   * @param _groupIndex The index of the group to add the candidate to.
   * @return The new size of the group.
   */
  function addCandidateToGroup(address _candidate, uint256 _groupIndex) internal returns (uint256) {
    address head = groupHeads[_groupIndex];

    if (head == address(0)) {
      groupHeads[_groupIndex] = _candidate;
      candidates[_candidate].next = address(0);
      groupSizes[_groupIndex] = 1;
      return 1;
    }

    address current = head;
    while (candidates[current].next != address(0)) {
      current = candidates[current].next;
    }
    candidates[current].next = _candidate;
    candidates[_candidate].next = address(0);

    return ++groupSizes[_groupIndex];
  }

  /**
   * @notice Rename a delegation count group.
   * @dev This function is used for efficiency reasons to cover the use case of a group containing only a single
   * candidate and there is no directly adjacent delegation count in the ranking. In that case, the group can be
   * re-labeled with the new count without having to update the sortedGroups array as the position of the group
   * in the ranking is unchanged.
   * This function reverts on input that threatens the integrity of the sortedGroups array. Strictly, this is not needed
   * as the logic of calling the internal functions should not misuse the internal functions, but better to leave as insurance.
   * @param _oldCount The old delegation count.
   * @param _newCount The new delegation count.
   */
  function renameSortedGroup(uint256 _oldCount, uint256 _newCount) internal {
    uint256 oldIndex = findSortedGroupsIndex(_oldCount);
    uint256 newIndex = findSortedGroupsIndex(_newCount);
    require(sortedGroups[oldIndex] == _oldCount, "Old Count to rename not found");
    if (newIndex < sortedGroups.length && sortedGroups[newIndex] == _newCount)
      revert("New Count already exists. Cannot rename.");
    sortedGroups[oldIndex] = _newCount;
  }

  /**
   * @notice Insert a new delegation count into the ranking that does not yet exist.
   * @param _count The delegation count to insert.
   */
  function insertSortedGroup(uint256 _count) internal {
    uint256 insertionIndex = findSortedGroupsIndex(_count);
    // Insert the count and shift the array
    sortedGroups.push(_count);
    for (uint256 j = sortedGroups.length - 1; j > insertionIndex; ) {
      sortedGroups[j] = sortedGroups[j - 1];
      unchecked {
        j--;
      }
    }
    sortedGroups[insertionIndex] = _count;
  }

  /**
   * @notice Remove the delegation count from the ranking.
   * @param _count The delegation count to remove.
   */
  function removeSortedGroup(uint256 _count) internal {
    uint256 deletionIndex = findSortedGroupsIndex(_count);
    require(sortedGroups[deletionIndex] == _count, "Count not found");
    uint256 lastIndex = sortedGroups.length - 1;
    // Remove the element by shifting the array
    for (uint256 j = deletionIndex; j < lastIndex; ) {
      sortedGroups[j] = sortedGroups[j + 1];
      unchecked {
        j++;
      }
    }
    sortedGroups.pop();
  }

  /**
   * @notice Determines the current or future index of the delegation count in the ranking using binary search.
   * @dev The calling function needs to determine the context of the returned value, i.e. whether to use it for inserting
   * a new delegation count or accessing an existing one.
   * @param _count The delegation count to find.
   * @return The index of the delegation count, if it already exists, or the correct insertion index in the ranking, if not found.
   */
  function findSortedGroupsIndex(uint256 _count) internal view returns (uint256) {
    uint256 left = 0;
    uint256 right = sortedGroups.length;
    while (left < right) {
      uint256 mid = left + (right - left) / 2;
      if (sortedGroups[mid] == _count) {
        return mid;
      } else if (sortedGroups[mid] > _count) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }

  /**
   * @notice Get the next ranked candidate after the given candidate.
   * @param _current The current candidate address, or address(0) to get the highest ranked candidate
   * @return The next candidate in the ranking, or address(0) if no more candidates
   */
  function getNextRankedCandidate(address _current) external view returns (address) {
    // Return highest ranked candidate if current is 0x0
    if (_current == address(0)) {
      if (sortedGroups.length == 0) return address(0);
      return groupHeads[sortedGroups[0]];
    }

    // Get current candidate's group
    uint256 currentCount = candidates[_current].delegationCount;

    // Check next in same group
    address next = candidates[_current].next;
    if (next != address(0)) return next;

    // Find current group's index
    uint256 groupIndex = findSortedGroupsIndex(currentCount);

    // Look for head of next lower group
    if (groupIndex + 1 < sortedGroups.length) {
      return groupHeads[sortedGroups[groupIndex + 1]];
    }

    return address(0);
  }
}
