'use client';

import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';

import ErrorText from '@/components/ErrorText';
import { joinGroupFormSchema, JoinGroupFormType } from '@/config/validation-schema';
import { useGroupsErrors } from '@/store/groups.store';
import { useProfileActions } from '@/store/profile.store';
import GroupSelect from './forms/GroupSelect';

const JoinGroupForm = () => {
  const { initializeGroupsError } = useGroupsErrors();

  const { joinGroup } = useProfileActions();

  const handleSubmit = async (values: JoinGroupFormType) => {
    try {
      return joinGroup(values.id);
    } catch (error) {
      console.error('Error during registration.', error);
      throw error;
    }
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: JoinGroupFormType = {
    id: '',
  };

  return (
    <Formik<JoinGroupFormType>
      initialValues={initValues}
      validationSchema={joinGroupFormSchema}
      onSubmit={handleSubmit}
    >
      {({ dirty, isValid, isSubmitting }: FormikProps<JoinGroupFormType>) => (
        <Form>
          <Field name="id" label="Join a group" as={GroupSelect} placeholder="Search groups by name" />
          <ErrorText message={initializeGroupsError} />
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
