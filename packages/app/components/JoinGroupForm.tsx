'use client';

import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';

import ErrorText from '@/components/ErrorText';
import { JoinGroupForm as FormType, joinGroupFormSchema } from '@/config/validation-schema';
import { useJoinGroup } from '@/query/profile';
import { useGroupsErrors } from '@/store/groups.store';
import { useProfileActions } from '@/store/profile.store';
import GroupSelect from './forms/GroupSelect';

const JoinGroupForm = () => {
  const { mutateAsync: joinGroup } = useJoinGroup();
  const { updateGroup } = useProfileActions();
  const { initializeGroupsError } = useGroupsErrors();

  const handleSubmit = async (values: FormType) => {
    return joinGroup(values.id).then((data) => updateGroup(data.group));
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    id: '',
  };

  return (
    <Formik<FormType> initialValues={initValues} validationSchema={joinGroupFormSchema} onSubmit={handleSubmit}>
      {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => (
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
