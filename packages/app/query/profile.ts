import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { ProfileForm } from '@/config/validation-schema';
import { UserProfile } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchProfile = (): Promise<UserProfile> => axios.get('/api/profile').then((response) => response.data);
function fetchProfileOptions() {
  return queryOptions({
    queryKey: [QUERY_KEYS.profile.getProfile],
    queryFn: () => fetchProfile(),
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
  return useQuery(fetchProfileOptions());
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
