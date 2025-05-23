import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES, IMAGE_FORMATS } from '@/config/constants';
import { fetchGroup, updateGroup } from '@/db';
import { generateErrorMessage } from '@/utils';
import { pinToGroup, unpin } from '@/utils/pinata';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Updates or sets the group's logo.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns The updated group or 400 or 500
 */
export async function POST(request: NextRequest, { params }: RouteParamsGroup) {
  const { groupId } = await params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const filename: string = `${FILE_PREFIXES.groupLogo}-${groupId}`;

    if (!file) {
      return NextResponse.json({ error: 'Invalid input data. No file found.' }, { status: 400 });
    }

    const { cid, error, errorStatus } = await pinToGroup(file, filename, IMAGE_FORMATS.groupLogo, group.logo);

    if (error) {
      return NextResponse.json({ error }, { status: errorStatus ?? 500 });
    }

    const updatedGroup = await updateGroup({ ...group, logo: cid });

    return NextResponse.json(updatedGroup);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while updating the group logo');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}

/**
 * Deletes the group's logo.
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns The updated group or 400 or 500
 */
export async function DELETE(_: NextRequest, { params }: RouteParamsGroup) {
  const { groupId } = await params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    if (group.logo) {
      await unpin(group.logo);
      const updatedGroup = await updateGroup({ ...group, logo: null });
      return NextResponse.json(updatedGroup);
    }

    return NextResponse.json(group);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while deleting the group logo');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
