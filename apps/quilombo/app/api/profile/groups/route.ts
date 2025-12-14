/**
 * API Route: GET /api/profile/groups
 *
 * Returns the current user's group associations:
 * - adminGroups: Groups where the user is an admin
 * - memberGroups: Groups where the user has a member_of genealogy relationship
 *
 * @openapi
 * /api/profile/groups:
 *   get:
 *     summary: Get current user's group associations
 *     tags: [Profile, Groups]
 *     security:
 *       - session: []
 *     responses:
 *       200:
 *         description: User's group associations
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 adminGroups:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Group'
 *                 memberGroups:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Group'
 *       401:
 *         description: Unauthorized - not logged in
 */

import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchGroupsWhereUserIsAdmin, fetchGroupMembershipsForUser } from '@/db';

export async function GET() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const [adminGroups, memberGroups] = await Promise.all([
    fetchGroupsWhereUserIsAdmin(session.user.id),
    fetchGroupMembershipsForUser(session.user.id),
  ]);

  return NextResponse.json({ adminGroups, memberGroups });
}
