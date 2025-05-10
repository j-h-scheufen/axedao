import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { FieldProps, useField } from 'formik';

import { City } from '@/types/model';
import { Suspense } from 'react';
import { SearchIcon } from '../icons';

type CityProps = FieldProps['field'] & {
  cities: City[];
  onInputChange: (value: string) => void;
};

function isNumeric(value: string) {
  return /^-?\d+$/.test(value);
}
const getDisplayName = ({ name, stateCode }: City): string => {
  let cityName = name || '';
  if (!!stateCode && !isNumeric(stateCode)) cityName += ', ' + stateCode;
  return cityName;
};

/**
 * TODO: error handling to set error state for formik, filter function so we can use items?
 * @param props The that were passed to the Field component.
 */
const CountrySelect = ({ cities, onInputChange, ...props }: CityProps) => {
  const [field, , form] = useField(props);

  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Autocomplete
        {...field}
        defaultItems={cities}
        variant="bordered"
        labelPlacement="outside"
        className="w-full"
        placeholder="Select City ..."
        isLoading={!cities}
        menuTrigger="focus"
        inputProps={{
          classNames: { input: 'truncate' },
        }}
        popoverProps={{ backdrop: 'blur' }}
        startContent={<SearchIcon className="text-default-400" strokeWidth={2.5} size={20} />}
        onInputChange={onInputChange}
        onSelectionChange={(key) => {
          if (key) form.setValue(getDisplayName(cities[key as number]));
          else form.setValue(undefined);
        }}
        {...props}
      >
        {cities.map((city, index) => (
          <AutocompleteItem key={index} value={getDisplayName(city)}>
            {getDisplayName(city)}
          </AutocompleteItem>
        ))}
      </Autocomplete>
    </Suspense>
  );
};

export default CountrySelect;
