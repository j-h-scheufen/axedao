import { Autocomplete, AutocompleteItem } from '@heroui/react';
import { Avatar } from '@heroui/react';
import { FieldProps, useField } from 'formik';
import { useState } from 'react';

import useCountriesAndCities from '@/hooks/useCountriesAndCities';
import { Country } from '@/types/model';
import { SearchIcon } from '../icons';

type CountrySelectProps = FieldProps['field'] & {
  onSelect?: (value?: string) => void;
};

/**
 * Wrapper for an AutoComplete that displays a list of countries with flags.
 * Countries are fetched from the store. Pass onSelect to get the selected country's icoCode.
 * @param onSelect Called on selection change to return the country's isoCode.
 * @param props The props that were passed to the Field component.
 */
const CountrySelect = ({ onSelect, ...props }: CountrySelectProps) => {
  const [field, , form] = useField(props);
  const [selectedValue, setSelectedValue] = useState<string | undefined>(undefined);
  const { countries, countriesError } = useCountriesAndCities();
  return countriesError ? (
    <div className="text-warning-500">{countriesError.message}</div>
  ) : (
    <Autocomplete
      {...field}
      defaultItems={countries || []}
      variant="bordered"
      labelPlacement="outside"
      className="w-full"
      placeholder="Select Country ..."
      menuTrigger="focus"
      inputProps={{
        classNames: { input: 'truncate' },
      }}
      popoverProps={{ backdrop: 'blur' }}
      startContent={
        selectedValue ? (
          <Avatar className="w-5 h-5" src={`https://flagcdn.com/${selectedValue.toLowerCase()}.svg`} />
        ) : (
          <SearchIcon className="text-default-400" strokeWidth={2.5} size={20} />
        )
      }
      onSelectionChange={(key) => {
        const isoCode = key?.toString();
        form.setValue(isoCode);
        setSelectedValue(isoCode);
        onSelect?.(isoCode);
      }}
      {...props}
    >
      {({ name, isoCode }: Country) => (
        <AutocompleteItem
          key={isoCode}
          aria-label={`Country Option Code ${isoCode}`}
          startContent={
            <Avatar alt={name} className="w-6 h-6" src={`https://flagcdn.com/${isoCode.toLowerCase()}.svg`} />
          }
        >
          {name}
        </AutocompleteItem>
      )}
    </Autocomplete>
  );
};

export default CountrySelect;
