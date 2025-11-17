# Atlas + Drizzle ORM Integration Plan

**Status:** Planning / Not Implemented
**Created:** 2025-01-11
**Last Updated:** 2025-01-11

## Problem Statement

Drizzle-kit's migration system has several limitations that impact production reliability:

1. **Not Idempotent by Design** - Generates raw SQL without `IF NOT EXISTS` clauses, requiring manual fixes
2. **Poor Partial Failure Handling** - No status tracking for failed/partial migrations, leading to inconsistent state
3. **Transaction Batching Issues** - Runs multiple unapplied migrations in one transaction, causing deployment problems
4. **Limited Intelligence** - Cannot detect or resolve migration conflicts, doesn't understand database state beyond tracking table
5. **No Preview/Dry-Run** - Cannot see what will happen before applying migrations
6. **PostgreSQL Enum Issues** - Problematic handling of enum types, especially with `drizzle-kit push`

### Current Pain Points in Our Project

- Migration 0023 was partially applied to staging, creating all objects but not recording completion in `__drizzle_migrations`
- Had to manually make migration idempotent by wrapping statements in `DO...EXCEPTION` blocks
- No way to preview migrations before applying to staging/production
- No automatic detection of dangerous operations (data loss, breaking changes)

## Proposed Solution: Atlas for Migrations

Keep Drizzle ORM for queries (lightweight, SQL-like, good TypeScript integration) but use Atlas for migration management.

### Why Atlas?

**Intelligence & Safety:**
- Automatic migration planning from schema changes
- Migration linting detects destructive changes, data loss risks, performance issues
- Integrity checks via `atlas.sum` file prevent tampering with migration history
- Preview/dry-run shows exact SQL before applying
- Testing framework for migrations against real databases

**Production Reliability:**
- Idempotent migrations by default
- Handles partial failures gracefully
- Pre-execution checks and post-migration validation
- CI/CD native with registry system (like Docker Hub for migrations)

**Advanced Features:**
- Manages objects beyond ORM scope: Views, Triggers, Row Level Security, Stored Procedures
- Multi-database support: PostgreSQL, MySQL, SQLite, SQL Server, ClickHouse
- Kubernetes, Terraform, GitHub Actions integration

## Architecture

### Components

```
┌─────────────────────────────────────────────────────────┐
│  Drizzle Schema (TypeScript)                            │
│  apps/quilombo/db/schema.ts                             │
└────────────────┬────────────────────────────────────────┘
                 │
                 │ drizzle-kit export
                 ▼
┌─────────────────────────────────────────────────────────┐
│  Atlas (Migration Planning & Execution)                 │
│  - Reads schema via external_schema                     │
│  - Generates migration SQL files                        │
│  - Lints for safety                                     │
│  - Applies with integrity checks                        │
└─────────────────────────────────────────────────────────┘
                 │
                 │ Migration files
                 ▼
┌─────────────────────────────────────────────────────────┐
│  atlas/migrations/                                      │
│  - 20250111_initial.sql                                 │
│  - 20250112_add_groups.sql                              │
│  - atlas.sum (integrity checksums)                      │
└─────────────────────────────────────────────────────────┘
```

### File Structure

```
apps/quilombo/
├── db/
│   ├── schema.ts              # Drizzle schema (source of truth)
│   ├── index.ts               # DB query functions (unchanged)
│   └── connection.ts          # DB connection (unchanged)
├── drizzle.config.ts          # Drizzle config (for export only)
├── atlas.hcl                  # Atlas configuration
└── atlas/
    └── migrations/            # Atlas-generated migrations
        ├── 20250111_initial.sql
        ├── 20250112_add_groups.sql
        └── atlas.sum          # Migration integrity file
```

## Implementation Plan

### Phase 1: Setup & Configuration (Development Environment)

**1.1 Install Atlas CLI**

```bash
# macOS
brew install ariga/tap/atlas

# Verify installation
atlas version
```

**1.2 Create Atlas Configuration**

Create `apps/quilombo/atlas.hcl`:

```hcl
# Atlas configuration for Drizzle integration
data "external_schema" "drizzle" {
  program = [
    "npx",
    "drizzle-kit",
    "export"
  ]
}

env "local" {
  # Development database (Docker)
  dev = "docker://postgres/16/dev?search_path=public"

  # Schema source from Drizzle
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory
  migration {
    dir = "file://atlas/migrations"
  }
}

env "staging" {
  # Staging database (Supabase)
  url = getenv("STAGING_DATABASE_URL")

  schema {
    src = data.external_schema.drizzle.url
  }

  migration {
    dir = "file://atlas/migrations"
  }

  # Enable linting
  lint {
    destructive {
      error = true
    }
    data_depend {
      error = true
    }
    backward_incompatible {
      error = true
    }
  }
}

env "production" {
  url = getenv("PRODUCTION_DATABASE_URL")

  schema {
    src = data.external_schema.drizzle.url
  }

  migration {
    dir = "file://atlas/migrations"
  }

  # Strict linting for production
  lint {
    destructive {
      error = true
    }
    data_depend {
      error = true
    }
    backward_incompatible {
      error = true
    }
  }
}
```

