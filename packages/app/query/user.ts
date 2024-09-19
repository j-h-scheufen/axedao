import { infiniteQueryOptions, queryOptions, useInfiniteQuery, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import { QUERY_DEFAULT_STALE_TIME_MINUTES } from '@/config/constants';
import { User, UserSearchParams, UserSearchResult } from '@/types/model';

export const QUERY_KEYS = {
  getUser: 'getUser',
  searchUsers: 'getUsers',
} as const;

const fetchUser = async (id: string): Promise<User> => axios.get(`/api/users/${id}`).then((response) => response.data);

const searchUsers = async ({ offset, pageSize, searchTerm }: UserSearchParams): Promise<UserSearchResult> => {
  let queryParams = `?offset=${offset}`;
  queryParams += searchTerm ? `&searchTerm=${searchTerm}` : '';
  queryParams += pageSize ? `&limit=${pageSize}` : '';
  return axios.get('/api/users/search?offset=' + queryParams).then((response) => response.data);
};

function fetchUserOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.getUser, id],
    queryFn: () => fetchUser(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

function searchUsersOptions(pageSize?: number, searchTerm?: string) {
  return infiniteQueryOptions({
    queryKey: [QUERY_KEYS.searchUsers],
    queryFn: ({ pageParam }: { pageParam: number | string }) =>
      searchUsers({ offset: Number(pageParam), pageSize, searchTerm }),
    initialPageParam: 0,
    getNextPageParam: (lastPage, pages) => lastPage.nextOffset,
  });
}

export const useFetchUser = (id: string) => {
  return useQuery(fetchUserOptions(id));
};

export const useSearchUsers = ({ pageSize, searchTerm }: Omit<UserSearchParams, 'offset'>) => {
  return useInfiniteQuery(searchUsersOptions(pageSize, searchTerm));
};

// Todo groupmembers, test infinite query
