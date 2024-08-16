import useGroupLocation from '@/hooks/useGroupLocation';
import { City } from '@/store/cities.store';
import { Country } from '@/store/countries.store';
import { Autocomplete, AutocompleteItem, AutocompleteProps, Avatar } from '@nextui-org/react';
import { isNil } from 'lodash';
import { FieldError } from 'react-hook-form';

type Props = {
  onCountryChange: (country: Country | null) => void;
  onCityChange: (city: City | null) => void;
  countriesError?: FieldError;
  citiesError?: FieldError;
  countriesProps?: Omit<AutocompleteProps, 'children'>;
  citiesProps?: Omit<AutocompleteProps, 'children'>;
};
const GroupLocation = ({
  onCountryChange,
  onCityChange,
  countriesError,
  citiesError,
  countriesProps,
  citiesProps,
}: Props) => {
  const {
    selectedCountryCode,
    setSelectedCountryCode,
    setCitySearchTerm,
    setSelectedCityName,
    countries,
    isLoadingCountries,
    cities,
    isLoadingCities,
  } = useGroupLocation();

  return (
    <>
      <Autocomplete
        {...countriesProps}
        isLoading={isLoadingCountries}
        listboxProps={{ emptyContent: isLoadingCountries ? 'Loading...' : 'No countries found' }}
        inputProps={{
          color: countriesError?.message ? 'danger' : undefined,
          description: countriesError?.message ? (
            <span className="text-danger">{countriesError.message}</span>
          ) : undefined,
          classNames: { input: 'truncate' },
        }}
        popoverProps={{
          placement: 'bottom',
        }}
        onSelectionChange={(isoCode) => {
          onCountryChange(isoCode ? countries.find((c) => c.isoCode === isoCode)! : null);
          setSelectedCountryCode(isoCode?.toString() || '');
        }}
      >
        {countries.map((country) => {
          const { name, isoCode } = country;
          return (
            <AutocompleteItem
              key={isoCode}
              startContent={
                <Avatar alt={name} className="w-6 h-6" src={`https://flagcdn.com/${isoCode.toLowerCase()}.svg`} />
              }
            >
              {name}
            </AutocompleteItem>
          );
        })}
      </Autocomplete>
      <Autocomplete
        {...citiesProps}
        isLoading={isLoadingCities}
        listboxProps={{ emptyContent: isLoadingCities ? 'Loading...' : 'No cities found' }}
        disabled={!selectedCountryCode}
        onInputChange={setCitySearchTerm}
        inputProps={{
          color: citiesError?.message ? 'danger' : undefined,
          description: citiesError?.message ? <span className="text-danger">{citiesError.message}</span> : undefined,
          classNames: { input: 'truncate' },
        }}
        popoverProps={{
          placement: 'bottom',
        }}
        onSelectionChange={(index) => {
          if (!isNil(index)) {
            const city = cities[Number(index)];
            onCityChange(city);
            setSelectedCityName(city.name);
          } else {
            onCityChange(null);
            setSelectedCityName('');
          }
        }}
      >
        {cities.map((city, index) => {
          const { name } = city;
          return <AutocompleteItem key={index}>{name}</AutocompleteItem>;
        })}
      </Autocomplete>
    </>
  );
};
export default GroupLocation;
