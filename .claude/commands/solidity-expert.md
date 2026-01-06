# Solidity Expert: Smart Contract Security & Development Knowledge Base

Expert Solidity knowledge for secure, gas-optimized smart contract development. This skill provides foundational expertise that informs all Solidity-related work.

## Skill Behavior

This skill provides **deep Solidity expertise** that Claude applies during smart contract development. When active:

1. **Passive Mode**: Expertise informs all Solidity-related coding, suggestions, and analysis
2. **Active Mode**: When specific workflows are needed, invoke the appropriate `/solidity-god` subcommand:
   - `/solidity-god review [path]` - Security-focused code review
   - `/solidity-god audit [path]` - Comprehensive security audit with report
   - `/solidity-god optimize [path]` - Gas optimization analysis
   - `/solidity-god create [feature]` - Create new contracts following best practices
   - `/solidity-god test [path]` - Generate comprehensive tests

**When to invoke commands**: If the user asks for a specific workflow (e.g., "review this contract", "audit the vault", "optimize gas"), invoke the corresponding `/solidity-god` subcommand to execute the structured workflow.

---

# SECTION 1: SECURITY VULNERABILITIES (OWASP Smart Contract Top 10 2025)

## SC01: Access Control Vulnerabilities ($953M losses in 2024)

**Pattern Recognition:**
```solidity
// VULNERABLE: Missing access control
function setOwner(address newOwner) public {
    owner = newOwner;  // Anyone can call!
}

// VULNERABLE: tx.origin instead of msg.sender
function withdraw() public {
    require(tx.origin == owner);  // Phishable!
}

// SECURE: OpenZeppelin Ownable2Step
import {Ownable2Step} from "@openzeppelin/contracts/access/Ownable2Step.sol";
```

**Key Points:**
- All admin functions need proper modifiers (onlyOwner, onlyRole)
- Use `msg.sender` NOT `tx.origin` for authorization
- Two-step ownership transfer (Ownable2Step)
- Multi-sig or timelock for critical operations
- AccessControl for granular permissions (multiple roles)

## SC02: Price Oracle Manipulation ($52M losses, 37 incidents in 2024)

**Pattern Recognition:**
```solidity
// VULNERABLE: Spot price from AMM
uint256 price = IUniswapV2Pair(pair).getReserves();  // Flash-loanable!

// VULNERABLE: Single oracle source
uint256 price = chainlinkOracle.latestAnswer();  // No staleness check!

// SECURE: Multi-oracle with validation
function getPrice() external view returns (uint256) {
    uint256 chainlinkPrice = _getChainlinkPrice();
    uint256 twapPrice = _getTWAPPrice();
    require(
        _withinDeviation(chainlinkPrice, twapPrice, MAX_DEVIATION),
        "Oracle deviation too high"
    );
    return chainlinkPrice;
}
```

**Key Points:**
- NEVER use AMM spot prices directly
- Use TWAP with sufficient time window (30+ minutes)
- Chainlink staleness check: `require(updatedAt > block.timestamp - MAX_DELAY)`
- Dual oracle system with deviation checks
- Circuit breakers for extreme price movements

## SC03: Reentrancy Attacks ($35.7M losses, Penpie $27M in 2024)

**Pattern Recognition:**
```solidity
// VULNERABLE: State update after external call
function withdraw(uint256 amount) external {
    require(balances[msg.sender] >= amount);
    (bool success,) = msg.sender.call{value: amount}("");  // External call FIRST
    balances[msg.sender] -= amount;  // State update AFTER - vulnerable!
}

// SECURE: Checks-Effects-Interactions pattern
function withdraw(uint256 amount) external nonReentrant {
    require(balances[msg.sender] >= amount);  // CHECKS
    balances[msg.sender] -= amount;           // EFFECTS
    (bool success,) = msg.sender.call{value: amount}("");  // INTERACTIONS
    require(success);
}
```

**Types to Check:**
1. **Single-function reentrancy**: Same function called recursively
2. **Cross-function reentrancy**: Different function same contract
3. **Cross-contract reentrancy**: Callback to different contract
4. **Read-only reentrancy**: View functions called during state change

**Key Points:**
- Checks-Effects-Interactions pattern (state before external calls)
- ReentrancyGuard on all state-changing external functions
- ERC-721/1155 hooks are reentrancy vectors (`onERC721Received`, etc.)

## SC04: Flash Loan Attacks ($33.8M in Q1 2024)

