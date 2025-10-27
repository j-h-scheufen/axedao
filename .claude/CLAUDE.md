# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

You are an expert full-stack web3 / Dapp developer specialized in Solidity, TypeScript, Node.js, Next.js 15 App Router, React, Viem, Wagmi, HeroUI, I18Next, Formik, YUP, Sharp, Jotai, Drizzle-Kit, Tailwind CSS.

# General

- Do not use pleasantries and compliments. Keep your answers to the point.
- Always strive to produce working code. Run linting and compile commands to make sure.
- For APIs and complex logic and calculations, use a test-first approach.

# CRITICAL SECURITY RULES

## File Operations & Git Safety

**NEVER create backup files with sensitive content:**
- NEVER create backup copies of `.env*` files under any circumstances
- If you must preserve content during edits, use git stash or ask the user to create a branch
- Before any git commit or push, ALWAYS check staged files for sensitive content

**Pre-commit checklist (MANDATORY before every commit):**
1. Run `git diff --cached --name-only` to list all staged files
2. Verify NO files match these patterns are staged:
   - `*.backup`, `*.bak`, `*.old`, `*.tmp`, `*.copy`
   - `.env*` (except `.env.example` or `.env.sample`)
   - Any file containing credentials, API keys, or secrets
3. If any suspicious files are found, STOP and alert the user immediately
4. Use `git diff --cached` to review actual changes before committing

**If you accidentally stage sensitive files:**
1. IMMEDIATELY unstage: `git reset HEAD <file>`
2. Add pattern to `.gitignore` if not already present
3. Alert the user about the security risk
4. NEVER proceed with commit until issue is resolved

# Repository Structure

This is a **pnpm monorepo** comprising apps/ and packages/ to support the Axé DAO ecosystem:
- `apps/www` - Public website with i18next internationalization
- `apps/quilombo` - DApp to access community functions (main application)
- `packages/contracts` - Solidity contracts using Foundry/Forge
- `packages/subgraph-moloch-v3` - Subgraph for Moloch v3 DAO

**Package-Specific Documentation**: Each package has its own `.claude/CLAUDE.md` file with detailed technical information:
- `apps/quilombo/.claude/CLAUDE.md` - Quilombo app architecture, authentication, database, state management, API routes
- `packages/contracts/.claude/CLAUDE.md` - Smart contracts, deployment, testing with Foundry/Forge

# Common Commands

## Monorepo Operations
```bash
# Install dependencies (from root)
pnpm install

# Run all builds
pnpm build

# Run all linting
pnpm lint

# Format all code (Biome for JS/TS, Prettier for Solidity)
pnpm format

# Run all tests (excludes integration tests)
pnpm test
```

## Package-Specific Commands

For detailed package-specific commands, refer to each package's `.claude/CLAUDE.md` file:
- **Quilombo**: `apps/quilombo/.claude/CLAUDE.md` - Development server, database migrations, Wagmi generation
- **Contracts**: `packages/contracts/.claude/CLAUDE.md` - Forge testing, deployment workflows, contract verification
- **WWW**: Standard Next.js commands (`pnpm dev`, `pnpm build`)

# Architecture

## Key Principles

- This is a **pnpm monorepo** - HeroUI packages are hoisted to root node_modules
- Use functional, declarative programming. Avoid classes.
- Prefer iteration and modularization over duplication.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading).
- Use lowercase with dashes for directories (e.g., components/auth-wizard).
- Favor named exports for components.
- Use the Receive an Object, Return an Object (RORO) pattern.
- Always check all package.json files to know about latest dependencies.
- Follow SOLID principles.
- Emphasize type-safety and static analysis.
- Once the same variable or chunk of code is needed in more than one place, extract it into a separate function or utility module.
- **Environment variables**: Use centralized config/environment.ts files in apps, not direct process.env access.
- **Database access** (Quilombo): Centralized in db/index.ts - all DB functions must be added there.

## JavaScript/TypeScript

- Use TypeScript for all code. Prefer types for props definitions.
- Prioritize error handling and edge cases:
  - Handle errors and edge cases at the beginning of functions
  - Use early returns for error conditions to avoid deeply nested if statements
  - Place the happy path last in the function for improved readability
  - Implement proper error logging and user-friendly error messages

### Import Organization

Organize imports in this order:
1. External libraries (next, lodash, uuid, etc.)
2. `@/config` imports
3. Other "@/" prefix imports
4. Relative imports ("./", "../", etc.)

### Utility Functions

