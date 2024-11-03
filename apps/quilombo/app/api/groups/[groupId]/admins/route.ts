import { NextRequest, NextResponse } from 'next/server';

import { fetchGroup, fetchGroupAdminIds } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';

/**
 * Returns the admin IDs of the specified group.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns the admin IDs of the group as string[]
 */
export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
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
      },
    );
  }
}
