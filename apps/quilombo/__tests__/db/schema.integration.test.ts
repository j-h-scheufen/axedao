/**
 * Integration tests for database schema and basic operations
 * Verifies that Testcontainers setup works and schema is correct
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';

describe('Database Schema Integration Tests', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  beforeAll(async () => {
    console.log('Starting integration tests...');
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();
  });

  describe('Users Table', () => {
    it('should insert and query users', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'test@example.com',
        nickname: 'testuser',
      });

      const users = await db.select().from(schema.users).where(eq(schema.users.id, userId));

      expect(users).toHaveLength(1);
      expect(users[0].email).toBe('test@example.com');
      expect(users[0].nickname).toBe('testuser');
    });
  });

  describe('Groups Table', () => {
    it('should insert and query groups', async () => {
      const groupId = uuidv4();

      await db.insert(schema.groups).values({
        id: groupId,
        name: 'Test Group',
        description: 'A test group',
        createdAt: new Date(),
      });

      const groups = await db.select().from(schema.groups).where(eq(schema.groups.id, groupId));

      expect(groups).toHaveLength(1);
      expect(groups[0].name).toBe('Test Group');
      expect(groups[0].description).toBe('A test group');
    });
  });

  describe('Foreign Key Constraints', () => {
    it('should enforce group_admins foreign keys', async () => {
      const nonExistentGroupId = uuidv4();
      const nonExistentUserId = uuidv4();

      // Should fail - group doesn't exist
      await expect(
        db.insert(schema.groupAdmins).values({
          userId: nonExistentUserId,
          groupId: nonExistentGroupId,
        })
      ).rejects.toThrow();
    });
  });
});
