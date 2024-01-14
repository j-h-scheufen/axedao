// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { AXE } from "./AXE.sol";


/**
 * @title Axé Token
 * @dev xERC20 Token
 */
contract AXE2 is AXE {

    uint256 public swapFee = 500;
    
    mapping (address => bool) private transferFeeInclusion;

  /**
   * @dev Constructor
   * Mints the vesting amount for the msg.sender into 
   */
  constructor() AXE() {
  }

  /**
   * Sets a new liquidity fee.
   * @param feeBasisPoints must be between 0 and 1000, will be divided by 10
   */
  function setFee(uint256 feeBasisPoints) external onlyOwner() {
    require(feeBasisPoints >= 0 && feeBasisPoints <= 10000, "Fees must be in basis points: E.g. 50 = 0.5%, 1000 = 100.0%");
    swapFee = feeBasisPoints;
  }

  /**
   * Applies the liquidityFee as basis points to the given amount
   * @param amount the amount on which to apply the fee
   */
  function calculateFee(uint256 amount) private view returns (uint256) {
    if(amount == 0) return 0;
    return amount * swapFee / 10**4;
  }

  function _update(address from, address to, uint256 amount) internal override {

    // require(from != address(0), "from zero address");
    // require(to != address(0), "to zero address");

    // uint256 fromBalance = _balances[from];
    // require(fromBalance >= amount, "transfer amount exceeds balance");
    uint256 fee = 0;

    //buy
    if (transferFeeInclusion[from]) {
      if (swapFee > 0) {
          fee = calculateFee(amount);
          // _balances[address(this)] = _balances[address(this)] + fee;
      }
    }
    //sell
    else if (transferFeeInclusion[to]) {
      if (swapFee > 0) {
          fee = calculateFee(amount);
          // _balances[address(this)] = _balances[address(this)] + fee;
      }
    }
    uint256 adjustedAmount = amount - fee;
    super._update(from, to, adjustedAmount);
  }

  function setTransferFeeInclusion(address addr, bool applyFee) public {
    require(addr != address(0), "Cannot add zero address for fee inclusion");
    transferFeeInclusion[addr] = applyFee;
  }

  //to receive ETH from uniswapV2Router when swapping
  receive() external payable {}

}