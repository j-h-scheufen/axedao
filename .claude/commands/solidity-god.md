# Solidity God: Smart Contract Workflow Executor

Structured workflows for smart contract development, security reviews, audits, and optimization. This command provides specific procedures that leverage the `solidity-expert` skill's deep knowledge.

**Input:** $ARGUMENTS (task: "review [path]", "audit [path]", "optimize [path]", "create [feature]", "test [path]")

---

## Prerequisites

**Before executing any workflow:**
If the `solidity-expert` skill is not already active in this conversation, invoke it first to ensure full security and optimization expertise is available.

---

## Workflow Routing

Parse $ARGUMENTS to determine the workflow:

| Command | Workflow | Output |
|---------|----------|--------|
| `review [path]` | Security Review | Findings list with severity |
| `audit [path]` | Full Security Audit | Formal audit report |
| `optimize [path]` | Gas Optimization | Optimization recommendations |
| `create [feature]` | Contract Creation | Production-ready contract |
| `test [path]` | Test Generation | Comprehensive test suite |

---

# WORKFLOW 1: SECURITY REVIEW (`review`)

Quick security-focused code review identifying vulnerabilities.

## Procedure

1. **Read** the target contract(s)
2. **Analyze** using the OWASP Smart Contract Top 10 checklist (from solidity-expert)
3. **Check** each vulnerability category:
   - [ ] Access Control (SC01)
   - [ ] Oracle Manipulation (SC02)
   - [ ] Reentrancy (SC03)
   - [ ] Flash Loan Vectors (SC04)
   - [ ] Integer Issues (SC05)
   - [ ] DoS Vectors (SC06)
   - [ ] Signature Issues (SC07)
4. **Identify** external interaction risks
5. **Report** findings

## Output Format

```markdown
## Security Review: [Contract Name]

### Critical Findings
- [Finding with file:line reference]

### High Severity
- [Finding]

### Medium Severity
- [Finding]

### Low Severity / Informational
- [Finding]

### Recommendations
1. [Actionable recommendation]
```

---

# WORKFLOW 2: SECURITY AUDIT (`audit`)

Comprehensive security audit with formal report structure.

## Procedure

1. **Scope Definition**: Identify all contracts in scope
2. **Architecture Review**: Understand contract interactions and trust boundaries
3. **Line-by-Line Analysis**: Review every function
4. **Vulnerability Assessment**: Full OWASP Top 10 + additional checks:
   - [ ] Access Control (SC01)
   - [ ] Oracle Manipulation (SC02)
   - [ ] Reentrancy (all types) (SC03)
   - [ ] Flash Loan Vectors (SC04)
   - [ ] Integer Overflow/Underflow (SC05)
   - [ ] DoS Vectors (SC06)
   - [ ] Signature Vulnerabilities (SC07)
   - [ ] Proxy/Upgrade Safety
   - [ ] ERC Standard Compliance
   - [ ] MEV Exposure
   - [ ] Centralization Risks
   - [ ] External Call Safety
5. **Static Analysis**: Recommend running Slither/Aderyn
6. **Test Coverage**: Assess existing tests
7. **Generate Report**

## Output Format

```markdown
# Security Audit Report

## Executive Summary
- **Scope**: [Contracts audited]
- **Commit**: [Git commit hash if available]
- **Date**: [Date]
- **Critical Issues**: [Count]
- **High Issues**: [Count]
- **Medium Issues**: [Count]
- **Low Issues**: [Count]

## Findings

### [CRITICAL-01] Title
**Severity**: Critical
**Location**: `file.sol:123`
**Description**: [Detailed description]
**Impact**: [What could go wrong]
**Recommendation**: [How to fix]
**Code**:
```solidity
// Vulnerable code
```

### [HIGH-01] Title
...

## Recommendations Summary
1. [Priority-ordered recommendations]

## Disclaimer
This audit was performed to the best of ability given the provided scope.
It does not guarantee the absence of vulnerabilities.
```

---

# WORKFLOW 3: GAS OPTIMIZATION (`optimize`)

Analyze and optimize gas consumption.

## Procedure

1. **Read** target contract(s)
2. **Identify** gas-intensive patterns:
   - [ ] Unnecessary storage reads/writes
   - [ ] Unoptimized loops
   - [ ] Memory vs calldata usage
   - [ ] Variable packing opportunities
   - [ ] Redundant checks
   - [ ] String vs bytes32 usage
   - [ ] Require strings vs custom errors
