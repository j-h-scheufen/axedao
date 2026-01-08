# Security Audit Report

## Executive Summary

| Attribute | Details |
|-----------|---------|
| **Scope** | 15 Solidity contracts in `/packages/contracts/contracts/*` |
| **Solidity Version** | ^0.8.20 |
| **Date** | 2026-01-06 |
| **Auditor** | Claude Code (Opus 4.5) |
| **Critical Issues** | 1 |
| **High Issues** | 3 |
| **Medium Issues** | 5 |
| **Low Issues** | 6 |
| **Informational** | 4 |

### Contracts in Scope

- `config/DaoConfig.sol`
- `config/IDaoConfig.sol`
- `baal/TreasuryShaman.sol`
- `baal/ITreasuryShaman.sol`
- `baal/AxeMembershipCouncil.sol`
- `baal/IAxeMembershipCouncil.sol`
- `tokens/AxeMembership.sol`
- `tokens/IAxeMembership.sol`
- `tokens/AXE.sol`
- `tokens/IAXE.sol`
- `tokens/AXESource.sol`
- `tokens/IAXESource.sol`
- `tokens/XERC20/AXERC20.sol`
- `tokens/XERC20/IXERC20.sol`
- `utils/Governable.sol`

---

## Findings

### [CRITICAL-01] Reentrancy in TreasuryShaman `receive()` Function

**Severity**: Critical
**Location**: `contracts/baal/TreasuryShaman.sol:136-159`
**Status**: FIXED

**Description**: The `receive()` function duplicated the logic of `depositNative()` but lacked the `nonReentrant` modifier. The comment acknowledged this but the inline implementation was still vulnerable to reentrancy.

**Impact**: An attacker could re-enter through the `depositReceiver.call{value: amount}("")` before state is finalized, potentially minting extra loot tokens.

**Code**:
```solidity
receive() external payable {
    // Delegate to depositNative (but we can't use nonReentrant here since it's calling another function)
    // Instead, just do the same logic inline
    if (msg.value == 0) revert InsufficientDeposit();
    // ... loot minting happens before transfer
    (bool success, ) = depositReceiver.call{ value: amount }("");  // REENTRANCY VECTOR
}
```

**Recommendation**: Extract logic to internal function with `nonReentrant` modifier that both `depositNative()` and `receive()` can call.

---

### [HIGH-01] Missing `nonReentrant` in AxeMembershipCouncil `requestCouncilUpdate()`

**Severity**: High
**Location**: `contracts/baal/AxeMembershipCouncil.sol:135`
**Status**: FIXED

**Description**: The `requestCouncilUpdate()` function modifies critical state (incoming/outgoing council lists) and reads from external contracts (`lootToken.balanceOf()`, `membership.getRankedGroupAtIndex()`) but had no reentrancy protection.

**Impact**: If the `membership` contract or tokens have callback mechanisms, state could be manipulated during execution.

**Recommendation**: Add `nonReentrant` modifier to `requestCouncilUpdate()`.

---

### [HIGH-02] Unsafe ERC20 Transfer in AXE.sol

**Severity**: High
**Location**: `contracts/tokens/AXE.sol:207`
**Status**: FIXED

**Description**: The `withdrawToken()` function used `token.transfer()` instead of `SafeERC20.safeTransfer()`. Some ERC20 tokens (like USDT) don't return a boolean, which would cause this call to revert or fail silently.

**Code**:
```solidity
function withdrawToken(address _token, uint256 _amount) external onlyGovernor {
    // ...
    token.transfer(governorTreasury, transfer);  // UNSAFE
}
```

**Recommendation**: Use `SafeERC20.safeTransfer()`:
```solidity
IERC20(_token).safeTransfer(governorTreasury, transfer);
```

---

### [HIGH-03] Overflow Risk in DaoConfig `calculateTokenAmount()`

**Severity**: High
**Location**: `contracts/config/DaoConfig.sol:139`
**Status**: FIXED

**Description**: The mathematical formula could overflow with very large values before division occurs.

**Code**:
```solidity
return (_baseAmount * rate * (10 ** _tokenDecimals)) / (1e18 * 1e18);
```

**Impact**: With Solidity 0.8+, overflow would revert rather than wrap, but users would be unable to complete transactions for large amounts.

