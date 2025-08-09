import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';
import { parseAbsoluteToLocal } from '@internationalized/date';

import { fetchEventOptions, validateAndConvertDate } from '@/query/event';
import type { Event, ZonedEvent } from '@/types/model';

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
