import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import {
  type CreateNewGroupForm,
  createNewGroupFormSchema,
  type GroupSearchParams,
  groupSearchSchema,
} from '@/config/validation-schema';
import { addGroupAdmin, fetchUser, insertGroup, searchGroups, updateUser } from '@/db';
import type { GroupSearchResult } from '@/types/model';
import { generateErrorMessage } from '@/utils';

/**
 * Route handler for infinite (paginated) group search.
 * @param request - The request object
 * @param URLparams - pageSize, offset, searchTerm, city, country, verified
 * @returns { data: Group[], nextOffset: number }
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const pageSize = Number(searchParams.get('pageSize')) || QUERY_DEFAULT_PAGE_SIZE;
  const offset = Number(searchParams.get('offset'));
  const searchTerm = searchParams.get('searchTerm');
  let verified: string | null | boolean | undefined = searchParams.get('verified');
  verified = verified === 'false' ? false : verified === 'true' || undefined;
  let nextOffset = null;

  let searchOptions: GroupSearchParams;
  try {
    searchOptions = groupSearchSchema.validateSync({
      pageSize,
      offset,
      ...omitBy({ searchTerm, verified }, isNil),
    });
  } catch (error) {
    console.error('Unable to validate input data', error);
    return NextResponse.json({ error: 'Invalid input data' }, { status: 400 });
  }

  const searchResults = await searchGroups(searchOptions);

  // Calculate nextOffset based on totalCount and offset
  if (searchResults.totalCount > offset + pageSize) {
    nextOffset = offset + pageSize;
  } else if (searchResults.totalCount > offset) {
    nextOffset = searchResults.totalCount;
  } else {
    nextOffset = null;
  }

  const result: GroupSearchResult = { data: searchResults.rows, totalCount: searchResults.totalCount, nextOffset };
  return Response.json(result);
}

/**
 * Creates a new group and assigns the logged-in user as the admin of the group.
 * The user must not be a member of any other group.
 * Sets createdBy field. Leaves claimedBy/claimedAt NULL (claiming is only for imported groups).
 * @param request - CreateNewGroupForm
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
        { status: 403 }
      );
    }

    const body = await request.json();
    const isValid = await createNewGroupFormSchema.validate(body);
    if (!isValid) {
      return NextResponse.json({ error: 'Invalid group data' }, { status: 400 });
    }
    const groupData = body as CreateNewGroupForm;

    const newGroupId = uuidv4();
    const group = await insertGroup({
      ...groupData,
      id: newGroupId,
      createdBy: session.user.id,
    });
    if (!group) throw Error('Unable to create the group');

    await updateUser({ id: session.user.id, groupId: newGroupId });
    await addGroupAdmin({ groupId: group.id, userId: session.user.id });

    return NextResponse.json(group);
  } catch (error) {
    console.error('Error creating group', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating group') },
      {
        status: 500,
      }
    );
  }
}
