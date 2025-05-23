import { type NextRequest, NextResponse } from 'next/server';

import { fetchGroup, fetchGroupAdminIds } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Returns the admin IDs of the specified group.
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns the admin IDs of the group as string[]
 */
export async function GET(_: NextRequest, { params }: RouteParamsGroup) {
  try {
    const { groupId } = await params;
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    const adminIds = await fetchGroupAdminIds(groupId);

    return NextResponse.json(adminIds);
  } catch (error) {
    console.error('Error fetching admins', error);
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group admins');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
