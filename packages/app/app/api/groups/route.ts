import { CreateNewGroupFormType, createNewGroupFormSchema } from '@/constants/schemas';
import {
  addGroupAdmin,
  countGroups,
  fetchGroupIdFromName,
  fetchGroups,
  fetchUserProfileByEmail,
  insertGroup,
  updateUser,
} from '@/db';
import { generateErrorMessage } from '@/utils';
import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const limit = searchParams.get('limit');
    const offset = searchParams.get('offset');
    const searchTerm = searchParams.get('searchTerm');
    const groups = await fetchGroups(
      limit ? Number(limit) : undefined,
      offset ? Number(offset) : undefined,
      searchTerm || undefined,
    );
    const count = await countGroups();
    return Response.json({ groups, count });
  } catch (error) {
    return Response.json(
      { error: true, message: 'An unexpected error occured while fetching groups' },
      {
        status: 500,
      },
    );
  }
}

export async function POST(request: NextRequest) {
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
    const userProfile = await fetchUserProfileByEmail(session.user.email);
    if (!userProfile) {
      throw new Error();
    }
    const { id: userId, group_id } = userProfile;
    if (group_id) {
      return Response.json(
        { error: true, message: 'You cannot create a new group while being a member of an existing group' },
        {
          status: 403,
        },
      );
    }

    const body = await request.json();
    const isValid = await createNewGroupFormSchema.validate(body);
    if (!isValid) {
      return Response.json(
        { error: true, message: 'Invalid group data' },
        {
          status: 400,
        },
      );
    }
    const groupData = body as CreateNewGroupFormType;
    const { name } = groupData;

    const groupExists = await fetchGroupIdFromName(name);
    if (groupExists) {
      return Response.json(
        { error: true, message: `A group with the name "${name}" already exists` },
        {
          status: 403,
        },
      );
    }

    const groupId = uuidv4();
    const group = await insertGroup({ ...groupData, id: groupId, founder: userId, leader: userId, verified: false });
    await updateUser({ id: userId, group_id: groupId });
    await addGroupAdmin({ groupId, userId });

    return Response.json(group);
  } catch (error) {
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating group') },
      {
        status: 403,
      },
    );
  }
}
