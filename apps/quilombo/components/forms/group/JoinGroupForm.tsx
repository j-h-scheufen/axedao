'use client';

import { Button } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback } from 'react';

import ErrorText from '@/components/ErrorText';
import { type JoinGroupForm as FormType, joinGroupFormSchema } from '@/config/validation-schema';
import { useJoinGroup } from '@/hooks/useCurrentUser';
import GroupSelect from '../GroupSelect';

const JoinGroupForm = () => {
  const { joinGroup, error: joinGroupError } = useJoinGroup();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      return joinGroup(values.id);
    },
    [joinGroup]
  );

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    id: '',
  };

  return (
    <Formik<FormType> initialValues={initValues} validationSchema={joinGroupFormSchema} onSubmit={handleSubmit}>
      {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => (
        <Form>
          <Field name="id" label="Join a group" as={GroupSelect} placeholder="Search groups by name" />
          <ErrorText message={joinGroupError?.message} />
          <div className="mt-5 flex justify-between gap-3">
            <Button
              type="submit"
              className="w-full flex-1"
              color="primary"
              isLoading={isSubmitting}
              disabled={!dirty || !isValid}
            >
              Join group
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default JoinGroupForm;
