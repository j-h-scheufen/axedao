// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Test } from "forge-std/Test.sol";

import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { AxeMembership, IAxeMembership } from "../contracts/tokens/AxeMembership.sol";
import { DaoConfig, IDaoConfig } from "../contracts/config/DaoConfig.sol";
import { MockERC20 } from "./MockERC20.sol";

contract AxeMembershipOnboardingTest is Test {
  AxeMembership public token;
  DaoConfig public daoConfig;

  address dao = 0x1c3ac998b698206CD2fb22bb422Bf14367470866;
  address donationReceiver = 0x114D5F3904dB2b4635528C08b1687ECB5468EE17;
  // anvil default accounts
  address private userA = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
  address private userB = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
  address private userC = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;

  MockERC20 swapToken;
  uint256 constant TOKEN_RATE = 1e18; // 1:1 rate (1 token = 1 base unit)
  uint256 constant NATIVE_TOKEN_RATE = 1e18; // 1:1 rate for native token (e.g., xDAI)
  uint256 constant MEMBERSHIP_MULTIPLIER = 10e18; // 10 base units

  function setUp() public {
    // Deploy swap token
    swapToken = new MockERC20("Swap Token", "SWAP");

    // Mint tokens to test users
    swapToken.mint(address(userA), 1000e18);
    swapToken.mint(address(userB), 1000e18);
    swapToken.mint(address(userC), 1000e18);

    // Give test users native tokens
    vm.deal(userA, 100 ether);
    vm.deal(userB, 100 ether);
    vm.deal(userC, 100 ether);

    // Deploy DaoConfig proxy
    DaoConfig configImpl = new DaoConfig();
    address[] memory tokens = new address[](1);
    tokens[0] = address(swapToken);
    uint256[] memory rates = new uint256[](1);
    rates[0] = TOKEN_RATE;

    bytes memory initData = abi.encodeWithSelector(DaoConfig.initializeWithTokens.selector, dao, tokens, rates);
    ERC1967Proxy proxy = new ERC1967Proxy(address(configImpl), initData);
    daoConfig = DaoConfig(address(proxy));

    // Set native token rate
    vm.prank(dao);
    daoConfig.setNativeTokenRate(NATIVE_TOKEN_RATE);

    // Deploy AxeMembership with DaoConfig
    token = new AxeMembership(
      dao,
      donationReceiver,
      address(daoConfig),
      MEMBERSHIP_MULTIPLIER,
      "ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json"
    );
  }

  function test_ERC20Donation() public {
    uint256 oldMemberCount = token.getMemberCount();
    uint256 oldSwapTokenBalance = swapToken.balanceOf(donationReceiver);

    // Calculate expected donation amount: multiplier * rate / 1e18, adjusted for token decimals
    // With 10e18 multiplier and 1e18 rate, we expect 10 tokens (10e18 in 18 decimal token)
    uint256 expectedDonationAmount = token.getDonationAmount(address(swapToken));

    vm.startPrank(userA);
    vm.expectRevert(); // Insufficient allowance
    token.donate(address(swapToken));
    IERC20(swapToken).approve(address(token), expectedDonationAmount);
    token.donate(address(swapToken));
    assertTrue(token.isMember(userA), "User A should be a member");
    assertEq(token.getMemberCount(), oldMemberCount + 1, "Member count should increase by 1");
    assertTrue(
      token.ownerOf(token.getMemberCount()) == userA,
      "User A should be the owner of the new membership token"
    );
    assertEq(
      swapToken.balanceOf(address(donationReceiver)),
      oldSwapTokenBalance + expectedDonationAmount,
      "Receiver should have received the donation amount"
    );
    // Testing the newMemberOnlymodifier here
    vm.expectRevert(abi.encodeWithSelector(IAxeMembership.AlreadyMemberError.selector, userA));
    token.donate(address(swapToken));
    vm.stopPrank();
  }

  function test_NativeDonation() public {
    // Get the native donation amount from config (multiplier * rate / 1e18)
    // With 10e18 multiplier and 1e18 rate, we expect 10 native tokens
    uint256 nativeDonationAmount = token.getNativeDonationAmount();
    assertEq(nativeDonationAmount, 10 ether, "Native donation amount should be 10 ether");

    uint256 oldMemberCount = token.getMemberCount();
    uint256 oldBalance = donationReceiver.balance;

    vm.startPrank(userB);
    (bool success, ) = address(token).call{ value: nativeDonationAmount }("");
    require(success, "Failed to send native tokens from user B");
    assertTrue(token.isMember(userB), "User B should be a member");
    assertEq(token.getMemberCount(), oldMemberCount + 1, "Member count should increase by 1");
    assertTrue(
      token.ownerOf(token.getMemberCount()) == userB,
      "User B should be the owner of the new membership token"
    );
    assertEq(
      donationReceiver.balance,
      oldBalance + nativeDonationAmount,
      "Receiver should have received the donation amount from User B"
    );

    // Test that userB can't donate again
    vm.startPrank(userB);
    vm.expectRevert(abi.encodeWithSelector(IAxeMembership.AlreadyMemberError.selector, userB));
    (success, ) = address(token).call{ value: nativeDonationAmount }("");
    vm.stopPrank();

    oldBalance = donationReceiver.balance;
    uint256 oldUserCBalance = userC.balance;

    vm.startPrank(userC);
    vm.expectRevert(
      abi.encodeWithSelector(
        IAxeMembership.InsufficientDonationError.selector,
        nativeDonationAmount - 0.000005 ether,
        nativeDonationAmount
      )
    );
    (success, ) = address(token).call{ value: nativeDonationAmount - 0.000005 ether }("");
    (success, ) = address(token).call{ value: 3 * nativeDonationAmount }("");
    require(success, "Failed to send native tokens from user C");
    assertTrue(token.isMember(userC), "User C should be a member");
    assertEq(token.getMemberCount(), oldMemberCount + 2, "Original member count should have increased by 2");
    assertTrue(
      token.ownerOf(token.getMemberCount()) == userC,
      "User C should be the owner of the new membership token"
    );
    assertEq(
      donationReceiver.balance,
      oldBalance + nativeDonationAmount,
      "Receiver should have received the donation amount from User C"
    );
    assertEq(userC.balance, oldUserCBalance - nativeDonationAmount, "User C should have spent the donation amount");
    vm.stopPrank();
  }

  function test_MultipleTokenSupport() public {
    // Create a second token with different rate (e.g., 1.15 = 1.15e18)
    MockERC20 secondToken = new MockERC20("Second Token", "SEC");
    uint256 secondTokenRate = 115e16; // 1.15

    // Verify initial state - only swapToken is supported
    assertTrue(daoConfig.isTokenSupported(address(swapToken)), "Initial token should be supported");
    assertFalse(daoConfig.isTokenSupported(address(secondToken)), "Second token should not be supported initially");

    address[] memory supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 1, "Should have 1 supported token initially");
    assertEq(supportedTokens[0], address(swapToken), "First supported token should be swapToken");

    // Add second token to DaoConfig as DAO owner
    vm.prank(dao);
    daoConfig.setTokenRate(address(secondToken), secondTokenRate);

    assertTrue(daoConfig.isTokenSupported(address(secondToken)), "Second token should now be supported");
    assertEq(daoConfig.getTokenRate(address(secondToken)), secondTokenRate, "Second token rate should match");

    supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 2, "Should have 2 supported tokens now");

    // Test donation with second token
    secondToken.mint(userA, 1000e18);

    // Expected amount for second token: 10 * 1.15 = 11.5 tokens
    uint256 expectedAmount = token.getDonationAmount(address(secondToken));
    assertEq(expectedAmount, 115e17, "Expected 11.5 tokens for donation");

    vm.startPrank(userA);
    IERC20(secondToken).approve(address(token), expectedAmount);
    token.donate(address(secondToken));
    vm.stopPrank();

    assertTrue(token.isMember(userA), "User A should be a member after donating with second token");
  }

  function test_UpdateMultiplier() public {
    uint256 originalMultiplier = token.getMultiplier();
    uint256 newMultiplier = originalMultiplier * 2;

    // Non-owner cannot update
    vm.prank(userA);
    vm.expectRevert();
    token.setMultiplier(newMultiplier);

    // Owner can update
    vm.prank(dao);
    token.setMultiplier(newMultiplier);

    assertEq(token.getMultiplier(), newMultiplier, "Multiplier should be updated");

    // Verify donation amount changed accordingly
    uint256 newDonationAmount = token.getDonationAmount(address(swapToken));
    assertEq(newDonationAmount, 20e18, "Donation amount should be doubled (20 tokens)");
  }

  function test_DaoConfigRateChange() public {
    // Original donation amount with rate 1.0 and multiplier 10
    uint256 originalAmount = token.getDonationAmount(address(swapToken));
    assertEq(originalAmount, 10e18, "Original should be 10 tokens");

    // DAO changes the rate to 1.5
    vm.prank(dao);
    daoConfig.setTokenRate(address(swapToken), 15e17); // 1.5

    // New donation amount should reflect the new rate
    uint256 newAmount = token.getDonationAmount(address(swapToken));
    assertEq(newAmount, 15e18, "New amount should be 15 tokens (10 * 1.5)");
  }

  function test_RemoveTokenFromConfig() public {
    // Create and add a second token
    MockERC20 secondToken = new MockERC20("Second Token", "SEC");

    vm.prank(dao);
    daoConfig.setTokenRate(address(secondToken), 1e18);

    address[] memory supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 2, "Should have 2 supported tokens");

    // Non-owner cannot remove
    vm.prank(userA);
    vm.expectRevert();
    daoConfig.removeToken(address(swapToken));

    // Owner can remove the original token
    vm.prank(dao);
    daoConfig.removeToken(address(swapToken));

    assertFalse(daoConfig.isTokenSupported(address(swapToken)), "Original token should no longer be supported");
    assertEq(daoConfig.getTokenRate(address(swapToken)), 0, "Removed token should have 0 rate");

    supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 1, "Should have 1 supported token after removal");
    assertEq(supportedTokens[0], address(secondToken), "Remaining token should be secondToken");

    // Attempting to donate with removed token should fail
    vm.startPrank(userA);
    IERC20(swapToken).approve(address(token), 100e18);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.TokenNotSupported.selector, address(swapToken)));
    token.donate(address(swapToken));
    vm.stopPrank();

    // Donation with remaining token should work
    secondToken.mint(userA, 100e18);
    uint256 expectedAmount = token.getDonationAmount(address(secondToken));
    vm.startPrank(userA);
    IERC20(secondToken).approve(address(token), expectedAmount);
    token.donate(address(secondToken));
    vm.stopPrank();

    assertTrue(token.isMember(userA), "User A should be a member after donating with second token");
  }

  function test_UnsupportedTokenRejected() public {
    MockERC20 unsupportedToken = new MockERC20("Unsupported Token", "UNS");
    unsupportedToken.mint(userA, 100e18);

    vm.startPrank(userA);
    IERC20(unsupportedToken).approve(address(token), 100e18);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.TokenNotSupported.selector, address(unsupportedToken)));
    token.donate(address(unsupportedToken));
    vm.stopPrank();
  }

  function test_CannotAddZeroAddressToken() public {
    vm.prank(dao);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.InvalidTokenAddress.selector));
    daoConfig.setTokenRate(address(0), 1e18);
  }

  function test_CannotAddTokenWithZeroRate() public {
    MockERC20 newToken = new MockERC20("New Token", "NEW");

    vm.prank(dao);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.InvalidRate.selector));
    daoConfig.setTokenRate(address(newToken), 0);
  }

  function test_CannotRemoveUnsupportedToken() public {
    MockERC20 unsupportedToken = new MockERC20("Unsupported Token", "UNS");

    vm.prank(dao);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.TokenNotSupported.selector, address(unsupportedToken)));
    daoConfig.removeToken(address(unsupportedToken));
  }

  function test_MultiplierMustBePositive() public {
    vm.prank(dao);
    vm.expectRevert(abi.encodeWithSelector(IAxeMembership.InvalidMultiplier.selector));
    token.setMultiplier(0);
  }

  function test_EventsEmitted() public {
    MockERC20 newToken = new MockERC20("New Token", "NEW");
    uint256 newRate = 12e17; // 1.2

    // Test TokenAdded event
    vm.prank(dao);
    vm.expectEmit(true, false, false, true);
    emit IDaoConfig.TokenAdded(address(newToken), newRate);
    daoConfig.setTokenRate(address(newToken), newRate);

    // Test TokenRateUpdated event
    uint256 updatedRate = 13e17; // 1.3
    vm.prank(dao);
    vm.expectEmit(true, false, false, true);
    emit IDaoConfig.TokenRateUpdated(address(newToken), newRate, updatedRate);
    daoConfig.setTokenRate(address(newToken), updatedRate);

    // Test TokenRemoved event
    vm.prank(dao);
    vm.expectEmit(true, false, false, false);
    emit IDaoConfig.TokenRemoved(address(newToken));
    daoConfig.removeToken(address(newToken));

    // Test MultiplierUpdated event
    uint256 newMultiplier = 20e18;
    vm.prank(dao);
    vm.expectEmit(false, false, false, true);
    emit IAxeMembership.MultiplierUpdated(MEMBERSHIP_MULTIPLIER, newMultiplier);
    token.setMultiplier(newMultiplier);
  }

  function test_DonationAmountCalculation() public {
    // Test various rate/multiplier combinations
    // Rate 1.0, Multiplier 10 → 10 tokens
    assertEq(token.getDonationAmount(address(swapToken)), 10e18);

    // Change multiplier to 5
    vm.prank(dao);
    token.setMultiplier(5e18);
    assertEq(token.getDonationAmount(address(swapToken)), 5e18);

    // Change rate to 2.0
    vm.prank(dao);
    daoConfig.setTokenRate(address(swapToken), 2e18);
    assertEq(token.getDonationAmount(address(swapToken)), 10e18); // 5 * 2 = 10

    // Add token with 6 decimals (like USDC)
    MockERC20 usdc = new MockERC20("USDC", "USDC");
    // Note: MockERC20 uses 18 decimals, but the calculation should handle any decimals
    vm.prank(dao);
    daoConfig.setTokenRate(address(usdc), 1e18); // 1:1 rate
    assertEq(token.getDonationAmount(address(usdc)), 5e18); // 5 tokens at 1:1
  }

  function test_NativeTokenRateChange() public {
    // Initial native donation amount: 10 * 1.0 = 10 native tokens
    uint256 initialAmount = token.getNativeDonationAmount();
    assertEq(initialAmount, 10 ether, "Initial native donation should be 10 ether");

    // Change native token rate to 2.0 (means 2 native tokens per base unit)
    vm.prank(dao);
    daoConfig.setNativeTokenRate(2e18);

    // Now donation amount should be: 10 * 2.0 = 20 native tokens
    uint256 newAmount = token.getNativeDonationAmount();
    assertEq(newAmount, 20 ether, "Native donation should be 20 ether with 2.0 rate");

    // Change rate to 0.5 (means 0.5 native tokens per base unit)
    vm.prank(dao);
    daoConfig.setNativeTokenRate(5e17); // 0.5

    // Now donation amount should be: 10 * 0.5 = 5 native tokens
    uint256 halfAmount = token.getNativeDonationAmount();
    assertEq(halfAmount, 5 ether, "Native donation should be 5 ether with 0.5 rate");
  }

  function test_DisableNativeTokenDonation() public {
    // Verify native token is supported initially
    assertTrue(daoConfig.isNativeTokenSupported(), "Native token should be supported initially");
    assertEq(token.getNativeDonationAmount(), 10 ether, "Should return donation amount when supported");

    // Disable native token by setting rate to 0
    vm.prank(dao);
    daoConfig.setNativeTokenRate(0);

    assertFalse(daoConfig.isNativeTokenSupported(), "Native token should not be supported after setting rate to 0");
    assertEq(token.getNativeDonationAmount(), 0, "Should return 0 when native token not supported");

    // Attempt to donate with native token should fail
    vm.startPrank(userA);
    vm.expectRevert(abi.encodeWithSelector(IAxeMembership.DonationOptionNotAvailable.selector));
    (bool success, ) = address(token).call{ value: 10 ether }("");
    // The call may return false due to revert, but we expect the revert
    vm.stopPrank();
  }

  function test_BatchSetTokenRates() public {
    MockERC20 tokenA = new MockERC20("Token A", "TKA");
    MockERC20 tokenB = new MockERC20("Token B", "TKB");
    MockERC20 tokenC = new MockERC20("Token C", "TKC");

    address[] memory tokens = new address[](3);
    tokens[0] = address(tokenA);
    tokens[1] = address(tokenB);
    tokens[2] = address(tokenC);

    uint256[] memory rates = new uint256[](3);
    rates[0] = 1e18; // 1.0
    rates[1] = 15e17; // 1.5
    rates[2] = 2e18; // 2.0

    // Non-owner cannot call batch set
    vm.prank(userA);
    vm.expectRevert();
    daoConfig.setTokenRates(tokens, rates);

    // Owner can batch set
    vm.prank(dao);
    daoConfig.setTokenRates(tokens, rates);

    // Verify all tokens were added
    assertTrue(daoConfig.isTokenSupported(address(tokenA)), "Token A should be supported");
    assertTrue(daoConfig.isTokenSupported(address(tokenB)), "Token B should be supported");
    assertTrue(daoConfig.isTokenSupported(address(tokenC)), "Token C should be supported");

    assertEq(daoConfig.getTokenRate(address(tokenA)), 1e18, "Token A rate should be 1.0");
    assertEq(daoConfig.getTokenRate(address(tokenB)), 15e17, "Token B rate should be 1.5");
    assertEq(daoConfig.getTokenRate(address(tokenC)), 2e18, "Token C rate should be 2.0");

    // Should have 4 supported tokens total (swapToken + 3 new)
    address[] memory supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 4, "Should have 4 supported tokens");
  }

  function test_BatchSetTokenRates_ArrayLengthMismatch() public {
    address[] memory tokens = new address[](2);
    tokens[0] = address(swapToken);
    tokens[1] = address(0x1234567890123456789012345678901234567890);

    uint256[] memory rates = new uint256[](3);
    rates[0] = 1e18;
    rates[1] = 2e18;
    rates[2] = 3e18;

    vm.prank(dao);
    vm.expectRevert(abi.encodeWithSelector(IDaoConfig.ArrayLengthMismatch.selector));
    daoConfig.setTokenRates(tokens, rates);
  }

  function test_BatchSetTokenRates_UpdateExisting() public {
    // swapToken already exists with rate 1e18
    MockERC20 newToken = new MockERC20("New Token", "NEW");

    address[] memory tokens = new address[](2);
    tokens[0] = address(swapToken); // existing token
    tokens[1] = address(newToken); // new token

    uint256[] memory rates = new uint256[](2);
    rates[0] = 25e17; // update existing to 2.5
    rates[1] = 15e17; // new token at 1.5

    vm.prank(dao);
    daoConfig.setTokenRates(tokens, rates);

    assertEq(daoConfig.getTokenRate(address(swapToken)), 25e17, "Existing token rate should be updated");
    assertEq(daoConfig.getTokenRate(address(newToken)), 15e17, "New token rate should be set");

    // Should have 2 supported tokens (not duplicated)
    address[] memory supportedTokens = daoConfig.getSupportedTokens();
    assertEq(supportedTokens.length, 2, "Should have 2 supported tokens");
  }

  function test_NativeTokenRateEvent() public {
    vm.prank(dao);
    vm.expectEmit(false, false, false, true);
    emit IDaoConfig.NativeTokenRateUpdated(NATIVE_TOKEN_RATE, 2e18);
    daoConfig.setNativeTokenRate(2e18);
  }

  function test_CombinedERC20AndNativeDonation() public {
    // User A donates via ERC20
    uint256 erc20Amount = token.getDonationAmount(address(swapToken));
    vm.startPrank(userA);
    IERC20(swapToken).approve(address(token), erc20Amount);
    token.donate(address(swapToken));
    vm.stopPrank();
    assertTrue(token.isMember(userA), "User A should be member via ERC20");

    // User B donates via native token
    uint256 nativeAmount = token.getNativeDonationAmount();
    vm.prank(userB);
    (bool success, ) = address(token).call{ value: nativeAmount }("");
    require(success, "Native donation should succeed");
    assertTrue(token.isMember(userB), "User B should be member via native token");

    // Both should be members with incrementing token IDs
    assertEq(token.getMemberCount(), 2, "Should have 2 members");
    assertEq(token.ownerOf(1), userA, "Token 1 should belong to User A");
    assertEq(token.ownerOf(2), userB, "Token 2 should belong to User B");
  }
}
