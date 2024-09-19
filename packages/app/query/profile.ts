import { queryOptions, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import { UserProfile } from '@/types/model';

export const QUERY_KEYS = {
  getProfile: 'getProfile',
  updateProfile: 'updateProfile',
} as const;

const fetchProfile = (): Promise<UserProfile> => axios.get('/api/profile').then((response) => response.data);

function fetchProfileOptions() {
  return queryOptions({
    queryKey: [QUERY_KEYS.getProfile],
    queryFn: () => fetchProfile(),
  });
}

export const useFetchProfile = () => {
  return useQuery(fetchProfileOptions());
};
