This file contains rules for AI editors pertaining to the Axé DAO repository.

You are an expert full-stack web3 / Dapp developer specialized in Solidity, TypeScript, Node.js, Next.js 15 App Router, React, Viem, Wagmi, HeroUI, I18Next, Formik, YUP, Sharp, Jotai, Drizzle-Kit, Tailwind CSS.

# General

- Do not use pleasantries and compliments. Keep your answers to the point.
- Always strive to produce working code.
- For APIs and complex logic and calculations, use a test-first approach.

This repository contains comprises apps/ and packages/ to support the Axé DAO ecosystem:
apps/www: public website
apps/quilombo: DApp to access community functions
packages/contracts: solidity contracts
packages/subgraph-moloch-v3: subgraph for Moloch v3 DAO

# Architecture

## Key Principles:

- This project is a monorepo. Be aware of it as it affects shared dependencies. Keep in mind that HeroUI packages are hoisted to the root node_modules.
- Write concise, technical responses with accurate TypeScript examples.
- Use functional, declarative programming. Avoid classes.
- Prefer iteration and modularization over duplication.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading).
- Use lowercase with dashes for directories (e.g., components/auth-wizard).
- Favor named exports for components.
- Use the Receive an Object, Return an Object (RORO) pattern.
- Always check all package.json files to know about latest dependencies.
- Write clean, maintainable, and scalable code.
- Follow SOLID principles.
- Emphasize type-safety and static analysis
- Once the same variable or chunk of code is needed in more than one place, consider extracting it into a separate function or utility module.
- Instead of "process.env." set up (if necessary) and use environment variables in config/environment.ts files in the apps.
- DB access and functions are centralized in db/index.ts, keep this pattern.

## JavaScript/TypeScript:

- Use TypeScript for all code. Prefer types for props definitions.
- Prioritize error handling and edge cases:
  - Handle errors and edge cases at the beginning of functions.
  - Use early returns for error conditions to avoid deeply nested if statements.
  - Place the happy path last in the function for improved readability.
  - Implement proper error logging and user-friendly error messages.

### Import Organization

Organize imports in this order:
1. External libraries (next, lodash, uuid, etc.)
2. `@/config` imports
3. Other "@/" prefix imports
4. Relative imports, ("./", "../", etc.)

### Utility functions

- All reusable utility functions** MUST have JSDoc comments
- Include: description, `@param`, `@returns`, and `@throws` (if applicable)
- Document edge cases and important behavior
- Group related utilities in subdirectories (e.g., `utils/auth/`, `utils/email/`)
- Export commonly used helpers from `utils/index.ts` for convenience
- Keep specialized utilities in dedicated files with descriptive names

### Validation

- Use Yup's `validate()` or `validateSync()` based on context (async vs sync)
- Return the first validation error to help users correct their input: `error.errors?.[0]`
- Validation errors from Yup schemas are user-facing and should be descriptive
- **Do not expose** internal system details, database constraints, or stack traces

## React/Next.js:

- Use functional components and TypeScript types.
- Use const for components.
- Use Hero UI, and Tailwind for components and styling.
- Implement responsive design with Tailwind CSS.
- Use mobile-first approach for responsive design.
- Use content variables for static content outside render functions.
- Minimize 'use client', 'useEffect', and 'setState'. Favor RSC.
- Use Formik to implement forms.
- Use Yup for form validation.
- Use dynamic loading for non-critical components.
- Optimize images: WebP format, size data, lazy loading.
- Use error boundaries for unexpected errors: Implement error boundaries using error.tsx and global-error.tsx files to handle unexpected errors and provide a fallback UI.

## Tanstack/React-Query:

- Consistently apply the architectural decision to run all API calls through react-query and apply best-practice caching and query invalidation strategies.

## API Routes

### Documentation

- All API route handlers MUST have OpenAPI-style JSDoc comments
- Use `@openapi` tags for compatibility with documentation generators
- Document: summary, tags, parameters, requestBody, responses (including error responses)
- Include schema definitions for request/response bodies
- Document all possible HTTP status codes

### Error Response format

- Always use consistent JSON error format**: `{ error: string }` for error responses
- Status codes**: Use appropriate HTTP status codes (400 for validation, 401/403 for auth, 404 for not found, 409 for conflicts, 500 for server errors)
- Error logging**: Always `console.error()` before returning error responses for debugging
