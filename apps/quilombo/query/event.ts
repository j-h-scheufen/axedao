import {
  infiniteQueryOptions,
  queryOptions,
  useInfiniteQuery,
  useMutation,
  useQuery,
  useQueryClient,
} from '@tanstack/react-query';
import axios from 'axios';

import { QueryConfig } from '@/config/constants';
import type { CreateEventForm, UpdateEventForm } from '@/config/validation-schema';
import type { Event, EventSearchResult } from '@/types/model';
import { QUERY_KEYS } from '.';

/**
 * Note that the various fetch options are exported as read-only objects in order to be used by atomWithQuery.
 * When used in useQuery hooks (e.g. useQuery, useInfiniteQuery), the options should be wrappped
 * into the queryOptions() function in order to take advantage of the added type safety and inference.
 */

const fetchEvent = async (id: string): Promise<Event> =>
  axios.get(`/api/events/${id}`).then((response) => response.data);
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

  const queryString = params.toString();
  const url = `/api/events${queryString ? `?${queryString}` : ''}`;
  return axios.get(url).then((response) => response.data);
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
}) => {
  return {
    queryKey: [QUERY_KEYS.event.searchEvents, searchTerm, type, countryCode, groupId, userId, startDate, endDate],
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

const createEvent = async (newEvent: CreateEventForm): Promise<Event> =>
  axios.post('/api/events', newEvent).then((response) => response.data);

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
}) => {
  return useInfiniteQuery(infiniteQueryOptions(searchEventsOptions(params)));
};

export const useCreateEventMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (newEvent: CreateEventForm) => createEvent(newEvent),
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
      queryClient.setQueryData([QUERY_KEYS.event.getEvent, variables.eventId], data);
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
