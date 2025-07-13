import { Button } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useRouter } from 'next/navigation';
import { useCallback } from 'react';

import { FieldInput } from '@/components/forms';
import { PATHS } from '@/config/constants';
import { type CreateNewGroupForm as FormType, createNewGroupFormSchema } from '@/config/validation-schema';
import { useCreateGroup } from '@/hooks/useGroup';

const CreateNewGroupForm = () => {
  const router = useRouter();
  const { createGroup, error } = useCreateGroup();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      return createGroup(values).then((group) => router.push(`${PATHS.groups}/${group.id}/edit`));
    },
    [createGroup, router]
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
            {error && <div className="text-danger">{error.message}</div>}
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
