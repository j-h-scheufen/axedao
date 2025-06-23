import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { createLocationFormSchema } from '@/config/validation-schema';
import { fetchGroupLocations, insertGroupLocation, isGroupAdmin } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Returns the locations of the specified group
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns the locations of the group as GroupLocation[]
 */
export async function GET(_: NextRequest, { params }: RouteParamsGroup) {
  try {
    const { groupId } = await params;
    const locations = await fetchGroupLocations(groupId);
    return Response.json(locations);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group locations');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}

/**
 * Adds a new location to the specified group
 * @param request - CreateLocationForm
 * @param groupId - PATH parameter. The id of the group
 * @returns the updated list of group locations as GroupLocation[]
 */
export async function POST(request: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = await params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  if (!isAdmin) {
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can add locations' },
      {
        status: 403,
      }
    );
  }

  try {
    const body = await request.json();
    const validatedData = await createLocationFormSchema.validate(body);

    await insertGroupLocation({
      ...validatedData,
      groupId,
    });

    const locations = await fetchGroupLocations(groupId);
    return Response.json(locations);
  } catch (error) {
    console.error('Error creating group location:', error);
    const message = generateErrorMessage(error, 'An unexpected error occurred while creating the location');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
