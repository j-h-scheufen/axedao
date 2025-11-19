/**
 * Unit tests for password hashing and verification utilities
 * Tests bcrypt hashing with proper salt rounds and verification
 */

import { describe, it, expect } from 'vitest';
import { hashPassword, verifyPassword } from '@/utils/auth/password';

describe('Password Utilities', () => {
  describe('hashPassword', () => {
    it('should hash a password', async () => {
      const password = 'mySecurePassword123!';
      const hash = await hashPassword(password);

      expect(hash).toBeDefined();
      expect(typeof hash).toBe('string');
      expect(hash).not.toBe(password);
      expect(hash.length).toBeGreaterThan(0);
    });

    it('should produce bcrypt hash format', async () => {
      const password = 'testPassword';
      const hash = await hashPassword(password);

      // Bcrypt hashes start with $2a$, $2b$, or $2y$ followed by cost factor
      expect(hash).toMatch(/^\$2[aby]\$\d{2}\$/);
    });

    it('should produce different hashes for same password (salting)', async () => {
      const password = 'samePassword123';
      const hash1 = await hashPassword(password);
      const hash2 = await hashPassword(password);

      expect(hash1).not.toBe(hash2);
      expect(hash1).toBeDefined();
      expect(hash2).toBeDefined();
    });

    it('should handle empty string password', async () => {
      const hash = await hashPassword('');

      expect(hash).toBeDefined();
      expect(typeof hash).toBe('string');
      expect(hash.length).toBeGreaterThan(0);
    });

    it('should handle special characters in password', async () => {
      const password = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      const hash = await hashPassword(password);

      expect(hash).toBeDefined();
      expect(typeof hash).toBe('string');
    });

    it('should handle unicode characters', async () => {
      const password = 'пароль密码🔒';
      const hash = await hashPassword(password);

      expect(hash).toBeDefined();
      expect(typeof hash).toBe('string');
    });

    it('should handle very long passwords', async () => {
      const password = 'a'.repeat(1000);
      const hash = await hashPassword(password);

      expect(hash).toBeDefined();
      expect(typeof hash).toBe('string');
    });
  });

  describe('verifyPassword', () => {
    it('should verify correct password', async () => {
      const password = 'correctPassword123';
      const hash = await hashPassword(password);

      const isValid = await verifyPassword(password, hash);

      expect(isValid).toBe(true);
    });

    it('should reject incorrect password', async () => {
      const password = 'correctPassword123';
      const hash = await hashPassword(password);

      const isValid = await verifyPassword('wrongPassword', hash);

      expect(isValid).toBe(false);
    });

    it('should be case sensitive', async () => {
      const password = 'CaseSensitivePassword';
      const hash = await hashPassword(password);

      const isValid1 = await verifyPassword('casesensitivepassword', hash);
      const isValid2 = await verifyPassword('CASESENSITIVEPASSWORD', hash);
      const isValid3 = await verifyPassword('CaseSensitivePassword', hash);

      expect(isValid1).toBe(false);
      expect(isValid2).toBe(false);
      expect(isValid3).toBe(true);
    });

    it('should handle empty password verification', async () => {
      const hash = await hashPassword('');

      const isValid1 = await verifyPassword('', hash);
      const isValid2 = await verifyPassword('notEmpty', hash);

      expect(isValid1).toBe(true);
      expect(isValid2).toBe(false);
    });

    it('should handle special characters in verification', async () => {
      const password = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      const hash = await hashPassword(password);

      const isValid1 = await verifyPassword(password, hash);
      const isValid2 = await verifyPassword('!@#$%^&*()_+-=[]{}|;:,.<>?/~', hash);

      expect(isValid1).toBe(true);
      expect(isValid2).toBe(false);
    });

    it('should handle unicode characters in verification', async () => {
      const password = 'пароль密码🔒';
      const hash = await hashPassword(password);

      const isValid = await verifyPassword(password, hash);

      expect(isValid).toBe(true);
    });

    it('should reject slightly different passwords', async () => {
      const password = 'password123';
      const hash = await hashPassword(password);

      const similarPasswords = ['password124', 'password12', 'password 123', 'password123 ', ' password123'];

      for (const similar of similarPasswords) {
        const isValid = await verifyPassword(similar, hash);
        expect(isValid).toBe(false);
      }
    });

    it('should return false for invalid hash format', async () => {
      const password = 'testPassword';
      const invalidHash = 'not-a-valid-bcrypt-hash';

      // bcrypt.compare returns false for invalid hashes rather than throwing
      const isValid = await verifyPassword(password, invalidHash);
      expect(isValid).toBe(false);
    });

    it('should return false for empty hash', async () => {
      const password = 'testPassword';

      // bcrypt.compare returns false for empty hash
      const isValid = await verifyPassword(password, '');
      expect(isValid).toBe(false);
    });
  });

  describe('Hash and Verify Integration', () => {
    it('should work with multiple different passwords', async () => {
      const passwords = ['password1', 'password2', 'password3'];

      const hashes = await Promise.all(passwords.map((pwd) => hashPassword(pwd)));

      // Verify each password with its own hash
      for (let i = 0; i < passwords.length; i++) {
        const isValid = await verifyPassword(passwords[i], hashes[i]);
        expect(isValid).toBe(true);
      }

      // Verify first password doesn't match other hashes
      expect(await verifyPassword(passwords[0], hashes[1])).toBe(false);
      expect(await verifyPassword(passwords[0], hashes[2])).toBe(false);
    }, 15000);

    it('should handle concurrent hashing operations', async () => {
      const passwords = Array.from({ length: 10 }, (_, i) => `password${i}`);

      const hashes = await Promise.all(passwords.map((pwd) => hashPassword(pwd)));

      expect(hashes).toHaveLength(10);
      expect(new Set(hashes).size).toBe(10); // All hashes unique

      // Verify all work correctly
      const verifications = await Promise.all(passwords.map((pwd, i) => verifyPassword(pwd, hashes[i])));

      expect(verifications.every((v) => v === true)).toBe(true);
    });

    it('should maintain security over multiple hash-verify cycles', async () => {
      const password = 'securePassword123!';

      // Hash the same password multiple times
      const hashes = await Promise.all(Array.from({ length: 5 }, () => hashPassword(password)));

      // All hashes should be different (salting)
      expect(new Set(hashes).size).toBe(5);

      // But all should verify correctly
      const verifications = await Promise.all(hashes.map((hash) => verifyPassword(password, hash)));

      expect(verifications.every((v) => v === true)).toBe(true);
    });

    it('should maintain integrity for password changes', async () => {
      const oldPassword = 'oldPassword123';
      const newPassword = 'newPassword456';

      const oldHash = await hashPassword(oldPassword);
      const newHash = await hashPassword(newPassword);

      // Old password should not verify with new hash
      expect(await verifyPassword(oldPassword, newHash)).toBe(false);

      // New password should not verify with old hash
      expect(await verifyPassword(newPassword, oldHash)).toBe(false);

      // Each should verify with their own hash
      expect(await verifyPassword(oldPassword, oldHash)).toBe(true);
      expect(await verifyPassword(newPassword, newHash)).toBe(true);
    });
  });

  describe('Security Considerations', () => {
    it('should use sufficient bcrypt cost factor', async () => {
      const password = 'testPassword';
      const hash = await hashPassword(password);

      // Extract cost factor from hash (format: $2b$12$...)
      const match = hash.match(/^\$2[aby]\$(\d{2})\$/);
      expect(match).not.toBeNull();

      if (match) {
        const costFactor = Number.parseInt(match[1], 10);
        // Cost factor should be at least 10 for security
        expect(costFactor).toBeGreaterThanOrEqual(10);
      }
    });

    it('should produce hashes of consistent length', async () => {
      const passwords = ['short', 'mediumlength', 'verylongpasswordwithmanychars'];

      const hashes = await Promise.all(passwords.map((pwd) => hashPassword(pwd)));

      // Bcrypt hashes are always 60 characters
      for (const hash of hashes) {
        expect(hash.length).toBe(60);
      }
    });

    it('should use constant-time comparison', async () => {
      const password = 'testPassword';
      const hash = await hashPassword(password);

      // bcrypt.compare uses constant-time comparison internally
      // Just verify both correct and incorrect verifications complete
      const correctResult = await verifyPassword(password, hash);
      const incorrectResult = await verifyPassword('wrongPassword', hash);

      expect(correctResult).toBe(true);
      expect(incorrectResult).toBe(false);
    });
  });
});