3. **Calculate** estimated savings
4. **Propose** optimizations with before/after code

## Output Format

```markdown
## Gas Optimization Report: [Contract Name]

### Summary
| Category | Potential Savings |
|----------|------------------|
| Storage | ~X gas per call |
| Loops | ~Y gas per iteration |
| ... | ... |

### Optimizations

#### OPT-1: [Title]
**Location**: `file.sol:123`
**Estimated Savings**: ~X gas
**Current**:
```solidity
// Current code
```
**Optimized**:
```solidity
// Optimized code
```
**Explanation**: [Why this saves gas]

### Compiler Settings
Recommended foundry.toml:
```toml
[profile.default]
optimizer = true
optimizer_runs = 200
via_ir = true
```
```

---

# WORKFLOW 4: CONTRACT CREATION (`create`)

Create new contracts following all security best practices.

## Procedure

1. **Understand** requirements from $ARGUMENTS
2. **Design** with security-first approach:
   - Minimal attack surface
   - Clear access control
   - Safe external interactions
3. **Implement** following patterns:
   - Checks-Effects-Interactions
   - Pull over push
   - Proper visibility modifiers
   - Custom errors (not require strings)
   - NatSpec documentation
4. **Include** in contract:
   - [ ] Access control (Ownable2Step or AccessControl)
   - [ ] ReentrancyGuard where needed
   - [ ] Input validation
   - [ ] Event emission for state changes
   - [ ] Proper error handling
5. **Generate** matching test file

## Output

- Production-ready Solidity contract
- Comprehensive test file
- Deployment considerations (if applicable)

---

# WORKFLOW 5: TEST GENERATION (`test`)

Generate comprehensive Foundry tests for existing contracts.

## Procedure

1. **Analyze** target contract
2. **Identify** all public/external functions
3. **Generate** tests covering:
   - [ ] Happy path for each function
   - [ ] Revert conditions
   - [ ] Edge cases
   - [ ] Access control
   - [ ] Fuzz tests for numeric inputs
   - [ ] Invariant tests for critical properties
4. **Use** proper test naming: `test_function_scenario()`

## Test Structure Template

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {TargetContract} from "../src/TargetContract.sol";

contract TargetContractTest is Test {
    TargetContract public target;
    address public owner;
    address public user;

    function setUp() public {
        owner = makeAddr("owner");
        user = makeAddr("user");
        vm.prank(owner);
        target = new TargetContract();
    }

    // === Unit Tests ===

    function test_functionName_succeeds() public {
        // Arrange
        // Act
        // Assert
    }

    function test_functionName_revertsWhen_condition() public {
        vm.expectRevert(TargetContract.CustomError.selector);
        target.functionName();
    }

    // === Fuzz Tests ===

    function testFuzz_functionName(uint256 amount) public {
        amount = bound(amount, 1, type(uint128).max);
        // Test with fuzzed input
    }

    // === Access Control Tests ===

    function test_adminFunction_revertsWhen_notOwner() public {
        vm.prank(user);
        vm.expectRevert();
        target.adminFunction();
    }
}
```

---

# QUICK REFERENCE: SECURITY CHECKLIST

Use this for all workflows (detailed knowledge in `solidity-expert` skill):

## Pre-Deployment Checklist

- [ ] All tests pass (unit, fuzz, invariant)
- [ ] Static analysis clean (Slither, Aderyn)
- [ ] Access control reviewed
- [ ] Reentrancy guards in place
- [ ] Oracle manipulation resistant
- [ ] Integer overflow safe
- [ ] Signature replay protected
- [ ] DoS vectors eliminated
- [ ] Upgrade mechanism tested (if proxy)

## External Interactions

- [ ] All external calls checked for success
- [ ] Reentrancy considered for each external call
- [ ] Token interactions use SafeERC20
- [ ] Callbacks handled safely (ERC-721/1155 hooks)
- [ ] Flash loan scenarios considered

## Code Quality

- [ ] NatSpec on all public/external functions
- [ ] Custom errors used (not require strings)
- [ ] Events emitted for state changes
- [ ] No magic numbers (use constants)
- [ ] Proper visibility (external > public when possible)
