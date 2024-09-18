import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { LinkTypes, UpdateGroupProfileForm, updateGroupProfileSchema } from '@/config/validation-schema';
import {
  addLink,
  deleteGroup,
  fetchGroup,
  fetchGroupAdminIds,
  fetchGroupProfile,
  isGroupAdmin,
  removeLink,
  updateGroup,
  updateLink,
} from '@/db';
import { Link } from '@/types/model';
import { generateErrorMessage } from '@/utils';

/**
 * Returns a GroupProfile object for a given group ID.
 * @param req
 * @param param1
 * @returns
 */
export async function GET(req: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    if (!groupProfile) return NextResponse.json({ error: `Group ID ${groupId} does not exist` }, { status: 404 });

    return Response.json(groupProfile);
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      },
    );
  }
}

/**
 * Updates a group profile including its links.
 * @param req GroupFormType
 * @param groupId
 * @returns
 */
export async function PATCH(req: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  if (!isAdmin)
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can update a group' },
      {
        status: 401,
      },
    );

  const body = await req.json();
  const isValid = await updateGroupProfileSchema.validate(body);
  if (!isValid) {
    return Response.json(
      { error: true, message: 'Invalid profile data' },
      {
        status: 400,
      },
    );
  }

  const { banner, logo, links } = body as UpdateGroupProfileForm;

  const groupProfileData = omitBy(
    {
      name: body.name,
      email: body.email,
      description: body.description,
      links: body.links,
      adminIds: body.adminIds,
      leader: body.leader,
      founder: body.founder,
      banner: banner,
      logo: logo,
    },
    isNil,
  );

  const groupProfile = await fetchGroupProfile(groupId); // TODO why fetch the whole profile to get the links?
  if (!groupProfile)
    return NextResponse.json(
      { error: 'Unable to locate the group to update. Please confirm that the group still exists.' },
      { status: 404 },
    );

  const { group, links: existingLinks = [] } = groupProfile;

  for (const link of links) {
    const isNewLink = !link.id;
    let isUpdatedLink = false;

    if (isNewLink) {
      const addedLink = await addLink({
        ...link,
        type: link.type as LinkTypes,
        ownerId: group.id,
      });
      link.id = addedLink?.id;
    } else {
      for (const existingLink of existingLinks) {
        if (link.id === existingLink.id && link.url !== existingLink.url) {
          isUpdatedLink = true;
          break;
        }
      }
    }

    if (isUpdatedLink) {
      await updateLink(link as Link);
    }
  }

  const deletedLinkIds: number[] = [];
  for (const existingLink of existingLinks) {
    let isDeletedLink = true;
    for (const link of links) {
      if (link.id === existingLink.id) {
        isDeletedLink = false;
        break;
      }
    }
    if (isDeletedLink) {
      await removeLink(existingLink.id);
      deletedLinkIds.push(existingLink.id);
    }
  }

  const updatedGroup = await updateGroup({ ...groupProfileData, id: group.id });
  return Response.json({ group: updatedGroup || {}, links });
}

export async function DELETE(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = params;
    const group = await fetchGroup(groupId);
    if (!group) return NextResponse.json({ error: `Group ID ${groupId} does not exist` }, { status: 404 });

    const adminIds = await fetchGroupAdminIds(groupId);

    if (!adminIds.some((id) => id === session.user.id)) {
      return Response.json(
        { error: true, message: 'Unauthorized to delete the group. Missing admin privileges.' },
        {
          status: 403,
        },
      );
    }

    await deleteGroup(groupId);

    return Response.json({ success: true });
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while deleting group') },
      {
        status: 500,
      },
    );
  }
}
