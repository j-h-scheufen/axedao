import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { ProfileForm } from '@/config/validation-schema';
import { UserProfile } from '@/types/model';
import { useSession } from 'next-auth/react';
import { QUERY_KEYS } from '.';

const fetchProfile = (): Promise<UserProfile> => axios.get('/api/profile').then((response) => response.data);
// The enable flag is to prevent calling the endpoint too early, because it's used in populating
// the JotaiProvider's store. Calling the endpoint without a user session would result in the server
// redirecting to the login page and returning that as a valid response.
// TODO needs a better solution in middleware to return the error status code instead of redirecting.
function fetchProfileOptions(enabled: boolean) {
  return queryOptions({
    queryKey: [QUERY_KEYS.profile.getProfile],
    queryFn: () => fetchProfile(),
    enabled,
  });
}

const updateProfile = async (data: ProfileForm): Promise<UserProfile> =>
  axios.patch(`/api/profile`, data).then((response) => response.data);

const joinGroup = (groupId: string): Promise<UserProfile> =>
  axios.put(`/api/profile/group/${groupId}`).then((response) => response.data);

const leaveGroup = (groupId: string): Promise<UserProfile> =>
  axios.delete(`/api/profile/group/${groupId}`).then((response) => response.data);

// HOOKS
export const useFetchProfile = () => {
  const { data: session } = useSession();
  return useQuery(fetchProfileOptions(!!session?.user.id));
};

export const useUpdateProfileMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (data: ProfileForm) => updateProfile(data),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.profile.getProfile], data);
    },
  });
};

export const useJoinGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => joinGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.profile.getProfile], data);
    },
  });
};

export const useLeaveGroupMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => leaveGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.profile.getProfile], data);
    },
  });
};
