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
import { Group, GroupProfile, GroupSearchResult, User } from '@/types/model';
import { GroupAndUserParams, QUERY_KEYS } from '.';

const fetchGroup = (id: string): Promise<Group> => axios.get(`/api/groups/${id}`).then((response) => response.data);
function fetchGroupOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroup, id],
    queryFn: () => fetchGroup(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  });
}

const fetchGroupProfile = (id: string): Promise<GroupProfile> =>
  axios.get(`/api/groups/${id}/profile`).then((response) => response.data);
function fetchGroupProfileOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroupProfile, id],
    queryFn: () => fetchGroupProfile(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  });
}

const fetchGroupMembers = (id: string): Promise<User[]> =>
  axios.get(`/api/groups/${id}/members`).then((response) => response.data);
function fetchGroupMembersOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroupMembers, id],
    queryFn: () => fetchGroupMembers(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
  });
}

const fetchGroupAdmins = (id: string): Promise<User[]> =>
  axios.get(`/api/groups/${id}/admins`).then((response) => response.data);
function fetchGroupAdminsOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.group.getGroupAdmins, id],
    queryFn: () => fetchGroupAdmins(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
    enabled: !!id,
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
export const useFetchGroup = (id: string) => useQuery(fetchGroupOptions(id));

export const useFetchGroupProfile = (id: string) => useQuery(fetchGroupProfileOptions(id));

export const useFetchGroupMembers = (id: string) => useQuery(fetchGroupMembersOptions(id));

export const useSearchGroups = ({ offset, pageSize, searchTerm }: SearchParams) => {
  return useInfiniteQuery(searchGroupsOptions(offset, pageSize, searchTerm));
};

export const useCreateGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (newGroup: CreateNewGroupForm) => createGroup(newGroup),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, { id: data.id }], data);
      // The current user's groupId has changed as part of creating a new group
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.profile.getProfile] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useDeleteGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => deleteGroup(groupId),
    onSuccess: () => {
      // The current user's groupId has changed as part of deleting the group
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.profile.getProfile] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useUpdateGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, data }: { groupId: string; data: UpdateGroupForm }) => updateGroup(groupId, data),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, { id: data.id }], data);
      // The current user's group in the profile has changed
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.profile.getProfile] });
    },
  });
};

export const useRemoveMemberMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => removeMember(groupId, userId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupMembers] });
    },
  });
};

export const useAddAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => addAdmin(groupId, userId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupAdmins] });
    },
  });
};

export const useRemoveAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ groupId, userId }: GroupAndUserParams) => removeAdmin(groupId, userId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupAdmins] });
    },
  });
};
