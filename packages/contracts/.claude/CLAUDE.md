# CLAUDE.md - Contracts Package

This file provides guidance to Claude Code when working with the Axé DAO smart contracts.

## Overview

Solidity smart contracts for the Axé DAO ecosystem, including the AXE token, membership NFTs, and DAO governance integrations with Moloch v3.

## Technology Stack

- **Build System**: Foundry/Forge + Hardhat
- **Testing**: Forge tests (unit + integration)
- **Deployment**: Forge scripts with Create3Factory for deterministic addresses
- **Contract Dependencies**: OpenZeppelin 5.0.2, DaoHaus Baal Contracts 1.2.18, Uniswap v2
- **Verification**: Etherscan integration via Forge

## Common Commands

### Building

```bash
# Build (TypeScript check + Forge compile)
pnpm build

# Forge compile only
forge compile
```

### Testing

```bash
# Run unit tests (excludes *IntegrationTest contracts)
pnpm test
forge test --no-match-contract IntegrationTest

# Run specific test
forge test --match-test test_IssuanceProposal

# Run integration tests (requires local anvil node)
export TEST_MODE=integration && forge test --match-contract IntegrationTest

# Coverage
pnpm coverage
forge coverage
```

### Linting and Formatting

```bash
# Lint (Biome for TS + Prettier for Solidity)
pnpm lint

# Format
pnpm format
```

## Local Development

### Hardhat Local Node with Fork

**Chain ID Configuration**: The local Hardhat node is configured with chain ID `1337` to match MetaMask's default localhost configuration.

See `hardhat.config.ts`:
```typescript
networks: {
  hardhat: {
    chainId: 1337,
    ...
  }
}
```

**MetaMask Setup**: Configure localhost network in MetaMask with chain ID `1337` and RPC URL `http://127.0.0.1:8545`.

### Starting a Forked Node

```bash
# Fork from Sepolia (for testing with deployed contracts)
FORK=true npx hardhat node

# Or using Anvil
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114
```

## Deployment

### Prerequisites

**Encrypted Keystore**: To avoid exposing private keys, add deployer account to Forge's encrypted keystore:

```bash
cast wallet import axe-deployer --interactive
```

### Important Forge Keystore Bug

**CRITICAL**: Foundry has a UX bug where the `--account` parameter is ignored unless you also specify `--sender` with the public address. Without `--sender`, Forge will use the default account for `startBroadcast()`.

See: https://github.com/foundry-rs/foundry/issues/6034

**Always use both parameters**:
```bash
--account axe-deployer --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B
```

### Environment Variables

Required for deployment and verification:

```bash
export ETHERSCAN_API_KEY=XXXXXXXXXX
export HTTPS_PROVIDER_URL_SEPOLIA=XXXXXXXXXXX
```

**Tip**: Store ENV vars in local `.env.local` (NOT committed) and export them:
```bash
export $(grep -v '^#' .env.local | xargs)
```

Make sure there are no whitespaces in declarations (e.g., `ETHERSCAN_API_KEY=XXX`).

### Deployment Workflow

#### 1. Local Fork Testing

Start local anvil node forked from target network:

```bash
# Fork from Sepolia at specific block (Axé DAO created at block 5327951)
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114
```

Run deploy script against local fork:

```bash
forge script scripts/deploy-AXE.s.sol:Deploy \
  --rpc-url http://localhost:8545 \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --broadcast -vvv
```

#### 2. Simulate Deployment on Target Network

Test deployment without broadcasting:

```bash
forge script scripts/deploy-AXE.s.sol:Deploy \
  --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  -vvv --verify
```

#### 3. Deploy to Target Network

After verification, add `--broadcast` flag:

```bash
forge script scripts/deploy-AXE.s.sol:Deploy \
  --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --broadcast -vvv --verify
```

### Create3Factory Deployment