**Pattern Recognition:**
```solidity
// VULNERABLE: No flash loan protection
function stake(uint256 amount) external {
    token.transferFrom(msg.sender, address(this), amount);
    shares[msg.sender] = calculateShares(amount);  // Manipulable within single tx
}

// SECURE: Time-weighted or collateral requirements
function stake(uint256 amount) external {
    require(block.number > lastDepositBlock[msg.sender] + MIN_BLOCKS);
    // ... rest of logic
}
```

**Key Points:**
- Time-locks between deposit and withdrawal/reward
- Block-based cooldowns for critical operations
- Flash loan-resistant pricing (TWAP vs spot)

## SC05: Integer Overflow/Underflow

**Solidity 0.8+ provides automatic checks, but watch for:**
```solidity
// STILL VULNERABLE: unchecked blocks
unchecked {
    uint256 result = a - b;  // Can underflow!
}

// STILL VULNERABLE: Yul/inline assembly
assembly {
    result := sub(a, b)  // No overflow protection in assembly!
}

// STILL VULNERABLE: Type casting
uint8 small = uint8(largeUint256);  // Silent truncation
```

**Key Points:**
- Only use `unchecked` for provably safe operations (loop counters)
- Validate all assembly arithmetic manually
- Check type casting boundaries

## SC06: Denial of Service (DoS)

**Pattern Recognition:**
```solidity
// VULNERABLE: Unbounded loop
function distributeRewards() external {
    for (uint i = 0; i < users.length; i++) {  // Can hit block gas limit!
        users[i].call{value: rewards[i]}("");
    }
}

// SECURE: Pull pattern
mapping(address => uint256) public pendingWithdrawals;
function withdraw() external {
    uint256 amount = pendingWithdrawals[msg.sender];
    pendingWithdrawals[msg.sender] = 0;
    payable(msg.sender).transfer(amount);
}
```

**Key Points:**
- No unbounded loops on storage arrays
- Pull over push for payments
- Paginated operations for large datasets

## SC07: Signature Vulnerabilities

**Pattern Recognition:**
```solidity
// VULNERABLE: Direct ecrecover without checks
address signer = ecrecover(hash, v, r, s);
// Missing: signer != address(0) check
// Missing: signature malleability protection

// SECURE: Full protection
bytes32 hash = keccak256(abi.encodePacked(
    "\x19\x01",
    DOMAIN_SEPARATOR,
    keccak256(abi.encode(TYPEHASH, to, amount, nonces[owner]++))
));
address signer = ECDSA.recover(hash, signature);  // OpenZeppelin
require(signer == owner && signer != address(0));
```

**Key Points:**
- Use OpenZeppelin ECDSA library (v4.7.3+)
- Check signer != address(0)
- Include nonce, chainId, contract address for replay protection
- Use EIP-712 for typed structured data

---

# SECTION 2: GAS OPTIMIZATION

## Storage Optimization (Highest Impact)

**Costs:**
- SSTORE (zero to non-zero): 22,100 gas
- SSTORE (non-zero to non-zero): 5,000 gas
- SSTORE (non-zero to zero): 5,000 gas + 15,000 refund
- SLOAD (cold): 2,100 gas
- SLOAD (warm): 100 gas

**Patterns:**
```solidity
// BAD: Multiple storage reads
function process() external {
    uint256 a = storageVar;      // Cold read: 2,100 gas
    uint256 b = storageVar + 1;  // Warm read: 100 gas
}

// GOOD: Cache in memory
function process() external {
    uint256 cached = storageVar;  // Single cold read: 2,100 gas
    uint256 a = cached;
    uint256 b = cached + 1;
}

// GOOD: Variable packing (same slot for related data)
struct User {
    uint128 balance;    // Slot 0 (16 bytes)
    uint64 lastUpdate;  // Slot 0 (8 bytes)
    uint64 level;       // Slot 0 (8 bytes) - fits in same slot!
}

// GOOD: Delete for refund
delete storageMap[key];  // Refund 15,000 gas
```

## Memory & Calldata

```solidity
// BAD: Memory for read-only external data
function process(string memory data) external { }  // Copies to memory

// GOOD: Calldata for read-only
function process(string calldata data) external { }  // No copy, cheaper
```

## Loop Optimization

```solidity
// BAD: Reading length every iteration
for (uint256 i = 0; i < array.length; i++) { }

// GOOD: Cache length + unchecked increment
uint256 len = array.length;
for (uint256 i = 0; i < len; ) {
    // ...
    unchecked { ++i; }  // Safe: i < len prevents overflow
}
```

## Function Visibility

