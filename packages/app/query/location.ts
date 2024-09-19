import { queryOptions, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import { City, SearchCitiesQuery } from '@/types/model';

export const QUERY_KEYS = {
  getCities: 'getCities',
} as const;

const fetchCities = (countryCode: string, citySearchTerm?: string): Promise<City[]> => {
  const query: SearchCitiesQuery = { countryCode: countryCode || '', searchTerm: citySearchTerm || '' };
  const queryParams = new URLSearchParams(query);
  return axios.get(`/api/location/cities?${queryParams}`).then((response) => response.data);
};

function fetchCitiesOptions(countryCode: string, citySearchTerm?: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.getCities, countryCode, citySearchTerm],
    queryFn: () => fetchCities(countryCode, citySearchTerm),
  });
}

export const useFetchCities = (countryCode: string, citySearchTerm?: string) => {
  return useQuery(fetchCitiesOptions(countryCode, citySearchTerm));
};
