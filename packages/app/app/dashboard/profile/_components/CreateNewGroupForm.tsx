import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikHelpers, FormikProps } from 'formik';

import { CitySelect, CountrySelect, FieldInput } from '@/components/forms';
import useCountriesAndCities from '@/hooks/useCountriesAndCities';
import { useProfileActions } from '@/store/profile.store';
import { createNewGroupFormSchema, CreateNewGroupFormType } from '../schema';

const CreateNewGroupForm = () => {
  const { createGroup } = useProfileActions();
  const { selectedCountryCode, setSelectedCountryCode, cities, setCitySearch, isLoading } = useCountriesAndCities();

  const handleSubmit = (values: CreateNewGroupFormType, { setSubmitting }: FormikHelpers<CreateNewGroupFormType>) => {
    try {
      console.log('Creating group with values:', values);
      return createGroup(values);
    } catch (error) {
      console.error('Error during group creation.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  // NOTE: The initial form values MUST BE declared outside of JSX, otherwise it can lead to hydration errors.
  const initValues: CreateNewGroupFormType = {
    name: '',
    country: '',
    city: '',
    verified: false,
  };

  return (
    <Formik<CreateNewGroupFormType>
      initialValues={initValues}
      onSubmit={handleSubmit}
      validationSchema={createNewGroupFormSchema}
    >
      {({ dirty, isValid, isSubmitting }: FormikProps<CreateNewGroupFormType>) => {
        return (
          <Form className="flex flex-col gap-3 mb-5">
            <Field name="name" label="Name" as={FieldInput} />
            <Field
              name="country"
              label="Country"
              as={CountrySelect}
              onSelect={(value: string) => setSelectedCountryCode(value)}
            />
            <Field
              name="city"
              label="City"
              as={CitySelect}
              cities={cities}
              onInputChange={setCitySearch}
              isDisabled={!selectedCountryCode || isLoading}
              isLoading={isLoading}
            />
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
