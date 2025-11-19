/**
 * API Route Tests: POST /api/auth/change-password
 *
 * Tests the password change endpoint with mocked authentication and database.
 * Verifies validation, authentication, current password verification, and password update workflow.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/auth/password');

describe('POST /api/auth/change-password', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let hashPassword: ReturnType<typeof vi.fn>;
  let verifyPassword: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'test-user-123';
  const currentPassword = 'OldPassword123!@#';
  const newPassword = 'NewPassword456!@#';

  const validChangeData = {
    currentPassword,
    newPassword,
    confirmPassword: newPassword,
  };

  const mockUserWithPassword = {
    id: testUserId,
    email: 'user@example.com',
    passwordHash: 'hashed-old-password',
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');
    const passwordUtils = await import('@/utils/auth/password');

    // Setup function mocks
    getServerSession = vi.fn();
    hashPassword = vi.fn();
    verifyPassword = vi.fn();

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (passwordUtils.hashPassword as typeof hashPassword) = hashPassword;
    (passwordUtils.verifyPassword as typeof verifyPassword) = verifyPassword;

    // Mock database
    const mockUpdateResult = vi.fn().mockResolvedValue([{ id: testUserId }]);

    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUserWithPassword),
        },
      },
      update: vi.fn().mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: vi.fn().mockReturnValue({
            returning: mockUpdateResult,
          }),
        }),
      }),
    };

    (dbModule as any).db = mockDb;

    // Default mocks for successful flow
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });
    hashPassword.mockResolvedValue('hashed-new-password');
    verifyPassword.mockResolvedValue(true); // Current password is correct

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/auth/change-password/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when current password is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: { newPassword, confirmPassword: newPassword },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Current password is required' });
    });

    it('should return 400 when new password is too weak', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: { currentPassword, newPassword: 'weak', confirmPassword: 'weak' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Password must be at least 12 characters' });
    });

    it('should return 400 when passwords do not match', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: { currentPassword, newPassword, confirmPassword: 'DifferentPass123!@#' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Passwords must match' });
    });

    it('should return 400 when new password equals current password', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: { currentPassword, newPassword: currentPassword, confirmPassword: currentPassword },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'New password must be different from current password' });
    });
  });

  describe('User Validation', () => {
    it('should return 404 when user not found', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User not found' });
    });
  });

  describe('Current Password Verification', () => {
    it('should return 400 when current password is incorrect', async () => {
      verifyPassword.mockResolvedValue(false);

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Current password is incorrect' });
      expect(verifyPassword).toHaveBeenCalledWith(currentPassword, 'hashed-old-password');
    });

    it('should skip current password verification for users without password', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithPassword,
        passwordHash: null, // OAuth/wallet user
      });

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(verifyPassword).not.toHaveBeenCalled();
    });
  });

  describe('Successful Password Change', () => {
    it('should return 200 with success message', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Password changed successfully' });
    });

    it('should hash new password before storing', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      await POST(request);

      expect(hashPassword).toHaveBeenCalledWith(newPassword);
    });

    it('should update user password in database', async () => {
      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      await POST(request);

      expect(mockDb.update).toHaveBeenCalled();
      const setCall = mockDb.update.mock.results[0].value.set;
      expect(setCall).toHaveBeenCalledWith({ passwordHash: 'hashed-new-password' });
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when password update fails', async () => {
      mockDb.update.mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: vi.fn().mockReturnValue({
            returning: vi.fn().mockResolvedValue([]), // Empty result
          }),
        }),
      });

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Failed to update password' });
    });

    it('should return 500 when database throws error', async () => {
      mockDb.update.mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: vi.fn().mockReturnValue({
            returning: vi.fn().mockRejectedValue(new Error('Database error')),
          }),
        }),
      });

      const request = createMockRequest('http://localhost/api/auth/change-password', {
        method: 'POST',
        body: validChangeData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'An error occurred while changing password' });
    });
  });
});