- **All reusable utility functions MUST have JSDoc comments**
- Include: description, `@param`, `@returns`, and `@throws` (if applicable)
- Document edge cases and important behavior
- Group related utilities in subdirectories (e.g., `utils/auth/`, `utils/email/`)
- Export commonly used helpers from `utils/index.ts` for convenience
- Keep specialized utilities in dedicated files with descriptive names

## React/Next.js

- Use functional components and TypeScript types
- Use const for components
- Use Hero UI and Tailwind for components and styling
- Implement responsive design with Tailwind CSS (mobile-first approach)
- Use content variables for static content outside render functions
- Minimize 'use client', 'useEffect', and 'setState' - favor RSC
- Use Formik for forms, Yup for validation
- Use dynamic loading for non-critical components
- Optimize images: WebP format, size data, lazy loading
- Use error boundaries: Implement using error.tsx and global-error.tsx files

## Validation (Quilombo)

- Use Yup's `validate()` or `validateSync()` based on context (async vs sync)
- Return the first validation error to help users correct their input: `error.errors?.[0]`
- Validation errors from Yup schemas are user-facing and should be descriptive
- **Do not expose** internal system details, database constraints, or stack traces

## Shared Conventions Across Packages

### Error Handling Patterns

1. **API Routes** (Quilombo):
   - Always use consistent JSON error format: `{ error: string }`
   - Status codes: 400 (validation), 401/403 (auth), 404 (not found), 409 (conflicts), 500 (server errors)
   - Return first validation error only
   - Always `console.error()` before returning error responses for debugging

2. **Contract Testing** (Contracts):
   - Unit tests exclude integration tests via `--no-match-contract IntegrationTest`
   - Integration tests require local anvil node and `TEST_MODE=integration`
   - Use fork testing for complex scenarios

### Documentation Requirements

1. **API Route Handlers** (Quilombo):
   - All API route handlers MUST have OpenAPI-style JSDoc comments
   - Use `@openapi` tags for compatibility with documentation generators
   - Document: summary, tags, parameters, requestBody, responses (including error responses)
   - Include schema definitions for request/response bodies
   - Document all possible HTTP status codes

2. **Utility Functions** (All packages):
   - All reusable utility functions MUST have JSDoc comments
   - Include: description, `@param`, `@returns`, and `@throws` (if applicable)
   - Document edge cases and important behavior

### Linting and Formatting

- **JavaScript/TypeScript**: Biome 2.0.0 for linting and formatting
- **Solidity**: Prettier with prettier-plugin-solidity
- Run `pnpm lint` and `pnpm format` before committing
- Lint-staged configured for pre-commit hooks

## Package Overviews

### apps/quilombo (Main DApp)
- Next.js 15 App Router with React Server Components
- Multi-provider authentication (SIWE, email/password, Google OAuth)
- PostgreSQL with PostGIS via Drizzle ORM
- Jotai + React-Query for state management
- Wagmi + Viem + Silk Wallet for Web3
- HeroUI + Tailwind CSS for UI

See `apps/quilombo/.claude/CLAUDE.md` for detailed architecture.

### apps/www (Public Website)
- Next.js 15 App Router
- i18next internationalization with browser language detection
- No authentication or Web3 integration
- HeroUI + Tailwind CSS for UI

### packages/contracts (Smart Contracts)
- Foundry/Forge for building and testing
- Hardhat for deployment scripts and network configuration
- Create3Factory for deterministic cross-chain addresses
- OpenZeppelin, DaoHaus Baal Contracts, Uniswap v2 dependencies

See `packages/contracts/.claude/CLAUDE.md` for deployment workflows and testing patterns.

### packages/subgraph-moloch-v3 (Subgraph)
- GraphQL subgraph for Moloch v3 DAO
- Query layer for on-chain DAO data

## Development Workflow

1. **Setup**: Run `pnpm install` from monorepo root
2. **Development**: Use package-specific dev commands (see package `.claude/CLAUDE.md` files)
3. **Linting**: Run `pnpm lint` before committing
4. **Testing**: Run `pnpm test` for unit tests (integration tests require separate setup)
5. **Building**: Run `pnpm build` to build all packages
6. **Committing**: Follow conventional commits, pre-commit hooks will run linting

## Important Notes

1. **pnpm Workspaces**: Dependencies may be hoisted to root `node_modules`, be aware when debugging
2. **Version Overrides**: Root `package.json` has strict version overrides for React 19.1.0 and TypeScript 5.8.3
3. **Node Version**: Requires Node.js >=20.0.0
4. **Package Manager**: Must use pnpm 9.12.3+ (enforced by packageManager field)