**1.3 Update Package Scripts**

Add to `apps/quilombo/package.json`:

```json
{
  "scripts": {
    "db:migrate:plan": "atlas migrate diff --env local",
    "db:migrate:preview": "atlas migrate apply --env local --dry-run",
    "db:migrate:apply": "atlas migrate apply --env local",
    "db:migrate:lint": "atlas migrate lint --env local",
    "db:migrate:status": "atlas migrate status --env local",
    "db:migrate:validate": "atlas migrate validate --env local"
  }
}
```

### Phase 2: Migration from Drizzle-kit to Atlas

**2.1 Baseline Existing Migrations**

```bash
# Navigate to quilombo
cd apps/quilombo

# Apply baseline to mark existing migrations as completed
atlas migrate apply \
  --env staging \
  --baseline "$(atlas migrate hash --dir file://db/migrations)"
```

This tells Atlas that all existing Drizzle migrations are already applied.

**2.2 Verify Migration Status**

```bash
atlas migrate status --env staging
```

Should show all existing migrations as applied.

**2.3 Create First Atlas Migration**

When you make a schema change in `db/schema.ts`:

```bash
# Generate migration SQL
pnpm db:migrate:plan

# Review the generated SQL in atlas/migrations/
cat atlas/migrations/<timestamp>_<description>.sql

# Lint for safety issues
pnpm db:migrate:lint

# Preview without applying
pnpm db:migrate:preview

# Apply to local dev
pnpm db:migrate:apply
```

### Phase 3: CI/CD Integration

**3.1 Update GitHub Workflows**

Replace `.github/workflows/db-migrate-staging.yml`:

```yaml
name: Staging Database Migration (Atlas)

on:
  push:
    branches:
      - develop
    paths:
      - 'apps/quilombo/atlas/migrations/**'
      - 'apps/quilombo/db/schema.ts'
  workflow_dispatch:

concurrency:
  group: staging-migration
  cancel-in-progress: false

jobs:
  migrate:
    name: Run Atlas Migrations
    runs-on: ubuntu-latest
    environment: staging
    timeout-minutes: 10

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Atlas
        uses: ariga/setup-atlas@v0
        with:
          cloud-token: ${{ secrets.ATLAS_CLOUD_TOKEN }}

      - name: Lint migrations
        working-directory: apps/quilombo
        env:
          STAGING_DATABASE_URL: ${{ secrets.STAGING_DATABASE_URL }}
        run: |
          echo "🔍 Linting migrations for safety..."
          atlas migrate lint --env staging

      - name: Apply migrations
        working-directory: apps/quilombo
        env:
          STAGING_DATABASE_URL: ${{ secrets.STAGING_DATABASE_URL }}
        run: |
          echo "🚀 Applying migrations to staging..."
          atlas migrate apply --env staging

      - name: Verify migration status
        if: success()
        working-directory: apps/quilombo
        env:
          STAGING_DATABASE_URL: ${{ secrets.STAGING_DATABASE_URL }}
        run: |
          echo "✅ Verifying migration status..."
          atlas migrate status --env staging

      - name: Create migration report
        if: always()
        run: |
          echo "# Atlas Migration Report" >> $GITHUB_STEP_SUMMARY
          echo "**Status:** ${{ job.status }}" >> $GITHUB_STEP_SUMMARY
          echo "**Timestamp:** $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> $GITHUB_STEP_SUMMARY
```

**3.2 Update Production Workflow**

Similar changes to `.github/workflows/db-migrate-production.yml` with `--env production`.

### Phase 4: Migration Scripts Replacement

**4.1 Deprecate Old Scripts**

