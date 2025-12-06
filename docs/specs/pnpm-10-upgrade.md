# TODO: pnpm 10 Upgrade

## Overview

Vercel shows this message during builds:
```
Using pnpm@9.x based on project creation date
To use pnpm@10.x, manually opt in using corepack
```

This document evaluates whether to upgrade from pnpm 9 to pnpm 10.

## Current State

- **pnpm version**: 9.12.3 (defined in root `package.json` `packageManager` field)
- **Lockfile version**: 9.0

## Breaking Changes in pnpm 10

### 1. Lifecycle Scripts Disabled by Default (HIGH IMPACT)

Dependencies' postinstall/preinstall scripts no longer run automatically. This is a security feature but affects native modules.

**Affected packages in this project:**
- `sharp` - image processing (requires native build)
- `bcrypt` - password hashing (requires native build)
- Potentially others with postinstall scripts

**Required fix:**
```json
{
  "pnpm": {
    "onlyBuiltDependencies": ["sharp", "bcrypt"]
  }
}
```

### 2. Public Hoist Pattern Changed (MEDIUM IMPACT)

Nothing is hoisted by default. Previously, packages with `eslint` or `prettier` in their name were hoisted.

**Potential impact:** This monorepo relies on HeroUI packages being hoisted to root `node_modules`. May need explicit configuration:
```json
{
  "pnpm": {
    "publicHoistPattern": ["@heroui/*", "..."]
  }
}
```

### 3. Store Version Bumped to v10 (LOW IMPACT)

First install after upgrade will rebuild the entire store. One-time cost.

### 4. `pnpm deploy` Requires Workspace Setting (LOW IMPACT)

If using `pnpm deploy`, requires `inject-workspace-packages=true` in `.npmrc`.

### 5. Other Changes

- `#` character escaped in `node_modules/.pnpm` directory names
- `pnpm link` adds overrides to root package.json
- `pnpm test` passes all parameters directly to underlying script
- Fewer `npm_package_*` environment variables set during script execution
- Long paths use SHA256 instead of MD5
- Removed lockfile v6 to v9 conversion (use pnpm 9 if needed)

## Benefits of pnpm 10

- **Security**: Lifecycle scripts disabled by default prevents supply chain attacks
- **Consistency**: `manage-package-manager-versions` enabled by default
- **New features**: Configuration dependencies, improved workspace injection
- **Better hashing**: SHA256 for long paths

## Recommendation

**Do not upgrade yet.** Reasons:

1. Native dependencies (`sharp`, `bcrypt`) need explicit allowlisting
2. Monorepo hoisting configuration may need adjustments
3. CI/CD pipelines (Vercel, GitHub Actions) may need updates
4. pnpm 9 is stable and fully supported
5. Low benefit-to-effort ratio for this project

## Migration Checklist (When Ready)

1. [ ] Audit all dependencies for postinstall scripts
2. [ ] Add `pnpm.onlyBuiltDependencies` to root `package.json`
3. [ ] Test hoisting behavior with HeroUI packages
4. [ ] Update `.npmrc` if needed for hoisting patterns
5. [ ] Update `packageManager` field in root `package.json`
6. [ ] Delete `node_modules` and `pnpm-lock.yaml`
7. [ ] Run fresh `pnpm install`
8. [ ] Test all apps (`pnpm build`, `pnpm test`)
9. [ ] Test Vercel deployment
10. [ ] Update GitHub Actions if needed

## How to Upgrade

```bash
# Update packageManager field
# In package.json: "packageManager": "pnpm@10.x.x"

# Or use corepack
corepack enable
corepack prepare pnpm@latest --activate

# Clean install
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

## References

- [pnpm 10 Discussion](https://github.com/orgs/pnpm/discussions/8945)
- [Vercel pnpm v10 Support](https://vercel.com/changelog/automatic-pnpm-v10-support)
- [pnpm Releases](https://github.com/pnpm/pnpm/releases)
