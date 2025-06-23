import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { updateLocationFormSchema } from '@/config/validation-schema';
import { deleteGroupLocation, isGroupAdmin, isLocationInGroup, updateGroupLocation } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroupAndLocation } from '@/types/routes';

/**
 * Updates an existing location of the specified group
 * @param request - UpdateLocationForm
 * @param groupId - PATH parameter. The id of the group
 * @param locationId - PATH parameter. The id of the location to update
 * @returns the updated GroupLocation
 */
export async function PATCH(request: NextRequest, { params }: RouteParamsGroupAndLocation) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId, locationId } = await params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  if (!isAdmin) {
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can update locations' },
      {
        status: 403,
      }
    );
  }

  // Verify that the location belongs to the group
  const isLocationInGroupResult = await isLocationInGroup(locationId, groupId);
  if (!isLocationInGroupResult) {
    return Response.json(
      { error: true, message: 'Location not found in the specified group' },
      {
        status: 404,
      }
    );
  }

  try {
    const body = await request.json();
    const validatedData = await updateLocationFormSchema.validate(body);

    const updatedLocation = await updateGroupLocation(locationId, validatedData);

    if (!updatedLocation) {
      return Response.json(
        { error: true, message: 'Location not found' },
        {
          status: 404,
        }
      );
    }

    return Response.json(updatedLocation);
  } catch (error) {
    console.error('Error updating group location:', error);
    const message = generateErrorMessage(error, 'An unexpected error occurred while updating the location');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}

/**
 * Deletes a location from the specified group
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @param locationId - PATH parameter. The id of the location to delete
 * @returns 204 if successful, 404 if not found
 */
export async function DELETE(_: NextRequest, { params }: RouteParamsGroupAndLocation) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId, locationId } = await params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  if (!isAdmin) {
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can delete locations' },
      {
        status: 403,
      }
    );
  }

  // Verify that the location belongs to the group
  const isLocationInGroupResult = await isLocationInGroup(locationId, groupId);
  if (!isLocationInGroupResult) {
    return Response.json(
      { error: true, message: 'Location not found in the specified group' },
      {
        status: 404,
      }
    );
  }

  try {
    await deleteGroupLocation(locationId);
    return new NextResponse(null, { status: 204 });
  } catch (error) {
    console.error('Error deleting group location:', error);
    const message = generateErrorMessage(error, 'An unexpected error occurred while deleting the location');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
