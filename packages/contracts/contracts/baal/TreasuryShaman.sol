// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { IBaal } from "@daohaus/baal-contracts/contracts/interfaces/IBaal.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ReentrancyGuard } from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

import { ITreasuryShaman } from "./ITreasuryShaman.sol";
import { IDaoConfig } from "../config/IDaoConfig.sol";

/**
 * @title TreasuryShaman
 * @notice Manages deposits to the (rage-quittable) DAO treasury and mints loot tokens in return.
 * Uses DaoConfig for supported token rates with a local multiplier for loot calculation.
 * Supports both ERC20 tokens and native tokens (e.g., xDAI on Gnosis).
 *
 * Loot calculation: lootAmount = (depositAmount / tokenRate) * multiplier
 * - A multiplier of 1e18 means 1 base unit of deposit = 1 loot
 * - A multiplier of 2e18 means 1 base unit of deposit = 2 loot
 */
contract TreasuryShaman is ITreasuryShaman, Ownable, ReentrancyGuard {
  using SafeERC20 for IERC20;

  IBaal public immutable baal;
  IDaoConfig public daoConfig;
  address public immutable depositReceiver;
  /// @notice The multiplier for loot calculation (18 decimals). 1e18 = 1 loot per base unit.
  uint256 public multiplier;

  constructor(
    address _baal,
    address _daoConfig,
    address _depositReceiver,
    uint256 _multiplier,
    address _owner
  ) Ownable(_owner) {
    require(_baal != address(0), "Baal cannot be zero address");
    require(_daoConfig != address(0), "DaoConfig cannot be zero address");
    require(_depositReceiver != address(0), "Receiver cannot be zero address");
    require(_multiplier > 0, "Multiplier must be greater than 0");

    baal = IBaal(_baal);
    daoConfig = IDaoConfig(_daoConfig);
    depositReceiver = _depositReceiver;
    multiplier = _multiplier;
  }

  /**
   * @notice Allows users to deposit ERC20 tokens and receive loot in return.
   * @param _token The address of the ERC20 token to deposit.
   * @param _amount The amount of tokens to deposit.
   */
  function deposit(address _token, uint256 _amount) external override nonReentrant {
    if (_amount == 0) revert InsufficientDeposit();
    address sender = _msgSender();

    // Calculate loot to mint using config rate
    uint256 lootAmount = _calculateLootAmount(_token, _amount);

    // Mint loot tokens
    address[] memory recipients = new address[](1);
    recipients[0] = sender;
    uint256[] memory amounts = new uint256[](1);
    amounts[0] = lootAmount;
    baal.mintLoot(recipients, amounts);

    // Transfer tokens to deposit receiver
    IERC20(_token).safeTransferFrom(sender, depositReceiver, _amount);
    emit TreasuryDepositReceived(sender, _token, _amount, lootAmount);
  }

  /**
   * @notice Get the current multiplier.
   * @return The multiplier in 18 decimals.
   */
  function getMultiplier() external view override returns (uint256) {
    return multiplier;
  }

  /**
   * @notice Allows owner to update the multiplier.
   * @param _newMultiplier The new multiplier (with 18 decimals).
   */
  function setMultiplier(uint256 _newMultiplier) external override onlyOwner {
    if (_newMultiplier == 0) revert InvalidMultiplier();

    uint256 oldMultiplier = multiplier;
    multiplier = _newMultiplier;

    emit MultiplierUpdated(oldMultiplier, _newMultiplier);
  }

  /**
   * @notice Calculate loot amount for a given token deposit.
   * @param _token The token to deposit.
   * @param _amount The amount of tokens.
   * @return The loot amount that would be minted.
   */
  function calculateLootAmount(address _token, uint256 _amount) external view override returns (uint256) {
    return _calculateLootAmount(_token, _amount);
  }

  /**
   * @notice Allows users to deposit native tokens and receive loot in return.
   */
  function depositNative() external payable override nonReentrant {
    if (msg.value == 0) revert InsufficientDeposit();
    if (!daoConfig.isNativeTokenSupported()) revert NativeTokenNotSupported();

    address sender = _msgSender();
    uint256 amount = msg.value;

    // Calculate loot to mint using config rate
    uint256 lootAmount = _calculateNativeLootAmount(amount);

    // Mint loot tokens
    address[] memory recipients = new address[](1);
    recipients[0] = sender;
    uint256[] memory amounts = new uint256[](1);
    amounts[0] = lootAmount;
    baal.mintLoot(recipients, amounts);

    // Transfer native tokens to deposit receiver
    (bool success, ) = depositReceiver.call{ value: amount }("");
    require(success, "Failed to forward native deposit");
    emit NativeTreasuryDepositReceived(sender, amount, lootAmount);
  }

  /**
   * @notice Receive function that calls depositNative for convenience.
   */
  receive() external payable {
    // Delegate to depositNative (but we can't use nonReentrant here since it's calling another function)
    // Instead, just do the same logic inline
    if (msg.value == 0) revert InsufficientDeposit();
    if (!daoConfig.isNativeTokenSupported()) revert NativeTokenNotSupported();

    address sender = _msgSender();
    uint256 amount = msg.value;

    // Calculate loot to mint using config rate
    uint256 lootAmount = _calculateNativeLootAmount(amount);

    // Mint loot tokens
    address[] memory recipients = new address[](1);
    recipients[0] = sender;
    uint256[] memory amounts = new uint256[](1);
    amounts[0] = lootAmount;
    baal.mintLoot(recipients, amounts);

    // Transfer native tokens to deposit receiver
    (bool success, ) = depositReceiver.call{ value: amount }("");
    require(success, "Failed to forward native deposit");
    emit NativeTreasuryDepositReceived(sender, amount, lootAmount);
  }

  /**
   * @notice Calculate loot amount for a given native token deposit.
   * @param _amount The amount of native tokens.
   * @return The loot amount that would be minted.
   */
  function calculateNativeLootAmount(uint256 _amount) external view override returns (uint256) {
    return _calculateNativeLootAmount(_amount);
  }

  /**
   * @dev Internal function to calculate loot amount.
   * Formula: lootAmount = (depositAmount * 1e18 / tokenRate) * multiplier / 1e18
   * Adjusted for both deposit token decimals and loot token decimals.
   */
  function _calculateLootAmount(address _token, uint256 _amount) internal view returns (uint256) {
    uint256 rate = daoConfig.getTokenRate(_token);
    // getTokenRate reverts if token not supported

    uint256 depositDecimals = IERC20Metadata(_token).decimals();
    uint256 lootDecimals = IERC20Metadata(baal.lootToken()).decimals();

    // Convert deposit to base units, then apply multiplier
    // depositAmount (in token decimals) / rate = base units
    // base units * multiplier = loot (in 18 decimals, then adjust to loot decimals)
    uint256 lootAmount = (_amount * multiplier * (10 ** lootDecimals)) / (rate * (10 ** depositDecimals));

    return lootAmount;
  }

  /**
   * @dev Internal function to calculate loot amount for native tokens.
   * Formula: lootAmount = (depositAmount * multiplier) / nativeRate
   * Native tokens are 18 decimals.
   */
  function _calculateNativeLootAmount(uint256 _amount) internal view returns (uint256) {
    uint256 rate = daoConfig.getNativeTokenRate();
    // Rate of 0 means not supported, but we check isNativeTokenSupported() before calling

    uint256 lootDecimals = IERC20Metadata(baal.lootToken()).decimals();

    // Native tokens are 18 decimals
    // depositAmount (in 18 decimals) / rate = base units (18 decimals)
    // base units * multiplier / 1e18 = loot (adjust to loot decimals)
    uint256 lootAmount = (_amount * multiplier * (10 ** lootDecimals)) / (rate * 1e18);

    return lootAmount;
  }
}
