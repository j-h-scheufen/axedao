// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { IERC20, ERC20 } from '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import { ERC20Capped } from '@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol';
import { SafeERC20 } from '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import { VestingWallet } from '@openzeppelin/contracts/finance/VestingWallet.sol';
import { Ownable } from '@openzeppelin/contracts/access/Ownable.sol';
import { IUniswapV2Factory } from '@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol';
import { IUniswapV2Pair } from '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';
import { IUniswapV2Router02 } from '@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol';
import "hardhat/console.sol";

import { Governable } from './Governable.sol';

/**
 * @title Axé Token
 * @dev xERC20 Token
 */
contract AXE is Ownable, Governable, ERC20Capped {

  using SafeERC20 for IERC20; // TODO not sure this is of much use?

  // MAX SUPPLY encodes and honors Mestre Pastinha's and Mestre Bimba's birthdays.
  // M. Pastinha was born 10 years before M. Bimba, so going backwards in order of their birthdays gets us close to a target of 10 billion tokens:
  // 18[99]/[11]/[23], 18[89]/0[4]/0[5]
  uint256 internal constant _MAX_SUPPLY = 9_911_238_945;
  uint256 internal constant _VESTING_AMOUNT = 25_000_000; // .05 % of total supply, 5% of initial supply
  uint64 internal constant _VESTING_DURATION = 94_608_000; // 3 years
  string internal constant _NAME = unicode"Axé";
  string internal constant _TICKER = unicode"AXÉ";

  address private founder;
  address private governorTreasury;
  address public vestingWallet;
  uint256 public buyTax = 300;
  uint256 public sellTax = 500;
  address public uniswapV2Router; // = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D // Goerli Router
  address public uniswapV2Pair;
  mapping (address => bool) private taxablePairs;
  mapping (address => bool) private excluded;
  /**
   * @dev Stores the history of liquidityTokens that were used to swap AXE. Can contain duplicates
   */
  address[] private tokenHistory;

  modifier onlyBasisPoints(uint256 value) {
    require(value <= 10000, "Value must be in basis points (0-10000): E.g. 50 = 0.5%, 9990 = 99.9%");
    _;
  }

  //TODO add events

  /**
   * @dev Constructor - Mints the vesting amount for the governor into the governor's treasury.
   * @param _founder - the founder's address for vesting
   * @param _governor - the DAO's multisig
   * @param _governorTreasury - the DAO's treasury
   */
  constructor(address _founder, address _governor, address _governorTreasury) Ownable(_governor) Governable(_governor) ERC20(_NAME, _TICKER) ERC20Capped(_MAX_SUPPLY * (10 ** decimals())) {
    require(_founder != address(0), "AXE requires a founder");
    require(_governor != address(0), "AXE requires a governor");
    require(_governorTreasury != address(0), "AXE requires a governor's treasury");
    founder = _founder;
    governorTreasury = _governorTreasury;
    //exclude treasury and this contract from fees
    excluded[governorTreasury] = true;
    excluded[address(this)] = true;
    // Set up founder's vesting wallet
    VestingWallet vWallet = new VestingWallet(founder, uint64(block.timestamp), _VESTING_DURATION);
    vestingWallet = address(vWallet);
    _mint(vestingWallet, _VESTING_AMOUNT * (10 ** decimals()));
  }

  /**
   * @dev Allows the governor to issue additional supply to its treasury up to max supply.
   * @param _amount - amount of AXE to issue
   */
  function issue(uint256 _amount) public onlyGovernor {
    _mint(governorTreasury, _amount);
  }

  /**
   * Sets a new buy tax in basis points.
   * @param basisPoints must be between 0 and 10000
   */
  function setBuyTax(uint256 basisPoints) external onlyGovernor onlyBasisPoints(basisPoints) {
    buyTax = basisPoints;
  }

  /**
   * Sets a new sell tax in basis points.
   * @param basisPoints must be between 0 and 10000
   */
  function setSellTax(uint256 basisPoints) external onlyGovernor onlyBasisPoints(basisPoints) {
    sellTax = basisPoints;
  }

  /**
   * @dev Adds the given pair to the list of taxable pools
   * @param pair - a UniswapV2Pair
   */
  function addTaxablePair(address pair) public onlyGovernor {
    require(pair != address(0), "Cannot add zero address");
    taxablePairs[pair] = true;
  }

  /**
   * @dev Removes the given pair from the list of taxable pools
   * @param pair - a UniswapV2Pair, but not the current {uniswapV2Pair} used for swapping
   */
  function removeTaxablePair(address pair) public onlyGovernor {
    require(pair != uniswapV2Pair, "Cannot remove the pair which is used for liquidation");
    taxablePairs[pair] = false;
  }

  /**
   * @dev Returns the top of the {tokenHistory} list which corresponds to the token currently used for internal liquidation
   */
  function getActiveLiquidityToken() public view returns (address tokenAddress) {
    tokenAddress = tokenHistory.length > 0 ? tokenHistory[tokenHistory.length - 1] : address(0);
  }

  /**
   * @dev Attempts to swap the given amount of AXE for the liquidity token.
   * @param amount how much AXE to swap
   */
  function liquidate(uint256 amount) public onlyGovernor {
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
  function withdrawAll() external onlyGovernor {
    // Native token
    uint256 balance = address(this).balance;
    if (balance > 0) payable(governorTreasury).transfer(balance);
    // AXE
    balance = balanceOf(address(this));
    if (balance > 0) _transfer(address(this), governorTreasury, balance);
    // Other tokens from history
    uint256 numTokens = tokenHistory.length;
    IERC20 token;
    for (uint256 i = 0; i < numTokens; i++) {
      token = IERC20(tokenHistory[i]);
      balance = token.balanceOf(address(this));
      if (balance > 0) token.transfer(governorTreasury, balance);
    }
  }

  /**
   * @dev Fallback function to withdraw an ERC20 token that might've been sent to this contract, but is not in the tokenHistory.
   * @param _token the ERC20 to rescue
   */
  function rescueBalance(address _token) external onlyGovernor {
    uint256 balance = IERC20(_token).balanceOf(address(this));
    if (balance > 0) IERC20(_token).transfer(governorTreasury, balance);
  }

  /**
   * Sets a new router and liquidity token. If the router does not have an existing pair of AXE <-> liquidityToken,
   * a pair will be automatically created. The liquidityToken is added to the tokenHistory to be able to withdraw it later.
   * @param _exchangeRouter the UniswapV2Router to use
   * @param _liquidityToken an IERC20 token used to liquidate AXE
   */
  function setLiquidationRouterAndToken(address _exchangeRouter, address _liquidityToken) public onlyGovernor returns (address pairAddress) {
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
   * @dev Overrides ERC20._update to impose buy/sell fees
   */
  function _update(address from, address to, uint256 value) internal override {
    // Don't intervene on minting/burning
    if (from == address(0) || to == address(0)) {
      return super._update(from, to, value);
    }

    address spender = _msgSender();
    console.log("Spender:", spender);
    console.log("... transferring from %s to %s %s tokens", from, to, value);

    uint256 fee = 0;
    uint256 adjustedValue = value;
    if (!excluded[from] && !excluded[to]) {
      // BUY
      if (taxablePairs[from] && buyTax > 0) {
        fee = _calculateFee(buyTax, value);
        console.log("Tax on BUY from pair %s to %s: %s tokens", from, to, fee);
        super._update(from, address(this), fee);
        adjustedValue -= fee;
      }
      // SELL
      else if (taxablePairs[to] && sellTax > 0) {
        fee = _calculateFee(sellTax, value);
        console.log("Tax on SELL to pair %s from %s: %s tokens", to, from, fee);
        super._update(from, address(this), fee);
        adjustedValue -= fee;
      }
    }
    super._update(from, to, adjustedValue);
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