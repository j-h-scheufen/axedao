import {
  infiniteQueryOptions,
  queryOptions,
  useInfiniteQuery,
  useMutation,
  useQuery,
  useQueryClient,
} from '@tanstack/react-query';
import axios from 'axios';
import { parseAbsoluteToLocal } from '@internationalized/date';

import { QueryConfig } from '@/config/constants';
import { isValidISO8601 } from '@/config/validation-schema';
import type { CreateEventForm, UpdateEventForm } from '@/config/validation-schema';
import type { EventSearchResult, Event } from '@/types/model';
import { QUERY_KEYS } from '.';

/**
 * Note that the various fetch options are exported as read-only objects in order to be used by atomWithQuery.
 * When used in useQuery hooks (e.g. useQuery, useInfiniteQuery), the options should be wrappped
 * into the queryOptions() function in order to take advantage of the added type safety and inference.
 */

// Convert ISO strings back to Date objects to match server-side format
// Add defensive validation to ensure we received ISO strings
export const validateAndConvertDate = (value: unknown, fieldName: string): Date => {
  if (value instanceof Date) {
    return value;
  }
  if (typeof value === 'string' && isValidISO8601(value)) {
    return new Date(value);
  }
  throw new Error(`Invalid ISO date format for ${fieldName}: ${value}`);
};

const fetchEvent = async (id: string): Promise<Event> => {
  const response = await axios.get(`/api/events/${id}`);
  const rawEvent = response.data;

  return {
    ...rawEvent,
    start: validateAndConvertDate(rawEvent.start, 'start'),
    end: rawEvent.end ? validateAndConvertDate(rawEvent.end, 'end') : undefined,
  };
};
export const fetchEventOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.event.getEvent, id],
    queryFn: async () => fetchEvent(id ?? ''),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!id,
  } as const;
};

const searchEvents = async ({
  offset,
  pageSize,
  searchTerm,
  type,
  countryCode,
  groupId,
  userId,
  startDate,
  endDate,
  showActiveOnly,
}: {
  offset?: number;
  pageSize?: number;
  searchTerm?: string;
  type?: string;
  countryCode?: string;
  groupId?: string;
  userId?: string;
  startDate?: string;
  endDate?: string;
  showActiveOnly?: boolean;
}): Promise<EventSearchResult> => {
  const params = new URLSearchParams();
  if (offset !== undefined) params.append('offset', offset.toString());
  if (pageSize !== undefined) params.append('pageSize', pageSize.toString());
  if (searchTerm) params.append('searchTerm', searchTerm);
  if (type) params.append('type', type);
  if (countryCode) params.append('countryCode', countryCode);
  if (groupId) params.append('groupId', groupId);
  if (userId) params.append('userId', userId);
  if (startDate) params.append('startDate', startDate);
  if (endDate) params.append('endDate', endDate);
  if (showActiveOnly) params.append('showActiveOnly', 'true');

  const queryString = params.toString();
  const url = `/api/events${queryString ? `?${queryString}` : ''}`;
  const response = await axios.get(url);
  const rawData = response.data;

  return {
    ...rawData,
    data: rawData.data.map((rawEvent: any) => ({
      ...rawEvent,
      start: parseAbsoluteToLocal(validateAndConvertDate(rawEvent.start, 'start').toISOString()),
      end: rawEvent.end ? parseAbsoluteToLocal(validateAndConvertDate(rawEvent.end, 'end').toISOString()) : undefined,
    })),
  };
};

export const searchEventsOptions = ({
  offset,
  pageSize,
  searchTerm,
  type,
  countryCode,
  groupId,
  userId,
  startDate,
  endDate,
  showActiveOnly,
}: {
  offset?: number;
  pageSize?: number;
  searchTerm?: string;
  type?: string;
  countryCode?: string;
  groupId?: string;
  userId?: string;
  startDate?: string;
  endDate?: string;
  showActiveOnly?: boolean;
}) => {
  return {
    queryKey: [
      QUERY_KEYS.event.searchEvents,
      searchTerm,
      type,
      countryCode,
      groupId,
      userId,
      startDate,
      endDate,
      showActiveOnly,
    ],
    queryFn: async ({ pageParam }: { pageParam: number }) =>
      searchEvents({
        offset: pageParam,
        pageSize,
        searchTerm,
        type,
        countryCode,
        groupId,
        userId,
        startDate,
        endDate,
        showActiveOnly,
      }),
    initialPageParam: offset || 0,
    getNextPageParam: (lastPage: EventSearchResult) => {
      if (lastPage.nextOffset === null || lastPage.nextOffset >= lastPage.totalCount) {
        return undefined;
      }
      return lastPage.nextOffset;
    },
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

const createEvent = async (newEvent: CreateEventForm | FormData): Promise<Event> => {
  const response = await axios.post('/api/events', newEvent, {
    headers: newEvent instanceof FormData ? {} : { 'Content-Type': 'application/json' },
  });
  return response.data;
};

const updateEvent = async (eventId: string, data: UpdateEventForm): Promise<Event> =>
  axios.patch(`/api/events/${eventId}`, data).then((response) => response.data);

const deleteEvent = async (eventId: string): Promise<void> => axios.delete(`/api/events/${eventId}`);

// HOOKS
export const useFetchEvent = (id: string) => useQuery(queryOptions(fetchEventOptions(id)));

export const useSearchEvents = (params: {
  offset?: number;
  pageSize?: number;
  searchTerm?: string;
  type?: string;
  countryCode?: string;
  groupId?: string;
  userId?: string;
  startDate?: string;
  endDate?: string;
  showActiveOnly?: boolean;
}) => {
  return useInfiniteQuery(infiniteQueryOptions(searchEventsOptions(params)));
};

export const useCreateEventMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (newEvent: CreateEventForm | FormData) => createEvent(newEvent),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.event.getEvent, data.id], data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.event.searchEvents] });
    },
  });
};

export const useUpdateEventMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ eventId, data }: { eventId: string; data: UpdateEventForm }) => updateEvent(eventId, data),
    onSuccess: (data, variables) => {
      // Process the data through the same validation as fetchEvent
      const processedData = {
        ...data,
        start: validateAndConvertDate(data.start, 'start'),
        end: data.end ? validateAndConvertDate(data.end, 'end') : undefined,
      };
      queryClient.setQueryData([QUERY_KEYS.event.getEvent, variables.eventId], processedData);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.event.searchEvents] });
    },
  });
};

export const useDeleteEventMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (eventId: string) => deleteEvent(eventId),
    onSuccess: (_data, variables) => {
      queryClient.removeQueries({ queryKey: [QUERY_KEYS.event.getEvent, variables] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.event.searchEvents] });
    },
  });
};
