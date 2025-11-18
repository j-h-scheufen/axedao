import { queryOptions, useQuery } from '@tanstack/react-query';
import axios from '@/utils/axios';

import { QueryConfig } from '@/config/constants';
import type { GroupLocationFeatureCollection } from '@/types/model';
import { QUERY_KEYS } from './index';

// Fetch all locations for map view
const fetchLocations = async (): Promise<GroupLocationFeatureCollection> =>
  axios.get('/api/locations').then((response) => response.data);

export const fetchLocationsOptions = () => ({
  queryKey: [QUERY_KEYS.location.getLocations],
  queryFn: fetchLocations,
  staleTime: QueryConfig.staleTimeDefault,
});

export const useFetchLocations = () => useQuery(queryOptions(fetchLocationsOptions()));
