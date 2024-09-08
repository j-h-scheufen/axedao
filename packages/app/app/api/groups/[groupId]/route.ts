import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { GroupFormType, LinkTypes, groupFormSchema } from '@/config/validation-schema';
import {
  addLink,
  deleteGroup,
  fetchGroupProfile,
  fetchUserIdFromEmail,
  fetchUserProfileByEmail,
  isGroupAdmin,
  removeLink,
  updateGroup,
  updateLink,
} from '@/db';
import { Link } from '@/types/model';
import { generateErrorMessage } from '@/utils';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }

  try {
    const userId = await fetchUserIdFromEmail(session.user.email);
    if (!userId) {
      return Response.json(
        { error: true, message: 'User not found' },
        {
          status: 400,
        },
      );
    }

    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    if (!groupProfile) return NextResponse.json({ error: 'Unable to fetch group profile' }, { status: 404 });

    const isAdmin = await isGroupAdmin(groupId, userId);

    return Response.json({ groupProfile, isAdmin });
  } catch (error) {
    console.log(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      },
    );
  }
}

export async function PATCH(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authorized' },
      {
        status: 401,
      },
    );
  }

  const user = await fetchUserProfileByEmail(session.user.email);
  if (!user?.id) throw new Error();

  const { groupId } = params;
  const isAdmin = await isGroupAdmin(groupId, user.id);

  if (!isAdmin)
    return Response.json(
      { error: true, message: 'Unauthorized! Only group admins can update a group' },
      {
        status: 401,
      },
    );

  const body = await request.json();
  const isValid = await groupFormSchema.validate(body);
  if (!isValid) {
    return Response.json(
      { error: true, message: 'Invalid profile data' },
      {
        status: 400,
      },
    );
  }

  const { banner, logo, links } = body as GroupFormType;

  const groupProfileData = omitBy(
    {
      name: body.name,
      email: body.email,
      description: body.description,
      links: body.links,
      admins: body.admins,
      leader: body.leader,
      founder: body.founder,
      banner: banner,
      logo: logo,
    },
    isNil,
  );

  const group = await fetchGroupProfile(groupId);
  if (!group?.id) throw new Error('Unable to update group, please confirm that the group still exists');

  const { id, links: existingLinks = [] } = group;

  for (const link of links) {
    const isNewLink = !link.id;
    let isUpdatedLink = false;

    if (isNewLink) {
      const addedLink = await addLink({
        ...link,
        type: link.type as LinkTypes,
        ownerId: id,
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

  const updatedGroup = await updateGroup({ ...groupProfileData, id });
  return Response.json({ ...(updatedGroup || {}), links });
}

export async function DELETE(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }

  try {
    const user = await fetchUserProfileByEmail(session.user.email);
    if (!user) {
      return Response.json(
        { error: true, message: 'User not found' },
        {
          status: 400,
        },
      );
    }

    const { groupId } = params;
    const group = await fetchGroupProfile(groupId);
    if (!group) return NextResponse.json({ error: 'Unable to fetch group profile' }, { status: 404 });

    if (group.leader !== user?.id) {
      return Response.json(
        { error: true, message: "Only a group's leader can delete it." },
        {
          status: 500,
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
