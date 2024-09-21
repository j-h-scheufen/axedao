import { infiniteQueryOptions, queryOptions, useInfiniteQuery, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import { QUERY_DEFAULT_STALE_TIME_MINUTES } from '@/config/constants';
import { User, UserProfile, UserSearchParams, UserSearchResult } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchUser = async (id: string): Promise<User> => axios.get(`/api/users/${id}`).then((response) => response.data);
function fetchUserOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.user.getUser, id],
    queryFn: () => fetchUser(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

const fetchUserProfile = async (id: string): Promise<UserProfile> =>
  axios.get(`/api/users/${id}/profile`).then((response) => response.data);
function fetchUserProfileOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.user.getUserProfile, id],
    queryFn: () => fetchUserProfile(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

const searchUsers = async ({ offset, pageSize, searchTerm }: UserSearchParams): Promise<UserSearchResult> => {
  let queryParams = `?offset=${offset}`;
  queryParams += searchTerm ? `&searchTerm=${searchTerm}` : '';
  queryParams += pageSize ? `&limit=${pageSize}` : '';
  return axios.get('/api/users/search?offset=' + queryParams).then((response) => response.data);
};
function searchUsersOptions(offset?: number, pageSize?: number, searchTerm?: string) {
  return infiniteQueryOptions({
    queryKey: [QUERY_KEYS.user.searchUsers, searchTerm],
    queryFn: ({ pageParam }: { pageParam: number | string }) =>
      searchUsers({ offset: Number(pageParam), pageSize, searchTerm }),
    initialPageParam: offset || 0,
    getNextPageParam: (lastPage, pages) => lastPage.nextOffset,
  });
}

export const useFetchUser = (id: string) => {
  return useQuery(fetchUserOptions(id));
};

export const useFetchUserProfile = (id: string) => {
  return useQuery(fetchUserProfileOptions(id));
};

export const useSearchUsers = ({ offset, pageSize, searchTerm }: UserSearchParams) => {
  return useInfiniteQuery(searchUsersOptions(offset, pageSize, searchTerm));
};
