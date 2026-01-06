// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import { IBaal } from "@daohaus/baal-contracts/contracts/interfaces/IBaal.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { IERC20Errors } from "@openzeppelin/contracts/interfaces/draft-IERC6093.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

import { TreasuryShaman, ITreasuryShaman } from "../contracts/baal/TreasuryShaman.sol";
import { DaoConfig, IDaoConfig } from "../contracts/config/DaoConfig.sol";
import { MockERC20 } from "./MockERC20.sol";

/**
 * @title TreasuryShamanIntegrationTest
 * @notice Integration test that requires additional setup! The tests assume to be executed
 * against a fork of Sepolia where the Axé DAO and Axé token have been deployed.
 * Start a local anvil node with `anvil --fork-url $SEPOLIA_PROVIDER` before running the tests.
 * Set the `TEST_MODE` environment variable to `integration` before running the tests.
 */
contract TreasuryShamanIntegrationTest is Test {
  // The following addresses are for the Sepolia network
  IBaal baal = IBaal(0x1c3ac998b698206CD2fb22bb422Bf14367470866);
  address owner = 0xEE2ac838C83e5d6bf6Eb1C8A425C007345ACe39E;
  address depositTokenAddress = 0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B;
  address depositTokenOwner = 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B;
  uint256 forkBlockNumber = 7224997;

  TreasuryShaman shaman;
  DaoConfig daoConfig;
  MockERC20 newSwapToken;
  address[] testUsers;
  uint256 constant NUM_TEST_USERS = 5;
  uint256 constant MULTIPLIER = 1e18; // 1:1 multiplier for loot

  function setUp() public {
    string memory testMode = vm.envOr("TEST_MODE", string("normal"));
    vm.skip(keccak256(abi.encodePacked(testMode)) != keccak256(abi.encodePacked("integration")));
    vm.createSelectFork("http://127.0.0.1:8545", forkBlockNumber);

    // Deploy DaoConfig proxy with initial token
    DaoConfig configImpl = new DaoConfig();
    address[] memory tokens = new address[](1);
    tokens[0] = depositTokenAddress;
    uint256[] memory rates = new uint256[](1);
    rates[0] = 1e18; // 1:1 rate
    bytes memory initData = abi.encodeWithSelector(DaoConfig.initializeWithTokens.selector, owner, tokens, rates);
    ERC1967Proxy proxy = new ERC1967Proxy(address(configImpl), initData);
    daoConfig = DaoConfig(address(proxy));

    // Deploy shaman with DaoConfig
    shaman = new TreasuryShaman(
      address(baal),
      address(daoConfig),
      address(baal), // Use Baal as deposit receiver
      MULTIPLIER,
      owner
    );

    // Set up shaman permissions
    address[] memory shamans = new address[](1);
    uint256[] memory permissions = new uint256[](1);
    permissions[0] = 2; // Manager
    shamans[0] = address(shaman);
    vm.prank(owner);
    baal.setShamans(shamans, permissions);

    // Deploy new swap token for testing token updates
    newSwapToken = new MockERC20("Axe USD", "AXUSD");

    // Set up test users
    testUsers = new address[](NUM_TEST_USERS);
    for (uint256 i = 0; i < NUM_TEST_USERS; i++) {
      testUsers[i] = address(uint160(0x1000 + i));
      vm.deal(testUsers[i], 100 ether);
    }

    // Give test users some swap tokens
    uint256 amount = 1000 * 10 ** IERC20Metadata(depositTokenAddress).decimals();
    // Set token balances directly
    deal(depositTokenAddress, depositTokenOwner, amount * NUM_TEST_USERS * 2);
    vm.startPrank(depositTokenOwner);
    for (uint256 i = 0; i < NUM_TEST_USERS; i++) {
      IERC20(depositTokenAddress).transfer(testUsers[i], amount);
    }
    vm.stopPrank();
  }

  function test_Deposit() public {
    address user = testUsers[0];
    uint256 depositAmount = 100 * 10 ** IERC20Metadata(depositTokenAddress).decimals();
    uint256 expectedLoot = depositAmount; // 1:1 multiplier and 1:1 rate

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);
    uint256 initialBalance = IERC20(depositTokenAddress).balanceOf(user);

    // Approve and deposit
    vm.startPrank(user);
    IERC20(depositTokenAddress).approve(address(shaman), depositAmount);
    shaman.deposit(depositTokenAddress, depositAmount);
    vm.stopPrank();

    // Verify balances
    assertEq(IERC20(baal.lootToken()).balanceOf(user), initialLoot + expectedLoot, "Incorrect loot minted");
    assertEq(
      IERC20(depositTokenAddress).balanceOf(user),
      initialBalance - depositAmount,
      "Incorrect swap token balance"
    );
  }

  function test_DepositWithDifferentMultiplier() public {
    // Set multiplier to 0.5e18 (2 tokens for 1 loot)
    vm.prank(owner);
    shaman.setMultiplier(0.5e18);

    address user = testUsers[1];
    uint256 depositAmount = 100 * 10 ** IERC20Metadata(depositTokenAddress).decimals();
    uint256 expectedLoot = depositAmount / 2; // 0.5 multiplier means half the loot

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);

    // Approve and deposit
    vm.startPrank(user);
    IERC20(depositTokenAddress).approve(address(shaman), depositAmount);
    shaman.deposit(depositTokenAddress, depositAmount);
    vm.stopPrank();

    assertEq(
      IERC20(baal.lootToken()).balanceOf(user),
      initialLoot + expectedLoot,
      "Incorrect loot minted with custom multiplier"
    );
  }

  function test_SetMultiplier() public {
    uint256 newMultiplier = 2e18;

    vm.prank(owner);
    shaman.setMultiplier(newMultiplier);

    assertEq(shaman.getMultiplier(), newMultiplier, "Multiplier not updated");
  }

  function test_AddNewTokenToConfig() public {
    // Add new token to DaoConfig
    vm.prank(owner);
    daoConfig.setTokenRate(address(newSwapToken), 1e18);

    assertTrue(daoConfig.isTokenSupported(address(newSwapToken)), "New token should be supported");
    assertEq(daoConfig.getTokenRate(address(newSwapToken)), 1e18, "New token rate should be 1e18");
  }

  function test_CalculateLootAmount() public {
    uint256 depositAmount = 100 * 10 ** IERC20Metadata(depositTokenAddress).decimals();
    uint256 expectedLoot = depositAmount; // 1:1 with default multiplier and rate

    uint256 calculatedLoot = shaman.calculateLootAmount(depositTokenAddress, depositAmount);
    assertEq(calculatedLoot, expectedLoot, "Calculated loot should match expected");
  }

  function testRevert_SetMultiplier_NotOwner() public {
    vm.prank(testUsers[0]);
    vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, testUsers[0]));
    shaman.setMultiplier(2e18);
  }

  function testRevert_SetMultiplier_ZeroMultiplier() public {
    vm.prank(owner);
    vm.expectRevert(ITreasuryShaman.InvalidMultiplier.selector);
    shaman.setMultiplier(0);
  }

  function testRevert_Deposit_ZeroAmount() public {
    vm.prank(testUsers[0]);
    vm.expectRevert(ITreasuryShaman.InsufficientDeposit.selector);
    shaman.deposit(depositTokenAddress, 0);
  }

  function testRevert_Deposit_InsufficientAllowance() public {
    address user = testUsers[0];
    uint256 depositAmount = 100 * 10 ** IERC20Metadata(depositTokenAddress).decimals();

    vm.prank(user);
    vm.expectRevert(
      abi.encodeWithSelector(IERC20Errors.ERC20InsufficientAllowance.selector, address(shaman), 0, depositAmount)
    );
    shaman.deposit(depositTokenAddress, depositAmount);
  }

  function testRevert_Deposit_UnsupportedToken() public {
    address user = testUsers[0];
    uint256 depositAmount = 100e18;

    // newSwapToken is not added to DaoConfig
    newSwapToken.mint(user, depositAmount);

    vm.startPrank(user);
    newSwapToken.approve(address(shaman), depositAmount);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.TokenNotSupported.selector, address(newSwapToken)));
    shaman.deposit(address(newSwapToken), depositAmount);
    vm.stopPrank();
  }

  function test_NativeDeposit() public {
    // First, enable native token support
    vm.prank(owner);
    daoConfig.setNativeTokenRate(1e18); // 1:1 rate

    address user = testUsers[0];
    uint256 depositAmount = 10 ether;
    uint256 expectedLoot = depositAmount; // 1:1 multiplier and 1:1 rate

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);
    uint256 initialBalance = user.balance;
    uint256 initialBaalBalance = address(baal).balance;

    // Deposit native tokens
    vm.prank(user);
    shaman.depositNative{ value: depositAmount }();

    // Verify balances
    assertEq(IERC20(baal.lootToken()).balanceOf(user), initialLoot + expectedLoot, "Incorrect loot minted");
    assertEq(user.balance, initialBalance - depositAmount, "Incorrect user native balance");
    assertEq(address(baal).balance, initialBaalBalance + depositAmount, "Baal should receive native tokens");
  }

  function test_NativeDeposit_ViaReceive() public {
    // Enable native token support
    vm.prank(owner);
    daoConfig.setNativeTokenRate(1e18);

    address user = testUsers[1];
    uint256 depositAmount = 5 ether;
    uint256 expectedLoot = depositAmount;

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);

    // Deposit via receive() function
    vm.prank(user);
    (bool success, ) = address(shaman).call{ value: depositAmount }("");
    require(success, "Native deposit via receive should succeed");

    assertEq(IERC20(baal.lootToken()).balanceOf(user), initialLoot + expectedLoot, "Incorrect loot minted via receive");
  }

  function test_NativeDeposit_WithDifferentMultiplier() public {
    // Enable native token with 2.0 rate (2 native tokens = 1 base unit)
    vm.startPrank(owner);
    daoConfig.setNativeTokenRate(2e18);
    shaman.setMultiplier(0.5e18); // 0.5 multiplier
    vm.stopPrank();

    address user = testUsers[2];
    uint256 depositAmount = 10 ether;
    // Expected: (10 ether * 0.5e18 multiplier * 10^18 loot decimals) / (2e18 rate * 1e18) = 2.5 loot
    uint256 expectedLoot = shaman.calculateNativeLootAmount(depositAmount);

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);

    vm.prank(user);
    shaman.depositNative{ value: depositAmount }();

    assertEq(
      IERC20(baal.lootToken()).balanceOf(user),
      initialLoot + expectedLoot,
      "Incorrect loot with custom multiplier and rate"
    );
  }

  function testRevert_NativeDeposit_NotSupported() public {
    // Native token is not enabled by default (rate = 0)
    assertFalse(daoConfig.isNativeTokenSupported(), "Native token should not be supported by default");

    address user = testUsers[0];
    vm.prank(user);
    vm.expectRevert(ITreasuryShaman.NativeTokenNotSupported.selector);
    shaman.depositNative{ value: 1 ether }();
  }

  function testRevert_NativeDeposit_ZeroAmount() public {
    // Enable native token
    vm.prank(owner);
    daoConfig.setNativeTokenRate(1e18);

    vm.prank(testUsers[0]);
    vm.expectRevert(ITreasuryShaman.InsufficientDeposit.selector);
    shaman.depositNative{ value: 0 }();
  }

  function test_CalculateNativeLootAmount() public {
    // Enable native token
    vm.prank(owner);
    daoConfig.setNativeTokenRate(1e18);

    uint256 depositAmount = 100 ether;
    uint256 expectedLoot = depositAmount; // 1:1 with default multiplier and rate

    uint256 calculatedLoot = shaman.calculateNativeLootAmount(depositAmount);
    assertEq(calculatedLoot, expectedLoot, "Calculated native loot should match expected");
  }

  function test_CombinedERC20AndNativeDeposit() public {
    // Enable native token
    vm.prank(owner);
    daoConfig.setNativeTokenRate(1e18);

    address user = testUsers[3];
    uint256 erc20Amount = 50 * 10 ** IERC20Metadata(depositTokenAddress).decimals();
    uint256 nativeAmount = 25 ether;

    uint256 initialLoot = IERC20(baal.lootToken()).balanceOf(user);

    // ERC20 deposit
    vm.startPrank(user);
    IERC20(depositTokenAddress).approve(address(shaman), erc20Amount);
    shaman.deposit(depositTokenAddress, erc20Amount);

    // Native deposit
    shaman.depositNative{ value: nativeAmount }();
    vm.stopPrank();

    uint256 expectedTotalLoot = erc20Amount + nativeAmount; // Both 1:1
    assertEq(
      IERC20(baal.lootToken()).balanceOf(user),
      initialLoot + expectedTotalLoot,
      "Incorrect total loot from combined deposits"
    );
  }
}
