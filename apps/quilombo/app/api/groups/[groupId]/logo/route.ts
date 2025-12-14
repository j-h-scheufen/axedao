import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { canUserManageGroup, fetchGroup, updateGroup } from '@/db';
import type { RouteParamsGroup } from '@/types/routes';
import { generateErrorMessage } from '@/utils';
import { createImageBuffer } from '@/utils/images';
import { pinToGroup, unpinIfNotReferenced } from '@/utils/pinata';

/**
 * Updates or sets the group's logo.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns The updated group or 400 or 500
 */
export async function POST(request: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = await params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    // Check authorization
    const canManage = await canUserManageGroup(groupId, session.user.id);
    if (!canManage) {
      return NextResponse.json(
        { error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update the group logo' },
        { status: 403 }
      );
    }

    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const filename: string = `${FILE_PREFIXES.groupLogo}-${groupId}`;

    if (!file) {
      return NextResponse.json({ error: 'Invalid input data. No file found.' }, { status: 400 });
    }

    // 1. Save old logo CID
    const oldLogo = group.logo;

    // 2. Upload new file
    const imageBuffer = await createImageBuffer(file, 'groupLogo');
    const { cid, error, errorStatus } = await pinToGroup(imageBuffer, filename);

    if (error) {
      return NextResponse.json({ error }, { status: errorStatus ?? 500 });
    }

    // 3. Update group record (removes reference to old CID)
    const updatedGroup = await updateGroup({ ...group, logo: cid });

    // 4. Safely unpin old logo (only if not referenced elsewhere)
    if (oldLogo && oldLogo !== cid) {
      await unpinIfNotReferenced(oldLogo).catch((err) => {
        console.error('Failed to unpin old logo:', err.message);
      });
    }

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
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = await params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    // Check authorization
    const canManage = await canUserManageGroup(groupId, session.user.id);
    if (!canManage) {
      return NextResponse.json(
        { error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can delete the group logo' },
        { status: 403 }
      );
    }

    if (group.logo) {
      const logoCid = group.logo;

      // 1. Update group record first (removes reference)
      const updatedGroup = await updateGroup({ ...group, logo: null });

      // 2. Safely unpin (only if not referenced elsewhere)
      await unpinIfNotReferenced(logoCid).catch((err) => {
        console.error('Failed to unpin logo:', err.message);
      });

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
