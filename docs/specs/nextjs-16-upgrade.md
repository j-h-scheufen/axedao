# TODO: Next.js 16 Upgrade

## Overview

This document tracks the planned upgrade from Next.js 15.x to Next.js 16.x, which requires several coordinated changes including migrating next-auth from v4 to v5.

## Prerequisites

- Next.js 16 requires Node.js 20.9+
- TypeScript 5.1+ required
- React 19.2+ (already done)

## 1. next-auth v4 → v5 Migration

next-auth v4 does not support Next.js 16. Migration to v5 is required.

### Key Changes

**Configuration restructure:**
```typescript
// Old: config/next-auth-options.ts
export const authOptions: AuthOptions = { ... }

// New: auth.ts (root level)
export const { auth, handlers, signIn, signOut } = NextAuth({ ... })

// New: app/api/auth/[...nextauth]/route.ts
import { handlers } from "@/auth"
export const { GET, POST } = handlers
```

**Session access changes:**
- Replace all `getServerSession(authOptions)` → `auth()`
- Affected files (~20 API routes + components):
  - `app/api/*/route.ts` files
  - `app/(main)/groups/[groupId]/edit/page.tsx`
  - Test files in `__tests__/`

**Middleware changes:**
```typescript
// Old: middleware.ts
import { withAuth } from "next-auth/middleware"
export default withAuth(...)

// New: proxy.ts
export { auth as middleware } from "@/auth"
```

### Reference
- [Migration Guide](https://authjs.dev/getting-started/migrating-to-v5)

## 2. Next.js 16 Breaking Changes

### Async Route Props
All route params and searchParams must be awaited:
```typescript
// Old
export default function Page({ params }) {
  console.log(params.id)
}

// New
export default async function Page({ params }) {
  const { id } = await params
}
```

### Async Utility Functions
```typescript
// Old
const cookieList = cookies()

// New
const cookieList = await cookies()
```

Also applies to: `headers()`, `draftMode()`

### Middleware → Proxy Rename
- Rename `middleware.ts` to `proxy.ts`
- Export function as `proxy` instead of default

### revalidateTag() Requires Second Argument
```typescript
// Old
revalidateTag('blog-posts')

// New
revalidateTag('blog-posts', 'max')
```

### Parallel Routes Require default.js
All parallel route slots now require explicit `default.js` files.

### Other Changes
- `next lint` removed (we use Biome, so no impact)
- Turbopack is default bundler
- Image component defaults changed

## 3. Code Cleanup: Remove Manual Memoization

With Next.js 16 and React 19.2, the **React Compiler** is enabled and automatically handles memoization.

### What to Remove
- `useMemo` calls
- `useCallback` calls
- `React.memo()` wrappers

### Search Commands
```bash
# Find useMemo usage
grep -r "useMemo" --include="*.tsx" --include="*.ts" apps/quilombo/

# Find useCallback usage
grep -r "useCallback" --include="*.tsx" --include="*.ts" apps/quilombo/

# Find React.memo usage
grep -r "React.memo\|memo(" --include="*.tsx" --include="*.ts" apps/quilombo/
```

### Benefits
- Reduced code size and bundle size
- Improved maintainability
- Better performance (compiler optimizes more effectively)

### Priority
Low - can be done incrementally after the main upgrade. The compiler skips already-memoized code, so leaving them temporarily causes no issues.

## Migration Order

1. **Migrate next-auth v4 → v5** (biggest change, most risk)
2. **Upgrade Next.js 15 → 16**
3. **Update async params/utilities** (codemod available)
4. **Rename middleware.ts → proxy.ts**
5. **Update revalidateTag() calls**
6. **Add missing default.js for parallel routes**
7. **Build and test thoroughly**
8. **Remove manual memoization** (optional cleanup)

## Resources

- [Next.js 16 Release Notes](https://nextjs.org/blog/next-16)
- [Next.js 16 Upgrade Guide](https://nextjs.org/docs/app/guides/upgrading/version-16)
- [next-auth v5 Migration](https://authjs.dev/getting-started/migrating-to-v5)
- [React Compiler](https://react.dev/learn/react-compiler)

## Upgrade CLI

Next.js provides a codemod for automated updates:
```bash
npx @next/codemod@canary upgrade latest
```
