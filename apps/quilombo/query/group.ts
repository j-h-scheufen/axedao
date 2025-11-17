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
import type {
  CreateLocationForm,
  UpdateLocationForm,
  CreateNewGroupForm,
  GroupSearchParamsWithFilters,
  UpdateGroupForm,
  VerifyGroupForm,
  ClaimGroupForm,
} from '@/config/validation-schema';
import type { Group, GroupLocation, GroupSearchResult, User } from '@/types/model';
import { QUERY_KEYS } from './keys';
import type { FileUploadParams, GroupAndLocationParams, GroupAndUserParams, UseFileUploadMutation } from '.';

/**
 * Note that the various fetch options are exported as read-only objects in order to be used by atomWithQuery.
 * When used in useQuery hooks (e.g. useQuery, useInfiniteQuery), the options should be wrappped
 * into the queryOptions() function in order to take advantage of the added type safety and inference.
 */

const fetchGroup = async (id: string): Promise<Group> =>
  axios.get(`/api/groups/${id}`).then((response) => {
    const data = response.data;
    // Convert lastVerifiedAt from ISO string to Date object
    if (data.lastVerifiedAt) {
      data.lastVerifiedAt = new Date(data.lastVerifiedAt);
    }
    return data;
  });
export const fetchGroupOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroup, id],
    queryFn: async () => fetchGroup(id ?? ''),
    staleTime: QueryConfig.staleTimeGroup,
    enabled: !!id,
  } as const;
};

const fetchGroupMembers = async (id: string): Promise<User[]> =>
  axios.get(`/api/groups/${id}/members`).then((response) => response.data);
export const fetchGroupMembersOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroupMembers, id],
    queryFn: async () => fetchGroupMembers(id ?? ''),
    staleTime: QueryConfig.staleTimeGroupMembers,
    enabled: !!id,
  } as const;
};

const fetchGroupAdmins = async (id: string): Promise<string[]> =>
  axios.get(`/api/groups/${id}/admins`).then((response) => response.data);
export const fetchGroupAdminsOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroupAdmins, id],
    queryFn: async () => fetchGroupAdmins(id ?? ''),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!id,
  } as const;
};

const fetchGroupLocations = async (id: string): Promise<GroupLocation[]> =>
  axios.get(`/api/groups/${id}/locations`).then((response) => response.data);

export const fetchGroupLocationsOptions = (id: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.group.getGroupLocations, id],
    queryFn: async () => fetchGroupLocations(id ?? ''),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!id,
  } as const;
};

const fetchAvailableCountries = async (): Promise<{ countryCodes: string[] }> =>
  axios.get('/api/groups/countries').then((response) => response.data);

export const fetchAvailableCountriesOptions = {
  queryKey: [QUERY_KEYS.group.getAvailableCountries],
  queryFn: fetchAvailableCountries,
  staleTime: QueryConfig.staleTimeGroup, // Countries don't change often
} as const;

const searchGroups = async (params: GroupSearchParamsWithFilters): Promise<GroupSearchResult> => {
  return axios.post('/api/groups/search', params).then((response) => {
    const result = response.data;
    // Convert lastVerifiedAt from ISO string to Date object for each group
    result.data = result.data.map((group: Group) => ({
      ...group,
      lastVerifiedAt: group.lastVerifiedAt ? new Date(group.lastVerifiedAt) : null,
    }));
    return result;
  });
};

