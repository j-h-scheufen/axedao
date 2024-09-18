import { queryOptions, useQuery } from '@tanstack/react-query';

import { QUERY_DEFAULT_STALE_TIME_MINUTES } from '@/config/constants';
import { Group } from '@/types/model';
import axios from 'axios';

export const QUERY_KEYS = {
  getGroup: 'getGroup',
  updateGroup: 'updateGroup',
} as const;

const fetchGroup = (id: string): Promise<Group> => axios.get(`/api/groups/${id}`).then((response) => response.data);

function fetchGroupOptions(id: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.getGroup, id],
    queryFn: () => fetchGroup(id),
    staleTime: 1000 * 60 * QUERY_DEFAULT_STALE_TIME_MINUTES,
  });
}

export const useFetchGroup = (id: string) => {
  return useQuery(fetchGroupOptions(id));
};