Deploy scripts use the [Create3Factory](https://github.com/lifinance/create3-factory) for deterministic contract addresses across chains.

Factory address: `0x93FEC2C00BfE902F733B57c5a6CeeD7CD1384AE1` (available on all chains)

## Contract Verification

### Automatic Verification

Use `--verify` flag with forge script for automatic Etherscan verification.

### Manual Verification

If automatic verification fails or for manual verification:

```bash
forge verify-contract \
  --chain-id 11155111 \
  --num-of-optimizations 200 \
  --constructor-args $(cast abi-encode "constructor(address,address)" 0xee2ac838c83e5d6bf6eb1c8a425c007345ace39e 0x6EF543d0Cce1171F696f82cB6f698133037d5b32) \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --compiler-version 0.8.24+commit.e11b9ed9 \
  --watch \
  0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895 \
  contracts/AXESource.sol:AXESource
```

**Finding compiler version**: Run `forge inspect <ContractName> metadata` and look at the `compiler` field.

Example with more complex constructor:

```bash
forge verify-contract \
  --chain-id 11155111 \
  --num-of-optimizations 200 \
  --constructor-args $(cast abi-encode "constructor(address,address,address,uint256,uint256,string)" 0xee2ac838c83e5d6bf6eb1c8a425c007345ace39e 0x114D5F3904dB2b4635528C08b1687ECB5468EE17 0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B 10000000000000000000 100000000000000 ipfs://Qmb6cxks2ZMfWTXravK5RHf7LYLRYrtgxL14Zg47hFNxjU/quilombo-early-design.json) \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --compiler-version v0.8.24+commit.e11b9ed9 \
  --watch \
  0x4970C6Fd50B846A0E3686484d1D0C43157547E82 \
  contracts/tokens/MembershipCouncil.sol:MembershipCouncil
```

## Testing

### Unit Tests

Unit tests are executed on every build via `pnpm test`. Contracts named `*IntegrationTest` are excluded.

```bash
forge test --no-match-contract IntegrationTest
```

### Integration Tests

Integration tests require a local anvil node:

```bash
# 1. Start local anvil node
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5360605

# 2. Run integration tests
export TEST_MODE=integration && forge test --match-contract IntegrationTest
```

### Running Specific Tests

```bash
# Run specific test
forge test --match-test test_IssuanceProposal

# Run test against fork
forge test --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --fork-block-number 5360605 \
  --match-test test_IssuanceProposal

# Another example
forge test --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --fork-block-number 5411000 \
  --match-test test_LiquidityProposal
```

### Test with Impersonated Account

```bash
forge test --unlocked --from 0x238472397
```

## Useful Cast Commands

### Reading Contract State

```bash
# Read proposal state from DAO
cast call 0x1c3ac998b698206cd2fb22bb422bf14367470866 \
  "state(uint32)" 3 \
  --rpc-url http://localhost:8545
```

### Checking Balances

```bash
# Check ERC20 balance
cast balance \
  --erc20 0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895 \
  --rpc-url http://localhost:8545 \
  0xEE2ac838C83e5d6bf6Eb1C8A425C007345ACe39E

# Check ETH balance (with ether conversion)
cast balance -e \
  --rpc-url http://localhost:8545 \
  0x7e95A312E398431a26AC266B9215A7DddD5Ea60B
```

### Sending Transactions

```bash
# Send ETH from unlocked account (local anvil)
cast send \
  --rpc-url http://localhost:8545 \
  0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --value 0.5ether \
  --unlocked \
  --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

### Deploying and Interacting with Test Contracts

Deploy MockERC20:

```bash
forge create \
  --rpc-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --constructor-args "AxeUSD" "AXEUSD" \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  test/MockERC20.sol:MockERC20
```

Mint tokens:

```bash
cast send 0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B \
  "mint(address,uint256)" \
  0xEE2ac838C83e5d6bf6Eb1C8A425C007345ACe39E \
  10000000000000000000000 \
  --rpc-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer
```

## Deployed Contracts

### Sepolia Testnet

- **AXESource**: `0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895`
- **axeUSD**: `0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B`
- **UniswapV2Factory**: `0xAB5db096E5d2d79434ADC48B8D34f878dD7Fa0b0`
- **UniswapV2Router02**: `0xEF5aC450A41A39ef8A652C154318b3c8902ed86E`

## Architecture Patterns

### Foundry + Hardhat Hybrid

- Foundry/Forge for fast compilation and testing
- Hardhat for deployment scripts and network configuration
- TypeScript checking in build step ensures type safety

### Deployment Pattern

1. Write deployment logic in Solidity (Forge scripts)
2. Generate bytecode via Forge
3. Deploy via Create3Factory for deterministic addresses
4. Verify on Etherscan automatically or manually

### Test Organization

- Unit tests: `test/*.sol` (fast, no integration)
- Integration tests: `test/*IntegrationTest.sol` (require local node)
- Separation controlled by `--no-match-contract IntegrationTest` flag

## Important Notes

1. **Never use interactive git commands** (`git rebase -i`, `git add -i`) - not supported in automation

2. **Fork block numbers**: When forking for tests, use block numbers after critical deployments
   - Axé DAO created on Sepolia: block 5327951
   - Test forks typically use block 5352114+

3. **Gas optimization**: Contracts use 200 optimization runs (check `foundry.toml` or `hardhat.config.ts`)

4. **Chain ID consistency**: Local development uses chain ID 1337 to match MetaMask defaults

5. **Keystore security**: Always use encrypted keystores (`cast wallet import`) rather than exposing private keys
