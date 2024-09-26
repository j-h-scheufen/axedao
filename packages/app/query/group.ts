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
import { CreateNewGroupForm, SearchParams, UpdateGroupForm } from '@/config/validation-schema';
import { Group, GroupSearchResult, User } from '@/types/model';
import { GroupAndUserParams, QUERY_KEYS } from '.';

/**
 * Note that the various fetch options are exported as read-only objects in order to be used by atomWithQuery.
 * When used in useQuery hooks (e.g. useQuery, useInfiniteQuery), the options should be wrappped
 * into the queryOptions() function in order to take advantage of the added type safety and inference.
 */

const fetchGroup = (id: string): Promise<Group> => axios.get(`/api/groups/${id}`).then((response) => response.data);
export const fetchGroupOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroup, id],
    queryFn: () => fetchGroup(id ?? ''),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  } as const;
};

const fetchGroupMembers = (id: string): Promise<User[]> =>
  axios.get(`/api/groups/${id}/members`).then((response) => response.data);
export const fetchGroupMembersOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroupMembers, id],
    queryFn: () => fetchGroupMembers(id ?? ''),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  } as const;
};

const fetchGroupAdmins = (id: string): Promise<string[]> =>
  axios.get(`/api/groups/${id}/admins`).then((response) => response.data);
export const fetchGroupAdminsOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroupAdmins, id],
    queryFn: () => fetchGroupAdmins(id ?? ''),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  } as const;
};

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

const createGroup = async (newGroup: CreateNewGroupForm): Promise<Group> =>
  axios.post('/api/groups', newGroup).then((response) => response.data);

const deleteGroup = async (groupId: string): Promise<void> => axios.delete(`/api/groups/${groupId}`);

const updateGroup = async (groupId: string, data: UpdateGroupForm): Promise<Group> =>
  axios.patch(`/api/groups/${groupId}`, data).then((response) => response.data);

const removeMember = async (groupId: string, userId: string): Promise<User[]> =>
  axios.delete(`/api/groups/${groupId}/members/${userId}`).then((response) => response.data);

const addAdmin = async (groupId: string, userId: string): Promise<string[]> =>
  axios.put(`/api/groups/${groupId}/admins/${userId}`).then((response) => response.data);

const removeAdmin = async (groupId: string, userId: string): Promise<string[]> =>
  axios.delete(`/api/groups/${groupId}/admins/${userId}`).then((response) => response.data);

// HOOKS
export const useFetchGroup = (id: string) => useQuery(queryOptions(fetchGroupOptions(id)));

export const useFetchGroupMembers = (id: string) => useQuery(queryOptions(fetchGroupMembersOptions(id)));

export const useFetchGroupAdmins = (id: string) => useQuery(queryOptions(fetchGroupAdminsOptions(id)));

export const useSearchGroups = ({ offset, pageSize, searchTerm }: SearchParams) => {
  return useInfiniteQuery(searchGroupsOptions(offset, pageSize, searchTerm));
};

export const useCreateGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (newGroup: CreateNewGroupForm) => createGroup(newGroup),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, data.id], data);
      // The current user's groupId has changed as part of creating a new group
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getUser] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useDeleteGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => deleteGroup(groupId),
    onSuccess: (data, variables) => {
      // The current user's groupId has changed as part of deleting the group
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getUser] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup, variables] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useUpdateGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, data }: { groupId: string; data: UpdateGroupForm }) => updateGroup(groupId, data),
    onSuccess: (data, variables) => {
      console.log('updating query cache for group', variables.groupId, data);
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, variables.groupId], data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useRemoveMemberMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => removeMember(groupId, userId),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupMembers, variables.groupId], data);
    },
  });
};

export const useAddAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => addAdmin(groupId, userId),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins, variables.groupId], data);
    },
  });
};

export const useRemoveAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => removeAdmin(groupId, userId),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins, variables.groupId], data);
    },
  });
};
