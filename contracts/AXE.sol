// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { IERC20, ERC20 } from '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import { ERC20Capped } from '@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol';
import { SafeERC20 } from '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import { VestingWallet } from '@openzeppelin/contracts/finance/VestingWallet.sol';
import { Ownable } from '@openzeppelin/contracts/access/Ownable.sol';

import { Governable } from './Governable.sol';

/**
 * @title Axé Token
 * @dev xERC20 Token
 */
contract AXE is Ownable, Governable, ERC20Capped {

  using SafeERC20 for IERC20;

  // MAX SUPPLY encodes and honors Mestre Pastinha's and Mestre Bimba's birthdays.
  // Even though M. Pastinha was born 10 years before M. Bimba, the reverse order of their birthdays gets us closer to a target of 10 billion tokens:
  // 18[99]/[11]/[23], 18[89]/0[4]/0[5]
  uint256 internal constant _MAX_SUPPLY = 9_911_238_945;
  uint256 internal constant _VESTING_AMOUNT = 10_000_000;
  uint64 internal constant _VESTING_DURATION = 94_608_000; // 3 years
  string internal constant _NAME = unicode"Axé";
  string internal constant _TICKER = unicode"AXÉ";

  address public vestingWallet;

  /**
   * @dev Constructor
   * Mints the vesting amount for the msg.sender into 
   */
  constructor() Ownable(msg.sender) Governable(msg.sender) ERC20(_NAME, _TICKER) ERC20Capped(_MAX_SUPPLY * (10 ** decimals())) {
    VestingWallet vWallet = new VestingWallet(msg.sender, uint64(block.timestamp), _VESTING_DURATION);
    vestingWallet = address(vWallet);
    _mint(vestingWallet, _VESTING_AMOUNT * (10 ** decimals()));
  }

  /**
   * @dev Allows the governor to issue additional supply to itself up to max supply.
   */
  function issue(uint256 amount) public onlyGovernor {
    _mint(governor(), amount);
  }

}