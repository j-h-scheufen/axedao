import useNewGroupForm from '@/hooks/useNewGroupForm';
import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Autocomplete, AutocompleteItem, Avatar, Spinner } from '@nextui-org/react';
import { SearchIcon } from 'lucide-react';
import { ReactNode } from 'react';
import ErrorText from './ErrorText';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };

const CreateNewGroupForm = ({ secondaryButton }: Props) => {
  const {
    form: {
      register,
      handleSubmit,
      formState: { errors },
    },
    selectedCountryCode,
    setSelectedCountryCode,
    setCitySearchTerm,
    // selectedCity,
    setSelectedCity,
    profileActions,
    isCreatingGroup,
    createGroupError,
    countries,
    isLoadingCountries,
    cities,
    isLoadingCities,
  } = useNewGroupForm();

  return (
    <form onSubmit={handleSubmit(profileActions.createGroup)}>
      <div className="mb-5">
        <Input
          {...register('name')}
          label="Name"
          placeholder="Enter group's name"
          errorMessage={errors?.name?.message}
          color={!!errors?.name ? 'danger' : undefined}
        />
      </div>
      <div className="flex gap-3">
        <Autocomplete
          size="sm"
          className="max-w-xs"
          label="Search country"
          isLoading={isLoadingCountries}
          onSelectionChange={(isoCode) => setSelectedCountryCode(isoCode?.toString() || '')}
          startContent={<SearchIcon className="h-4 w-4" />}
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
          size="sm"
          className="max-w-xs"
          label="Search cities"
          isLoading={isLoadingCities}
          disabled={!selectedCountryCode}
          classNames={{ base: cn({ 'pointer-events-none opacity-50': !cities.length }) }}
          onInputChange={setCitySearchTerm}
          onSelectionChange={(city) => setSelectedCity(city?.toString() || '')}
          startContent={<SearchIcon className="h-4 w-4" />}
        >
          {cities.map((city) => {
            const { name } = city;
            return <AutocompleteItem key={name}>{name}</AutocompleteItem>;
          })}
        </Autocomplete>
      </div>
      <ErrorText message={createGroupError} />
      <div className="mt-5 flex justify-between gap-3">
        {secondaryButton && secondaryButton}
        <Button type="submit" className="w-full flex-1" isLoading={isCreatingGroup} spinner={<Spinner size="sm" />}>
          Create group
        </Button>
      </div>
    </form>
  );
};
export default CreateNewGroupForm;
