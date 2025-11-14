# Quilombo - Axé DAO Community DApp

**The decentralized community platform for Capoeira practitioners worldwide**

Quilombo is the main DApp of the Axé DAO ecosystem, providing a feature-rich platform for Capoeira communities to connect, organize, and govern themselves transparently.

> **Note**: For detailed technical documentation and architecture patterns, see [`.claude/CLAUDE.md`](./.claude/CLAUDE.md)

## Features

### Multi-Provider Authentication
- **Wallet Login**: Sign-In-With-Ethereum (SIWE) using Human Wallet (https://waap.xyz)
- **Email/Password**: Traditional authentication with email verification
- **Google OAuth**: Quick signup with Google account
- **Account Linking**: Connect multiple auth methods to one account

#### Authentication Methods & Primary Email

Quilombo supports three authentication methods that can work together:

1. **Email/Password**: Traditional authentication with bcrypt-hashed passwords
2. **Google OAuth**: Social login with automatic email verification
3. **Human Wallet (SIWE)**: Web3 authentication using Sign-In-With-Ethereum

**Primary Email Concept**:
- Every user account has a **primary email** (`users.email`) used for notifications, account recovery, and user identification
- The primary email determines which user profile is loaded during login
- Only one user can have a specific email as their primary email (enforced by unique DB constraint)

**How Primary Email is Set**:

| Scenario | Primary Email Behavior |
|----------|------------------------|
| **Sign up with Email/Password** | Primary email = the email you registered with |
| **Sign up with Google OAuth** | Primary email = your Google account email |
| **Sign up with Wallet (SIWE)** | Primary email = email from Human Wallet (user must provide) |
| **Link Google OAuth (matching email)** | Primary email remains unchanged |
| **Link Google OAuth (different email)** | User is prompted to confirm if they want to update primary email to Google email (only if that email is not taken by another user) |
| **Link Wallet after sign-up** | Primary email remains unchanged (wallet linking doesn't overwrite existing email) |

**Account Linking Rules**:
- Users can link multiple authentication methods to one account
- Google OAuth can only be linked if:
  - The Google email is not already registered as another user's primary email
  - The Google OAuth account is not already linked to another user
- When linking Google with a different email than your primary, you'll be prompted to:
  - Keep your current primary email and link Google (Google email stored in `oauthAccounts` only)
  - Update your primary email to match Google email (with confirmation modal)
- **Wallet linking allows the same wallet to be used by multiple accounts** because:
  - Wallet connection alone doesn't prove ownership (no cryptographic signature)
  - Real authentication via SIWE requires signing a message with the wallet's private key
  - This prevents blocking attacks where someone connects a wallet they don't control
- Wallet linking always preserves the existing primary email
- Users must maintain at least one authentication method (cannot remove the last method)

**Important Security Notes**:
- Primary email cannot be changed manually (only through the OAuth linking flow described above)
- If we add manual email change functionality in the future, we'll need to either:
  - Unlink any OAuth accounts using the old email as their provider email
  - Block email changes that conflict with existing OAuth provider emails
- During account linking, the system validates that you're not accidentally linking to another user's account
- **SIWE authentication verifies email consistency**: If a wallet is already linked to an account, signing in with that wallet requires the same email address to prevent identity confusion (important if switching wallet providers)

### User Profiles
- Customizable profiles with avatars and social links
- Public/private visibility controls
- Title selection (Student, Teacher, Mestre, etc.)
- Location-based user discovery

### Group Management
- Create and manage Capoeira groups
- Group verification system for authenticity
- Admin roles and permissions
- Member management
- Custom group branding (logos, banners)

### Geospatial Features
- Interactive map view of groups and events
- PostGIS-powered location search
- Country and city filtering
- Event location mapping

### Events
- Create and manage community events
- Event discovery and RSVPs
- Calendar integration

### Web3 Integration
- Human Wallet embedded wallet support
- Multi-chain support (Gnosis, Sepolia, Localhost)
- NFT membership tokens
- DAO governance participation

## Quick Start

### Prerequisites

- **Node.js**: >=20.0.0 (see root [package.json](../../package.json))
- **pnpm**: (see root [package.json](../../package.json))
- **PostgreSQL**: Latest with PostGIS extension
- **Docker**: (optional, for local DB)

> **Note**: For current package versions, refer to the [package.json](./package.json) file.

### Installation

```bash
# From monorepo root
pnpm install

# Or from quilombo directory
cd apps/quilombo
pnpm install
```

### Local Development Setup

**Recommended**: Use Docker Compose for a complete local development environment with PostgreSQL and email testing.

```bash
# 1. Configure environment for local development
# Edit .env.local:
NEXT_PUBLIC_APP_ENV=development
DATABASE_URL=postgres://postgres:mypassword@localhost:5433/postgres

# 2. Start PostgreSQL + Inbucket containers
pnpm db:local:up

# 3. Run database migrations
pnpm db:migrate

# 4. (Optional) Seed test data
pnpm db:local:seed

# 5. Start development server
pnpm dev
```

**Access local services:**
- App: http://localhost:8080
- Inbucket (email viewer): http://localhost:9000
- PostgreSQL: localhost:5433

See [`docs/LOCAL_DATABASE.md`](./docs/LOCAL_DATABASE.md) for detailed database documentation.

#### Local Email Testing

When `NEXT_PUBLIC_APP_ENV=development`, all emails are sent to the local Inbucket SMTP server instead of Mailjet:

- **View emails**: http://localhost:9000
- **Test workflows**: Signup, password reset, invitations all work normally
- **No real emails sent**: Safe to test with any email address
- **Console logging**: Verification/reset URLs are logged for quick access

**Common email workflows to test:**
- Register new account → verification email with link
- Use "Forgot password" → password reset email
- Send invites from `/invites` page → invitation emails
- Verify email after signup → welcome email

#### Manual Database Setup (Alternative)

If you prefer not to use Docker, see [`docs/LOCAL_DATABASE.md`](./docs/LOCAL_DATABASE.md) for manual PostgreSQL setup instructions.

### Environment Variables

Create a `.env.local` file (never commit this):

```env
# Environment Mode (development uses local SMTP, production uses Mailjet)
NEXT_PUBLIC_APP_ENV=development

# Database
DATABASE_URL=postgres://postgres:mypassword@localhost:5433/postgres

# NextAuth
NEXTAUTH_URL=http://localhost:8080
NEXTAUTH_SECRET=your-secret-here

# Google OAuth (optional)
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# Email - Production only (not needed for local development)
# MAILJET_API_KEY=your-mailjet-api-key
# MAILJET_API_SECRET=your-mailjet-api-secret

# SMTP - Local development (optional, defaults shown)
# SMTP_HOST=localhost
# SMTP_PORT=2500

# Web3 Configuration
NEXT_PUBLIC_CHAIN_ENV=development
NEXT_PUBLIC_WALLET_ENV=development

# RPC URLs
NEXT_PUBLIC_GNOSIS_RPC_URL=https://rpc.gnosischain.com
NEXT_PUBLIC_SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/YOUR-KEY
```

### Development

```bash
# Start development server on port 8080
pnpm dev

# Or from monorepo root
pnpm dev:app
```

Visit http://localhost:8080

### Building

```bash
# Build for production
pnpm build

# Start production server
pnpm start
```

### Database Commands

```bash
# Generate new migration from schema changes
pnpm db:generate

# Apply migrations
pnpm db:migrate

# Note: Some migrations are manually created for advanced features
# (triggers, functions, etc.) - see .claude/CLAUDE.md for details
```

### Linting and Formatting

```bash
# Lint
pnpm lint

# Format
pnpm format
```

## Architecture

### Technology Stack

**Framework**:
- Next.js App Router with React
- TypeScript
- React Server Components

**Authentication**:
- NextAuth with custom providers
- SIWE for wallet authentication
- Bcrypt for password hashing

**Database**:
- PostgreSQL with PostGIS extension
- Drizzle ORM for type-safe queries
- Centralized database access layer

**State Management**:
- Jotai for global state
- TanStack Query for server state
- Opinionated SSR hydration pattern

**Web3**:
- Wagmi + Viem
- Silk Wallet SDK
- Multi-chain support (Gnosis, Sepolia, Localhost)

**UI**:
- HeroUI component library
- Tailwind CSS
- Framer Motion for animations
- Mobile-first responsive design

**Forms & Validation**:
- Formik for form management
- Yup for validation schemas
- Centralized validation schema definitions

**Other**:
- Sharp for image processing
- Nuqs for URL state management
- Lodash utilities

### Project Structure

```
apps/quilombo/
├── .claude/             # Claude Code technical documentation
├── app/                 # Next.js App Router pages and API routes
│   ├── api/            # API endpoints
│   ├── _providers/     # React context providers
│   └── ...             # Pages and layouts
├── components/         # Reusable React components
├── config/             # Configuration files
│   ├── environment.ts  # Centralized env vars
│   ├── wagmi.ts       # Wagmi configuration
│   ├── next-auth-options.ts  # Auth config
│   └── validation-schema.ts  # Yup schemas
├── db/                 # Database layer
│   ├── index.ts       # Centralized DB functions
│   └── schema.ts      # Drizzle schema definitions
├── hooks/              # Custom React hooks
│   └── state/         # Jotai atoms
├── query/              # React-Query hooks
├── utils/              # Utility functions
│   ├── auth/          # Auth utilities
│   ├── email/         # Email provider
│   └── ...
└── public/             # Static assets
```

### Key Architectural Patterns

1. **Centralized Database Access**: All DB queries in `db/index.ts`
2. **Environment Configuration**: Use `config/environment.ts`, not `process.env`
3. **Server-Side Query Hydration**: Pre-populate QueryClient for SSR
4. **Jotai + React-Query Integration**: Atoms reference queries for reactive data
5. **Multi-Provider Auth**: SIWE, email/password, and OAuth in one system
6. **PostGIS Geospatial**: Location-based queries and mapping

For detailed architecture documentation, see [`.claude/CLAUDE.md`](./.claude/CLAUDE.md)

## API Routes

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/signup` | Create new account |
| POST | `/api/auth/verify-email` | Verify email address |
| POST | `/api/auth/resend-verification` | Resend verification email |
| POST | `/api/auth/forgot-password` | Request password reset |
| POST | `/api/auth/reset-password` | Reset password with token |
| POST | `/api/auth/change-password` | Change password (authenticated) |
| POST | `/api/auth/link-wallet` | Link Web3 wallet to account |
| POST | `/api/auth/remove-method` | Remove authentication method |
| GET | `/api/auth/methods` | Get available auth methods for user |
| GET | `/api/auth/oauth-link` | Get OAuth link status |
| POST | `/api/auth/oauth-link` | Link OAuth provider |
| DELETE | `/api/auth/oauth-link` | Unlink OAuth provider |

### Profile
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/profile` | Get current user profile |
| PATCH | `/api/profile` | Update current user profile |
| POST | `/api/profile/avatar` | Upload profile avatar |
| DELETE | `/api/profile/avatar` | Delete profile avatar |
| PUT | `/api/profile/group/[groupId]` | Join a group |
| DELETE | `/api/profile/group/[groupId]` | Leave a group |

### Users
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/users` | List users (with pagination/filters) |
| GET | `/api/users/[userId]` | Get specific user details |
| POST | `/api/users/search` | Search users |

### Groups
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/groups` | List groups (with pagination/filters) |
| POST | `/api/groups` | Create new group |
| GET | `/api/groups/[groupId]` | Get group details |
| PATCH | `/api/groups/[groupId]` | Update group |
| DELETE | `/api/groups/[groupId]` | Delete group |
| POST | `/api/groups/[groupId]/logo` | Upload group logo |
| DELETE | `/api/groups/[groupId]/logo` | Delete group logo |
| POST | `/api/groups/[groupId]/banner` | Upload group banner |
| DELETE | `/api/groups/[groupId]/banner` | Delete group banner |
| POST | `/api/groups/[groupId]/verify` | Submit group verification |
| POST | `/api/groups/[groupId]/claim` | Claim group ownership |
| GET | `/api/groups/[groupId]/members` | List group members |
| DELETE | `/api/groups/[groupId]/members/[userId]` | Remove member from group |
| GET | `/api/groups/[groupId]/admins` | List group admins |
| PUT | `/api/groups/[groupId]/admins/[userId]` | Add group admin |
| DELETE | `/api/groups/[groupId]/admins/[userId]` | Remove group admin |
| GET | `/api/groups/[groupId]/locations` | List group locations |
| POST | `/api/groups/[groupId]/locations` | Add group location |
| PATCH | `/api/groups/[groupId]/locations/[locationId]` | Update group location |
| DELETE | `/api/groups/[groupId]/locations/[locationId]` | Delete group location |

### Events
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/events` | List events (with filters) |
| POST | `/api/events` | Create new event |
| GET | `/api/events/[eventId]` | Get event details |
| PATCH | `/api/events/[eventId]` | Update event |
| DELETE | `/api/events/[eventId]` | Delete event |
| GET | `/api/events/locations` | Get event locations for map |

### Invitations
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/invitations` | Create invitation |
| POST | `/api/invitations/validate` | Validate invitation code |

### Admin
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/claims` | List all pending group claims |
| PUT | `/api/admin/claims/[claimId]/approve` | Approve group claim |
| PUT | `/api/admin/claims/[claimId]/reject` | Reject group claim |

### Utilities
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/image` | Image proxy/optimization service |
| GET | `/api/locations` | Get all locations for map |
| GET | `/api/stats` | Get system statistics |
| POST | `/api/graphql` | GraphQL endpoint |

For detailed API documentation with request/response schemas, see the OpenAPI comments in each route handler.

## Testing

```bash
# Run tests
pnpm test

# Run with coverage
pnpm test:coverage
```

## Contributing

We welcome contributions! Please see the main [Contributing Guide](../../README.md#contributing) for general guidelines.

### Quilombo-Specific Guidelines

1. **Database Changes**:
   - Modify `db/schema.ts`
   - Run `pnpm db:generate` to create migration
   - Test migration locally
   - Some features require manual migrations (see `.claude/CLAUDE.md`)

2. **API Routes**:
   - Add OpenAPI JSDoc comments
   - Use centralized validation schemas
   - Follow error response format: `{ error: string }`
   - Add tests for new endpoints

3. **State Management**:
   - Add Jotai atoms to `hooks/state/`
   - Add React-Query hooks to `query/`
   - Follow SSR hydration pattern

4. **Components**:
   - Use HeroUI components
   - Follow mobile-first design
   - Minimize client components
   - Add proper TypeScript types

## Documentation

- **Technical Documentation**: [`.claude/CLAUDE.md`](./.claude/CLAUDE.md) - Detailed architecture, patterns, and commands
- **Main Repository**: [Root README](../../README.md)
- **Smart Contracts**: [Contracts README](../../packages/contracts/README.md)

## Security

- Never commit `.env.local` or any environment files with secrets
- Use bash safety hooks to prevent accidental dangerous commands
- Follow security checklist in root `.claude/CLAUDE.md`
- Report security vulnerabilities to axe-dao@protonmail.com

## License

MIT License - see [LICENSE](../../LICENSE) for details.

## Support

- ⭐ Star the repository
- 🐛 Report bugs via GitHub issues
- 💡 Suggest features
- 🤝 Submit pull requests

---

**Part of the Axé DAO ecosystem**
