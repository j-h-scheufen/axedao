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

  uint256 internal constant _MAX_SUPPLY = 10_000_000_000;
  uint256 internal constant _DECIMALS = 10 ** 18;
  string internal constant _TOKEN_NAME = unicode"Axé";
  string internal constant _TOKEN_TICKER = unicode"AXÉ";

  /**
   * @dev Constructor
   */
  constructor() Ownable(msg.sender) Governable(msg.sender) ERC20(_TOKEN_NAME, _TOKEN_TICKER) ERC20Capped(_MAX_SUPPLY * _DECIMALS) {
  }

  /**
   * @dev Allows the governor to issue additional supply to itself up to max supply.
   */
  function issue(uint256 amount) public onlyGovernor {
    _mint(governor(), amount);
  }

}