/**
 * API Route Testing Utilities
 *
 * Helper functions for testing Next.js App Router API routes with mocked authentication.
 */

import { NextRequest } from 'next/server';
import { vi } from 'vitest';
import type { Session } from 'next-auth';

/**
 * Mock next-auth session for authenticated API requests
 *
 * @param userId - User ID to include in session
 * @param isGlobalAdmin - Whether user should be global admin (default: false)
 * @returns Mock session object
 */
export function mockAuthSession(userId: string, isGlobalAdmin = false): Session {
  return {
    user: {
      id: userId,
      email: `${userId}@example.com`,
      isGlobalAdmin,
    },
    expires: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(), // 24 hours from now
  };
}

/**
 * Mock getServerSession to return authenticated session
 *
 * @param userId - User ID for session
 * @param isGlobalAdmin - Whether user is global admin
 */
export function mockAuthenticatedSession(userId: string, isGlobalAdmin = false) {
  vi.doMock('next-auth', () => ({
    getServerSession: vi.fn().mockResolvedValue(mockAuthSession(userId, isGlobalAdmin)),
  }));
}

/**
 * Mock getServerSession to return null (unauthenticated)
 */
export function mockUnauthenticatedSession() {
  vi.doMock('next-auth', () => ({
    getServerSession: vi.fn().mockResolvedValue(null),
  }));
}

/**
 * Create a mock NextRequest for API route testing
 *
 * @param url - Request URL
 * @param options - Request options (method, body, headers)
 * @returns Mock NextRequest with proper json() method
 */
export function createMockRequest(
  url: string,
  options?: {
    method?: string;
    body?: unknown;
    headers?: Record<string, string>;
  }
): NextRequest {
  const method = options?.method || 'GET';
  const headers = new Headers(options?.headers || {});
  const bodyData = options?.body;

  if (bodyData) {
    headers.set('Content-Type', 'application/json');
  }

  const request = new NextRequest(url, {
    method,
    headers,
    body: bodyData ? JSON.stringify(bodyData) : undefined,
  });

  // Override the json() method to return our body data
  (request as any).json = async () => bodyData || {};

  return request;
}

/**
 * Extract JSON response from NextResponse
 *
 * @param response - NextResponse from route handler
 * @returns Parsed JSON body
 */
export async function getResponseJson(response: Response): Promise<unknown> {
  return response.json();
}

/**
 * Create mock route params for dynamic routes
 *
 * @param params - Route parameters
 * @returns Promise that resolves to params (Next.js 15 async params)
 */
export function createMockParams<T extends Record<string, string>>(params: T): Promise<T> {
  return Promise.resolve(params);
}
