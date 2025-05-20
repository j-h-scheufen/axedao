import { Autocomplete, AutocompleteItem, AutocompleteProps } from '@nextui-org/autocomplete';
import { Avatar } from '@nextui-org/avatar';

import useCountriesAndCities from '@/hooks/useCountriesAndCities';
import { City, Country } from '@/types/model';
import { cn } from '@/utils/tailwind';

type Props = {
  onCountryChange: (country: Country | null) => void;
  onCityChange: (city: City | null) => void;
  countriesProps?: Omit<AutocompleteProps, 'children'>;
  citiesProps?: Omit<AutocompleteProps, 'children'>;
};
const GroupLocation = ({ onCountryChange, onCityChange, countriesProps, citiesProps }: Props) => {
  const { countries, selectedCountryCode, setSelectedCountryCode, setCitySearch, cities } = useCountriesAndCities();
  return (
    <>
      <Autocomplete
        {...countriesProps}
        inputProps={{
          classNames: { input: 'truncate' },
        }}
        popoverProps={{
          placement: 'bottom',
        }}
        onSelectionChange={(isoCode) => {
          onCountryChange(isoCode && countries ? countries.find((c) => c.isoCode === isoCode)! : null);
          setSelectedCountryCode(isoCode?.toString() || '');
        }}
      >
        {countries !== undefined ? (
          countries.map((country) => {
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
          })
        ) : (
          <></>
        )}
      </Autocomplete>
      <Autocomplete
        {...citiesProps}
        className={cn(citiesProps?.className, {
          'opacity-70 pointer-events-none': !selectedCountryCode,
        })}
        disabled={!selectedCountryCode}
        onInputChange={setCitySearch}
        inputProps={{
          classNames: { input: 'truncate' },
        }}
        popoverProps={{
          placement: 'bottom',
        }}
        onSelectionChange={(index) => {
          if (index) {
            const city = cities![Number(index)];
            onCityChange(city);
          } else {
            onCityChange(null);
          }
        }}
      >
        {cities !== undefined ? (
          cities.map((city, index) => {
            const { name, stateCode } = city;
            let cityName = name;
            if (stateCode) cityName += `, ${stateCode}`;
            return <AutocompleteItem key={index}>{cityName}</AutocompleteItem>;
          })
        ) : (
          <></>
        )}
      </Autocomplete>
    </>
  );
};
export default GroupLocation;
