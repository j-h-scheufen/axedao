import { queryOptions, useQuery } from '@tanstack/react-query';

import { QueryConfig } from '@/config/constants';
import type { PublicStats } from '@/db';
import axios from '@/utils/axios';
import { QUERY_KEYS } from '.';

const fetchPublicStats = async (): Promise<PublicStats> => {
  const response = await axios.get('/api/stats');
  return response.data;
};

export const fetchPublicStatsOptions = {
  queryKey: [QUERY_KEYS.stats.publicStats],
  queryFn: fetchPublicStats,
  staleTime: QueryConfig.staleTimeDefault,
  refetchInterval: QueryConfig.staleTimeDefault,
  retry: 2,
} as const;

export const useFetchPublicStats = () => useQuery(queryOptions(fetchPublicStatsOptions));