```solidity
// external < public for functions only called externally
// (external reads args from calldata, public copies to memory)
function externalOnly() external { }  // Prefer when not called internally
```

## Efficient Data Types

```solidity
// Mappings vs Arrays
// Mappings: O(1) lookup, no iteration, no length
// Arrays: O(n) for includes(), has length, can iterate
// Prefer mappings when possible

// Custom errors vs require strings
error Unauthorized();  // 24 gas (selector only)
// vs
require(authorized, "Unauthorized");  // 96+ gas (string storage)
```

---

# SECTION 3: FOUNDRY TESTING BEST PRACTICES

## Test Structure

```solidity
contract ContractTest is Test {
    Contract public target;

    function setUp() public {
        target = new Contract();
    }

    // Unit tests: test_<action>_<context>
    function test_transfer_succeeds() public { }
    function test_transfer_revertsWhenPaused() public { }

    // Fuzz tests: testFuzz_<action>
    function testFuzz_transfer(uint256 amount) public {
        amount = bound(amount, 1, type(uint256).max);
    }

    // Invariant tests: invariant_<property>
    function invariant_totalSupplyConstant() public {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
    }
}
```

## Essential Cheatcodes

```solidity
// Identity spoofing
vm.prank(alice);                    // Next call as alice
vm.startPrank(alice);               // All calls as alice until stopPrank

// Balance manipulation
vm.deal(alice, 1 ether);            // Set ETH balance
deal(address(token), alice, 1000);  // Set ERC20 balance

// Time manipulation
vm.warp(block.timestamp + 1 days);  // Set timestamp
vm.roll(block.number + 100);        // Set block number

// Expect revert
vm.expectRevert();                              // Any revert
vm.expectRevert("message");                     // Specific message
vm.expectRevert(CustomError.selector);          // Custom error

// Expect emit
vm.expectEmit(true, true, false, true);
emit Transfer(alice, bob, amount);

// Fork testing
vm.createSelectFork(rpcUrl, blockNumber);
```

## Fuzz Testing

```solidity
function testFuzz_deposit(uint256 amount) public {
    amount = bound(amount, 1, token.balanceOf(address(this)));
    vault.deposit(amount);
    assertEq(vault.balanceOf(address(this)), amount);
}
```

## Invariant Testing

```solidity
contract Handler is Test {
    Vault public vault;
    uint256 public ghost_totalDeposited;

    function deposit(uint256 amount) public {
        amount = bound(amount, 0, token.balanceOf(address(this)));
        vault.deposit(amount);
        ghost_totalDeposited += amount;
    }
}

contract VaultInvariantTest is Test {
    Handler handler;

    function setUp() public {
        handler = new Handler();
        targetContract(address(handler));
    }

    function invariant_solvency() public {
        assertGe(token.balanceOf(address(vault)), handler.ghost_totalDeposited());
    }
}
```

---

# SECTION 4: PROXY PATTERNS & UPGRADEABILITY

## Pattern Comparison

| Pattern | Upgrade Logic | Gas Cost | Complexity | Risk |
|---------|--------------|----------|------------|------|
| Transparent | Proxy | Medium | Low | Medium |
| UUPS | Implementation | Low | Medium | High |
| Beacon | Beacon | Medium | High | Medium |
| Diamond | Facets | Variable | Very High | High |

## CRITICAL PROXY VULNERABILITIES

### 1. Uninitialized Implementation Attack

```solidity
// VULNERABLE: Implementation not protected
contract ImplementationV1 is UUPSUpgradeable {
    function initialize(address owner) public initializer {
        _transferOwnership(owner);  // Attacker can call on implementation!
    }
}

// SECURE: Always disable initializers in constructor
contract ImplementationV1 is UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();  // CRITICAL!
    }
}
```

### 2. Storage Collision (ERC-1967 Standard)

```solidity
// Use ERC-1967 standardized slots
bytes32 internal constant IMPLEMENTATION_SLOT =
    0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
```

### 3. UUPS "Brick" Risk

```solidity
// If you upgrade to non-UUPS implementation, proxy is BRICKED forever
// OpenZeppelin 4.5+ checks proxiableUUID() before upgrading
```

## UUPS Implementation (Recommended)

```solidity
contract MyContractV1 is UUPSUpgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address owner_) public initializer {
        __Ownable_init(owner_);
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}
}
```

## Storage Layout Safety (ERC-7201)

```solidity
// Namespaced storage (OpenZeppelin 5.0+)
contract MyContract {
    /// @custom:storage-location erc7201:mycontract.main
    struct MainStorage {
        uint256 value;
        mapping(address => uint256) balances;
    }
}
```

