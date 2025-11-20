/**
 * Integration tests for user authentication flows
 * Tests complete auth workflows using real database
 *
 * Authentication Flows Tested:
 * - Email/password signup and verification
 * - Password reset workflow
 * - Account status transitions
 * - OAuth account linking
 * - Token generation and validation
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq, and, gte } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';
import bcrypt from 'bcrypt';

describe('Authentication Flows (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();
  });

  describe('Email/Password Signup', () => {
    it('should create user with pending_verification status', async () => {
      const userId = uuidv4();
      const email = 'newuser@example.com';
      const passwordHash = await bcrypt.hash('password123', 10);

      const users = await db
        .insert(schema.users)
        .values({
          id: userId,
          email: email.toLowerCase(),
          name: 'New User',
          nickname: 'newuser',
          passwordHash,
          accountStatus: 'pending_verification',
          isGlobalAdmin: false,
        })
        .returning();

      expect(users).toHaveLength(1);
      expect(users[0].email).toBe(email.toLowerCase());
      expect(users[0].accountStatus).toBe('pending_verification');
      expect(users[0].emailVerifiedAt).toBeNull();
      expect(users[0].passwordHash).toBeTruthy();
    });

    it('should prevent duplicate email registration', async () => {
      const email = 'duplicate@example.com';
      const userId1 = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      // First user
      await db.insert(schema.users).values({
        id: userId1,
        email: email.toLowerCase(),
        passwordHash,
        isGlobalAdmin: false,
      });

      // Second user with same email should fail
      const userId2 = uuidv4();
      await expect(async () => {
        await db.insert(schema.users).values({
          id: userId2,
          email: email.toLowerCase(),
          passwordHash,
          isGlobalAdmin: false,
        });
      }).rejects.toThrow();
    });

    it('should hash password correctly', async () => {
      const userId = uuidv4();
      const plainPassword = 'mySecurePassword123!';
      const passwordHash = await bcrypt.hash(plainPassword, 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        isGlobalAdmin: false,
      });

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      // Verify password can be checked
      const isValid = await bcrypt.compare(plainPassword, user?.passwordHash || '');
      expect(isValid).toBe(true);

      // Verify wrong password fails
      const isWrong = await bcrypt.compare('wrongPassword', user?.passwordHash || '');
      expect(isWrong).toBe(false);
    });
  });

  describe('Email Verification Flow', () => {
    it('should create verification token for user', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        accountStatus: 'pending_verification',
        isGlobalAdmin: false,
      });

      // Create verification token
      const tokenHash = await bcrypt.hash('plain-token-123', 10);
      const expiresAt = new Date(Date.now() + 30 * 60 * 1000); // 30 minutes

      const tokens = await db
        .insert(schema.verificationTokens)
        .values({
          userId,
          tokenHash,
          type: 'email_verification',
          expiresAt,
        })
        .returning();

      expect(tokens).toHaveLength(1);
      expect(tokens[0].userId).toBe(userId);
      expect(tokens[0].type).toBe('email_verification');
      expect(tokens[0].consumedAt).toBeNull();
    });

    it('should verify email and activate account', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        accountStatus: 'pending_verification',
        isGlobalAdmin: false,
      });

      // Verify email
      const verifiedAt = new Date();
      await db
        .update(schema.users)
        .set({
          emailVerifiedAt: verifiedAt,
          accountStatus: 'active',
        })
        .where(eq(schema.users.id, userId));

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.accountStatus).toBe('active');
      expect(user?.emailVerifiedAt).toBeTruthy();
    });

    it('should mark token as consumed after use', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        isGlobalAdmin: false,
      });

      const tokenHash = await bcrypt.hash('plain-token', 10);
      const token = await db
        .insert(schema.verificationTokens)
        .values({
          userId,
          tokenHash,
          type: 'email_verification',
          expiresAt: new Date(Date.now() + 30 * 60 * 1000),
        })
        .returning();

      const tokenId = token[0].id;

      // Consume token
      const consumedAt = new Date();
      await db.update(schema.verificationTokens).set({ consumedAt }).where(eq(schema.verificationTokens.id, tokenId));

      const consumedToken = await db.query.verificationTokens.findFirst({
        where: eq(schema.verificationTokens.id, tokenId),
      });

      expect(consumedToken?.consumedAt).toBeTruthy();
    });

    it('should not allow expired token', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        isGlobalAdmin: false,
      });

      const tokenHash = await bcrypt.hash('plain-token', 10);
      const expiredDate = new Date(Date.now() - 1000); // 1 second ago

      await db.insert(schema.verificationTokens).values({
        userId,
        tokenHash,
        type: 'email_verification',
        expiresAt: expiredDate,
      });

      // Query for valid tokens (not expired, not consumed)
      const validToken = await db.query.verificationTokens.findFirst({
        where: and(
          eq(schema.verificationTokens.userId, userId),
          eq(schema.verificationTokens.type, 'email_verification'),
          gte(schema.verificationTokens.expiresAt, new Date())
        ),
      });

      expect(validToken).toBeUndefined();
    });
  });

  describe('Password Reset Flow', () => {
    it('should create password reset token', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('oldPassword', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        accountStatus: 'active',
        isGlobalAdmin: false,
      });

      // Create password reset token
      const tokenHash = await bcrypt.hash('reset-token-123', 10);
      const expiresAt = new Date(Date.now() + 30 * 60 * 1000);

      const tokens = await db
        .insert(schema.verificationTokens)
        .values({
          userId,
          tokenHash,
          type: 'password_reset',
          expiresAt,
        })
        .returning();

      expect(tokens).toHaveLength(1);
      expect(tokens[0].type).toBe('password_reset');
    });

    it('should update password and consume token', async () => {
      const userId = uuidv4();
      const oldPasswordHash = await bcrypt.hash('oldPassword', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash: oldPasswordHash,
        accountStatus: 'active',
        isGlobalAdmin: false,
      });

      const tokenHash = await bcrypt.hash('reset-token', 10);
      const token = await db
        .insert(schema.verificationTokens)
        .values({
          userId,
          tokenHash,
          type: 'password_reset',
          expiresAt: new Date(Date.now() + 30 * 60 * 1000),
        })
        .returning();

      // Update password
      const newPasswordHash = await bcrypt.hash('newPassword123', 10);
      await db.update(schema.users).set({ passwordHash: newPasswordHash }).where(eq(schema.users.id, userId));

      // Consume token
      await db
        .update(schema.verificationTokens)
        .set({ consumedAt: new Date() })
        .where(eq(schema.verificationTokens.id, token[0].id));

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      // Verify new password works
      const isValid = await bcrypt.compare('newPassword123', user?.passwordHash || '');
      expect(isValid).toBe(true);

      // Verify old password no longer works
      const isOldValid = await bcrypt.compare('oldPassword', user?.passwordHash || '');
      expect(isOldValid).toBe(false);
    });

    it('should allow multiple password reset tokens', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        isGlobalAdmin: false,
      });

      // Create multiple tokens (e.g., user requested reset multiple times)
      const tokenHash1 = await bcrypt.hash('token1', 10);
      const tokenHash2 = await bcrypt.hash('token2', 10);

      await db.insert(schema.verificationTokens).values([
        {
          userId,
          tokenHash: tokenHash1,
          type: 'password_reset',
          expiresAt: new Date(Date.now() + 30 * 60 * 1000),
        },
        {
          userId,
          tokenHash: tokenHash2,
          type: 'password_reset',
          expiresAt: new Date(Date.now() + 30 * 60 * 1000),
        },
      ]);

      const tokens = await db.query.verificationTokens.findMany({
        where: and(eq(schema.verificationTokens.userId, userId), eq(schema.verificationTokens.type, 'password_reset')),
      });

      expect(tokens).toHaveLength(2);
    });
  });

  describe('OAuth Account Linking', () => {
    it('should create OAuth account for Google provider', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        name: 'User Name',
        accountStatus: 'active',
        emailVerifiedAt: new Date(), // OAuth auto-verifies
        isGlobalAdmin: false,
      });

      // Link Google OAuth account
      const oauthAccounts = await db
        .insert(schema.oauthAccounts)
        .values({
          userId,
          provider: 'google',
          providerUserId: 'google-user-id-123',
          providerEmail: 'user@example.com',
        })
        .returning();

      expect(oauthAccounts).toHaveLength(1);
      expect(oauthAccounts[0].provider).toBe('google');
      expect(oauthAccounts[0].providerUserId).toBe('google-user-id-123');
    });

    it('should prevent duplicate OAuth account linking', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        isGlobalAdmin: false,
      });

      await db.insert(schema.oauthAccounts).values({
        userId,
        provider: 'google',
        providerUserId: 'google-id-123',
      });

      // Try to link same OAuth account again
      await expect(async () => {
        await db.insert(schema.oauthAccounts).values({
          userId,
          provider: 'google',
          providerUserId: 'google-id-123',
        });
      }).rejects.toThrow();
    });

    it('should find user by OAuth provider', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        isGlobalAdmin: false,
      });

      await db.insert(schema.oauthAccounts).values({
        userId,
        provider: 'google',
        providerUserId: 'google-id-123',
      });

      // Find user by OAuth
      const oauthAccount = await db.query.oauthAccounts.findFirst({
        where: and(
          eq(schema.oauthAccounts.provider, 'google'),
          eq(schema.oauthAccounts.providerUserId, 'google-id-123')
        ),
      });

      expect(oauthAccount?.userId).toBe(userId);
    });

    it('should cascade delete OAuth accounts when user is deleted', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        isGlobalAdmin: false,
      });

      await db.insert(schema.oauthAccounts).values({
        userId,
        provider: 'google',
        providerUserId: 'google-id-123',
      });

      // Delete user
      await db.delete(schema.users).where(eq(schema.users.id, userId));

      // OAuth account should be gone
      const oauthAccount = await db.query.oauthAccounts.findFirst({
        where: eq(schema.oauthAccounts.userId, userId),
      });

      expect(oauthAccount).toBeUndefined();
    });
  });

  describe('Account Status Management', () => {
    it('should transition from pending_verification to active', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password', 10);

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        accountStatus: 'pending_verification',
        isGlobalAdmin: false,
      });

      // Activate account
      await db
        .update(schema.users)
        .set({
          accountStatus: 'active',
          emailVerifiedAt: new Date(),
        })
        .where(eq(schema.users.id, userId));

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.accountStatus).toBe('active');
    });

    it('should support disabled account status', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        accountStatus: 'active',
        isGlobalAdmin: false,
      });

      // Disable account
      await db.update(schema.users).set({ accountStatus: 'disabled' }).where(eq(schema.users.id, userId));

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.accountStatus).toBe('disabled');
    });
  });

  describe('Complete Authentication Scenarios', () => {
    it('should complete full signup → verification → login flow', async () => {
      const userId = uuidv4();
      const email = 'newuser@example.com';
      const plainPassword = 'SecurePass123!';
      const passwordHash = await bcrypt.hash(plainPassword, 10);

      // Step 1: User signs up
      await db.insert(schema.users).values({
        id: userId,
        email: email.toLowerCase(),
        name: 'New User',
        passwordHash,
        accountStatus: 'pending_verification',
        isGlobalAdmin: false,
      });

      let user = await db.query.users.findFirst({
        where: eq(schema.users.email, email.toLowerCase()),
      });

      expect(user?.accountStatus).toBe('pending_verification');

      // Step 2: Verification token created
      const tokenHash = await bcrypt.hash('verification-token', 10);
      await db.insert(schema.verificationTokens).values({
        userId,
        tokenHash,
        type: 'email_verification',
        expiresAt: new Date(Date.now() + 30 * 60 * 1000),
      });

      // Step 3: User verifies email
      await db
        .update(schema.users)
        .set({
          accountStatus: 'active',
          emailVerifiedAt: new Date(),
        })
        .where(eq(schema.users.id, userId));

      user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.accountStatus).toBe('active');
      expect(user?.emailVerifiedAt).toBeTruthy();

      // Step 4: User can now login (password verification)
      const isPasswordValid = await bcrypt.compare(plainPassword, user?.passwordHash || '');
      expect(isPasswordValid).toBe(true);
    });

    it('should handle user with both password and OAuth', async () => {
      const userId = uuidv4();
      const passwordHash = await bcrypt.hash('password123', 10);

      // Create user with password
      await db.insert(schema.users).values({
        id: userId,
        email: 'user@example.com',
        passwordHash,
        accountStatus: 'active',
        isGlobalAdmin: false,
      });

      // Later link Google OAuth
      await db.insert(schema.oauthAccounts).values({
        userId,
        provider: 'google',
        providerUserId: 'google-123',
      });

      const user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      const oauthAccount = await db.query.oauthAccounts.findFirst({
        where: eq(schema.oauthAccounts.userId, userId),
      });

      // User can authenticate with both methods
      expect(user?.passwordHash).toBeTruthy();
      expect(oauthAccount?.provider).toBe('google');
    });

    it('should handle password reset for OAuth-only user', async () => {
      const userId = uuidv4();

      // OAuth user without password
      await db.insert(schema.users).values({
        id: userId,
        email: 'oauth-user@example.com',
        accountStatus: 'active',
        emailVerifiedAt: new Date(),
        isGlobalAdmin: false,
      });

      await db.insert(schema.oauthAccounts).values({
        userId,
        provider: 'google',
        providerUserId: 'google-id',
      });

      let user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.passwordHash).toBeNull();

      // User requests password (to enable password login)
      const newPasswordHash = await bcrypt.hash('NewPassword123', 10);
      await db.update(schema.users).set({ passwordHash: newPasswordHash }).where(eq(schema.users.id, userId));

      user = await db.query.users.findFirst({
        where: eq(schema.users.id, userId),
      });

      expect(user?.passwordHash).toBeTruthy();

      // Now user can login with both OAuth and password
      const isPasswordValid = await bcrypt.compare('NewPassword123', user?.passwordHash || '');
      expect(isPasswordValid).toBe(true);
    });
  });
});
