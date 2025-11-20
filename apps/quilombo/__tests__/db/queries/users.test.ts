/**
 * Unit tests for user query functions
 * Tests database operations with mocked db instance
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import type * as schema from '@/db/schema';

// Mock the database before importing the queries
vi.mock('@/db', () => ({
  db: {
    query: {
      users: {
        findFirst: vi.fn(),
        findMany: vi.fn(),
      },
    },
    select: vi.fn(),
    insert: vi.fn(),
    update: vi.fn(),
  },
}));

describe('User Queries', () => {
  let isGlobalAdmin: (userId: string) => Promise<boolean | undefined>;
  let searchUsers: (options: any) => Promise<{ rows: schema.SelectUser[]; totalCount: number }>;
  let fetchSessionData: (walletAddress: string) => Promise<any | undefined>;
  let fetchUser: (userId: string) => Promise<schema.SelectUser | undefined>;
  let insertUser: (userValues: schema.InsertUser) => Promise<any>;
  let updateUser: (user: any) => Promise<any>;
  let searchUsersByAddresses: (addresses: string[]) => Promise<any[]>;

  let mockDb: any;

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mock after resetting
    const dbModule = await import('@/db');
    mockDb = dbModule.db;

    // Import functions after mocking
    const queriesModule = await import('@/db/queries/users');
    isGlobalAdmin = queriesModule.isGlobalAdmin;
    searchUsers = queriesModule.searchUsers;
    fetchSessionData = queriesModule.fetchSessionData;
    fetchUser = queriesModule.fetchUser;
    insertUser = queriesModule.insertUser;
    updateUser = queriesModule.updateUser;
    searchUsersByAddresses = queriesModule.searchUsersByAddresses;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('isGlobalAdmin', () => {
    it('should return true for global admin', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({ isGlobalAdmin: true });

      const result = await isGlobalAdmin('user-123');

      expect(result).toBe(true);
      expect(mockDb.query.users.findFirst).toHaveBeenCalled();
    });

    it('should return false for non-admin user', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({ isGlobalAdmin: false });

      const result = await isGlobalAdmin('user-123');

      expect(result).toBe(false);
    });

    it('should return undefined for non-existent user', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const result = await isGlobalAdmin('non-existent');

      expect(result).toBeUndefined();
    });
  });

  describe('searchUsers', () => {
    const mockUsers = [
      {
        record: {
          id: 'user-1',
          email: 'user1@example.com',
          name: 'User One',
          nickname: 'user1',
          groupId: 'group-1',
        },
        groupName: 'Test Group',
        count: 2,
      },
      {
        record: {
          id: 'user-2',
          email: 'user2@example.com',
          name: 'User Two',
          nickname: 'user2',
          groupId: null,
        },
        groupName: null,
        count: 2,
      },
    ];

    beforeEach(() => {
      // Setup chain mocking for query builder
      const mockChain = {
        from: vi.fn().mockReturnThis(),
        leftJoin: vi.fn().mockReturnThis(),
        where: vi.fn().mockReturnThis(),
        limit: vi.fn().mockReturnThis(),
        offset: vi.fn().mockResolvedValue(mockUsers),
      };
      mockDb.select = vi.fn().mockReturnValue(mockChain);
    });

    it('should return users with pagination', async () => {
      const result = await searchUsers({ pageSize: 10, offset: 0 });

      expect(result.rows).toHaveLength(2);
      expect(result.totalCount).toBe(2);
      expect(result.rows[0]).toHaveProperty('id', 'user-1');
      expect(result.rows[0]).toHaveProperty('groupName', 'Test Group');
    });

    it('should handle empty results', async () => {
      const mockChain = {
        from: vi.fn().mockReturnThis(),
        leftJoin: vi.fn().mockReturnThis(),
        where: vi.fn().mockReturnThis(),
        limit: vi.fn().mockReturnThis(),
        offset: vi.fn().mockResolvedValue([]),
      };
      mockDb.select = vi.fn().mockReturnValue(mockChain);

      const result = await searchUsers({ pageSize: 10, offset: 0 });

      expect(result.rows).toHaveLength(0);
      expect(result.totalCount).toBe(0);
    });

    it('should apply search term filter', async () => {
      await searchUsers({
        searchTerm: 'john',
        pageSize: 10,
        offset: 0,
      });

      expect(mockDb.select).toHaveBeenCalled();
    });

    it('should apply wallet filter', async () => {
      await searchUsers({
        filters: { hasWallet: true },
        pageSize: 10,
        offset: 0,
      });

      expect(mockDb.select).toHaveBeenCalled();
    });

    it('should apply titles filter', async () => {
      await searchUsers({
        filters: { titles: ['professor', 'mestre'] },
        pageSize: 10,
        offset: 0,
      });

      expect(mockDb.select).toHaveBeenCalled();
    });

    it('should handle users without group names', async () => {
      const result = await searchUsers({ pageSize: 10, offset: 0 });

      expect(result.rows[1].groupName).toBeUndefined();
    });
  });

  describe('fetchSessionData', () => {
    it('should return session data for valid wallet', async () => {
      const mockSession = {
        id: 'user-123',
        walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
        isGlobalAdmin: true,
      };
      mockDb.query.users.findFirst.mockResolvedValue(mockSession);

      const result = await fetchSessionData('0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC');

      expect(result).toEqual(mockSession);
      expect(mockDb.query.users.findFirst).toHaveBeenCalledWith({
        where: expect.any(Function),
        columns: { id: true, walletAddress: true, isGlobalAdmin: true },
      });
    });

    it('should return undefined for empty wallet address', async () => {
      const result = await fetchSessionData('');

      expect(result).toBeUndefined();
      expect(mockDb.query.users.findFirst).not.toHaveBeenCalled();
    });

    it('should return undefined for non-existent wallet', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const result = await fetchSessionData('0xNonExistent');

      // Drizzle returns null for not found, not undefined
      expect(result).toBeNull();
    });
  });

  describe('fetchUser', () => {
    it('should return user by ID', async () => {
      const mockUser = {
        id: 'user-123',
        email: 'user@example.com',
        name: 'Test User',
      };
      mockDb.query.users.findFirst.mockResolvedValue(mockUser);

      const result = await fetchUser('user-123');

      expect(result).toEqual(mockUser);
      expect(mockDb.query.users.findFirst).toHaveBeenCalledWith({
        where: expect.any(Function),
      });
    });

    it('should return undefined for non-existent user', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const result = await fetchUser('non-existent');

      // Drizzle returns null for not found, not undefined
      expect(result).toBeNull();
    });
  });

  describe('insertUser', () => {
    it('should insert new user', async () => {
      const newUser = {
        id: 'new-user',
        email: 'newuser@example.com',
        name: 'New User',
        isGlobalAdmin: false,
      };

      const mockChain = {
        values: vi.fn().mockReturnThis(),
        returning: vi.fn().mockResolvedValue([newUser]),
      };
      mockDb.insert = vi.fn().mockReturnValue(mockChain);

      const result = await insertUser(newUser);

      expect(result).toEqual(newUser);
      expect(mockDb.insert).toHaveBeenCalled();
      expect(mockChain.values).toHaveBeenCalledWith(newUser);
      expect(mockChain.returning).toHaveBeenCalled();
    });
  });

  describe('updateUser', () => {
    it('should update existing user', async () => {
      const updatedUser = {
        id: 'user-123',
        name: 'Updated Name',
        email: 'updated@example.com',
      };

      const mockChain = {
        set: vi.fn().mockReturnThis(),
        where: vi.fn().mockReturnThis(),
        returning: vi.fn().mockResolvedValue([updatedUser]),
      };
      mockDb.update = vi.fn().mockReturnValue(mockChain);

      const result = await updateUser(updatedUser);

      expect(result).toEqual(updatedUser);
      expect(mockDb.update).toHaveBeenCalled();
      expect(mockChain.set).toHaveBeenCalledWith(updatedUser);
    });

    it('should return undefined when user not found', async () => {
      const mockChain = {
        set: vi.fn().mockReturnThis(),
        where: vi.fn().mockReturnThis(),
        returning: vi.fn().mockResolvedValue([]),
      };
      mockDb.update = vi.fn().mockReturnValue(mockChain);

      const result = await updateUser({ id: 'non-existent' });

      expect(result).toBeUndefined();
    });
  });

  describe('searchUsersByAddresses', () => {
    it('should find users by wallet addresses', async () => {
      const mockUsers = [
        {
          id: 'user-1',
          walletAddress: '0x111',
          name: 'User 1',
        },
        {
          id: 'user-2',
          walletAddress: '0x222',
          name: 'User 2',
        },
      ];
      mockDb.query.users.findMany.mockResolvedValue(mockUsers);

      const result = await searchUsersByAddresses(['0x111', '0x222']);

      expect(result).toEqual(mockUsers);
      expect(mockDb.query.users.findMany).toHaveBeenCalledWith({
        where: expect.any(Function),
        orderBy: expect.any(Function),
      });
    });

    it('should return empty array for no matches', async () => {
      mockDb.query.users.findMany.mockResolvedValue([]);

      const result = await searchUsersByAddresses(['0xNonExistent']);

      expect(result).toEqual([]);
    });

    it('should handle empty address array', async () => {
      mockDb.query.users.findMany.mockResolvedValue([]);

      const result = await searchUsersByAddresses([]);

      expect(result).toEqual([]);
    });
  });
});
