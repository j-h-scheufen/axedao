/**
 * @openapi
 * /api/genealogy/groups/{groupId}/claimable:
 *   get:
 *     summary: Check if a genealogy group profile can be admin-claimed
 *     description: |
 *       Returns whether the genealogy group profile can be admin-claimed.
 *       A group is admin-claimable if there's no corresponding entry in public.groups
 *       (i.e., no one has claimed admin rights yet).
 *
 *       Note: This is different from whether users can declare membership.
 *       Historical/inactive groups (isActive=false) shouldn't allow membership
 *       declarations but may still be admin-claimable.
 *     tags:
 *       - Genealogy
 *       - Groups
 *     parameters:
 *       - name: groupId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *         description: The genealogy group profile ID
 *     responses:
 *       200:
 *         description: Admin claimability status
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 isClaimable:
 *                   type: boolean
 *                   description: Whether admin rights can be claimed for this group
 *       400:
 *         description: Missing group ID
 *       500:
 *         description: Server error
 */

import { NextResponse } from 'next/server';

import { isGroupAdminClaimable } from '@/db';

type RouteParams = {
  params: Promise<{ groupId: string }>;
};

export async function GET(_request: Request, { params }: RouteParams) {
  try {
    const { groupId } = await params;

    if (!groupId) {
      return NextResponse.json({ error: 'Group ID is required' }, { status: 400 });
    }

    const isClaimable = await isGroupAdminClaimable(groupId);

    return NextResponse.json({ isClaimable });
  } catch (error) {
    console.error('Error checking group admin claimability:', error);
    return NextResponse.json({ error: 'Failed to check claimability' }, { status: 500 });
  }
}
