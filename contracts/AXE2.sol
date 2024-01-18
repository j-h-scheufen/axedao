// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { IERC20 } from '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import { IUniswapV2Factory } from '@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol';
import { IUniswapV2Pair } from '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';
import { IUniswapV2Router02 } from '@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol';
import "hardhat/console.sol";

import { AXE } from "./AXE.sol";

/**
 * @title Axé Token
 * @dev xERC20 Token
 */
contract AXE2 is AXE {

  uint256 public buyTax = 300;
  uint256 public sellTax = 500;
  address public uniswapV2Router; // = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D // Goerli Router
  address public uniswapV2Pair;
  
  mapping (address => bool) private taxablePairs;
  mapping (address => bool) private excluded;
  // stores the history of liquidityTokens that were used to swap AXE
  // Note: can contain duplicates
  address[] private tokenHistory;

  modifier onlyBasisPoints(uint256 value) {
    require(value <= 10000, "Value must be in basis points (0-10000): E.g. 50 = 0.5%, 9990 = 99.9%");
    _;
  }

  /**
   * @dev Constructor 
   */
  constructor() AXE() {
    //exclude governor and this contract from fees
    excluded[governor()] = true;
    excluded[address(this)] = true;
  }

  /**
   * Sets a new buy tax in basis points.
   * @param basisPoints must be between 0 and 10000
   */
  function setBuyTax(uint256 basisPoints) external onlyGovernor() onlyBasisPoints(basisPoints) {
    buyTax = basisPoints;
  }

  /**
   * Sets a new sell tax in basis points.
   * @param basisPoints must be between 0 and 10000
   */
  function setSellTax(uint256 basisPoints) external onlyGovernor() onlyBasisPoints(basisPoints) {
    sellTax = basisPoints;
  }

  function addTaxablePair(address pair) public onlyGovernor() {
    require(pair != address(0), "Cannot add zero address");
    taxablePairs[pair] = true;
  }

  function removeTaxablePair(address pair) public onlyGovernor() {
    require(pair != uniswapV2Pair, "Cannot remove the pair which is used for liquidation");
    taxablePairs[pair] = false;
  }

  function getActiveLiquidityToken() public view returns (address tokenAddress) {
    tokenAddress = tokenHistory.length > 0 ? tokenHistory[tokenHistory.length - 1] : address(0);
  }

  /**
   * @dev Attempts to swap the given amount of AXE for the liquidity token.
   * @param amount how much AXE to swap
   */
  function liquidate(uint256 amount) public onlyGovernor() {
    require (_hasRouter(), "Invoking this function requires a router and a liquidity pair to be set up!");
    require (amount > 0 && amount <= balanceOf(address(this)), "Liquidation amount must be between 0 and max balance.");
    // Grant allowance for swapping
    _approve(address(this), uniswapV2Router, amount);
    uint deadline = block.timestamp + (10 * 60); // 10 min
    address[] memory path;
    path[0] = address(this);
    path[1] = getActiveLiquidityToken();
    IUniswapV2Router02(uniswapV2Router).swapExactTokensForTokens(
      amount,
      0,
      path,
      address(this),
      deadline
    );
  }

  /**
   * @dev Withdraws accumulated AXE, liquidityTokens (from history), and native tokens, for any existing balances to the governor.
   */
  function withdrawFees() external onlyGovernor() {
    // Native token
    uint256 balance = address(this).balance;
    if (balance > 0) payable(governor()).transfer(balance);
    // AXE
    balance = balanceOf(address(this));
    if (balance > 0) _transfer(address(this), governor(), balance);
    // Other tokens from history
    uint256 numTokens = tokenHistory.length;
    IERC20 token;
    for (uint256 i = 0; i < numTokens; i++) {
      token = IERC20(tokenHistory[i]);
      balance = token.balanceOf(address(this));
      if (balance > 0) token.transfer(governor(), balance);
    }
  }

  /**
   * Sets a new router and liquidity token. If the router does not have an existing pair of AXE <-> liquidityToken,
   * a pair will be automatically created. The liquidityToken is added to the tokenHistory to be able to withdraw it later.
   * @param _exchangeRouter the UniswapV2Router to use
   * @param _liquidityToken an IERC20 token used to liquidate AXE
   */
  function setLiquidationRouterAndToken(address _exchangeRouter, address _liquidityToken) public onlyGovernor() returns (address pairAddress) {
    require(_exchangeRouter != address(0), "Router cannot be zero address");
    require(_liquidityToken != address(0), "Liquidity token cannot be zero address");
    // set router for swapping
    uniswapV2Router = _exchangeRouter;
    address existingPair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory())
      .getPair(address(this), _liquidityToken);
    if (address(0) == existingPair) {
      // Create a uniswap pair for the new token
      uniswapV2Pair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory())
        .createPair(address(this), _liquidityToken);
    }
    else {
      uniswapV2Pair = existingPair;
    }
    // Keep a reference to the liquidity token to access any accumulated balance in the future
    tokenHistory.push(_liquidityToken); // Note: does not check if the same token has been used in the past and would store a duplicate
    // Add pair to be taxed
    taxablePairs[uniswapV2Pair] = true;
    pairAddress = uniswapV2Pair;
  }

  /**
   * @dev Overrides ERC20.transferFrom to impose buy/sell fees
   */
  function transferFrom(address from, address to, uint256 value) public override returns (bool) {
    address spender = _msgSender();
    console.log("Spender transferring from %s to %s %s tokens", from, to, value);

    _spendAllowance(from, spender, value);
    uint256 fee = 0;
    uint256 adjustedValue = value;
    if (!excluded[from] && !excluded[to]) {
      // BUY
      if (taxablePairs[from] && buyTax > 0) {
        fee = _calculateFee(buyTax, value);
        console.log("Tax on BUY from pair %s to %s: %s tokens", from, to, fee);
        _transfer(from, address(this), fee);
        adjustedValue -= fee;
      }
      // SELL
      else if (taxablePairs[to] && sellTax > 0) {
        fee = _calculateFee(sellTax, value);
        console.log("Tax on SELL to pair %s from %s: %s tokens", to, from, fee);
        _transfer(from, address(this), fee);
        adjustedValue -= fee;
      }
    }
    _transfer(from, to, adjustedValue);

    return true;
  }

  /**
   * Applies the given tax to the given amount and returns the result.
   * @param basisPoints the tax in basis points
   * @param amount the amount on which to apply the tax
   */
  function _calculateFee(uint256 basisPoints, uint256 amount) internal pure returns (uint256) {
    return amount == 0 ? 0 : amount * basisPoints / 10**4;
  }

  function _hasRouter() internal view returns (bool success) {
    return uniswapV2Router != address(0) && uniswapV2Pair != address(0);
  }

  //to receive native tokens
  receive() external payable {}

}
