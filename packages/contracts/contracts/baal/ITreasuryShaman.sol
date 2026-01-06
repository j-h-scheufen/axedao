// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/**
 * @title ITreasuryShaman
 * @notice Interface for the TreasuryShaman contract.
 * Manages deposits to the DAO treasury and mints loot tokens in return.
 * Uses DaoConfig for token rates with a local multiplier for loot calculation.
 * Supports both ERC20 tokens and native tokens (e.g., xDAI on Gnosis).
 */
interface ITreasuryShaman {
  event TreasuryDepositReceived(address indexed depositor, address indexed token, uint256 amount, uint256 lootMinted);
  event NativeTreasuryDepositReceived(address indexed depositor, uint256 amount, uint256 lootMinted);
  event MultiplierUpdated(uint256 oldMultiplier, uint256 newMultiplier);

  error InsufficientDeposit();
  error InvalidDepositReceiver();
  error InvalidMultiplier();
  error NativeTokenNotSupported();

  /**
   * @notice Deposit ERC20 tokens and receive loot in return.
   * @param token The ERC20 token to deposit.
   * @param amount The amount of tokens to deposit.
   */
  function deposit(address token, uint256 amount) external;

  /**
   * @notice Deposit native tokens and receive loot in return.
   * Send native tokens directly to the contract.
   */
  function depositNative() external payable;

  /**
   * @notice Get the current multiplier.
   * @return The multiplier in 18 decimals.
   */
  function getMultiplier() external view returns (uint256);

  /**
   * @notice Set the multiplier for loot calculation.
   * @param newMultiplier The new multiplier in 18 decimals.
   */
  function setMultiplier(uint256 newMultiplier) external;

  /**
   * @notice Calculate loot amount for a given ERC20 token deposit.
   * @param token The token to deposit.
   * @param amount The amount of tokens.
   * @return The loot amount that would be minted.
   */
  function calculateLootAmount(address token, uint256 amount) external view returns (uint256);

  /**
   * @notice Calculate loot amount for a given native token deposit.
   * @param amount The amount of native tokens.
   * @return The loot amount that would be minted.
   */
  function calculateNativeLootAmount(uint256 amount) external view returns (uint256);
}
