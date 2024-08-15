import { createNewGroupFormSchema } from '@/app/dashboard/profile/schema';
import { useCreateGroupError, useIsCreatingGroup, useProfileActions } from '@/app/dashboard/profile/store';
import { SearchCitiesQuery, useCities, useCitiesActions, useIsLoadingCities } from '@/store/cities.store';
import { useCountries, useCountriesActions, useIsLoadingCountries } from '@/store/countries.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { isEqual } from 'lodash';
import { useEffect, useRef, useState } from 'react';
import { useForm } from 'react-hook-form';
import { useDebounce } from 'use-debounce';

const useNewGroupForm = () => {
  const [selectedCountryCode, setSelectedCountryCode] = useState<string>('');
  const [selectedCity, setSelectedCity] = useState<string>('');
  const [citySearchTerm, setCitySearchTerm] = useState<string>('');
  const [debouncedCitySearchTerm] = useDebounce(citySearchTerm, 500);

  const lastQueryRef = useRef<SearchCitiesQuery | null>(null);

  const profileActions = useProfileActions();

  const isCreatingGroup = useIsCreatingGroup();
  const createGroupError = useCreateGroupError();

  const countries = useCountries();
  const countriesActions = useCountriesActions();
  const isLoadingCountries = useIsLoadingCountries();

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
        searchTerm: debouncedCitySearchTerm || undefined,
      }),
    );
    if (!selectedCountryCode || isEqual(lastQuery, query) || (selectedCity && debouncedCitySearchTerm === selectedCity))
      return;
    citiesActions.search(query);
    lastQueryRef.current = query;
  }, [selectedCountryCode, citiesActions, debouncedCitySearchTerm, lastQueryRef, selectedCity]);

  const form = useForm({
    resolver: yupResolver(createNewGroupFormSchema),
  });

  return {
    form,
    selectedCountryCode,
    setSelectedCountryCode,
    citySearchTerm,
    setCitySearchTerm,
    selectedCity,
    setSelectedCity,
    profileActions,
    isCreatingGroup,
    createGroupError,
    countries,
    countriesActions,
    isLoadingCountries,
    cities,
    citiesActions,
    isLoadingCities,
  };
};

export default useNewGroupForm;
