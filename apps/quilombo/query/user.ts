import { infiniteQueryOptions, queryOptions, useInfiniteQuery, useQuery } from '@tanstack/react-query';
import axios from '@/utils/axios';

import { QueryConfig } from '@/config/constants';
import type { UserSearchParams } from '@/config/validation-schema';
import type { User, UserSearchResult } from '@/types/model';
import { QUERY_KEYS } from './keys';
import type { SearchByAddressParams } from '.';

const fetchUser = async (id: string): Promise<User> => axios.get(`/api/users/${id}`).then((response) => response.data);
export const fetchUserOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.user.getUser, id],
    queryFn: async () => fetchUser(id ?? ''),
    staleTime: QueryConfig.staleTimeUser,
    enabled: !!id,
  } as const;
};

export const searchUsers = async (params: UserSearchParams): Promise<UserSearchResult> => {
  return axios.post('/api/users/search', params).then((response) => response.data);
};

export const searchUsersOptions = (params: UserSearchParams) => {
  const { offset, pageSize, searchTerm, filters } = params;
  return {
    queryKey: [QUERY_KEYS.user.searchUsers, searchTerm, filters],
    queryFn: async ({ pageParam }: { pageParam: number }) =>
      searchUsers({ offset: pageParam, pageSize, searchTerm, filters }),
    initialPageParam: offset || 0,
    getNextPageParam: (lastPage: UserSearchResult) => {
      if (lastPage.nextOffset === null || lastPage.nextOffset >= lastPage.totalCount) {
        return undefined;
      }
      return lastPage.nextOffset;
    },
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

export const useFetchUser = (id: string | undefined) => {
  return useQuery(queryOptions(fetchUserOptions(id)));
};

export const useSearchUsers = (params: UserSearchParams) => {
  return useInfiniteQuery(infiniteQueryOptions(searchUsersOptions(params)));
};

export const searchUsersByAddresses = async ({ addresses }: SearchByAddressParams): Promise<User[]> => {
  return axios.post('/api/users/search', { addresses }).then((response) => response.data.data);
};

export const searchUsersByAddressesOptions = ({ addresses }: SearchByAddressParams) => {
  return {
    queryKey: [QUERY_KEYS.user.searchByAddresses, addresses],
    queryFn: () => searchUsersByAddresses({ addresses }),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!addresses,
  } as const;
};

export const useSearchUsersByAddresses = (params: SearchByAddressParams) => {
  return useQuery(queryOptions(searchUsersByAddressesOptions(params)));
};
