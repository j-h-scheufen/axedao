import { queryOptions, useQuery } from '@tanstack/react-query';
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

export const useFetchProfile = () => {
  return useQuery(fetchProfileOptions());
};