Mark as deprecated (don't delete yet):

- `apps/quilombo/scripts/db-migrate-staging.ts` → Add deprecation notice
- `apps/quilombo/scripts/db-migrate-production.ts` → Add deprecation notice

**4.2 Update Documentation**

Update `apps/quilombo/.claude/CLAUDE.md` with new Atlas workflow.

### Phase 5: Advanced Features (Optional)

**5.1 Composite Schema for Advanced Objects**

For triggers, views, RLS policies not supported by Drizzle:

```hcl
data "composite_schema" "app" {
  # Drizzle schema
  schema "drizzle" {
    url = data.external_schema.drizzle.url
  }

  # Additional SQL objects
  schema "advanced" {
    url = "file://db/advanced-objects.sql"
  }
}
```

**5.2 Migration Testing**

```bash
# Test migration against a clean database
atlas migrate test \
  --env local \
  --dev-url "docker://postgres/16/test"
```

**5.3 Schema Visualization**

```bash
# Generate schema diagram
atlas schema inspect \
  --env local \
  --format "{{ mermaid . }}" > schema.mmd
```

## Migration Workflow Comparison

### Current (Drizzle-kit)

```bash
# 1. Modify schema.ts
# 2. Generate migration
pnpm db:generate

# 3. Review SQL (manual)
cat db/migrations/0024_*.sql

# 4. Apply locally
pnpm db:migrate

# 5. Commit and push
# 6. GitHub Action runs db-migrate-staging.ts
# 7. Hope it works 🤞
```

### New (Atlas)

```bash
# 1. Modify schema.ts
# 2. Plan migration
pnpm db:migrate:plan

# 3. Lint for issues
pnpm db:migrate:lint
# → Detects destructive changes, data loss risks

# 4. Preview exact SQL
pnpm db:migrate:preview

# 5. Apply locally
pnpm db:migrate:apply

# 6. Commit and push
# 7. GitHub Action:
#    - Lints migration
#    - Shows preview
#    - Applies with integrity checks
#    - Validates success
# 8. Confident deployment ✅
```

## Safety Features

### Migration Linting

Atlas automatically detects:

**Destructive Changes:**
- Dropped tables/databases
- Dropped non-virtual columns
- Truncated tables

**Data-Dependent Changes:**
- Adding UNIQUE constraint to column with potential duplicates
- Adding NOT NULL to nullable column with existing NULLs
- Type changes that may truncate data

**Backward Incompatible:**
- Renaming columns/tables
- Changing column types
- Removing default values

**Performance Issues:**
- Table locks during ALTER
- Full table rewrites
- Missing indexes on foreign keys

### Integrity Verification

**atlas.sum file:**
- Contains checksums of all migration files
- Prevents tampering with migration history
- Forces explicit handling of migration order changes

### Pre-Migration Checks

Configure checks in `atlas.hcl`:

```hcl
migration {
  dir = "file://atlas/migrations"

  # Ensure no pending changes in dev
  check "no_drift" {}

  # Verify migration can be reversed
  check "reversible" {}

  # Ensure connection is stable
  check "connection_test" {}
}
```

## Rollback Strategy

### Atlas Approach

Atlas generates forward-only migrations by default. For rollback:

**Option 1: Write Down Migrations**

```bash
# Generate reverse migration manually
atlas migrate new rollback_add_groups \
  --edit
```

**Option 2: Declarative Rollback**

```bash
# Revert schema.ts changes
git revert <commit>

# Generate new forward migration to undo
pnpm db:migrate:plan
```

**Option 3: Point-in-Time Recovery (Production)**

Use Supabase's point-in-time recovery for critical rollbacks.

## Migration Best Practices

### Development

1. **Always lint before committing**
   ```bash
   pnpm db:migrate:lint
   ```

2. **Preview migrations locally**
   ```bash
   pnpm db:migrate:preview
   ```

3. **Test against fresh database**
   ```bash
   atlas migrate test --env local
   ```

4. **Keep migrations small and focused**
   - One logical change per migration
   - Split large refactors into multiple migrations

### Staging

1. **Let CI run linting first**
   - Workflow will fail on destructive changes
   - Review linting output before proceeding

2. **Monitor staging migration logs**
   - Check GitHub Actions output
   - Verify `atlas migrate status` after deployment

3. **Test application after migration**
   - Run smoke tests
   - Verify backward compatibility

### Production

1. **Require staging success first**
   - Production workflow should depend on staging

2. **Schedule migrations during low-traffic windows**
   - Avoid peak hours
   - Coordinate with team

3. **Have rollback plan ready**
   - Document reverse migration steps
   - Backup database before major schema changes

4. **Use blue-green deployments for breaking changes**
   - Deploy new schema
   - Run migration
   - Switch application traffic

## Handling Edge Cases

### Partial Migration Failures

**With Atlas:**
1. Migration fails mid-execution
2. Atlas records failure state in tracking table
3. Next run detects incomplete migration
4. Atlas prompts: retry, rollback, or manual intervention

**Current (Drizzle-kit):**
1. Migration fails mid-execution
2. Objects may be partially created
3. Next run tries to re-create objects
4. Errors on duplicate objects
5. Manual intervention required ❌

### Migration Conflicts

**Scenario:** Two developers create migrations from same base

**With Atlas:**
1. `atlas.sum` checksum detects history divergence
2. Fails with clear error: "migration history conflict"
3. Developers must merge and regenerate

**Current (Drizzle-kit):**
1. No conflict detection
2. Migrations may apply in wrong order
3. Subtle bugs possible ❌

### Schema Drift

**Scenario:** Manual changes made directly to database

**With Atlas:**
```bash
# Detect drift
atlas schema diff \
  --from file://atlas/migrations \
  --to env://staging

# Fix drift by generating migration from current state
atlas schema inspect --env staging > current.sql
# Review differences, then apply corrections
```

**Current (Drizzle-kit):**
- No drift detection
- Manual comparison required ❌

## Cost Analysis

### Atlas Pricing (2025)

**Free Tier:**
- Unlimited local use
- All CLI features
- GitHub integration
- Community support

**Atlas Cloud (Optional):**
- $99/month: Schema registry, enhanced linting, team features
- $299/month: Advanced analytics, compliance reports

**Our Needs:** Free tier sufficient for now. Cloud tier valuable for team growth.

### Migration Effort

**Initial Setup:** ~4-8 hours
- Install Atlas
- Configure atlas.hcl
- Baseline existing migrations
- Update CI/CD workflows
- Team training

**Ongoing:** Net time savings
- Fewer manual migration fixes
- Reduced debugging time
- Faster reviews (automatic linting)
- Less production incidents

## Risks & Mitigation

### Risk 1: Learning Curve

**Mitigation:**
- Start with declarative workflow (simpler)
- Extensive documentation in this spec
- Pair programming for first migrations
- Keep Drizzle-kit as fallback initially

### Risk 2: Tool Lock-In

**Mitigation:**
- Atlas generates standard SQL migrations
- Can migrate back to Drizzle-kit if needed
- Migration files are portable
- Open-source with active community

### Risk 3: Breaking Changes in Atlas

**Mitigation:**
- Pin Atlas version in CI: `uses: ariga/setup-atlas@v0`
- Test upgrades in dev/staging first
- Monitor Atlas release notes
- Version migrations in git for rollback

### Risk 4: Integration Issues

**Mitigation:**
- Extensive testing in dev environment first
- Gradual rollout: local → staging → production
- Keep parallel Drizzle-kit setup for 1 sprint
- Document rollback procedure

## Success Metrics

### Quantitative

- **Migration failures:** Target 0 in staging/production
- **Manual intervention:** Reduce by 90%
- **Migration review time:** Reduce by 50% (auto-linting)
- **Incident response:** Faster root cause identification

### Qualitative

- **Developer confidence:** Higher comfort deploying schema changes
- **Code review:** Less bikeshedding on migration SQL
- **Production incidents:** Fewer schema-related outages

## Timeline

### Week 1: Research & Planning
- ✅ Research Atlas capabilities
- ✅ Document integration plan (this spec)
- ⬜ Team review and approval

### Week 2: Development Setup
- ⬜ Install Atlas locally
- ⬜ Create atlas.hcl configuration
- ⬜ Test on existing schema
- ⬜ Generate first Atlas migration

### Week 3: Baseline & Testing
- ⬜ Baseline existing Drizzle migrations
- ⬜ Test migration workflow end-to-end
- ⬜ Verify idempotency
- ⬜ Document any gotchas

### Week 4: CI/CD Integration
- ⬜ Update GitHub workflows
- ⬜ Configure staging environment
- ⬜ Test automated migrations
- ⬜ Update team documentation

### Week 5: Production Rollout
- ⬜ Apply baseline to production
- ⬜ Run first Atlas migration in production
- ⬜ Monitor and validate
- ⬜ Deprecate old scripts

## References

### Documentation

- **Atlas + Drizzle Guide:** https://atlasgo.io/guides/orms/drizzle
- **Atlas Versioned Migrations:** https://atlasgo.io/versioned/intro
- **Migration Linting:** https://atlasgo.io/versioned/lint
- **Existing Project Integration:** https://atlasgo.io/guides/orms/drizzle/existing-project

### GitHub

- **Atlas CLI:** https://github.com/ariga/atlas
- **Atlas Examples:** https://github.com/ariga/atlas-examples

### Community

- **Atlas Discord:** https://discord.gg/zZ6sWVg6NT
- **Drizzle Discord:** https://discord.gg/yfjTbVXMW4

## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2025-01-11 | Keep Drizzle ORM for queries | Lightweight, SQL-like, good DX |
| 2025-01-11 | Use Atlas for migrations | Better safety, linting, reliability |
| 2025-01-11 | Start with versioned workflow | Audit trail important for team |
| TBD | Approve/reject this plan | Team discussion needed |

## Next Steps

1. **Team Review:** Discuss this spec, address concerns
2. **Pilot Test:** Implement Phase 1 on feature branch
3. **Evaluate:** Run for 1-2 sprints, measure success metrics
4. **Decide:** Go/no-go for full rollout
5. **Document:** Update team runbooks and onboarding

---

**Questions? Contact:** [Your Name/Team]
**Last Review:** 2025-01-11
