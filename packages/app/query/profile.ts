import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { UserProfile } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchProfile = (): Promise<UserProfile> => axios.get('/api/profile').then((response) => response.data);
function fetchProfileOptions() {
  return queryOptions({
    queryKey: [QUERY_KEYS.profile.getProfile],
    queryFn: () => fetchProfile(),
  });
}

const joinGroup = (groupId: string): Promise<UserProfile> =>
  axios.post(`/api/profile/group/${groupId}`).then((response) => response.data);

const leaveGroup = (groupId: string): Promise<UserProfile> =>
  axios.delete(`/api/profile/group/${groupId}`).then((response) => response.data);

export const useFetchProfile = () => {
  return useQuery(fetchProfileOptions());
};

export const useJoinGroup = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => joinGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.profile.getProfile], data);
    },
  });
};

export const useLeaveGroup = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (groupId: string) => leaveGroup(groupId),
    onSuccess: (data) => {
      queryClient.setQueryData([QUERY_KEYS.profile.getProfile], data);
    },
  });
};
