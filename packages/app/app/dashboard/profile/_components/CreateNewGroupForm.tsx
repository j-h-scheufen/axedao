import ErrorText from '@/components/ErrorText';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { AutocompleteProps } from '@nextui-org/react';
import { useController } from 'react-hook-form';
import useNewGroupForm from '../_hooks/useNewGroupForm';
import GroupLocation from '@/components/GroupLocation';

const CreateNewGroupForm = () => {
  const {
    form: {
      control,
      register,
      handleSubmit,
      formState: { errors },
    },
    profileActions,
    isCreatingGroup,
    createGroupError,
  } = useNewGroupForm();

  const locationProps = {
    labelPlacement: 'inside' as const,
    className: 'w-full',
  };

  const { field: countriesField } = useController({
    control,
    name: 'country'
  })
  const countriesProps: Omit<AutocompleteProps, 'children'> = {
    ref: countriesField.ref,
    name: countriesField.name,
    onBlur: countriesField.onBlur,
    label: 'Countries',
    placeholder: 'Search...',
    ...locationProps
  }
  const countriesError = errors.country;

  const { field: citiesField } = useController({
    control,
    name: 'city'
  })
  const citiesProps: Omit<AutocompleteProps, 'children'> = {
    ref: citiesField.ref,
    name: citiesField.name,
    onBlur: citiesField.onBlur,
    label: 'Cities',
    placeholder: 'Search...',
    disabled: !countriesField.value,
    ...locationProps
  };
  const citiesError = errors.city;

  return (
    <form
      onSubmit={handleSubmit((values) => {
        return profileActions.createGroup(values);
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
        <GroupLocation
          onCountryChange={country => {
            countriesField.onChange(country ? country.name : undefined);
          }}
          onCityChange={city => {
            if (city) {
              const { name, stateCode } = city
              let cityName = name;
              if (stateCode) cityName += `, ${stateCode}`
              citiesField.onChange(cityName);
            } else {
              citiesField.onChange(undefined);
            }
          }}
          countriesProps={countriesProps}
          countriesError={countriesError}
          citiesProps={citiesProps}
          citiesError={citiesError}
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
