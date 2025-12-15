/**
 * API Route Tests: GET /api/groups/[groupId]/members
 *
 * Tests group member listing operations.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');

describe('Group Members API Routes', () => {
  const testGroupId = 'group-123';
  const testMemberId = 'member-456';

  const mockMembers = [
    {
      id: testMemberId,
      email: 'member@example.com',
      name: 'Member User',
      nickname: 'Member',
      title: null,
      phone: null,
      avatar: null,
      groupId: testGroupId,
      links: [],
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    },
    {
      id: 'member-789',
      email: 'member2@example.com',
      name: 'Member User 2',
      nickname: 'Member2',
      title: null,
      phone: null,
      avatar: null,
      groupId: testGroupId,
      links: [],
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    },
  ];

  describe('GET /api/groups/[groupId]/members', () => {
    let GET: (request: Request, context: { params: Promise<{ groupId: string }> }) => Promise<Response>;
    let mockDb: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const dbModule = await import('@/db');

      // Mock database functions
      mockDb = {
        fetchPublicGroupMembers: vi.fn().mockResolvedValue(mockMembers),
      };

      (dbModule.fetchPublicGroupMembers as typeof mockDb.fetchPublicGroupMembers) = mockDb.fetchPublicGroupMembers;

      const routeModule = await import('@/app/api/groups/[groupId]/members/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Successful Retrieval', () => {
      it('should return list of group members', async () => {
        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.fetchPublicGroupMembers).toHaveBeenCalledWith(testGroupId);
        expect(body).toHaveLength(2);
        expect(body[0]).toEqual(
          expect.objectContaining({
            id: testMemberId,
            email: 'member@example.com',
            groupId: testGroupId,
          })
        );
      });

      it('should return empty array when no members', async () => {
        mockDb.fetchPublicGroupMembers.mockResolvedValue([]);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual([]);
      });

      it('should handle different group IDs', async () => {
        const differentGroupId = 'group-999';

        const request = new Request(`http://localhost/api/groups/${differentGroupId}/members`, {
          method: 'GET',
        });

        await GET(request, { params: Promise.resolve({ groupId: differentGroupId }) });

        expect(mockDb.fetchPublicGroupMembers).toHaveBeenCalledWith(differentGroupId);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.fetchPublicGroupMembers.mockRejectedValue(new Error('Database error'));

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });
});
