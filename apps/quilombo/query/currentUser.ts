import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

import type { ProfileForm } from '@/config/validation-schema';
import type { AuthMethods, Group, User } from '@/types/model';
import { useSession } from 'next-auth/react';
import type { FileUploadParams, UseFileUploadMutation } from '.';
import { QUERY_KEYS } from '.';

const fetchCurrentUser = (): Promise<User> => axios.get('/api/profile').then((response) => response.data);
// The userId is not required to call the endpoint (which automatically uses the session user), but needed to
// avoid the query running without a session. It currently results in the server redirecting to the login page and
// returning that as a valid response.
// TODO this needs a better solution in middleware to return the error status code instead of redirecting on API.
export const fetchCurrentUserOptions = (userId: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.currentUser.getUser],
    queryFn: () => fetchCurrentUser(),
    enabled: !!userId,
  } as const;
};

const fetchAuthMethods = (): Promise<AuthMethods> => axios.get('/api/auth/methods').then((response) => response.data);

export const fetchAuthMethodsOptions = (userId: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.currentUser.getAuthMethods],
    queryFn: () => fetchAuthMethods(),
    enabled: !!userId,
  } as const;
};

const updateCurrentUser = async (data: ProfileForm): Promise<User> =>
  axios.patch('/api/profile', data).then((response) => response.data);

// Note: Join/leave group functionality has been removed.
// Group membership is now handled via genealogy statements (member_of predicate).
// See the genealogy API endpoints for membership management.

export const updateAvatar = async ({ file }: FileUploadParams): Promise<User> => {
  const data = new FormData();
  if (file) {
    data.set('file', file);
    return axios
      .post('/api/profile/avatar', data, { headers: { 'Content-Type': 'multipart/form-data' } })
      .then((response) => response.data);
  }
  return axios.delete('/api/profile/avatar').then((response) => response.data);
};

// HOOKS
export const useFetchCurrentUser = () => {
  const { data: session } = useSession();
  return useQuery(queryOptions(fetchCurrentUserOptions(session?.user.id)));
};

export const useFetchAuthMethods = () => {
  const { data: session } = useSession();
  return useQuery(queryOptions(fetchAuthMethodsOptions(session?.user.id)));
};

export const useUpdateCurrentUserMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (data: ProfileForm) => updateCurrentUser(data),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.currentUser.getUser], data);
      queryClient.invalidateQueries({
        queryKey: [QUERY_KEYS.user.searchUsers],
        exact: false, // invalidate all searchUsers queries regardless of the search term
      });
    },
  });
};

// Note: useJoinGroupMutation and useLeaveGroupMutation have been removed.
// Group membership is now handled via genealogy statements (member_of predicate).

export const useUpdateAvatarMutation: UseFileUploadMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: FileUploadParams) => updateAvatar(params),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.currentUser.getUser], data);
      queryClient.invalidateQueries({
        queryKey: [QUERY_KEYS.user.searchUsers],
        exact: false,
      });
    },
  });
};

// User's group associations (admin groups and member groups)
export type UserGroupsResponse = {
  adminGroups: Group[];
  memberGroups: Group[];
};

const fetchUserGroups = (): Promise<UserGroupsResponse> =>
  axios.get('/api/profile/groups').then((response) => response.data);

export const fetchUserGroupsOptions = (userId: string | undefined) => {
  return {
    queryKey: [QUERY_KEYS.currentUser.getGroups],
    queryFn: () => fetchUserGroups(),
    enabled: !!userId,
  } as const;
};

export const useFetchUserGroups = () => {
  const { data: session } = useSession();
  return useQuery(queryOptions(fetchUserGroupsOptions(session?.user.id)));
};
