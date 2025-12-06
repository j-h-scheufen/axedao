# Dark Mode Investigation - HeroUI + Tailwind v4

## Problem Statement
After React/Next.js dependency upgrades, the HeroUI NavBar shows a grey/light background instead of transparent in dark mode. This only happens in **Vercel production builds**, not in local development.

## Background Context
- React was previously pinned to 19.1.x to avoid this exact dark mode issue
- React 19.1.x has security vulnerability CVE-2025-66478
- Upgraded to React 19.2.1 to address the CVE
- This re-surfaced the dark mode bug

**FALLBACK PLAN:** If we can't fix this, revert tailwind/heroui config changes and pin React to a patched 19.1.x version. However, solving this properly is valuable since we'll need to upgrade React eventually anyway.

## Key Learnings (DO NOT FORGET)

### Critical Requirements for HeroUI + Tailwind v4:
1. **`darkMode: 'class'`** - MUST be set for HeroUI to generate `.dark` CSS variables
2. **`extend: 'dark'` / `extend: 'light'`** - MUST be used in theme config to inherit HeroUI's base theme (background, foreground, default, content1-4, etc.). WITHOUT THIS, layouts break!
3. **`@config` vs `@plugin`** - `@plugin` does NOT pass darkMode config to HeroUI. Must use `@config`.

### What Breaks Without `extend`:
- HeroUI components lose their base styling (backgrounds, spacing, borders)
- NavBar, Cards, Modals all look broken
- Only custom colors (primary/secondary) would work, everything else missing

## Approaches Tried

### 1. @plugin approach (HeroUI recommended for Tailwind v4)
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@plugin "../config/heroui.mjs";
@custom-variant dark (&:is(.dark *));
```

**Result:** FAILED
- HeroUI component layouts work correctly
- `.dark` CSS variables are NOT generated in production build
- Only `:root` (light theme) variables present
- Reason: `@plugin` doesn't pass `darkMode: 'class'` config to HeroUI

### 2. @plugin with @source inline("dark") safelist
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@source inline("dark");
@plugin "../config/heroui.mjs";
@custom-variant dark (&:where(.dark, .dark *));
```

**Result:** FAILED
- Safelisting the `dark` class doesn't help
- The problem isn't that `.dark` class utilities are stripped
- The problem is that the HeroUI plugin never GENERATES the `.dark` CSS variables in the first place
- `@plugin` alone doesn't tell HeroUI to generate dark theme variables

### 3. @config approach WITHOUT extend (BROKEN LAYOUTS)
**Result:** FAILED
- Dark theme variables generated
- BUT HeroUI component layouts completely broken
- Missing base theme variables (background, foreground, default, etc.)
- Reason: Custom themes replaced base themes instead of extending them

### 4. @config approach WITH extend (LAYOUTS BROKEN)
**Configuration:**
```css
@import "tailwindcss";
@config "../tailwind.config.mjs";
```

**Result:** PARTIAL SUCCESS / FAILED
- `.dark` CSS variables ARE generated ✓
- BUT HeroUI component classes (navbar, flex layouts) are MISSING
- Tailwind v4 ignores `content` array in config - uses automatic detection
- node_modules excluded by default, so HeroUI classes not picked up

### 5. @source + @config approach (CURRENT ATTEMPT)
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@config "../tailwind.config.mjs";
```

With `tailwind.config.mjs`:
```js
export default {
  content: [...],  // IGNORED by Tailwind v4!
  darkMode: 'class',  // Required for .dark CSS variables
  plugins: [
    heroui({
      themes: {
        dark: { extend: 'dark', colors: {...} },
        light: { extend: 'light', colors: {...} },
      },
    }),
  ],
};
```

**Result:** FAILED
- Local build: `.dark` CSS variables present ✓
- Vercel build: `.dark` CSS variables MISSING ✗
- Layouts appear correct (unlike attempt #4)
- Vercel's production build strips .dark rules because Tailwind doesn't see the class in source

### 6. @source + @source inline("dark") + @config
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@source inline("dark");
@config "../tailwind.config.mjs";
```

**Hypothesis:**
- @config generates .dark CSS variables (verified locally)
- @source inline("dark") safelists the dark class so Tailwind won't strip it in production
- @source for HeroUI ensures component classes are included

**Result:** FAILED
- Vercel deployment still missing `.dark` CSS variables
- `@source inline("dark")` safelists the `dark` class but NOT the CSS variable block
- The HeroUI `.dark:not(#\#)` selector with CSS variables is still stripped

