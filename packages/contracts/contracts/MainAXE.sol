// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { VestingWallet } from "@openzeppelin/contracts/finance/VestingWallet.sol";

import { IMainAXE } from "./interfaces/IMainAXE.sol";
import { AXE } from "./AXE.sol";

/**
 * @title Main Axé Token
 * @dev Extends the standard Axé token to add a VestingWallet for the founder and an issue function
 * for the governor.
 * This contract is supposed to be deployed only once on a network where the "governor" lives and where
 * new Axé will be minted. All other standard Axé implementations do not allow the governor to
 * issue new tokens.
 */
contract MainAXE is IMainAXE, AXE {
  uint256 internal constant _VESTING_AMOUNT = 50_000_000; // ~0.5% of total supply
  uint64 internal constant _VESTING_DURATION = 94_608_000; // 3 years

  address public vestingWallet;

  /**
   * @dev Constructor - Mints the vesting amount for the founder into a VestingWallet and gives control to the governor.
   * @param _governor - the DAO's multisig
   * @param _governorTreasury - the DAO's treasury
   * @param _founder - the founder's address for vesting
   */
  constructor(
    address _governor,
    address _governorTreasury,
    address _founder
  ) AXE(_governor, _governorTreasury) {
    require(_founder != address(0), "MainAXE requires a founder");
    VestingWallet vWallet = new VestingWallet(_founder, uint64(block.timestamp), _VESTING_DURATION);
    vestingWallet = address(vWallet);
    _mint(vestingWallet, _VESTING_AMOUNT * (10 ** decimals()));
  }

  /**
   * @dev Allows the governor to issue additional supply to its treasury up to max supply.
   * @param _amount - amount of AXE to issue
   */
  function issue(uint256 _amount) external onlyGovernor {
    _mint(governorTreasury, _amount);
    emit AxeIssued(_amount);
  }
}
