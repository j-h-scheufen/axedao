# Axé DAO Smart Contracts

**Solidity smart contracts for the Axé DAO ecosystem**

This package contains the smart contracts powering the Axé DAO, including the AXE token, membership NFTs, and integrations with the Moloch v3 DAO framework.

> **Note**: For detailed technical documentation, deployment workflows, and testing patterns, see [`.claude/CLAUDE.md`](./.claude/CLAUDE.md)

## Contracts Overview

### Core Contracts

- **AXESource**: Main ERC20 token for the Axé DAO ecosystem
- **MembershipCouncil**: NFT-based membership tokens with roles and governance
- **DAO Integration**: Moloch v3 Baal contracts for decentralized governance

### Dependencies

- **OpenZeppelin**: Battle-tested contract implementations
- **DaoHaus Baal**: Moloch v3 DAO framework
- **Uniswap V2**: DEX contracts for liquidity and token swaps
- **Create3Factory**: Deterministic cross-chain deployment

> **Note**: For current package versions, refer to the `package.json` file.

## Quick Start

### Prerequisites

- **Node.js**: >=20.0.0 (see root [package.json](../../package.json))
- **pnpm**: (see root [package.json](../../package.json))
- **Foundry**: Latest version

### Install Foundry

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Installation

```bash
# From monorepo root
pnpm install

# Or from contracts directory
cd packages/contracts
pnpm install
```

### Building

```bash
# Build (TypeScript check + Forge compile)
pnpm build

# Forge compile only
forge compile
```

## Testing

### Unit Tests

```bash
# Run unit tests (excludes integration tests)
pnpm test

# Or directly with Forge
forge test --no-match-contract IntegrationTest

# Run specific test
forge test --match-test test_IssuanceProposal

# Generate coverage report
pnpm coverage
forge coverage
```

### Integration Tests

Integration tests require a local Anvil node:

```bash
# 1. Start local Anvil node (in separate terminal)
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5360605

# 2. Run integration tests
export TEST_MODE=integration && forge test --match-contract IntegrationTest
```

### Fork Testing

Test against live networks:

```bash
# Test against Sepolia fork
forge test --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --fork-block-number 5360605 \
  --match-test test_IssuanceProposal

# Test with impersonated account
forge test --unlocked --from 0x238472397
```

## Deployment

> **Important**: See [`.claude/CLAUDE.md`](./.claude/CLAUDE.md) for complete deployment workflows and best practices.

### Setup Deployer Account

Add deployer account to Forge's encrypted keystore:

```bash
cast wallet import axe-deployer --interactive
```

### Environment Variables

Required environment variables:

```bash
export ETHERSCAN_API_KEY=your_etherscan_api_key
export HTTPS_PROVIDER_URL_SEPOLIA=your_sepolia_rpc_url
export HTTPS_PROVIDER_URL_GNOSIS=your_gnosis_rpc_url
```

### Deploy to Testnet

```bash
# 1. Test deployment locally first
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114

# 2. Simulate deployment (no broadcast)
forge script scripts/deploy-AXE.s.sol:Deploy \
  --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  -vvv --verify

# 3. Deploy for real (add --broadcast)
forge script scripts/deploy-AXE.s.sol:Deploy \
  --fork-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --broadcast -vvv --verify
```

**Critical Note**: Always specify both `--account` and `--sender` due to a Foundry bug. See [`.claude/CLAUDE.md`](./.claude/CLAUDE.md) for details.

### Contract Verification

Automatic verification (recommended):

```bash
# Include --verify flag during deployment
forge script scripts/deploy-AXE.s.sol:Deploy \
  --broadcast --verify
```

Manual verification (if automatic fails):

```bash
forge verify-contract \
  --chain-id 11155111 \
  --num-of-optimizations 200 \
  --constructor-args $(cast abi-encode "constructor(address,address)" 0xee2ac838... 0x6EF543d0...) \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --compiler-version 0.8.24+commit.e11b9ed9 \
  --watch \
  0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895 \
  contracts/AXESource.sol:AXESource
```

## 🛠️ Useful Commands

### Cast Utilities

#### Read Contract State

```bash
# Check proposal state
cast call 0x1c3ac998b698206cd2fb22bb422bf14367470866 \
  "state(uint32)" 3 \
  --rpc-url http://localhost:8545

# Check token balance
cast balance --erc20 0xaE8F6454... \
  --rpc-url http://localhost:8545 \
  0xEE2ac838...

# Check ETH balance
cast balance -e \
  --rpc-url http://localhost:8545 \
  0x7e95A312E398431a26AC266B9215A7DddD5Ea60B
```

#### Send Transactions

```bash
# Send ETH (on local Anvil)
cast send \
  --rpc-url http://localhost:8545 \
  0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --value 0.5ether \
  --unlocked \
  --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

# Deploy and interact with test contracts
forge create \
  --rpc-url $HTTPS_PROVIDER_URL_SEPOLIA \
  --account axe-deployer \
  --constructor-args "AxeUSD" "AXEUSD" \
  test/MockERC20.sol:MockERC20
```

