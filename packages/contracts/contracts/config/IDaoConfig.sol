// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/**
 * @title IDaoConfig
 * @notice Interface for the DAO-wide configuration contract.
 * Manages supported ERC20 tokens and their conversion rates relative to a base currency (e.g., EURe).
 * Rates are expressed with 18 decimals where 1e18 = 1.0.
 * A rate of 1.15e18 means 1.15 tokens = 1 base unit.
 *
 * Native token (e.g., xDAI on Gnosis) is also supported with its own rate.
 */
interface IDaoConfig {
  // Events
  event TokenRateUpdated(address indexed token, uint256 oldRate, uint256 newRate);
  event TokenAdded(address indexed token, uint256 rate);
  event TokenRemoved(address indexed token);
  event NativeTokenRateUpdated(uint256 oldRate, uint256 newRate);

  // Errors
  error TokenNotSupported(address token);
  error NativeTokenNotSupported();
  error InvalidRate();
  error InvalidTokenAddress();
  error ArrayLengthMismatch();

  /**
   * @notice Get the conversion rate for a token.
   * @param token The token address.
   * @return The rate with 18 decimals (0 if not supported).
   */
  function getTokenRate(address token) external view returns (uint256);

  /**
   * @notice Check if a token is supported.
   * @param token The token address.
   * @return True if supported.
   */
  function isTokenSupported(address token) external view returns (bool);

  /**
   * @notice Get all supported token addresses.
   * @return Array of supported token addresses.
   */
  function getSupportedTokens() external view returns (address[] memory);

  /**
   * @notice Set or update a token's conversion rate.
   * @param token The token address.
   * @param rate The rate with 18 decimals (must be > 0).
   */
  function setTokenRate(address token, uint256 rate) external;

  /**
   * @notice Remove a token from the supported list.
   * @param token The token address.
   */
  function removeToken(address token) external;

  /**
   * @notice Set or update multiple token rates in a single transaction.
   * @param tokens Array of token addresses.
   * @param rates Array of rates (must match tokens length).
   */
  function setTokenRates(address[] calldata tokens, uint256[] calldata rates) external;

  /**
   * @notice Get the conversion rate for the native token (e.g., xDAI).
   * @return The rate with 18 decimals (0 if not supported).
   */
  function getNativeTokenRate() external view returns (uint256);

  /**
   * @notice Check if native token is supported.
   * @return True if supported.
   */
  function isNativeTokenSupported() external view returns (bool);

  /**
   * @notice Set or update the native token's conversion rate.
   * @param rate The rate with 18 decimals. Set to 0 to disable native token.
   */
  function setNativeTokenRate(uint256 rate) external;

  /**
   * @notice Calculate the token amount needed for a given base amount.
   * @param token The token to pay with.
   * @param baseAmount The amount in base units (18 decimals).
   * @param tokenDecimals The decimals of the payment token.
   * @return The token amount needed (in token decimals).
   */
  function calculateTokenAmount(address token, uint256 baseAmount, uint8 tokenDecimals) external view returns (uint256);

  /**
   * @notice Calculate the native token amount needed for a given base amount.
   * @param baseAmount The amount in base units (18 decimals).
   * @return The native token amount needed (in 18 decimals).
   */
  function calculateNativeTokenAmount(uint256 baseAmount) external view returns (uint256);
}