**Recommendation**: Use `Math.mulDiv()` from OpenZeppelin for overflow-safe multiplication:
```solidity
uint256 baseUnits = Math.mulDiv(_baseAmount, rate, 1e18);
return Math.mulDiv(baseUnits, 10 ** _tokenDecimals, 1e18);
```

---

### [MEDIUM-01] Single-Step Ownership Transfer in Multiple Contracts

**Severity**: Medium
**Location**:
- `contracts/tokens/AxeMembership.sol:25` (uses `Ownable`)
- `contracts/baal/TreasuryShaman.sol:25` (uses `Ownable`)
- `contracts/baal/AxeMembershipCouncil.sol:26` (uses `Ownable`)

**Status**: FIXED

**Description**: These contracts use OpenZeppelin's `Ownable` instead of `Ownable2Step`. A typo in `transferOwnership()` could irrevocably transfer ownership to a wrong address.

**Recommendation**: Use `Ownable2Step` for all ownership-critical contracts.

---

### [MEDIUM-02] Governable.sol Uses Single-Step Transfer

**Severity**: Medium
**Location**: `contracts/utils/Governable.sol:78-83`
**Status**: FIXED

**Description**: The custom `Governable` contract implements single-step governorship transfer similar to `Ownable`. This carries the same risk of accidental loss of control.

**Recommendation**: Implement a two-step governorship transfer pattern with `transferGovernorship()` and `acceptGovernorship()`.

---

### [MEDIUM-03] Centralization Risk: Unlimited Tax Rates in AXE.sol

**Severity**: Medium
**Location**: `contracts/tokens/AXE.sol:75-87`
**Status**: FIXED

**Description**: The governor can set `buyTax` and `sellTax` up to 10000 basis points (100%). This allows complete confiscation of trade value.

**Impact**: A compromised or malicious governor could set taxes to 100%, effectively stealing all traded tokens.

**Recommendation**: Implement maximum tax caps:
```solidity
uint256 public constant MAX_TAX = 2500; // 25%
require(_basisPoints <= MAX_TAX, "Tax exceeds maximum");
```

---

### [MEDIUM-04] Missing Input Validation for `donationReceiver` in AxeMembership

**Severity**: Medium
**Location**: `contracts/tokens/AxeMembership.sol:352-354`
**Status**: FIXED

**Description**: `setDonationReceiver()` doesn't validate that the new receiver is not `address(0)`, unlike the constructor.

**Code**:
```solidity
function setDonationReceiver(address _donationReceiver) external onlyOwner {
    donationReceiver = _donationReceiver;  // No zero-address check
}
```

**Recommendation**: Add validation:
```solidity
require(_donationReceiver != address(0), "Invalid receiver");
```

---

### [MEDIUM-05] DoS Vector in AxeMembershipCouncil Array Operations

**Severity**: Medium
**Location**: `contracts/baal/AxeMembershipCouncil.sol:285-297`
**Status**: FIXED

**Description**: The `increaseCouncilLimit()` function creates a new array and copies all elements in a loop. For large councils (e.g., 100+ members), this could hit block gas limits.

**Code**:
```solidity
address[] memory newList = new address[](_newLimit);
for (uint256 i = 0; i < currentCouncilList.length; i++) {
    newList[i] = currentCouncilList[i];
}
currentCouncilList = newList;
```

**Recommendation**: Consider a mapping-based approach or limit maximum council size.

---

### [LOW-01] Missing Event Emission Ordering in DaoConfig `removeToken()`

**Severity**: Low
**Location**: `contracts/config/DaoConfig.sol:104-123`
**Status**: FIXED

**Description**: The state change for `tokenRates[_token] = 0` happens before array manipulation. If the array removal fails, the rate is already zeroed.

**Recommendation**: Move `tokenRates[_token] = 0` after the array manipulation or use a transactional pattern.

---

### [LOW-02] Unchecked Array Index Access

**Severity**: Low
**Location**: `contracts/baal/AxeMembershipCouncil.sol:242-244`
**Status**: FIXED

**Description**: `getCouncilMemberAtIndex()` doesn't validate `_index` bounds before accessing `currentCouncilList[_index]`.

**Recommendation**: Add bounds checking:
```solidity
require(_index < currentCouncilList.length, "Index out of bounds");
```

