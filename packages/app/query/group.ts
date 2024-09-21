import {
  infiniteQueryOptions,
  queryOptions,
  useInfiniteQuery,
  useMutation,
  useQuery,
  useQueryClient,
} from '@tanstack/react-query';
import axios from 'axios';

import { QUERY_DEFAULT_STALE_TIME_MINUTES } from '@/config/constants';
import { CreateNewGroupForm, SearchParams } from '@/config/validation-schema';
import { Group, GroupProfile, GroupSearchResult, User } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchGroup = (id: string): Promise<Group> => axios.get(`/api/groups/${id}`).then((response) => response.data);
function fetchGroupOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroup, id],
    queryFn: () => fetchGroup(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

const fetchGroupProfile = (id: string): Promise<GroupProfile> =>
  axios.get(`/api/groups/${id}/profile`).then((response) => response.data);
function fetchGroupProfileOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroupProfile, id],
    queryFn: () => fetchGroup(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

const fetchGroupMembers = (id: string): Promise<User[]> =>
  axios.get(`/api/groups/${id}/members`).then((response) => response.data);
function fetchGroupMembersOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroupMembers, id],
    queryFn: () => fetchGroupMembers(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

const searchGroups = async ({ offset, pageSize, searchTerm }: SearchParams): Promise<GroupSearchResult> => {
  let queryParams = `?offset=${offset}`;
  queryParams += searchTerm ? `&searchTerm=${searchTerm}` : '';
  queryParams += pageSize ? `&pageSize=${pageSize}` : '';
  return axios.get(`/api/groups${queryParams}`).then((response) => response.data);
};
function searchGroupsOptions(offset?: number, pageSize?: number, searchTerm?: string) {
  return infiniteQueryOptions({
    queryKey: [QUERY_KEYS.group.searchGroups, searchTerm],
    queryFn: ({ pageParam }: { pageParam: number | string }) =>
      searchGroups({ offset: Number(pageParam), pageSize, searchTerm }),
    initialPageParam: offset || 0,
    getNextPageParam: (lastPage, pages) => lastPage.nextOffset,
    staleTime: 1000 * 60 * 15, // 15 minutes
  });
}

const createGroup = (newGroup: CreateNewGroupForm): Promise<Group> =>
  axios.post('/api/groups', newGroup).then((response) => response.data);

export const useFetchGroup = (id: string) => useQuery(fetchGroupOptions(id));

export const useFetchGroupProfile = (id: string) => useQuery(fetchGroupProfileOptions(id));

export const useFetchGroupMembers = (id: string) => useQuery(fetchGroupOptions(id));

export const useSearchGroups = ({ offset, pageSize, searchTerm }: SearchParams) => {
  return useInfiniteQuery(searchGroupsOptions(offset, pageSize, searchTerm));
};

export const useCreateGroup = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (newGroup: CreateNewGroupForm) => createGroup(newGroup),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, { id: data.id }], data);
      // The current user's groupId has changed as part of creating a new group
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.profile.getProfile] });
    },
  });
};

// add / remove members

// add / remove admins

// invalidate queries accordingly