## Architecture

### Technology Stack

- **Solidity**: Latest
- **Build System**: Foundry/Forge + Hardhat
- **Testing**: Forge tests (unit + integration)
- **Deployment**: Forge scripts with Create3Factory
- **Libraries**: OpenZeppelin, DaoHaus Baal, Uniswap V2

### Deployment Strategy

Contracts use [Create3Factory](https://github.com/lifinance/create3-factory) for deterministic addresses across chains:

- Factory Address: `0x93FEC2C00BfE902F733B57c5a6CeeD7CD1384AE1` (all chains)
- Enables same contract address on different networks
- Simplifies multi-chain deployments

### Testing Strategy

1. **Unit Tests**: Fast, isolated tests for individual contracts
   - Excluded pattern: `*IntegrationTest.sol`
   - Run with: `forge test --no-match-contract IntegrationTest`

2. **Integration Tests**: Complex scenarios with multiple contracts
   - Naming: `*IntegrationTest.sol`
   - Require local Anvil node
   - Run with: `TEST_MODE=integration forge test --match-contract IntegrationTest`

3. **Fork Tests**: Test against live network state
   - Use specific block numbers for reproducibility
   - Can impersonate accounts for testing

## Deployed Contracts

### Sepolia Testnet

| Contract | Address | Explorer |
|----------|---------|----------|
| AXESource | `0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895` | [View on Etherscan](https://sepolia.etherscan.io/address/0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895) |
| AxeUSD (Test) | `0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B` | [View](https://sepolia.etherscan.io/address/0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B) |
| UniswapV2Factory | `0xAB5db096E5d2d79434ADC48B8D34f878dD7Fa0b0` | [View](https://sepolia.etherscan.io/address/0xAB5db096E5d2d79434ADC48B8D34f878dD7Fa0b0) |
| UniswapV2Router02 | `0xEF5aC450A41A39ef8A652C154318b3c8902ed86E` | [View](https://sepolia.etherscan.io/address/0xEF5aC450A41A39ef8A652C154318b3c8902ed86E) |

### Mainnet

_Coming soon_

## Development

### Linting and Formatting

```bash
# Lint (Biome for TS + Prettier for Solidity)
pnpm lint

# Format
pnpm format
```

### Local Development with Fork

```bash
# Start local Hardhat node (chain ID 1337)
FORK=true npx hardhat node

# Or use Anvil
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114

# Deploy to local fork
forge script scripts/deploy-AXE.s.sol:Deploy \
  --rpc-url http://localhost:8545 \
  --account axe-deployer \
  --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B \
  --broadcast -vvv
```

**Note**: Local chain ID is set to 1337 to match MetaMask's default localhost configuration.

## Contributing

We welcome contributions! Please see the main [Contributing Guide](../../README.md#contributing) for general guidelines.

### Contract-Specific Guidelines

1. **Writing Contracts**:
   - Follow Solidity style guide
   - Add comprehensive NatSpec comments
   - Use OpenZeppelin contracts where possible
   - Optimize for gas efficiency

2. **Testing**:
   - Write unit tests for all new functions
   - Add integration tests for complex interactions
   - Test edge cases and error conditions
   - Aim for >95% coverage

3. **Deployment**:
   - Test on local fork first
   - Deploy to testnet before mainnet
   - Verify contracts on Etherscan
   - Document deployment in this README

4. **Security**:
   - Never commit private keys
   - Use Forge's encrypted keystore
   - Follow security best practices
   - Consider audit for major changes

## Documentation

- **Technical Documentation**: [`.claude/CLAUDE.md`](./.claude/CLAUDE.md) - Detailed commands, workflows, and patterns
- **Main Repository**: [Root README](../../README.md)
- **Quilombo DApp**: [Quilombo README](../../apps/quilombo/README.md)
- **Foundry Book**: [https://book.getfoundry.sh/](https://book.getfoundry.sh/)
- **OpenZeppelin Docs**: [https://docs.openzeppelin.com/](https://docs.openzeppelin.com/)

## Security

- Always use encrypted keystores for private keys
- Test thoroughly on testnets before mainnet
- Get audits for production deployments
- Report security issues to axe-dao@protonmail.com

## License

MIT License - see [LICENSE](../../LICENSE) for details.

## Acknowledgments

- [Foundry](https://getfoundry.sh/) for the excellent development toolkit
- [OpenZeppelin](https://openzeppelin.com/) for secure contract libraries
- [DaoHaus](https://daohaus.club/) for Moloch v3 Baal contracts
- [Create3Factory](https://github.com/lifinance/create3-factory) for deterministic deployments

---

**Part of the Axé DAO ecosystem**
