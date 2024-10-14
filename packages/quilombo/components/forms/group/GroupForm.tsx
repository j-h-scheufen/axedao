'use client';

import { Button } from '@nextui-org/button';
import { Textarea } from '@nextui-org/input';
import { Field, FieldArray, FieldProps, Form, Formik, FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { useRouter } from 'next/navigation';
import { useCallback, useState } from 'react';

import { FieldInput, FounderField } from '@/components/forms';
import LinksArray from '@/components/forms/LinksArray';
import GroupFormSkeleton from '@/components/skeletons/GroupSkeletons';
import SubsectionHeading from '@/components/SubsectionHeading';
import { GROUP_DESCRIPTION_MAX_LENGTH, PATHS } from '@/config/constants';
import { UpdateGroupForm, updateGroupSchema } from '@/config/validation-schema';
import { groupAtom } from '@/hooks/state/group';
import { useDeleteGroup, useUpdateGroup } from '@/hooks/useGroup';
import { DeleteGroup } from '.';

const GroupForm = () => {
  const { data: group, isFetching } = useAtomValue(groupAtom);
  const router = useRouter();
  const { deleteGroup, isPending: isPendingDelete } = useDeleteGroup();
  const { updateGroup, isPending: isPendingUpdate } = useUpdateGroup();
  const [charsLeft, setCharsLeft] = useState<number>(GROUP_DESCRIPTION_MAX_LENGTH - (group?.description?.length || 0));

  // TODO: Deleting the group will have consequences for any logged-in user belonging to that group as their state will be out of sync.
  // TODO: the whole concept of a user belonging to only one group and having to be a member in order to be admin is not mature!
  const handleDeleteGroup = useCallback(async () => {
    if (!group) return;
    return deleteGroup(group.id).then(() => router.push(PATHS.profile));
  }, [group, deleteGroup, router]);

  const handleSubmit = useCallback(
    async (values: UpdateGroupForm) => {
      if (!group) return;
      /**
       * TODO: We should really only update the profile fields that have changed in order to avoid future
       * API validation conflicts. See https://medium.com/@tonyeder11/formik-enablereinitialize-example-fixing-backend-validation-errors-76d26031d5f7
       * At least the images can be updated separately from the rest of the profile.
       */
      return updateGroup({ groupId: group.id, data: values }).then(() => router.push(`${PATHS.groups}/${group.id}`));
    },
    [router, updateGroup, group],
  );

  if (!group || isFetching) return <GroupFormSkeleton />;

  const initValues: UpdateGroupForm = {
    name: group?.name || '',
    email: group?.email || '',
    founder: group?.founder || '',
    description: group?.description || '',
    links: group?.links || [],
  };

  return (
    <Formik<UpdateGroupForm>
      initialValues={initValues}
      validationSchema={updateGroupSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ values, dirty, isValid, isSubmitting }: FormikProps<UpdateGroupForm>) => (
        <Form className="flex flex-col gap-2 sm:gap-4">
          <Field name="name" label="Name" placeholder="Enter your group's name" as={FieldInput} />
          <Field name="email" label="Email" type="email" placeholder="Enter your group's email" as={FieldInput} />
          <Field name="founder" label="Founder" placeholder="Enter the founder's name" as={FounderField} />
          <Field name="description" label="Description" placeholder="Enter a short description of your group">
            {({ field, meta }: FieldProps) => {
              return (
                <Textarea
                  {...field}
                  errorMessage={meta.error}
                  isInvalid={meta.touched && !!meta.error}
                  label="Description"
                  placeholder="Enter a short description of your group"
                  description={`${charsLeft} characters left`}
                  onInput={(e) => setCharsLeft(300 - (e.target as HTMLTextAreaElement).value.length)}
                  className="mb-5 w-full"
                  classNames={{ description: 'w-fit ml-auto' }}
                />
              );
            }}
          </Field>
          <SubsectionHeading>Links</SubsectionHeading>
          <FieldArray name="links">
            {(helpers) => <LinksArray links={values.links} actions={{ remove: helpers.remove, add: helpers.push }} />}
          </FieldArray>

          <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
            <DeleteGroup deleteGroup={handleDeleteGroup} isDeleting={isPendingDelete} />
            <Button
              type="submit"
              className="flex w-full items-center"
              color="primary"
              isLoading={isSubmitting || isPendingUpdate}
              disabled={!dirty || !isValid}
            >
              Update group
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default GroupForm;
