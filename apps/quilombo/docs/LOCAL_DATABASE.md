# Local Database Development

This guide explains how to work with a local PostgreSQL database for development.

## Prerequisites

- Docker Desktop installed and running
- pnpm installed

## Quick Start

```bash
# 1. Update .env.local to use local database:
DATABASE_URL=postgres://postgres:mypassword@localhost:5433/postgres

# 2. Start the local PostgreSQL container
pnpm db:local:up

# 3. Run migrations to set up the schema (required on first run!)
pnpm db:migrate

# 4. (Optional) Seed with test data
pnpm db:local:seed
```

**Note**: On the first run, the database is completely empty. You MUST run `pnpm db:migrate` after `pnpm db:local:up` to create the schema. Alternatively, use `pnpm db:local:reset` which does both steps automatically.

## Available Commands

### Database Container Management

```bash
# Start the database (runs in background)
pnpm db:local:up
# Note: On first run, you must run 'pnpm db:migrate' after this!

# Stop the database (preserves data)
pnpm db:local:down

# Reset database (destroys all data, recreates container, runs migrations automatically)
pnpm db:local:reset
# This is the easiest way to start fresh - migrations are included!

# View database logs
pnpm db:local:logs
```

### Schema Management

```bash
# Generate a new migration from schema changes
pnpm db:generate

# Run pending migrations
pnpm db:migrate
```

### Data Management

```bash
# Seed database with test data
pnpm db:local:seed

# Connect to PostgreSQL CLI
pnpm db:local:psql
```

## Test Data

After running `pnpm db:local:seed`, you'll have:

**Test Users (all fully activated with verified emails):**
- `admin@test.com` / `password123` (Global Admin, Mestre)
- `user1@test.com` / `password123` (Maria Silva, Aluna)
- `user2@test.com` / `password123` (João Santos, Professor)

All users are created as if they completed the full onboarding flow:
- Email verified (`emailVerified: true`)
- Account active (`accountStatus: 'active'`)
- Password authentication enabled
- Ready to log in immediately

## Common Workflows

### Testing a New Migration Locally

```bash
# 1. Make changes to db/schema.ts
# 2. Generate migration
pnpm db:generate

# 3. Apply to local database
pnpm db:migrate

# 4. Test in the app
pnpm dev
```

### Starting Fresh

```bash
# Destroy everything and start over
pnpm db:local:reset

# Add test data
pnpm db:local:seed
```

### Inspecting the Database

```bash
# Connect to PostgreSQL CLI
pnpm db:local:psql

# Example queries:
postgres=# \dt                    -- List tables
postgres=# SELECT * FROM users;   -- Query users
postgres=# \d users               -- Describe users table
postgres=# \q                     -- Quit
```

## Docker Details

### Container Configuration

- **Image**: `postgis/postgis:17-3.5` (PostgreSQL 17 + PostGIS 3.5)
- **Container Name**: `quilombo-postgres`
- **Port**: `5433` (host) → `5432` (container)
- **Volume**: `quilombo-postgres-data` (persists data between restarts)

**Note**: The docker-compose.yml also includes an Inbucket container for email testing. See the main [README.md](../README.md#local-email-testing) for details.

### Data Persistence

The database data is stored in a Docker volume named `quilombo-postgres-data`. This means:
- Data survives `docker-compose down` and `docker-compose up`
- Data is destroyed by `docker-compose down -v` (the `-v` flag removes volumes)
- Data is isolated from your system and other projects

### Initialization Scripts

On first startup, the container automatically runs SQL scripts from `scripts/db-init/`:
- `01-extensions.sql` - Creates schemas and installs PostGIS

## Switching Between Environments

Your `.env.local` can have multiple DATABASE_URL entries:

```bash
# PROD
DATABASE_URL=postgres://postgres.imtntdwnbjbgjnrnpjow:...@aws-0-us-east-1.pooler.supabase.com:5432/postgres
# STAGING
#DATABASE_URL=postgresql://postgres.swkvthsbxneexfqrolmz:...@aws-0-us-east-1.pooler.supabase.com:6543/postgres
# LOCAL
#DATABASE_URL=postgres://postgres:mypassword@localhost:5432/postgres
```

Simply comment/uncomment the one you want to use.

**⚠️ Warning**: Always double-check which DATABASE_URL is active before running migrations!

## Troubleshooting

### Port 5433 already in use

If you need to change the port (default is 5433):

```bash
# Edit docker-compose.yml
ports:
  - "5434:5432"  # Use a different port on host

# Then update DATABASE_URL in .env.local to match
DATABASE_URL=postgres://postgres:mypassword@localhost:5434/postgres
```

### Container won't start

```bash
# Check logs
pnpm db:local:logs

# Remove container and volume, start fresh
docker compose down -v
pnpm db:local:up
```

### Migrations fail

```bash
# Check if container is healthy
docker ps

# Connect and check schema manually
pnpm db:local:psql
postgres=# \dn  -- List schemas (should see public, extensions, gis)
```

## Benefits of This Setup

1. **Isolated**: No interference with system PostgreSQL or other projects
2. **Reproducible**: Everyone gets the same PostgreSQL version and extensions
3. **Fast Reset**: Fresh database in seconds with `db:local:reset`
4. **Version Controlled**: `docker-compose.yml` documents the exact configuration
5. **No Installation**: No need to install PostgreSQL + PostGIS system-wide
6. **Safe Testing**: Test destructive operations without fear
7. **Migration Testing**: Test migrations locally before applying to staging/production

## Integration with CI/CD

This same `docker-compose.yml` can be used in CI pipelines:

```yaml
# Example GitHub Actions
- name: Start PostgreSQL
  run: docker compose up -d

- name: Run migrations
  run: pnpm db:migrate

- name: Run tests
  run: pnpm test
```
