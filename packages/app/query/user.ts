import { infiniteQueryOptions, queryOptions, useInfiniteQuery, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import { QueryConfig } from '@/config/constants';
import { SearchParams } from '@/config/validation-schema';
import { User, UserSearchResult } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchUser = async (id: string): Promise<User> => axios.get(`/api/users/${id}`).then((response) => response.data);
export const fetchUserOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.user.getUser, id],
    queryFn: () => fetchUser(id ?? ''),
    staleTime: QueryConfig.staleTimeUser,
    enabled: !!id,
  } as const;
};

const searchUsers = async ({ offset, pageSize, searchTerm }: SearchParams): Promise<UserSearchResult> => {
  let queryParams = `?offset=${offset}`;
  queryParams += searchTerm ? `&searchTerm=${searchTerm}` : '';
  queryParams += pageSize ? `&limit=${pageSize}` : '';
  return axios.get(`/api/users${queryParams}`).then((response) => response.data);
};
function searchUsersOptions(offset?: number, pageSize?: number, searchTerm?: string) {
  return infiniteQueryOptions({
    queryKey: [QUERY_KEYS.user.searchUsers, searchTerm],
    queryFn: ({ pageParam }: { pageParam: number | string }) =>
      searchUsers({ offset: Number(pageParam), pageSize, searchTerm }),
    initialPageParam: offset || 0,
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    getNextPageParam: (lastPage, pages) => lastPage.nextOffset,
    staleTime: QueryConfig.staleTimeDefault,
  });
}

export const useFetchUser = (id: string) => {
  return useQuery(queryOptions(fetchUserOptions(id)));
};

export const useSearchUsers = ({ offset, pageSize, searchTerm }: SearchParams) => {
  return useInfiniteQuery(searchUsersOptions(offset, pageSize, searchTerm));
};
