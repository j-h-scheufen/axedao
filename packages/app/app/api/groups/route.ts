import { createNewGroupFormSchema, CreateNewGroupFormType } from '@/app/dashboard/profile/schema';
import {
  addGroupAdmin,
  countGroups,
  fetchGroupIdFromName,
  fetchGroups,
  fetchProfile,
  insertGroup,
  updateUser,
} from '@/db';
import { generateErrorMessage } from '@/utils';
import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import { boolean, number, object, string } from 'yup';

const groupOptionsSchema = object({
  limit: number().required().nonNullable(),
  offset: number().required().nonNullable(),
  searchTerm: string().nonNullable(),
  city: string().nonNullable(),
  country: string().nonNullable(),
  verified: boolean().nonNullable(),
});

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const limit = searchParams.get('limit');
    const offset = searchParams.get('offset');
    const searchTerm = searchParams.get('searchTerm');
    const city = searchParams.get('city');
    const country = searchParams.get('country');
    let verified: string | null | boolean | undefined = searchParams.get('verified');
    verified = verified === 'false' ? false : verified === 'true' || undefined;

    const options = await groupOptionsSchema.validate({
      limit: Number(limit),
      offset: Number(offset),
      ...omitBy({ searchTerm, city, country, verified }, isNil),
    });

    if (!options) {
      return NextResponse.json({ error: 'Invalid data' }, { status: 400 });
    }

    const groups = await fetchGroups(options);
    const count = await countGroups();
    return NextResponse.json({ groups, count });
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: 'An unexpected error occured while fetching groups' }, { status: 500 });
  }
}

export async function POST(request: NextRequest) {
  const session = await getServerSession();
  const email = session?.user?.email;
  if (!email) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const profile = await fetchProfile(email);
    if (!profile) {
      throw new Error();
    }
    const { id: userId, groupId } = profile;
    if (groupId) {
      return NextResponse.json(
        { error: 'You cannot create a new group while being a member of an existing group' },
        { status: 403 },
      );
    }

    const body = await request.json();
    const isValid = await createNewGroupFormSchema.validate(body);
    if (!isValid) {
      return NextResponse.json({ error: 'Invalid group data' }, { status: 400 });
    }
    const groupData = body as CreateNewGroupFormType;
    const { name } = groupData;

    const groupExists = await fetchGroupIdFromName(name);
    if (groupExists) {
      return NextResponse.json({ error: `A group with the name "${name}" already exists` }, { status: 403 });
    }

    const newGroupId = uuidv4();
    const group = await insertGroup({ ...groupData, id: newGroupId, leader: userId, verified: false });
    await updateUser({ id: userId, groupId: newGroupId });
    await addGroupAdmin({ groupId: newGroupId, userId });

    return NextResponse.json({ group });
  } catch (error) {
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating group') },
      {
        status: 403,
      },
    );
  }
}
