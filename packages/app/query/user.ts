import { queryOptions, useQuery } from '@tanstack/react-query';

import { User } from '@/types/model';
import axios from 'axios';

export const QUERY_KEYS = {
  getUser: 'getUser',
  updateUser: 'updateUser',
} as const;

const fetchUser = (id: string): Promise<User> =>
  axios.get(`/api/users/${id}`).then((response) => {
    console.log('ID: ', id);
    console.log('Res:', response);
    return response.data;
  });

function fetchUserOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.getUser, id],
    queryFn: () => fetchUser(id),
    staleTime: 1000 * 60 * 15,
  });
}

export const useFetchUser = (id: string) => {
  return useQuery(fetchUserOptions(id));
};
