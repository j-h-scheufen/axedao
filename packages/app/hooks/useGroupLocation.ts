import { SearchCitiesQuery, useCities, useCitiesActions, useIsLoadingCities } from '@/store/cities.store';
import { useCountries, useCountriesActions, useIsLoadingCountries } from '@/store/countries.store';
import { isEqual } from 'lodash';
import { useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

const useGroupLocation = () => {
  const [selectedCountryCode, setSelectedCountryCode] = useState<string>('');
  const [selectedCityName, setSelectedCityName] = useState<string>('');
  const [citySearchTerm, setCitySearchTerm] = useState<string>('');
  const [debouncedCitySearchTerm] = useDebounce(citySearchTerm, 500);

  const countries = useCountries();
  const countriesActions = useCountriesActions();
  const isLoadingCountries = useIsLoadingCountries();

  const lastQueryRef = useRef<SearchCitiesQuery | null>(null);

  const cities = useCities();
  const citiesActions = useCitiesActions();
  const isLoadingCities = useIsLoadingCities();

  useEffect(() => {
    countriesActions.initialize();
  }, [countriesActions]);

  useEffect(() => {
    const lastQuery = lastQueryRef.current;
    const query: SearchCitiesQuery = JSON.parse(
      JSON.stringify({
        countryCode: selectedCountryCode,
        searchTerm: debouncedCitySearchTerm ? debouncedCitySearchTerm.split(',')[0] : undefined,
      }),
    );
    if (
      !selectedCountryCode ||
      isEqual(lastQuery, query) ||
      (selectedCityName && debouncedCitySearchTerm === selectedCityName)
    )
      return;
    citiesActions.search(query);
    lastQueryRef.current = query;
  }, [selectedCountryCode, citiesActions, debouncedCitySearchTerm, lastQueryRef, selectedCityName]);

  return {
    selectedCountryCode,
    setSelectedCountryCode,
    citySearchTerm,
    setCitySearchTerm,
    selectedCityName,
    setSelectedCityName,
    countries,
    countriesActions,
    isLoadingCountries,
    cities,
    citiesActions,
    isLoadingCities,
  };
};

export default useGroupLocation;