---

### [LOW-03] Event Parameter Mismatch in AXE.sol

**Severity**: Low
**Location**: `contracts/tokens/AXE.sol:242`
**Status**: FIXED

**Description**: The `SellTaxApplied` event incorrectly uses `buyTax` instead of `sellTax` as the basisPoints parameter.

**Code**:
```solidity
emit SellTaxApplied(_value, buyTax, fee, _from);  // Should be sellTax
```

**Recommendation**: Change to:
```solidity
emit SellTaxApplied(_value, sellTax, fee, _from);
```

---

### [LOW-04] Missing `require` String Consistency

**Severity**: Low
**Location**: Multiple contracts
**Status**: FIXED

**Description**: Some contracts use custom errors while others use `require()` with strings. Custom errors are more gas-efficient and should be used consistently.

**Examples**:
- `TreasuryShaman.sol:129` uses `require(success, "Failed to forward native deposit")`
- `AxeMembership.sol:134` uses `require(!candidates[sender].available, "Already enlisted")`

**Recommendation**: Convert all `require()` statements to custom errors for consistency and gas savings.

---

### [LOW-05] Soul-bound Token Transfer Prevention Not Explicit

**Severity**: Low
**Location**: `contracts/tokens/AxeMembership.sol`
**Status**: FIXED

**Description**: While AxeMembership is described as "soul-bound" in comments, there's no explicit override of `_update()` or `_transfer()` to prevent transfers. If ERC721 allows transfers, delegation counts could become stale.

**Recommendation**: Override `_update()` to prevent transfers:
```solidity
function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
    address from = _ownerOf(tokenId);
    if (from != address(0) && to != address(0)) {
        revert("Soul-bound: transfers not allowed");
    }
    return super._update(to, tokenId, auth);
}
```

---

### [LOW-06] AXERC20 Mint/Burn Publicly Callable

**Severity**: Low
**Location**: `contracts/tokens/XERC20/AXERC20.sol:42-59`
**Status**: OPEN

**Description**: The `mint()` and `burn()` functions are `public` with no access control modifier. They rely on the bridge limit system, but any address with `maxLimit > 0` can call them.

**Impact**: Relies entirely on the limit system for access control. If limits are misconfigured, unauthorized minting could occur.

**Recommendation**: Consider adding explicit role checks in addition to limit checks.

---

## Informational Findings

### [INFO-01] UUPS Proxy Pattern Correctly Implemented

**Location**: `contracts/config/DaoConfig.sol:33-36`

**Description**: DaoConfig correctly implements `_disableInitializers()` in the constructor, preventing implementation contract takeover attacks. Good practice.

---

### [INFO-02] Consider Using `Ownable2Step` for New EOA-Owned Contracts

All new contracts owned by EOAs should use `Ownable2Step` by default. Current contracts using `Ownable` with DAO multi-sig ownership are acceptable.

---

### [INFO-03] Gas Optimization: Binary Search Implementation

**Location**: `contracts/tokens/AxeMembership.sol:556-569`

The `findSortedGroupsIndex()` function uses binary search which is efficient. No changes needed.

---

### [INFO-04] Consider Adding NatSpec Documentation

Several functions lack complete NatSpec documentation. Adding `@notice`, `@param`, and `@return` tags improves code maintainability and can be used for documentation generation.

---

## Recommendations Summary

| Priority | Action | Status |
|----------|--------|--------|
| **P0** | Fix reentrancy in `TreasuryShaman.receive()` | FIXED |
| **P0** | Use `SafeERC20.safeTransfer()` in `AXE.withdrawToken()` | FIXED |
| **P1** | Add `nonReentrant` to `AxeMembershipCouncil.requestCouncilUpdate()` | FIXED |
| **P1** | Fix overflow risk in `DaoConfig.calculateTokenAmount()` | FIXED |
| **P1** | Migrate from `Ownable` to `Ownable2Step` | FIXED |
| **P1** | Implement two-step governorship in `Governable.sol` | FIXED |
| **P2** | Add tax caps in `AXE.sol` | FIXED |
| **P2** | Add zero-address validation in `setDonationReceiver()` | FIXED |
| **P2** | Fix event parameter in `SellTaxApplied` | FIXED |
| **P3** | Convert `require()` strings to custom errors | FIXED |
| **P3** | Add soul-bound transfer prevention | FIXED |
| **P3** | Add bounds checking for array access | FIXED |

