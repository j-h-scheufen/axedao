import { notFound } from 'next/navigation';
import { NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES, IMAGE_FORMATS } from '@/config/constants';
import { fetchGroup, updateGroup } from '@/db';
import { generateErrorMessage } from '@/utils';
import { pinToGroup, unpin } from '@/utils/pinata';

/**
 * Updates or sets the group's banner.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns The updated group or 400 or 500
 */
export async function POST(request: NextRequest, { params }: { params: { groupId: string } }) {
  const { groupId } = params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const filename: string = `${FILE_PREFIXES.groupBanner}-${groupId}`;

    if (!file) {
      return NextResponse.json({ error: `Invalid input data. No file found.` }, { status: 400 });
    }

    const { cid, error, errorStatus } = await pinToGroup(file, filename, IMAGE_FORMATS.groupBanner, group.banner);

    if (error) {
      return NextResponse.json({ error }, { status: errorStatus ?? 500 });
    }

    const updatedGroup = await updateGroup({ ...group, banner: cid });

    return NextResponse.json(updatedGroup);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while updating the group banner');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}

export async function DELETE(request: NextRequest, { params }: { params: { groupId: string } }) {
  const { groupId } = params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    if (group.banner) {
      await unpin(group.banner);
      const updatedGroup = await updateGroup({ ...group, banner: null });
      return NextResponse.json(updatedGroup);
    }

    return NextResponse.json(group);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while deleting the group banner');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