### 7. @source + @config + @custom-variant dark
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@config "../tailwind.config.mjs";
@custom-variant dark (&:where(.dark, .dark *));
```

**Key insight from user**: Other HeroUI components (cards, buttons) work correctly in dark mode on Vercel - only NavBar fails. Looking at HeroUI navbar source, it uses `dark:bg-background/20` for the blurred navbar effect. This is a `dark:` utility variant that needs to be generated.

**Rationale:**
- `@custom-variant dark` registers the dark variant with Tailwind v4
- This should generate `dark:bg-background/20` and other `dark:` utilities
- HeroUI docs show `@custom-variant dark (&:is(.dark *))` as required
- Using `:where()` for lower specificity: `(&:where(.dark, .dark *))`

**Local verification:**
```bash
grep "dark\\\\:bg-background" .next/static/css/*.css
# Shows: dark\:bg-background classes present in local build
```

**Result:** FAILED
- Vercel deployment still shows grey navbar
- Downloaded CSS from Vercel: `.dark` CSS variables and `dark:bg-background` utilities are MISSING
- Local build CSS: Both `.dark` variables and `dark:` utilities are PRESENT

### 8. @source inline safelist + .vercelignore
**Configuration:**
```css
@import "tailwindcss";
@source "../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}";
@source inline("dark dark:bg-background dark:bg-background/20");
@config "../tailwind.config.mjs";
@custom-variant dark (&:where(.dark, .dark *));
```

Also added `.vercelignore` with `!.gitignore` (recommended workaround from GitHub discussions).

**Result:** FAILED - **NOT A CACHE ISSUE**
- Vercel deployment: CSS hash **unchanged** (`dcdad60da95220ba.css`)
- Previous deployment (attempt #7): Same hash (`dcdad60da95220ba.css`)
- Redeployed with "use build cache" disabled - still same hash
- Still missing `.dark` CSS variables and `dark:bg-background` utilities

**UPDATE**: Vercel build logs show:
```
Restored build cache from previous deployment (5SScFX7v1dScfG6CxLtwxpK1jNFA)
```
This happens on **automatic deployments after push**, even if a previous manual redeploy had cache disabled. The build cache restoration may be preventing CSS regeneration.

**Root cause**: The `@source inline()` and other config changes have NO EFFECT on Vercel's Tailwind CSS output. Something in Vercel's environment causes Tailwind to:
1. Either not read our config properly, OR
2. Process sources differently, OR
3. Use different path resolution for `@source` and `@config` directives

### Key Question: Why does Vercel's Tailwind build differ from local?
Possible factors:
- **Working directory**: Vercel may run from monorepo root, not `apps/quilombo`
- **Path resolution**: Relative paths in `@source`/`@config` may resolve differently
- **pnpm store location**: node_modules symlinks may not work the same way
- **Turbo caching**: Even with Vercel cache disabled, Turborepo may cache

### 9. Inline .dark CSS variables workaround (CURRENT ATTEMPT)
**Configuration:**
Manually added all `.dark` theme CSS variables directly in `globals.css` `@layer base`.

```css
@layer base {
  .dark {
    color-scheme: dark;
    --heroui-background: 0 0% 0%;
    --heroui-foreground: 210 5.56% 92.94%;
    /* ... all HeroUI dark theme variables ... */
  }
}
```

**Rationale:**
- Bypasses the HeroUI plugin's `addUtilities()` mechanism entirely
- CSS in `@layer base` should NOT be tree-shaken
- Will confirm if inline CSS changes affect Vercel build output

**Local verification:**
- CSS hash changed: `d205ee61757dda73.css` → `f7082e552a6c2704.css`
- `.dark` variables present in build

**Vercel Result:** PARTIAL SUCCESS
- CSS hash changed on Vercel: `dcdad60da95220ba.css` → `ec4b65de7d85c9d3.css`
- `.dark` CSS variables ARE now present ✅
- BUT `dark:bg-background/20` utility is still MISSING ❌
- Navbar HTML only has `bg-background/70`, not the dark variant

### 10. Add dark:bg-background/20 via Navbar classNames (CURRENT ATTEMPT)
**Issue discovered:** HeroUI Navbar component outputs `bg-background/70` but NOT `dark:bg-background/20`.

Looking at rendered HTML:
```html
<nav class="... bg-background/70 ...">  <!-- Missing: dark:bg-background/20 -->
```

**Fix:** Explicitly add dark background via Navbar's `classNames.base`:
```tsx
<NextUINavbar
  classNames={{
    base: ['dark:bg-background/20'],
    // ...
  }}