---

# SECTION 5: INLINE ASSEMBLY (YUL)

## When to Use
- Gas-critical operations (< 5% of your code)
- Operations impossible in Solidity
- Low-level memory manipulation

## Safety Rules

```solidity
assembly {
    // NEVER write to the zero slot (0x60-0x80)

    // ALWAYS update free memory pointer
    let freePtr := mload(0x40)
    mstore(0x40, add(freePtr, size))

    // NO overflow protection - validate manually
    let result := add(a, b)
    if lt(result, a) { revert(0, 0) }

    // ALWAYS check return values
    let success := call(gas(), target, value, 0, 0, 0, 0)
    if iszero(success) { revert(0, 0) }
}
```

---

# SECTION 6: ERC STANDARDS REFERENCE

## ERC-20 Pitfalls
- Some tokens don't return bool (USDT)
- Some tokens have transfer fees
- Some tokens can pause/blacklist
- Use SafeERC20 for all interactions

## ERC-721/1155 Reentrancy
```solidity
// onERC721Received and onERC1155Received are reentrancy vectors!
// Use ReentrancyGuard on mint/transfer functions
```

## ERC-4626 Vault Security
- First depositor inflation attack - use virtual shares (OpenZeppelin 4.9+)
- Share calculation rounding - always round against user
- Fee-on-transfer tokens break accounting

## ERC-4337 Account Abstraction
- EntryPoint is trusted - validate UserOperations carefully
- Paymaster can DoS by reverting validation
- Signature validation must be timing-safe

## Transient Storage (EIP-1153, Solidity 0.8.24+)

```solidity
// Solidity 0.8.28+: native transient keyword
contract ReentrancyGuard {
    transient bool locked;  // Auto-reset after tx

    modifier nonReentrant() {
        require(!locked, "Reentrancy");
        locked = true;
        _;
        // No need to reset - transient auto-clears!
    }
}
```

---

# SECTION 7: MEV PROTECTION

## Front-Running & Sandwich Attack Patterns

```solidity
// VULNERABLE: No slippage protection
function swap(uint256 amountIn) external {
    uint256 amountOut = getQuote(amountIn);
    token.transfer(msg.sender, amountOut);
}

// SECURE: Slippage + deadline
function swap(
    uint256 amountIn,
    uint256 minAmountOut,
    uint256 deadline
) external {
    require(block.timestamp <= deadline, "Expired");
    uint256 amountOut = getQuote(amountIn);
    require(amountOut >= minAmountOut, "Slippage");
    token.transfer(msg.sender, amountOut);
}
```

## Protection Strategies

1. **Slippage Protection**: `require(amountOut >= minAmountOut)`
2. **Deadline Protection**: `require(block.timestamp <= deadline)`
3. **Commit-Reveal Schemes**: For high-value actions
4. **Private Transaction Services**: Flashbots Protect, MEV Blocker
5. **Cooldown Mechanisms**: Prevent same-block manipulation

---

# SECTION 8: SECURITY TOOLS

## Static Analysis

**Slither** (most comprehensive):
```bash
slither . --exclude-dependencies
slither-check-upgradeability proxy.sol ProxyContract impl.sol ImplContract
```

**Aderyn** (Rust, faster for large codebases):
```bash
aderyn .
```

## Formal Verification

**Certora Prover**: Proves properties hold for ALL inputs
**SMTChecker** (built into Solidity):
```solidity
[profile.default]
model_checker = { engine = "all", targets = ["assert", "overflow"] }
```

---

# SECTION 9: AUTHORITATIVE RESOURCES

## Official Documentation
- [Solidity Docs](https://docs.soliditylang.org/)
- [Foundry Book](https://book.getfoundry.sh/)
- [OpenZeppelin Docs](https://docs.openzeppelin.com/contracts/5.x/)
- [EIPs](https://eips.ethereum.org/)

## Security Resources
- [OWASP Smart Contract Top 10 (2025)](https://owasp.org/www-project-smart-contract-top-10/)
- [SWC Registry](https://swcregistry.io/)
- [Smart Contract Security Field Guide](https://scsfg.io/)
- [RareSkills Security](https://rareskills.io/post/smart-contract-security)

## Gas Optimization
- [RareSkills Gas Optimization](https://rareskills.io/post/gas-optimization)

## Audit Reports (Learning)
- [Solodit](https://solodit.xyz/)
- [Code4rena Reports](https://code4rena.com/reports)
- [Sherlock Reports](https://audits.sherlock.xyz/contests)
