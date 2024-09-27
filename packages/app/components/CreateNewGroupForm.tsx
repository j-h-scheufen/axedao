import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';

import { CountrySelect, FieldInput } from '@/components/forms';
import { CreateNewGroupForm as FormType, createNewGroupFormSchema } from '@/config/validation-schema';
import useCountriesAndCities from '@/hooks/useCountriesAndCities';
import { useCreateGroup } from '@/query/group';
import { useProfileActions } from '@/store/profile.store';

const CreateNewGroupForm = () => {
  const { mutateAsync: createGroup, error } = useCreateGroup();
  const { setSelectedCountryCode } = useCountriesAndCities();
  const { updateGroup } = useProfileActions();

  const handleSubmit = async (values: FormType) => {
    return createGroup(values).then((data) => updateGroup(data));
  };

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