>
```

**Local Verification:**
```bash
grep -o "dark\\\\:bg-background[^}]*" .next/static/css/*.css | head -3
# Shows: dark\:bg-background:where(.dark,.dark *)..., dark\:bg-background\/20:where(.dark,.dark *)...
```
✅ Both `dark:bg-background` and `dark:bg-background/20` utilities ARE generated in local build.

**Status: PENDING Vercel deployment verification**

## Verification Commands
```bash
# Check if .dark CSS variables exist in build
grep -o "\.dark[^{]*{[^}]*heroui" .next/static/css/*.css | head -5
# Should show: .dark:not(#\#)...{--heroui-background:0 0% 0%;...}

# Check if dark: utility variants exist
grep -o "dark\\\\:bg-background[^{]*{" .next/static/css/*.css | head -3
# Should show: dark\:bg-background:where(.dark,.dark *)...{

# Find which CSS file contains heroui variables
grep -l "heroui" .next/static/css/*.css
```

## What develop branch had (official HeroUI docs approach)
```css
/* globals.css */
@import "tailwindcss";
@plugin '../config/heroui.mjs';
@source '../../../node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}';
/* NOTE: Missing @custom-variant dark! */
```

```js
/* config/heroui.mjs */
heroui({
  themes: {
    dark: { colors: {...} },   // NOTE: Missing extend: 'dark'
    light: { colors: {...} },  // NOTE: Missing extend: 'light'
  },
});
```

**Problems with develop branch config:**
1. Missing `@custom-variant dark (&:is(.dark *))` - docs show this is required
2. Missing `extend: 'dark'`/`extend: 'light'` - causes base theme to be replaced, not extended
3. Using `@plugin` which doesn't pass `darkMode: 'class'` to HeroUI

## Current Status (2025-12-06)

**Current Configuration (Attempt #11):**
- Inline `.dark` CSS variables in `globals.css @layer base` (bypasses HeroUI plugin)
- Custom `.navbar-dark-bg` class in `@layer base` for navbar transparency
- `classNames.base: ['navbar-dark-bg']` on Navbar component
- `@source inline("dark dark:bg-background dark:bg-background/20")` safelist (kept for reference, but not working on Vercel)
- `@custom-variant dark (&:where(.dark, .dark *))` for dark variant registration

**Why `@source inline()` doesn't work on Vercel:**
- Vercel's Tailwind build doesn't generate `dark:bg-background/20` even with safelist
- Same code produces different CSS locally vs Vercel
- Workaround: Define the style manually in CSS instead of relying on Tailwind utilities

**Local Build Verified:**
- CSS hash: `e40b3c4476f0e468.css`
- `.dark` CSS variables: ✅ Present
- `.dark .navbar-dark-bg` rule: ✅ Present (sets `background-color: hsl(var(--heroui-background) / 0.2)`)

**Vercel Deployment: ✅ SUCCESS**
- Deployment: `quilombo-f9c6jc025-jhscheufens-projects.vercel.app`
- CSS hash: `c11c959af54adaad.css`
- Navbar now shows transparent/semi-transparent background in dark mode

## CRITICAL INSIGHT: Local vs Vercel CSS Output Differs

**The same source code produces different CSS on local vs Vercel builds:**

| Check | Local Build | Vercel Build |
|-------|-------------|--------------|
| CSS filename | `d205ee61757dda73.css` | `dcdad60da95220ba.css` |
| `.dark` CSS variables | ✅ Present | ❌ MISSING |
| `dark:bg-background` utilities | ✅ Present | ❌ MISSING |
| Font CSS (`ca21cea96a775e06.css`) | ✅ Same | ✅ Same |

**This proves the issue is in Tailwind's CSS generation on Vercel, NOT in our configuration syntax.**

Possible causes:
1. **pnpm hoisting differences** - Vercel may resolve `@source` path differently
2. **Build cache** - Vercel may have stale cached dependencies
3. **Node/pnpm version mismatch** - Different build environment
4. **Working directory** - Tailwind may run from different CWD on Vercel

## HeroUI Plugin Architecture (from source analysis)

The `.dark` CSS variables are generated via `addUtilities()` in the HeroUI plugin (not `addBase()`):
```javascript
// From @heroui/theme/dist/chunk-7ZMFUXZH.mjs
addUtilities({ ...resolved.utilities, ...utilities });
// resolved.utilities['.dark'] = { color-scheme: dark, --heroui-*: ... }
```

This means the `.dark` selector is treated as a **utility class** that can be tree-shaken if Tailwind doesn't detect the `dark` class being used in source files.

## If This Attempt Fails
Next steps to investigate:
1. **Clear Vercel build cache** - Force fresh build without cached node_modules
2. **Check Vercel build logs** - Look for warnings about @source path resolution
3. **Try absolute path** - Use repo-root-relative path for @source instead of ../../../
4. **Contact HeroUI/Tailwind** - File issue with reproduction case showing local vs Vercel diff
5. **Workaround: Inline CSS** - Manually add `.dark` CSS variables in globals.css @layer base

## References
- https://github.com/tailwindlabs/tailwindcss/discussions/16369
- https://stackoverflow.com/questions/79572864/how-to-config-hero-ui-with-tailwindcss-v4
- https://www.heroui.com/docs/guide/tailwind-v4
- https://github.com/heroui-inc/heroui/issues/4753
- https://github.com/tailwindlabs/tailwindcss/discussions/16370 (v4 Vercel build failures)
- https://stackoverflow.com/questions/79456787/tailwindcss-v4-not-working-when-deployed-with-vercel
- https://blakejones.dev/blog/how-to-make-a-safelist-in-tailwind-v4.1+/
