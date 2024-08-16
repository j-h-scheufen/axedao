import ErrorText from '@/components/ErrorText';
import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Autocomplete, AutocompleteItem, Avatar } from '@nextui-org/react';
import { SearchIcon } from 'lucide-react';
import { Controller } from 'react-hook-form';
import useNewGroupForm from '../_hooks/useNewGroupForm';

const CreateNewGroupForm = () => {
  const {
    form: {
      register,
      control,
      handleSubmit,
      formState: { errors },
    },
    selectedCountryCode,
    setSelectedCountryCode,
    setCitySearchTerm,
    // selectedCity,
    setSelectedCityName,
    profileActions,
    isCreatingGroup,
    createGroupError,
    countries,
    isLoadingCountries,
    cities,
    isLoadingCities,
  } = useNewGroupForm();

  return (
    <form
      onSubmit={handleSubmit((values) => {
        return profileActions.createGroup({
          ...values,
          country: countries.find((country) => country.isoCode === values.country)!.name,
        });
      })}
    >
      <div className="mb-5">
        <Input
          {...register('name')}
          label="Name"
          placeholder="Enter group's name"
          errorMessage={errors?.name?.message?.toString()}
          color={!!errors?.name ? 'danger' : undefined}
          classNames={{ inputWrapper: '!min-h-12' }}
        />
      </div>
      <div className="flex gap-3">
        <Controller
          name="country"
          control={control}
          render={({ field, fieldState: { error } }) => {
            const { ref, onChange } = field;
            return (
              <Autocomplete
                ref={ref}
                size="sm"
                className="max-w-xs"
                label="Search country"
                isLoading={isLoadingCountries}
                listboxProps={{ emptyContent: isLoadingCountries ? 'Loading...' : 'No countries found' }}
                onSelectionChange={(isoCode) => {
                  onChange(isoCode);
                  setSelectedCountryCode(isoCode?.toString() || '');
                }}
                startContent={<SearchIcon className="h-4 w-4" />}
                inputProps={{
                  color: error?.message ? 'danger' : undefined,
                  description: error?.message ? <span className="text-danger">{error.message}</span> : undefined,
                }}
              >
                {countries.map((country) => {
                  const { name, isoCode } = country;
                  return (
                    <AutocompleteItem
                      key={isoCode}
                      startContent={
                        <Avatar
                          alt={name}
                          className="w-6 h-6"
                          src={`https://flagcdn.com/${isoCode.toLowerCase()}.svg`}
                        />
                      }
                    >
                      {name}
                    </AutocompleteItem>
                  );
                })}
              </Autocomplete>
            );
          }}
        />
        <Controller
          name="city"
          control={control}
          render={({ field, fieldState: { error } }) => {
            const { ref, onChange } = field;
            return (
              <Autocomplete
                ref={ref}
                size="sm"
                className="max-w-xs"
                label="Search cities"
                isLoading={isLoadingCities}
                listboxProps={{ emptyContent: isLoadingCities ? 'Loading...' : 'No cities found' }}
                disabled={!selectedCountryCode}
                classNames={{ base: cn({ 'pointer-events-none opacity-50': !cities.length }) }}
                onInputChange={setCitySearchTerm}
                onSelectionChange={(cityName) => {
                  onChange(cityName);
                  setSelectedCityName(cityName?.toString() || '');
                }}
                startContent={<SearchIcon className="h-4 w-4" />}
                inputProps={{
                  color: error?.message ? 'danger' : undefined,
                  description: error?.message ? <span className="text-danger">{error.message}</span> : undefined,
                }}
              >
                {cities.map((city) => {
                  const { name } = city;
                  return <AutocompleteItem key={name}>{name}</AutocompleteItem>;
                })}
              </Autocomplete>
            );
          }}
        />
      </div>
      <ErrorText message={createGroupError} />
      <div className="mt-5 flex justify-between gap-3">
        <Button type="submit" className="w-full flex-1" isLoading={isCreatingGroup}>
          Create group
        </Button>
      </div>
    </form>
  );
};
export default CreateNewGroupForm;
