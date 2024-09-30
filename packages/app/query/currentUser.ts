import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { ProfileForm } from '@/config/validation-schema';
import { User } from '@/types/model';
import { useSession } from 'next-auth/react';
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

const updateCurrentUser = async (data: ProfileForm): Promise<User> =>
  axios.patch(`/api/profile`, data).then((response) => response.data);

const joinGroup = (groupId: string): Promise<User> =>
  axios.put(`/api/profile/group/${groupId}`).then((response) => response.data);

const leaveGroup = (groupId: string): Promise<User> =>
  axios.delete(`/api/profile/group/${groupId}`).then((response) => response.data);

// HOOKS
export const useFetchCurrentUser = () => {
  const { data: session } = useSession();
  return useQuery(queryOptions(fetchCurrentUserOptions(session?.user.id)));
};

export const useUpdateCurrentUserMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (data: ProfileForm) => updateCurrentUser(data),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.currentUser.getUser], data);
    },
  });
};

export const useJoinGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => joinGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.currentUser.getUser], data);
    },
  });
};

export const useLeaveGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => leaveGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.currentUser.getUser], data);
    },
  });
};
