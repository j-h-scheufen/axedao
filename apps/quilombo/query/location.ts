import { queryOptions, useQuery } from '@tanstack/react-query';
import axios from 'axios';

import type { City, Country, SearchCitiesParams } from '@/types/model';
import { QUERY_KEYS } from '.';

const fetchCountries = (): Promise<Country[]> => {
  return axios.get('/api/location/countries').then((response) => response.data);
};
const fetchCities = (countryCode: string, citySearchTerm?: string): Promise<City[]> => {
  const query: SearchCitiesParams = { countryCode: countryCode || '', searchTerm: citySearchTerm || '' };
  const queryParams = new URLSearchParams(query);
  return axios.get(`/api/location/cities?${queryParams}`).then((response) => response.data);
};

function fetchCountriesOptions() {
  return queryOptions({
    queryKey: [QUERY_KEYS.location.getCountries],
    queryFn: () => fetchCountries(),
    staleTime: Infinity,
  });
}
function fetchCitiesOptions(countryCode: string, citySearchTerm?: string) {
  return queryOptions({
    queryKey: [QUERY_KEYS.location.getCities, countryCode, citySearchTerm],
    queryFn: () => fetchCities(countryCode, citySearchTerm),
    enabled: !!countryCode,
  });
}

export const useFetchCountries = () => {
  return useQuery(fetchCountriesOptions());
};

export const useFetchCities = (countryCode: string, citySearchTerm?: string) => {
  return useQuery(fetchCitiesOptions(countryCode, citySearchTerm));
};
