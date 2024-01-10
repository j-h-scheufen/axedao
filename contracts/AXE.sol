// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20, ERC20Capped} from '@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol';
import {Ownable} from '@openzeppelin/contracts/access/Ownable.sol';

import {Governable} from './Governable.sol';

/**
 * @title Axé Token
 * @dev xERC20 Token
 */
contract AXE is Ownable, Governable, ERC20Capped {

  // MAX SUPPLY encodes and honors Mestre Pastinha's and Mestre Bimba's birthdays.
  // Even though M. Pastinha was born 10 years before M. Bimba, the reverse order of their birthdays gets us closer to a target of 10 billion tokens:
  // 18[99]/[11]/[23], 18[89]/0[4]/0[5]
  uint256 internal constant _MAX_SUPPLY = 9_911_238_945;
  string internal constant _NAME = unicode"Axé";
  string internal constant _TICKER = unicode"AXÉ";

  /**
   * @dev Constructor
   */
  constructor() Ownable(msg.sender) Governable(msg.sender) ERC20(_NAME, _TICKER) ERC20Capped(_MAX_SUPPLY * (10 ** decimals())) {
  }

  /**
   * @dev Allows the governor to issue additional supply to itself up to max supply.
   */
  function issue(uint256 amount) public onlyGovernor {
    _mint(governor(), amount);
  }

}