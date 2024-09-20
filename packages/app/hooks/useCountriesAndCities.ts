import { debounce } from 'lodash';
import { useEffect, useState } from 'react';

import { useFetchCities, useFetchCountries } from '@/query/location';

const useCountriesAndCities = () => {
  const [selectedCountryCode, setSelectedCountryCode] = useState<string | undefined>(undefined);
  const [citySearchTerm, setCitySearchTerm] = useState<string | undefined>(undefined);
  const { data: countries, error: countriesError } = useFetchCountries();
  const {
    data: cities,
    error: citiesError,
    isLoading,
    refetch: refetchCities,
  } = useFetchCities(selectedCountryCode ?? '', citySearchTerm);

  useEffect(() => {
    if (selectedCountryCode) refetchCities();
    return () => {
      setSelectedCountryCode(undefined);
      setCitySearchTerm(undefined);
    };
  }, [selectedCountryCode]);

  const setCitySearch = debounce((cityName: string) => setCitySearchTerm(cityName), 1000);

  return {
    countries,
    countriesError,
    cities,
    citiesError,
    selectedCountryCode,
    setSelectedCountryCode,
    setCitySearch,
    isLoading,
  };
};

export default useCountriesAndCities;