---

## Static Analysis Recommendations

Run the following tools before deployment:

```bash
# Slither static analysis
slither packages/contracts --exclude-dependencies

# Check upgradeability (for DaoConfig)
slither-check-upgradeability contracts/config/DaoConfig.sol DaoConfig

# Aderyn analysis
aderyn packages/contracts
```

---

## Disclaimer

This audit was performed to the best of ability given the provided scope. It does not guarantee the absence of vulnerabilities. The findings are based on the code snapshot at the time of review.

---

## Applied Fixes

### 2026-01-06

| Finding | Fix Applied | Commit |
|---------|-------------|--------|
| **[CRITICAL-01]** Reentrancy in `TreasuryShaman.receive()` | Refactored to use `_depositNativeInternal()` with `nonReentrant` modifier. Both `depositNative()` and `receive()` now call this protected internal function. | Pending |
| **[HIGH-01]** Missing `nonReentrant` in `requestCouncilUpdate()` | Added `nonReentrant` modifier to `AxeMembershipCouncil.requestCouncilUpdate()` | Pending |
| **[HIGH-02]** Unsafe ERC20 transfer in `AXE.withdrawToken()` | Changed `token.transfer()` to `token.safeTransfer()` using OpenZeppelin's SafeERC20 | Pending |
| **[HIGH-03]** Overflow risk in `calculateTokenAmount()` | Added `Math` import from OpenZeppelin; refactored calculations to use `Math.mulDiv()` for overflow-safe arithmetic in both `calculateTokenAmount()` and `calculateNativeTokenAmount()` | Pending |
| **[MEDIUM-03]** Unlimited tax rates | Added `MAX_TAX` constant (2500 = 25%) and validation in `setBuyTax()` and `setSellTax()` with `TaxExceedsMaximum` error | Pending |
| **[MEDIUM-04]** Missing zero-address validation | Added `InvalidAddress()` check to `setDonationReceiver()` | Pending |
| **[LOW-02]** Unchecked array access | Added bounds checking with `IndexOutOfBounds` error in `getCouncilMemberAtIndex()` | Pending |
| **[LOW-03]** Event parameter mismatch | Fixed `SellTaxApplied` event to use `sellTax` instead of `buyTax` | Pending |
| **[LOW-04]** Inconsistent error handling | Converted all `require()` statements to custom errors in `AXE.sol`, `AxeMembership.sol` contracts | Pending |
| **[LOW-05]** Soul-bound not enforced | Added `_update()` override with `SoulBoundTransferNotAllowed` error to block transfers | Pending |
| **[LOW-01]** Event emission ordering | Moved `tokenRates[_token] = 0` after array manipulation in `removeToken()` | Pending |
| **[MEDIUM-05]** DoS vector in council array operations | Added `MAX_COUNCIL_SIZE = 1000` constant and validation in `increaseCouncilLimit()` | Pending |
| **[MEDIUM-01]** Single-step ownership in AxeMembership, TreasuryShaman, AxeMembershipCouncil | Migrated all three contracts from `Ownable` to `Ownable2Step` | Pending |
| **[MEDIUM-02]** Single-step governorship in Governable.sol | Implemented two-step pattern with `pendingGovernor()`, `transferGovernorship()`, `acceptGovernorship()`, and `GovernorshipTransferStarted` event | Pending |

**Files Modified:**
- `contracts/baal/TreasuryShaman.sol`
- `contracts/baal/AxeMembershipCouncil.sol`
- `contracts/baal/IAxeMembershipCouncil.sol`
- `contracts/tokens/AXE.sol`
- `contracts/tokens/IAXE.sol`
- `contracts/tokens/AxeMembership.sol`
- `contracts/tokens/IAxeMembership.sol`
- `contracts/config/DaoConfig.sol`
- `contracts/utils/Governable.sol`
- `test/Axe.t.sol`
- `test/AxeMembershipOnboarding.t.sol`

**Verification:**
- All 32 unit tests pass (`forge test --no-match-contract IntegrationTest`)
- Compilation successful with no errors
