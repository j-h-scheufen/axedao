import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

import { nextAuthOptions } from '@/config/next-auth-options';
import { type CreateNewGroupForm, createNewGroupFormSchema } from '@/config/validation-schema';
import { insertGroup } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * @openapi
 * /api/admin/groups:
 *   post:
 *     summary: Create a new unmanaged group (admin only)
 *     description: Creates a new group without assigning any admins. Only accessible to global admins. Used for creating groups on behalf of organizations without user accounts.
 *     tags:
 *       - Admin
 *       - Groups
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *             properties:
 *               name:
 *                 type: string
 *                 description: Group name
 *               description:
 *                 type: string
 *                 description: Group description
 *               style:
 *                 type: string
 *                 enum: [Angola, Regional, Contemporânea]
 *               email:
 *                 type: string
 *                 format: email
 *               founder:
 *                 type: string
 *               links:
 *                 type: array
 *                 items:
 *                   type: object
 *                   properties:
 *                     type:
 *                       type: string
 *                     url:
 *                       type: string
 *     responses:
 *       200:
 *         description: Successfully created unmanaged group
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               description: The created group
 *       400:
 *         description: Invalid group data
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized - user not logged in
 *       403:
 *         description: Forbidden - user is not a global admin
 *       500:
 *         description: Server error
 */
export async function POST(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  if (!session.user.isGlobalAdmin) {
    return NextResponse.json({ error: 'Forbidden. Only global admins can create unmanaged groups' }, { status: 403 });
  }

  try {
    const body = await request.json();
    const isValid = await createNewGroupFormSchema.validate(body);
    if (!isValid) {
      return NextResponse.json({ error: 'Invalid group data' }, { status: 400 });
    }
    const groupData = body as CreateNewGroupForm;

    const newGroupId = uuidv4();
    const group = await insertGroup({
      ...groupData,
      id: newGroupId,
      // Leave createdBy, claimedBy, and claimedAt as null to mark as unmanaged
      createdBy: null,
      claimedBy: null,
    });

    if (!group) throw Error('Unable to create the group');

    // Do NOT assign the creator as admin or member - group remains unmanaged

    return NextResponse.json(group);
  } catch (error) {
    console.error('Error creating unmanaged group', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating group') },
      {
        status: 500,
      }
    );
  }
}