export const searchGroupsOptions = (params: GroupSearchParamsWithFilters) => {
  const { offset, pageSize, searchTerm, filters } = params;
  return {
    queryKey: [QUERY_KEYS.group.searchGroups, searchTerm, filters],
    queryFn: async ({ pageParam }: { pageParam: number }) =>
      searchGroups({ offset: pageParam, pageSize, searchTerm, filters }),
    initialPageParam: offset || 0,
    getNextPageParam: (lastPage: GroupSearchResult) => {
      if (lastPage.nextOffset === null || lastPage.nextOffset >= lastPage.totalCount) {
        return undefined;
      }
      return lastPage.nextOffset;
    },
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

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

const createGroupLocation = async (groupId: string, data: CreateLocationForm): Promise<GroupLocation[]> =>
  axios.post(`/api/groups/${groupId}/locations`, data).then((response) => response.data);

const updateGroupLocation = async (
  { groupId, locationId }: GroupAndLocationParams,
  data: UpdateLocationForm
): Promise<GroupLocation[]> =>
  axios.patch(`/api/groups/${groupId}/locations/${locationId}`, data).then((response) => response.data);

const deleteGroupLocation = async ({ groupId, locationId }: GroupAndLocationParams): Promise<GroupLocation[]> =>
  axios.delete(`/api/groups/${groupId}/locations/${locationId}`).then((response) => response.data);

export const updateLogo = async ({ ownerId, file }: FileUploadParams): Promise<User> => {
  const data = new FormData();
  const url = `/api/groups/${ownerId}/logo`;
  if (file) {
    data.set('file', file);
    return axios
      .post(url, data, { headers: { 'Content-Type': 'multipart/form-data' } })
      .then((response) => response.data);
  }
  return axios.delete(url).then((response) => response.data);
};

export const updateBanner = async ({ ownerId, file }: FileUploadParams): Promise<User> => {
  const data = new FormData();
  const url = `/api/groups/${ownerId}/banner`;
  if (file) {
    data.set('file', file);
    return axios
      .post(url, data, { headers: { 'Content-Type': 'multipart/form-data' } })
      .then((response) => response.data);
  }
  return axios.delete(url).then((response) => response.data);
};

// HOOKS
export const useFetchGroup = (id: string) => useQuery(queryOptions(fetchGroupOptions(id)));

export const useFetchGroupMembers = (id: string) => useQuery(queryOptions(fetchGroupMembersOptions(id)));

export const useFetchGroupAdmins = (id: string) => useQuery(queryOptions(fetchGroupAdminsOptions(id)));

export const useFetchGroupLocations = (id: string) => useQuery(queryOptions(fetchGroupLocationsOptions(id)));

export const useFetchAvailableCountries = () => useQuery(queryOptions(fetchAvailableCountriesOptions));

export const useSearchGroups = (params: GroupSearchParamsWithFilters) => {
  return useInfiniteQuery(infiniteQueryOptions(searchGroupsOptions(params)));
};

export const useCreateGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (newGroup: CreateNewGroupForm) => createGroup(newGroup),
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
    mutationFn: async (groupId: string) => deleteGroup(groupId),
    onSuccess: (_data, variables) => {
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
    mutationFn: async ({ groupId, data }: { groupId: string; data: UpdateGroupForm }) => updateGroup(groupId, data),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, variables.groupId], data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useRemoveMemberMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, userId }: GroupAndUserParams) => removeMember(groupId, userId),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupMembers, variables.groupId], data);
    },
  });
};

export const useAddAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, userId }: GroupAndUserParams) => addAdmin(groupId, userId),
    onSuccess: (_data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins, variables.groupId], _data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup, variables.groupId] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupMembers, variables.groupId] });
    },
  });
};

export const useRemoveAdminMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, userId }: GroupAndUserParams) => removeAdmin(groupId, userId),
    onSuccess: (_data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins, variables.groupId], _data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup, variables.groupId] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupMembers, variables.groupId] });
    },
  });
};

export const useCreateGroupLocationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, data }: { groupId: string; data: CreateLocationForm }) =>
      createGroupLocation(groupId, data),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupLocations, variables.groupId], data);
      // Invalidate locations since a new location was added
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.location.getLocations] });
    },
  });
};

export const useUpdateGroupLocationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, locationId, data }: GroupAndLocationParams & { data: UpdateLocationForm }) =>
      updateGroupLocation({ groupId, locationId }, data),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupLocations, variables.groupId], data);
      // Invalidate locations since a location was updated
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.location.getLocations] });
    },
  });
};

export const useDeleteGroupLocationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, locationId }: GroupAndLocationParams) => deleteGroupLocation({ groupId, locationId }),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroupLocations, variables.groupId], data);
      // Invalidate locations since a location was deleted
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.location.getLocations] });
    },
  });
};

export const useUpdateLogoMutation: UseFileUploadMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: FileUploadParams) => updateLogo(params),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, variables.ownerId], data);
    },
  });
};

export const useUpdateBannerMutation: UseFileUploadMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: FileUploadParams) => updateBanner(params),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, variables.ownerId], data);
    },
  });
};

// GROUP VERIFICATION AND CLAIMING

const verifyGroup = async (groupId: string, data: VerifyGroupForm): Promise<{ success: boolean }> =>
  axios.post(`/api/groups/${groupId}/verify`, data).then((response) => response.data);

const claimGroup = async (groupId: string, data: ClaimGroupForm): Promise<{ success: boolean }> =>
  axios.post(`/api/groups/${groupId}/claim`, data).then((response) => response.data);

export const useVerifyGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, data }: { groupId: string; data: VerifyGroupForm }) => verifyGroup(groupId, data),
    onSuccess: (_data, variables) => {
      // Invalidate the group query to refresh verification status and lastVerifiedAt
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup, variables.groupId] });
      // Invalidate search results to update verification badges
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};

export const useClaimGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ groupId, data }: { groupId: string; data: ClaimGroupForm }) => claimGroup(groupId, data),
    onSuccess: (_data, _variables) => {
      // Invalidate admin claims list if user is admin
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.admin.getClaims] });
    },
  });
};
