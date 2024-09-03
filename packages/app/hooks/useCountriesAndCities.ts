import axios from 'axios';
import { debounce } from 'lodash';
import { useEffect, useState } from 'react';

import { useCountriesActions } from '@/store/countries.store';
import { City } from '@/types/model';
import { generateErrorMessage } from '@/utils';

export type SearchCitiesQuery = { countryCode?: string; searchTerm?: string };

const useCountriesAndCities = () => {
  const [selectedCountryCode, setSelectedCountryCode] = useState<string | undefined>(undefined);
  const [citySearchTerm, setCitySearchTerm] = useState<string | undefined>(undefined);
  const [citiesError, setCitiesError] = useState<string>('');
  const [cities, setCities] = useState<City[]>([]);
  const { initialize: initializeCountries } = useCountriesActions();
  const [isLoading, setIsLoading] = useState<boolean>(false);

  const loadCities = async (countryCode: string) => {
    try {
      setIsLoading(true);
      const query: SearchCitiesQuery = { countryCode: countryCode || '', searchTerm: citySearchTerm || '' };
      const queryParams = new URLSearchParams(query);
      const { data: cities } = await axios.get(`/api/location/cities?${queryParams}`);
      setCities(cities);
    } catch (error) {
      const message = generateErrorMessage(error, 'An error occurred while fetching cities');
      console.error(message, error);
      setCitiesError('Unable to load cities');
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    initializeCountries();
    return () => {
      setSelectedCountryCode(undefined);
    };
  }, []);

  useEffect(() => {
    selectedCountryCode ? loadCities(selectedCountryCode) : setCities([]);
    return () => {
      setCities([]);
    };
  }, [selectedCountryCode]);

  const setCitySearch = debounce((cityName: string) => setCitySearchTerm(cityName), 1000);

  return {
    cities,
    citiesError,
    selectedCountryCode,
    setSelectedCountryCode,
    setCitySearch,
    isLoading,
  };
};

export default useCountriesAndCities;
