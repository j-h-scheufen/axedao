import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { genealogyGroupProfileUpdateSchema } from '@/config/validation-schema';
import {
  fetchGroupProfile,
  fetchStatementsByEntity,
  updateGroupProfile,
  canUserManageGenealogyGroupProfile,
} from '@/db';
import { generateErrorMessage } from '@/utils';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/genealogy/groups/{groupId}:
 *   get:
 *     summary: Get a group profile by ID
 *     description: Retrieves a single group profile from the genealogy schema with optional relationships
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: groupId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The group profile ID
 *       - in: query
 *         name: includeRelationships
 *         required: false
 *         schema:
 *           type: boolean
 *         description: Whether to include relationships (statements) for this group
 *     responses:
 *       200:
 *         description: Group profile found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   $ref: '#/components/schemas/GroupProfile'
 *                 relationships:
 *                   type: object
 *                   properties:
 *                     outgoing:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *                     incoming:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *       404:
 *         description: Group profile not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       429:
 *         description: Too many requests - rate limit exceeded
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                 retryAfter:
 *                   type: number
 *       500:
 *         description: Server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */
export async function GET(request: NextRequest, { params }: { params: Promise<{ groupId: string }> }) {
  // Rate limit: 60 requests per minute
  const RATE_LIMIT_MAX = 60;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const { groupId } = await params;
    const { searchParams } = new URL(request.url);
    const includeRelationships = searchParams.get('includeRelationships') === 'true';

    const group = await fetchGroupProfile(groupId);

    if (!group) {
      return NextResponse.json({ error: 'Group profile not found' }, { status: 404 });
    }

    const headers = createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX);

    if (includeRelationships) {
      const relationships = await fetchStatementsByEntity('group', groupId);
      return Response.json({ data: group, relationships }, { headers });
    }

    return Response.json({ data: group }, { headers });
  } catch (error) {
    console.error('Error fetching group profile:', error);
    return NextResponse.json({ error: 'Failed to fetch group profile' }, { status: 500 });
  }
}

/**
 * @openapi
 * /api/genealogy/groups/{groupId}:
 *   patch:
 *     summary: Update a group profile
 *     description: |
 *       Updates a genealogy group profile.
 *       Requires authentication. User must be an admin of the public.groups entry
 *       that references this genealogy profile.
 *     tags:
 *       - Genealogy
 *     security:
 *       - session: []
 *     parameters:
 *       - in: path
 *         name: groupId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The genealogy group profile ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 minLength: 2
 *               style:
 *                 type: string
 *                 enum: [angola, regional, contemporanea, mixed]
 *                 nullable: true
 *               logo:
 *                 type: string
 *                 nullable: true
 *               publicLinks:
 *                 type: array
 *                 items:
 *                   type: string
 *                   format: uri
 *                 description: Public references (Wikipedia, articles, etc.)
 *               descriptionEn:
 *                 type: string
 *                 maxLength: 2000
 *                 nullable: true
 *               descriptionPt:
 *                 type: string
 *                 maxLength: 2000
 *                 nullable: true
 *               philosophyEn:
 *                 type: string
 *                 maxLength: 5000
 *                 nullable: true
 *               philosophyPt:
 *                 type: string
 *                 maxLength: 5000
 *                 nullable: true
 *               historyEn:
 *                 type: string
 *                 maxLength: 10000
 *                 nullable: true
 *               historyPt:
 *                 type: string
 *                 maxLength: 10000
 *                 nullable: true
 *               isActive:
 *                 type: boolean
 *     responses:
 *       200:
 *         description: Profile updated successfully
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/GroupProfile'
 *       400:
 *         description: Invalid input or validation error
 *       401:
 *         description: Unauthorized - user not authenticated
 *       403:
 *         description: Forbidden - user is not authorized to update this profile
 *       404:
 *         description: Group profile not found
 *       500:
 *         description: Server error
 */
export async function PATCH(request: NextRequest, { params }: { params: Promise<{ groupId: string }> }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = await params;

    // Check if profile exists
    const existingProfile = await fetchGroupProfile(groupId);
    if (!existingProfile) {
      return NextResponse.json({ error: 'Group profile not found' }, { status: 404 });
    }

    // Check authorization
    const canManage = await canUserManageGenealogyGroupProfile(groupId, session.user.id);
    if (!canManage) {
      return NextResponse.json({ error: 'You are not authorized to update this group profile' }, { status: 403 });
    }

    const body = await request.json();

    // Validate input
    try {
      await genealogyGroupProfileUpdateSchema.validate(body);
    } catch (validationError) {
      const error = validationError as { errors?: string[] };
      return NextResponse.json({ error: error.errors?.[0] || 'Validation failed' }, { status: 400 });
    }

    // Update the profile
    const updatedProfile = await updateGroupProfile(groupId, body);

    if (!updatedProfile) {
      return NextResponse.json({ error: 'Failed to update profile' }, { status: 500 });
    }

    return NextResponse.json(updatedProfile);
  } catch (error) {
    console.error('Error updating group profile:', error);
    return NextResponse.json(
      { error: generateErrorMessage(error, 'An unexpected error occurred while updating profile') },
      { status: 500 }
    );
  }
}
