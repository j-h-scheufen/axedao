import { isUndefined, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import type { UpdateGroupForm } from '@/config/validation-schema';
import { updateGroupSchema } from '@/config/validation-schema';
import { deleteGroup, fetchGroup, fetchGroupAdminIds, isGroupAdmin, updateGroup } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Returns a Group object for a given group ID.
 * It is allowed to send partial data, i.e. only the fields that need to be updated. To 'unset' a field, send it as null.
 * @param _ - The request object (not used)
 * @returns a Group or 404 if not found
 */
export async function GET(_: NextRequest, { params }: RouteParamsGroup) {
  try {
    const { groupId } = await params;
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    return NextResponse.json(group);
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Updates the group with the specified ID.
 * @param request - UpdateGroupForm
 * @param groupId - PATH parameter. The id of the group
 * @returns the updated Group or 404 if not found
 */
export async function PATCH(request: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = await params;

  // Check if group exists
  const group = await fetchGroup(groupId);
  if (!group) return notFound();

  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  if (!isAdmin)
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can update a group' },
      {
        status: 401,
      }
    );

  const body = await request.json();
  const isValid = await updateGroupSchema.validate(body);
  if (!isValid) {
    return Response.json(
      { error: true, message: 'Invalid profile data' },
      {
        status: 400,
      }
    );
  }

  try {
    const groupData = body as Omit<UpdateGroupForm, 'id' | 'logo' | 'banner'>;
    const cleanedGroupData = omitBy(groupData, isUndefined);

    const updatedGroup = await updateGroup({ ...cleanedGroupData, id: groupId });
    return Response.json(updatedGroup);
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while updating the group') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Deletes the group with the specified ID.
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns 204 if successful, 404 if not found
 */
export async function DELETE(_: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = await params;
    const group = await fetchGroup(groupId);
    if (!group) notFound();

    const adminIds = await fetchGroupAdminIds(groupId);

    if (!adminIds.some((id) => id === session.user.id)) {
      return Response.json(
        { error: true, message: 'Unauthorized to delete the group. Missing admin privileges.' },
        {
          status: 403,
        }
      );
    }

    await deleteGroup(groupId);

    return new NextResponse(null, { status: 204 });
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while deleting group') },
      {
        status: 500,
      }
    );
  }
}
