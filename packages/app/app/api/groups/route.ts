import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import { boolean, number, object, string } from 'yup';

import { nextAuthOptions } from '@/config/next-auth-options';
import { createNewGroupFormSchema, CreateNewGroupFormType } from '@/config/validation-schema';
import { addGroupAdmin, countGroups, fetchGroups, fetchUser, insertGroup, updateUser } from '@/db';
import { generateErrorMessage } from '@/utils';

const groupOptionsSchema = object({
  limit: number().required().nonNullable(),
  offset: number().required().nonNullable(),
  searchTerm: string().nonNullable(),
  city: string().nonNullable(),
  country: string().nonNullable(),
  verified: boolean().nonNullable(),
});

/**
 * Returns a list of groups based on the query parameters.
 * @param request
 * @returns Group[]
 */
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

/**
 * Creates a new group and assigns the logged-in user as the admin of the group.
 * The user must not be a member of any other group.
 * @param request
 * @returns
 */
export async function POST(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const user = await fetchUser(session.user.id);
    if (!user) {
      throw new Error('No entry for logged-in user in DB. This should not be possible.');
    }

    if (user.groupId) {
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

    const newGroupId = uuidv4();
    const group = await insertGroup({ ...groupData, id: newGroupId, verified: false });
    await updateUser({ id: session.user.id, groupId: newGroupId });
    await addGroupAdmin({ groupId: newGroupId, userId: session.user.id });

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
