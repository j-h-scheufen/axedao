/**
 * EVENT QUERIES
 * Event management and searching
 */

import { and, count, eq, gte, ilike, inArray, isNotNull, lt, lte, or, sql, type SQLWrapper } from 'drizzle-orm';

import { QUERY_DEFAULT_PAGE_SIZE, type eventTypes } from '@/config/constants';
import * as schema from '@/db/schema';
import { db } from '@/db';

/**
 * Searches events with flexible filtering and pagination.
 * Supports filtering by search term, type, country, group, user, and date ranges.
 *
 * @param options - Search parameters
 * @returns Paginated list of events with total count
 */
export async function searchEvents(options: {
  pageSize?: number;
  offset?: number;
  searchTerm?: string;
  type?: string;
  eventTypes?: Array<(typeof eventTypes)[number]>;
  countryCode?: string; // Legacy support for single country code
  countryCodes?: string[]; // New parameter for multiple country codes
  groupId?: string;
  userId?: string;
  startDate?: Date;
  endDate?: Date;
  showActiveOnly?: boolean; // New parameter to show only active/upcoming events
}): Promise<{ rows: schema.SelectEvent[]; totalCount: number }> {
  const {
    pageSize = QUERY_DEFAULT_PAGE_SIZE,
    offset = 0,
    searchTerm,
    type,
    eventTypes: eventTypesFilter,
    countryCode,
    countryCodes,
    groupId,
    userId,
    startDate,
    endDate,
    showActiveOnly = false,
  } = options;

  const filters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    // Group search filters with OR logic - event can match in any of these fields
    const searchFilters = [
      ilike(schema.events.name, `%${searchTerm}%`),
      ilike(schema.events.description, `%${searchTerm}%`),
    ];
    filters.push(or(...searchFilters));
  }

  // Support both single type and multiple eventTypes
  if (type) {
    filters.push(eq(schema.events.type, type as (typeof eventTypes)[number]));
  } else if (eventTypesFilter && eventTypesFilter.length > 0) {
    // Filter out undefined values and ensure we have a valid array
    const validTypes = eventTypesFilter.filter((t): t is NonNullable<typeof t> => t !== undefined);
    if (validTypes.length > 0) {
      filters.push(inArray(schema.events.type, validTypes));
    }
  }

  // Support both single countryCode (legacy) and multiple countryCodes
  if (countryCodes && countryCodes.length > 0) {
    // Filter out undefined/null values
    const validCountryCodes = countryCodes.filter((c): c is string => !!c);
    if (validCountryCodes.length > 0) {
      filters.push(inArray(schema.events.countryCode, validCountryCodes));
    }
  } else if (countryCode) {
    // Legacy single country code support
    filters.push(eq(schema.events.countryCode, countryCode));
  }

  // Handle date filtering
  if (showActiveOnly) {
    // Show events that are either:
    // 1. Starting in the future (start >= now)
    // 2. Currently ongoing multi-day events (start < now AND end IS NOT NULL AND end >= now)
    const now = new Date();
    filters.push(
      or(
        gte(schema.events.start, now), // Future events
        and(
          lt(schema.events.start, now), // Started in the past
          isNotNull(schema.events.end), // Has an end date (multi-day event)
          gte(schema.events.end, now) // End date is in the future
        )
      )
    );
  } else {
    // Use explicit start/end date filters if provided
    if (startDate) filters.push(gte(schema.events.start, startDate));
    if (endDate) filters.push(lte(schema.events.end, endDate));
  }

  if (groupId) {
    filters.push(sql`${schema.events.associatedGroups} @> ${[groupId]}`);
  }

  if (userId) {
    filters.push(sql`${schema.events.associatedUsers} @> ${[userId]}`);
  }

  const results = await db
    .select({
      record: schema.events,
      count: sql<number>`count(*) over()`,
    })
    .from(schema.events)
    .where(filters.length ? and(...filters) : undefined)
    .orderBy(schema.events.start)
    .limit(pageSize)
    .offset(offset);

  return {
    rows: results.map((r) => r.record),
    totalCount: results[0]?.count || 0,
  };
}

/**
 * Fetches a single event by ID.
 *
 * @param eventId - ID of the event
 * @returns Event record or undefined if not found
 */
export async function fetchEvent(eventId: string): Promise<schema.SelectEvent | undefined> {
  return await db.query.events.findFirst({
    where: (events, { eq }) => eq(events.id, eventId),
  });
}

/**
 * Creates a new event.
 *
 * @param event - Event data to insert
 * @returns The created event record
 * @throws Error if insertion fails
 */
export async function insertEvent(event: schema.InsertEvent): Promise<schema.SelectEvent> {
  const events = await db.insert(schema.events).values(event).returning();
  if (!events.length) {
    throw new Error('Failed to insert event');
  }
  return events[0];
}

/**
 * Updates an existing event.
 *
 * @param eventId - ID of the event to update
 * @param updates - Partial event data to update
 * @returns Updated event or undefined if not found
 */
export async function updateEvent(
  eventId: string,
  updates: Partial<schema.InsertEvent>
): Promise<schema.SelectEvent | undefined> {
  const events = await db.update(schema.events).set(updates).where(eq(schema.events.id, eventId)).returning();
  return events.length ? events[0] : undefined;
}

/**
 * Deletes an event.
 *
 * @param eventId - ID of the event to delete
 */
export async function deleteEvent(eventId: string): Promise<void> {
  await db.delete(schema.events).where(eq(schema.events.id, eventId));
}

/**
 * Checks if a user is the creator of an event.
 *
 * @param eventId - ID of the event
 * @param userId - ID of the user
 * @returns True if user created the event
 */
export async function isEventCreator(eventId: string, userId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.events)
    .where(and(eq(schema.events.id, eventId), eq(schema.events.creatorId, userId)));
  return result.length > 0 && result[0].value > 0;
}

/**
 * Gets distinct country codes from events.
 *
 * @returns Array of ISO 3166-1 alpha-2 country codes
 */
export async function getDistinctEventCountryCodes(): Promise<string[]> {
  const results = await db
    .selectDistinct({ countryCode: schema.events.countryCode })
    .from(schema.events)
    .where(sql`${schema.events.countryCode} IS NOT NULL`)
    .orderBy(schema.events.countryCode);

  return results.map((r) => r.countryCode).filter(Boolean) as string[];
}
