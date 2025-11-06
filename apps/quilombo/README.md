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
- Wallet linking always preserves the existing primary email
- Users must maintain at least one authentication method (cannot remove the last method)

**Important Security Notes**:
- Primary email cannot be changed manually (only through the OAuth linking flow described above)
- If we add manual email change functionality in the future, we'll need to either:
  - Unlink any OAuth accounts using the old email as their provider email
  - Block email changes that conflict with existing OAuth provider emails
- During account linking, the system validates that you're not accidentally linking to another user's account

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

### Database Setup

#### Option 1: Docker PostgreSQL

```bash
# Pull and run PostgreSQL with PostGIS
docker pull postgres
docker run --name drizzle-postgres \
  -e POSTGRES_PASSWORD=mypassword \
  -d -p 5432:5432 \
  postgres
```

#### Option 2: Local PostgreSQL

Install PostgreSQL 14+ with PostGIS extension on your system.

#### Database Configuration

1. Set the `DATABASE_URL` environment variable:
   ```
   DATABASE_URL=postgres://postgres:mypassword@localhost:5432/postgres?options=-csearch_path%3D%24user,public,extensions,gis
   ```

2. Configure the database for PostGIS (run in PostgreSQL):
   ```sql
   -- Add PostGIS extension to 'gis' schema
   CREATE SCHEMA IF NOT EXISTS gis;
   CREATE EXTENSION IF NOT EXISTS postgis SCHEMA gis;

   -- Update user role search path
   ALTER ROLE postgres SET search_path TO "$user", public, extensions, gis;
   ```

3. Run migrations:
   ```bash
   pnpm db:migrate
   ```

### Environment Variables

Create a `.env.local` file (never commit this):

```env
# Database
DATABASE_URL=postgres://postgres:mypassword@localhost:5432/postgres?options=-csearch_path%3D%24user,public,extensions,gis

# NextAuth
NEXTAUTH_URL=http://localhost:8080
NEXTAUTH_SECRET=your-secret-here

# Google OAuth (optional)
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# Email (Mailjet for production)
MAILJET_API_KEY=your-mailjet-api-key
MAILJET_API_SECRET=your-mailjet-api-secret

# Environment Configuration
NEXT_PUBLIC_CHAIN_ENV=localhost
NEXT_PUBLIC_APP_ENV=development
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

| Method | Endpoint | Description |
|--------|----------|-------------|
| **Authentication** |
| POST | `/api/auth/signup` | Create new account |
| POST | `/api/auth/verify-email` | Verify email address |
| POST | `/api/auth/forgot-password` | Request password reset |
| POST | `/api/auth/reset-password` | Reset password |
| POST | `/api/auth/change-password` | Change password |
| GET | `/api/auth/methods` | Get auth methods for user |
| POST | `/api/auth/link-wallet` | Link wallet to account |
| POST | `/api/auth/remove-method` | Remove auth method |
| GET | `/api/auth/oauth-link` | Get pending OAuth link data |
| POST | `/api/auth/oauth-link` | Confirm OAuth account linking |
| DELETE | `/api/auth/oauth-link` | Cancel pending OAuth link |
| **Users** |
| GET | `/api/users` | Search users |
| GET | `/api/users/[userId]` | Get user by ID |
| GET | `/api/profile` | Get current user profile |
| PATCH | `/api/profile` | Update current user profile |
| **Groups** |
| GET | `/api/groups` | Search groups |
| POST | `/api/groups` | Create new group |
| GET | `/api/groups/[groupId]` | Get group by ID |
| PATCH | `/api/groups/[groupId]` | Update group |
| DELETE | `/api/groups/[groupId]` | Delete group |
| GET | `/api/groups/[groupId]/members` | Get group members |
| PUT | `/api/profile/group/[groupId]` | Join group |
| DELETE | `/api/profile/group/[groupId]` | Leave group |
| GET | `/api/groups/[groupId]/admins` | Get group admins |
| PUT | `/api/groups/[groupId]/admins/[userId]` | Add admin |
| DELETE | `/api/groups/[groupId]/admins/[userId]` | Remove admin |
| **Other** |
| POST | `/api/images` | Upload image |
| GET | `/api/location/countries` | Get country list |
| GET | `/api/location/cities` | Search cities |
| **Admin** |
| PUT | `/api/admin/groups/[groupId]/verification` | Verify group |
| DELETE | `/api/admin/groups/[groupId]/verification` | Unverify group |

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
