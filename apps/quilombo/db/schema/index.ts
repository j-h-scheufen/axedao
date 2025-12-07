/**
 * Schema index - Re-exports all schema definitions
 *
 * This file aggregates schema exports for easier imports.
 * The main db/schema.ts file contains the public schema.
 * The genealogy.ts file contains the genealogy schema.
 */

// Re-export public schema (maintains backward compatibility)
export * from '../schema';

// Re-export genealogy schema
export * from './genealogy';
