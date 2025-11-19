/**
 * Unit tests for custom error classes
 * Tests error instantiation, messages, names, and stack traces
 */

import { describe, it, expect } from 'vitest';
import { NotFoundError, ForbiddenError, ValidationError, ConflictError } from '@/utils/errors';

describe('Custom Error Classes', () => {
  describe('NotFoundError', () => {
    it('should create error with resource name only', () => {
      const error = new NotFoundError('User');

      expect(error).toBeInstanceOf(Error);
      expect(error).toBeInstanceOf(NotFoundError);
      expect(error.message).toBe('User not found');
      expect(error.name).toBe('NotFoundError');
      expect(error.stack).toBeDefined();
    });

    it('should create error with resource name and identifier', () => {
      const error = new NotFoundError('Group', 'abc-123');

      expect(error.message).toBe("Group with id 'abc-123' not found");
      expect(error.name).toBe('NotFoundError');
    });

    it('should maintain proper stack trace', () => {
      const error = new NotFoundError('Event', 'event-456');

      expect(error.stack).toBeDefined();
      expect(error.stack).toContain('NotFoundError');
    });

    it('should work with instanceof checks', () => {
      const error = new NotFoundError('Location');

      expect(error instanceof Error).toBe(true);
      expect(error instanceof NotFoundError).toBe(true);
      expect(error instanceof ForbiddenError).toBe(false);
    });

    it('should handle different resource types', () => {
      const resources = ['User', 'Group', 'Event', 'Invitation', 'Claim'];

      for (const resource of resources) {
        const error = new NotFoundError(resource, 'test-id');
        expect(error.message).toContain(resource);
        expect(error.message).toContain('test-id');
      }
    });
  });

  describe('ForbiddenError', () => {
    it('should create error with default message', () => {
      const error = new ForbiddenError();

      expect(error).toBeInstanceOf(Error);
      expect(error).toBeInstanceOf(ForbiddenError);
      expect(error.message).toBe('Forbidden');
      expect(error.name).toBe('ForbiddenError');
      expect(error.stack).toBeDefined();
    });

    it('should create error with custom message', () => {
      const error = new ForbiddenError('You do not have permission to access this resource');

      expect(error.message).toBe('You do not have permission to access this resource');
      expect(error.name).toBe('ForbiddenError');
    });

    it('should maintain proper stack trace', () => {
      const error = new ForbiddenError('Access denied');

      expect(error.stack).toBeDefined();
      expect(error.stack).toContain('ForbiddenError');
    });

    it('should work with instanceof checks', () => {
      const error = new ForbiddenError();

      expect(error instanceof Error).toBe(true);
      expect(error instanceof ForbiddenError).toBe(true);
      expect(error instanceof ValidationError).toBe(false);
    });
  });

  describe('ValidationError', () => {
    it('should create error with message', () => {
      const error = new ValidationError('Invalid email format');

      expect(error).toBeInstanceOf(Error);
      expect(error).toBeInstanceOf(ValidationError);
      expect(error.message).toBe('Invalid email format');
      expect(error.name).toBe('ValidationError');
      expect(error.stack).toBeDefined();
    });

    it('should handle various validation messages', () => {
      const messages = [
        'Email is required',
        'Password must be at least 8 characters',
        'Invalid date format',
        'Field cannot be empty',
      ];

      for (const message of messages) {
        const error = new ValidationError(message);
        expect(error.message).toBe(message);
        expect(error.name).toBe('ValidationError');
      }
    });

    it('should maintain proper stack trace', () => {
      const error = new ValidationError('Validation failed');

      expect(error.stack).toBeDefined();
      expect(error.stack).toContain('ValidationError');
    });

    it('should work with instanceof checks', () => {
      const error = new ValidationError('Invalid input');

      expect(error instanceof Error).toBe(true);
      expect(error instanceof ValidationError).toBe(true);
      expect(error instanceof ConflictError).toBe(false);
    });
  });

  describe('ConflictError', () => {
    it('should create error with message', () => {
      const error = new ConflictError('Group is already claimed');

      expect(error).toBeInstanceOf(Error);
      expect(error).toBeInstanceOf(ConflictError);
      expect(error.message).toBe('Group is already claimed');
      expect(error.name).toBe('ConflictError');
      expect(error.stack).toBeDefined();
    });

    it('should handle various conflict scenarios', () => {
      const scenarios = [
        'Resource already exists',
        'Email already in use',
        'Invitation already accepted',
        'Cannot delete group with active members',
      ];

      for (const scenario of scenarios) {
        const error = new ConflictError(scenario);
        expect(error.message).toBe(scenario);
        expect(error.name).toBe('ConflictError');
      }
    });

    it('should maintain proper stack trace', () => {
      const error = new ConflictError('Conflict detected');

      expect(error.stack).toBeDefined();
      expect(error.stack).toContain('ConflictError');
    });

    it('should work with instanceof checks', () => {
      const error = new ConflictError('Duplicate entry');

      expect(error instanceof Error).toBe(true);
      expect(error instanceof ConflictError).toBe(true);
      expect(error instanceof NotFoundError).toBe(false);
    });
  });

  describe('Error Differentiation', () => {
    it('should be able to distinguish between different error types', () => {
      const notFound = new NotFoundError('User', '123');
      const forbidden = new ForbiddenError('Access denied');
      const validation = new ValidationError('Invalid input');
      const conflict = new ConflictError('Already exists');

      expect(notFound instanceof NotFoundError).toBe(true);
      expect(notFound instanceof ForbiddenError).toBe(false);
      expect(notFound instanceof ValidationError).toBe(false);
      expect(notFound instanceof ConflictError).toBe(false);

      expect(forbidden instanceof ForbiddenError).toBe(true);
      expect(forbidden instanceof NotFoundError).toBe(false);

      expect(validation instanceof ValidationError).toBe(true);
      expect(validation instanceof ForbiddenError).toBe(false);

      expect(conflict instanceof ConflictError).toBe(true);
      expect(conflict instanceof ValidationError).toBe(false);
    });

    it('should all be instances of base Error class', () => {
      const errors = [
        new NotFoundError('Test'),
        new ForbiddenError(),
        new ValidationError('Test'),
        new ConflictError('Test'),
      ];

      for (const error of errors) {
        expect(error instanceof Error).toBe(true);
      }
    });
  });

  describe('Error Throwing and Catching', () => {
    it('should be catchable as specific error type', () => {
      expect(() => {
        throw new NotFoundError('User', 'abc');
      }).toThrow(NotFoundError);

      expect(() => {
        throw new ValidationError('Invalid');
      }).toThrow(ValidationError);
    });

    it('should be catchable as generic Error', () => {
      expect(() => {
        throw new ForbiddenError();
      }).toThrow(Error);

      expect(() => {
        throw new ConflictError('Conflict');
      }).toThrow(Error);
    });

    it('should preserve error message when thrown', () => {
      try {
        throw new NotFoundError('Group', 'group-123');
      } catch (error) {
        expect(error).toBeInstanceOf(NotFoundError);
        if (error instanceof NotFoundError) {
          expect(error.message).toBe("Group with id 'group-123' not found");
        }
      }
    });
  });
});
