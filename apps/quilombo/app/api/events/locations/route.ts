import { type NextRequest, NextResponse } from 'next/server';
import { isNil, omitBy } from 'lodash';

import { searchEvents } from '@/db';
import type { EventLocationFeatureCollection } from '@/types/model';

export async function GET(request: NextRequest): Promise<NextResponse> {
  try {
    const searchParams = request.nextUrl.searchParams;
    const {
      searchTerm,
      type,
      countryCode,
      groupId,
      userId,
      startDate,
      endDate,
      showActiveOnly = 'false',
    } = Object.fromEntries(searchParams.entries());

    const searchOptions = {
      pageSize: 1000, // Get all events for map view
      offset: 0,
      ...omitBy({ searchTerm, type, countryCode, groupId, userId }, isNil),
      ...(startDate && { startDate: new Date(startDate) }),
      ...(endDate && { endDate: new Date(endDate) }),
      showActiveOnly: showActiveOnly === 'true',
    };

    const searchResults = await searchEvents(searchOptions);

    if (searchResults.rows.length === 0) {
      return NextResponse.json({
        type: 'FeatureCollection',
        features: [],
      });
    }

    const featureCollection: EventLocationFeatureCollection = {
      type: 'FeatureCollection',
      features: searchResults.rows.map((event) => ({
        ...event.feature,
        properties: {
          // Event-specific data
          eventId: event.id,
          eventName: event.name,
          eventDescription: event.description || undefined,
          eventType: event.type,
          eventStart: event.start.toISOString(),
          eventEnd: event.end?.toISOString(),
          eventIsAllDay: event.isAllDay,
          eventUrl: event.url || undefined,
          eventImage: event.image || undefined,
          countryCode: event.countryCode || undefined,

          // Creator/Group data
          creatorId: event.creatorId,
          associatedGroups: event.associatedGroups,
          associatedUsers: event.associatedUsers,
        },
      })),
    };

    return NextResponse.json(featureCollection);
  } catch (error) {
    console.error('Error fetching event locations:', error);
    return NextResponse.json({ error: 'Failed to fetch event locations' }, { status: 500 });
  }
}
