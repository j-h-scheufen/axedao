```ascii
    ___          __     ____  ___   ____
   /   |  _  ___/_/    / __ \/   | / __ \
  / /| | | |/_/ _ \   / / / / /| |/ / / /
 / ___ |_>  </  __/  / /_/ / ___ / /_/ /
/_/  |_/_/|_|\___/  /_____/_/  |_\____/

```

# Axé DAO

**Building a decentralized autonomous organization for the global Capoeira community**

Axé DAO combines blockchain technology with community governance to create a transparent, inclusive platform for Capoeira practitioners worldwide. This monorepo contains the smart contracts, DApp, and supporting infrastructure for the Axé DAO ecosystem.

## 🌍 Project Overview

Axé DAO empowers Capoeira communities through:

- **Decentralized Governance**: Moloch v3-based DAO for transparent community decision-making
- **Community Platform**: Connect with practitioners, groups, and events globally
- **Token Economics**: AXE token for participation and governance
- **Membership NFTs**: On-chain representation of community roles and achievements

## 📦 Monorepo Structure

This is a pnpm monorepo containing:

| Package | Description | Tech Stack |
|---------|-------------|------------|
| [`apps/quilombo`](./apps/quilombo) | Main DApp for community features | Next.js, React, Wagmi, Drizzle ORM |
| [`apps/www`](./apps/www) | Public marketing website | Next.js, i18next |
| [`packages/contracts`](./packages/contracts) | Smart contracts for AXE token and DAO | Solidity, Foundry, Hardhat |
| [`packages/subgraph-moloch-v3`](./packages/subgraph-moloch-v3) | GraphQL API for DAO data | The Graph |

> **Note**: For current package versions, refer to the respective `package.json` files in each package directory.

## 🚀 Quick Start

### Prerequisites

- **Node.js**: >=20.0.0 (see `engines` in root [package.json](./package.json))
- **pnpm**: (see `packageManager` in root [package.json](./package.json))
- **Foundry**: (for smart contracts)

### Installation

```bash
# Clone the repository
git clone https://github.com/j-h-scheufen/axedao.git
cd axedao

# Install dependencies
pnpm install

# Build all packages
pnpm build
```

### Development

```bash
# Run Quilombo DApp (port 8080)
pnpm dev:app

# Run public website (port 3000)
pnpm dev:www

# Run all tests
pnpm test

# Lint all packages
pnpm lint

# Format all code
pnpm format
```

For package-specific commands and detailed setup instructions, see each package's README:
- [Quilombo DApp](./apps/quilombo/README.md)
- [Public Website](./apps/www/README.md)
- [Smart Contracts](./packages/contracts/README.md)

## 🏗️ Architecture

### Technology Stack

**Frontend**:
- Next.js App Router with React Server Components
- HeroUI component library + Tailwind CSS
- TypeScript for type safety

**Web3**:
- Wagmi + Viem for Ethereum interactions
- Silk Wallet SDK for embedded wallet support
- Moloch v3 DAO framework

**Backend**:
- PostgreSQL with PostGIS for geospatial data
- Drizzle ORM for type-safe database access
- NextAuth for multi-provider authentication

**Smart Contracts**:
- Solidity
- Foundry for testing and deployment
- OpenZeppelin contracts
- Create3Factory for deterministic addresses

### Key Features

- **Multi-Provider Authentication**: SIWE wallet auth, email/password, Google OAuth
- **Geospatial Mapping**: Find groups and events using PostGIS
- **State Management**: Jotai atoms + React-Query for efficient data fetching
- **Type Safety**: End-to-end TypeScript from frontend to database
- **Mobile-First Design**: Responsive UI optimized for all devices

## 🤝 Contributing

We welcome contributions from the community! Whether you're a developer, designer, or Capoeira practitioner, there are many ways to get involved.

### Development Setup

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `pnpm test`
5. Commit using conventional commits: `git commit -m "feat: add amazing feature"`
6. Push to your fork: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Commit Convention

We use [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `chore:` Maintenance tasks
- `test:` Test additions or changes
- `refactor:` Code refactoring

### Code Style

- **JavaScript/TypeScript**: Biome for linting and formatting
- **Solidity**: Prettier with solidity plugin
- Pre-commit hooks enforce style automatically

### Testing

```bash
# Run all unit tests
pnpm test

# Smart contract tests
cd packages/contracts
forge test

# Integration tests (requires local DB)
cd apps/quilombo
pnpm db:migrate
pnpm test
```

## 📚 Documentation

- [Quilombo DApp Documentation](./apps/quilombo/README.md)
- [Smart Contracts Documentation](./packages/contracts/README.md)
- [Public Website Documentation](./apps/www/README.md)
- [Contributing Guidelines](./CONTRIBUTING.md) _(coming soon)_
- [Code of Conduct](./CODE_OF_CONDUCT.md) _(coming soon)_

## 🌐 Deployments

### Sepolia Testnet

- **AXESource Token**: [`0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895`](https://sepolia.etherscan.io/address/0xaE8F6454fa13EbA1Be4ea60019d1bd34F9D04895)
- **AxeUSD Test Token**: `0xD44Eb94380bff68a827604fDb2dA7b0A3Ec6Ad0B`
- **UniswapV2Factory**: `0xAB5db096E5d2d79434ADC48B8D34f878dD7Fa0b0`
- **UniswapV2Router02**: `0xEF5aC450A41A39ef8A652C154318b3c8902ed86E`

### Production

_Coming soon_

## 🛠️ Tech Stack Details

### Frontend Libraries

- **UI Framework**: HeroUI
- **Styling**: Tailwind CSS
- **State Management**: Jotai
- **Data Fetching**: TanStack Query
- **Forms**: Formik + Yup
- **Web3**: Wagmi + Viem
- **Authentication**: NextAuth
- **Internationalization**: i18next (www)

### Backend Libraries

- **Database**: PostgreSQL with PostGIS extension
- **ORM**: Drizzle ORM
- **Image Processing**: Sharp
- **Email**: Mailjet integration

### Smart Contract Dependencies

- **Framework**: Foundry/Forge
- **DAO**: DaoHaus Baal Contracts
- **Tokens**: OpenZeppelin
- **DEX**: Uniswap V2 Core & Periphery

> **Note**: For current package versions, refer to the `package.json` files in each package directory.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## 🙏 Acknowledgments

- [Moloch DAO](https://molochdao.com/) for the governance framework
- [DaoHaus](https://daohaus.club/) for Baal contracts and tooling
- The global Capoeira community for inspiration and support

## 📞 Contact

- **Website**: https://axe-dao.vervel.app
- **App**: https://quilombo.vercel.app
- **Common Ground (DAO Forums)**: https://app.cg/c/x36ZitNwuM/
- **Public Signal**: https://signal.group/#CjQKIEzU62ErtEASM1FZ0yjmW2HZxgk6ig4Ztf58xRfCl58OEhBCXyjFcNxdyzxV_xfGCyTE
- **Email**: axe-dao@protonmail.com

## ⚡ Support

If you find this project valuable, consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting new features
- 🤝 Contributing code or documentation
- 📣 Spreading the word about Axé DAO

---

**Built with ❤️ by the Capoeira community, for the Capoeira community**
