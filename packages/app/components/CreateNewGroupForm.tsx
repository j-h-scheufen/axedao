import { createNewGroupFormSchema } from '@/constants/schemas';
import { useCities, useCitiesActions, useIsLoadingCities } from '@/store/cities.store';
import { useCountries, useCountriesActions, useIsLoadingCountries } from '@/store/countries.store';
import { useCreateGroupError, useIsCreatingGroup, useProfileActions } from '@/store/profile.store';
import { cn } from '@/utils/tailwind';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Autocomplete, AutocompleteItem, Avatar, Spinner } from '@nextui-org/react';
import { ReactNode, useEffect, useState } from 'react';
import { useForm } from 'react-hook-form';
import ErrorText from './ErrorText';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };

const CreateNewGroupForm = ({ secondaryButton }: Props) => {
  const [selectedCountryCode, setSelectedCountryCode] = useState<string>('');

  const profileActions = useProfileActions();
  const isCreatingGroup = useIsCreatingGroup();
  const createGroupError = useCreateGroupError();

  const countries = useCountries();
  const countriesActions = useCountriesActions();
  const isLoadingCountries = useIsLoadingCountries();

  const cities = useCities();
  const citiesActions = useCitiesActions();
  const isLoadingCities = useIsLoadingCities();
  console.log(cities);

  useEffect(() => {
    countriesActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!selectedCountryCode) return;
    citiesActions.load(selectedCountryCode);
  }, [selectedCountryCode, citiesActions]);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(createNewGroupFormSchema),
  });

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
          label="Select country"
          isLoading={isLoadingCountries}
          onSelectionChange={(isoCode) => setSelectedCountryCode(isoCode?.toString() || '')}
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
          label="Select city"
          isLoading={isLoadingCities}
          disabled={!cities.length}
          classNames={{ base: cn({ 'pointer-events-none opacity-50': !cities.length }) }}
        >
          {cities.map((city, i) => {
            const { name } = city;
            return <AutocompleteItem key={i}>{name}</AutocompleteItem>;
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
