// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable } from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { Math } from "@openzeppelin/contracts/utils/math/Math.sol";

import { IDaoConfig } from "./IDaoConfig.sol";

/**
 * @title DaoConfig
 * @notice DAO-wide configuration contract for managing supported ERC20 tokens and their conversion rates.
 * Uses UUPS upgradeable pattern for future extensibility.
 *
 * Rates are expressed relative to a base currency (e.g., EURe = 1.0).
 * A rate of 1.15e18 for USDC means 1.15 USDC = 1 base unit (e.g., 1 EUR equivalent).
 *
 * Consumer contracts (AxeMembership, TreasuryShaman) use this config with their own multipliers:
 * - AxeMembership multiplier: 10e18 → costs 11.50 USDC or 10 EURe for membership
 * - TreasuryShaman multiplier: 1e18 → 1.15 USDC or 1 EURe per loot token
 */
contract DaoConfig is IDaoConfig, Initializable, OwnableUpgradeable, UUPSUpgradeable {
  /// @notice Mapping from token address to conversion rate (18 decimals, 0 = not supported)
  mapping(address => uint256) internal tokenRates;

  /// @notice Array of supported tokens for enumeration
  address[] internal supportedTokens;

  /// @notice Conversion rate for native token (e.g., xDAI on Gnosis). 0 = not supported.
  uint256 internal nativeTokenRate;

  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  /**
   * @notice Initialize the contract.
   * @param _owner The owner address (typically DAO treasury multi-sig).
   */
  function initialize(address _owner) public initializer {
    __Ownable_init();
    __UUPSUpgradeable_init();
    _transferOwnership(_owner);
  }

  /**
   * @notice Initialize with an initial set of tokens and rates.
   * @param _owner The owner address.
   * @param _tokens Array of token addresses.
   * @param _rates Array of rates (must match tokens length).
   */
  function initializeWithTokens(
    address _owner,
    address[] calldata _tokens,
    uint256[] calldata _rates
  ) public initializer {
    uint256 len = _tokens.length;
    require(len == _rates.length, "Arrays length mismatch");
    __Ownable_init();
    __UUPSUpgradeable_init();
    _transferOwnership(_owner);

    for (uint256 i = 0; i < len; ) {
      _setTokenRate(_tokens[i], _rates[i]);
      unchecked {
        ++i;
      }
    }
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function getTokenRate(address _token) external view override returns (uint256) {
    return tokenRates[_token];
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function isTokenSupported(address _token) external view override returns (bool) {
    return tokenRates[_token] > 0;
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function getSupportedTokens() external view override returns (address[] memory) {
    return supportedTokens;
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function setTokenRate(address _token, uint256 _rate) external override onlyOwner {
    _setTokenRate(_token, _rate);
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function removeToken(address _token) external override onlyOwner {
    if (tokenRates[_token] == 0) revert TokenNotSupported(_token);

    // Remove from array first (swap with last and pop)
    uint256 length = supportedTokens.length;
    for (uint256 i = 0; i < length; ) {
      if (supportedTokens[i] == _token) {
        supportedTokens[i] = supportedTokens[length - 1];
        supportedTokens.pop();
        break;
      }
      unchecked {
        i++;
      }
    }

    // Zero rate after array manipulation succeeds
    tokenRates[_token] = 0;

    emit TokenRemoved(_token);
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function calculateTokenAmount(
    address _token,
    uint256 _baseAmount,
    uint8 _tokenDecimals
  ) external view override returns (uint256) {
    uint256 rate = tokenRates[_token];
    if (rate == 0) revert TokenNotSupported(_token);

    // Formula: tokenAmount = (baseAmount * rate) / 1e18, adjusted for token decimals
    // baseAmount is in 18 decimals, rate is in 18 decimals
    // Result needs to be in token decimals
    // Using mulDiv to prevent overflow: split into two safe operations
    uint256 baseUnits = Math.mulDiv(_baseAmount, rate, 1e18);
    return Math.mulDiv(baseUnits, 10 ** _tokenDecimals, 1e18);
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function setTokenRates(address[] calldata _tokens, uint256[] calldata _rates) external override onlyOwner {
    uint256 len = _tokens.length;
    if (len != _rates.length) revert ArrayLengthMismatch();

    for (uint256 i = 0; i < len; ) {
      _setTokenRate(_tokens[i], _rates[i]);
      unchecked {
        ++i;
      }
    }
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function getNativeTokenRate() external view override returns (uint256) {
    return nativeTokenRate;
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function isNativeTokenSupported() external view override returns (bool) {
    return nativeTokenRate > 0;
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function setNativeTokenRate(uint256 _rate) external override onlyOwner {
    uint256 oldRate = nativeTokenRate;
    nativeTokenRate = _rate;
    emit NativeTokenRateUpdated(oldRate, _rate);
  }

  /**
   * @inheritdoc IDaoConfig
   */
  function calculateNativeTokenAmount(uint256 _baseAmount) external view override returns (uint256) {
    if (nativeTokenRate == 0) revert NativeTokenNotSupported();

    // Formula: nativeAmount = (baseAmount * rate) / 1e18
    // Both baseAmount and rate are in 18 decimals, result is in 18 decimals (native token decimals)
    // Using mulDiv to prevent overflow with very large amounts
    return Math.mulDiv(_baseAmount, nativeTokenRate, 1e18);
  }

  /**
   * @dev Internal function to set or update a token rate.
   */
  function _setTokenRate(address _token, uint256 _rate) internal {
    if (_token == address(0)) revert InvalidTokenAddress();
    if (_rate == 0) revert InvalidRate();

    uint256 oldRate = tokenRates[_token];

    if (oldRate == 0) {
      // New token - add to array
      supportedTokens.push(_token);
      tokenRates[_token] = _rate;
      emit TokenAdded(_token, _rate);
    } else {
      // Existing token - update rate
      tokenRates[_token] = _rate;
      emit TokenRateUpdated(_token, oldRate, _rate);
    }
  }

  /**
   * @dev Required by UUPS pattern. Only owner can upgrade.
   */
  function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

  /**
   * @notice Returns the current implementation version.
   * @return The version string.
   */
  function version() external pure returns (string memory) {
    return "1.1.0";
  }
}
