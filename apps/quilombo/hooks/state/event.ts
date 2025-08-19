import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';
import { parseAbsoluteToLocal } from '@internationalized/date';

import { fetchEventOptions, validateAndConvertDate, fetchEventLocationsOptions } from '@/query/event';
import type { Event, ZonedEvent, EventLocationFeatureCollection } from '@/types/model';

// This atom is used to trigger the loading of an event
export const triggerEventIdAtom = atom<string | undefined>();

// Raw event atom (matches query result exactly)
export const eventAtom = atomWithQuery<Event | undefined>((get) => fetchEventOptions(get(triggerEventIdAtom)));

// Derived atom that converts Date objects to ZonedDateTime
export const zonedEventAtom = atom<{ event: ZonedEvent | undefined; isLoading: boolean }>((get) => {
  const rawEventResult = get(eventAtom);
  const rawEvent = rawEventResult.data;
  if (!rawEvent) return { event: undefined, isLoading: rawEventResult.isLoading };

  return {
    event: {
      ...rawEvent,
      start: parseAbsoluteToLocal(validateAndConvertDate(rawEvent.start, 'start').toISOString()),
      end: rawEvent.end ? parseAbsoluteToLocal(validateAndConvertDate(rawEvent.end, 'end').toISOString()) : undefined,
    },
    isLoading: rawEventResult.isLoading,
  };
});

// Global event locations for map view - with default filters for active events
export const eventLocationsAtom = atomWithQuery<EventLocationFeatureCollection>(() =>
  fetchEventLocationsOptions({ showActiveOnly: true })
);

// Filtered event locations that can be updated based on search/filter criteria
export const filteredEventLocationsAtom = atom<EventLocationFeatureCollection | null>(null);

// Search parameters atom for event locations
export const eventLocationSearchParamsAtom = atom<{
  searchTerm?: string;
  type?: string;
  countryCode?: string;
  groupId?: string;
  userId?: string;
  startDate?: string;
  endDate?: string;
  showActiveOnly?: boolean;
}>({ showActiveOnly: true });

// Derived atom that fetches event locations based on search parameters
export const filteredEventLocationsQueryAtom = atomWithQuery((get) => {
  const searchParams = get(eventLocationSearchParamsAtom);
  return fetchEventLocationsOptions(searchParams);
});
