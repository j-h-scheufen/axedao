/**
 * Custom error classes for the application.
 * Extends Error to maintain stack traces and instanceof checks.
 */

/**
 * Thrown when a requested resource (group, claim, user, etc.) is not found in the database.
 * Should be caught and returned as HTTP 404.
 */
export class NotFoundError extends Error {
  constructor(resource: string, identifier?: string) {
    const message = identifier ? `${resource} with id '${identifier}' not found` : `${resource} not found`;
    super(message);
    this.name = 'NotFoundError';
    // Maintains proper stack trace for where error was thrown (V8 only)
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, NotFoundError);
    }
  }
}

/**
 * Thrown when a user attempts an action they don't have permission for.
 * Should be caught and returned as HTTP 403.
 */
export class ForbiddenError extends Error {
  constructor(message: string = 'Forbidden') {
    super(message);
    this.name = 'ForbiddenError';
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, ForbiddenError);
    }
  }
}

/**
 * Thrown when input validation fails.
 * Should be caught and returned as HTTP 400.
 */
export class ValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ValidationError';
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, ValidationError);
    }
  }
}

/**
 * Thrown when a requested operation conflicts with the current state.
 * Example: Trying to claim a group that's already claimed.
 * Should be caught and returned as HTTP 409.
 */
export class ConflictError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ConflictError';
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, ConflictError);
    }
  }
}
