import { isNil, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import type { Feature, Geometry } from 'geojson';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { createEventFormSchema, type CreateEventForm, type EventType } from '@/config/validation-schema';
import { fetchUser, insertEvent, searchEvents } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * Route handler for infinite (paginated) event search.
 * @param request - The request object
 * @param URLparams - pageSize, offset, searchTerm, type, countryCode, groupId, userId, startDate, endDate
 * @returns { data: Event[], nextOffset: number }
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const pageSize = Number(searchParams.get('pageSize')) || QUERY_DEFAULT_PAGE_SIZE;
  const offset = Number(searchParams.get('offset'));
  const searchTerm = searchParams.get('searchTerm');
  const type = searchParams.get('type');
  const countryCode = searchParams.get('countryCode');
  const groupId = searchParams.get('groupId');
  const userId = searchParams.get('userId');
  const startDate = searchParams.get('startDate');
  const endDate = searchParams.get('endDate');

  let nextOffset = null;

  const searchOptions = {
    pageSize,
    offset,
    ...omitBy({ searchTerm, type, countryCode, groupId, userId, startDate, endDate }, isNil),
  };

  const searchResults = await searchEvents(searchOptions);

  // Calculate nextOffset based on totalCount and offset
  if (searchResults.totalCount > offset + pageSize) {
    nextOffset = offset + pageSize;
  } else if (searchResults.totalCount > offset) {
    nextOffset = searchResults.totalCount;
  } else {
    nextOffset = null;
  }

  // Convert database events to client events with proper Date objects
  const clientEvents = searchResults.rows;

  const result = { data: clientEvents, totalCount: searchResults.totalCount, nextOffset };
  return Response.json(result);
}

/**
 * Creates a new event with the logged-in user as the creator.
 * @param request - CreateEventForm
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

    const body = await request.json();

    try {
      await createEventFormSchema.validate(body);
    } catch (validationError) {
      console.error('Validation error:', validationError);
      return NextResponse.json({ error: 'Invalid event data', details: validationError }, { status: 400 });
    }

    const eventData = body as CreateEventForm;

    const newEventId = uuidv4();
    const event = await insertEvent({
      ...eventData,
      id: newEventId,
      creatorId: session.user.id,
      start: new Date(eventData.start), // Convert ISO string to Date for DB
      end: eventData.end ? new Date(eventData.end) : undefined, // Convert ISO string to Date for DB
      type: eventData.type as EventType,
      feature: eventData.feature as Feature<Geometry>,
      associatedGroups: eventData.associatedGroups.filter((id): id is string => id !== undefined),
      associatedUsers: eventData.associatedUsers.filter((id): id is string => id !== undefined),
    });

    // Convert database event to client event with proper Date objects
    const clientEvent = event;

    return NextResponse.json(clientEvent);
  } catch (error) {
    console.error('Error creating event', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating event') },
      {
        status: 500,
      }
    );
  }
}
