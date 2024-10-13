import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';
import { useCallback } from 'react';

import { CountrySelect, FieldInput } from '@/components/forms';
import { CreateNewGroupForm as FormType, createNewGroupFormSchema } from '@/config/validation-schema';
import useCountriesAndCities from '@/hooks/useCountriesAndCities';
import { useCreateGroup } from '@/hooks/useGroup';

const CreateNewGroupForm = () => {
  const { createGroup, error } = useCreateGroup();
  const { setSelectedCountryCode } = useCountriesAndCities();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      return createGroup(values);
    },
    [createGroup],
  );

  // NOTE: The initial form values MUST BE declared outside of JSX, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    name: '',
    country: '',
    city: '',
    verified: false,
  };

  return (
    <Formik<FormType> initialValues={initValues} onSubmit={handleSubmit} validationSchema={createNewGroupFormSchema}>
      {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => {
        return (
          <Form className="flex flex-col gap-3 mb-5">
            <Field name="name" label="Name" as={FieldInput} />
            <Field
              name="country"
              label="Country"
              as={CountrySelect}
              onSelect={(value: string) => setSelectedCountryCode(value)}
            />
            {error && <div className="text-danger">{error.message}</div>}
            {/* NOTE: CitySelect component has performance problems. Not using right now */}
            {/* <Field
              name="city"
              label="City"
              as={CitySelect}
              cities={cities}
              onInputChange={setCitySearch}
              isDisabled={!selectedCountryCode || isLoading}
              isLoading={isLoading}
            /> */}
            <div className="mt-5 flex justify-between gap-3">
              <Button
                type="submit"
                className="w-full flex-1"
                color="primary"
                isLoading={isSubmitting}
                disabled={!dirty || !isValid}
              >
                Create group
              </Button>
            </div>
          </Form>
        );
      }}
    </Formik>
  );
};

export default CreateNewGroupForm;
