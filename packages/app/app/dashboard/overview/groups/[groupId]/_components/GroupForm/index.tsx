'use client';

import { Button } from '@nextui-org/button';
import { Textarea } from '@nextui-org/input';
import { Field, FieldArray, FieldProps, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { useRouter } from 'next/navigation';
import { Suspense, useEffect, useState } from 'react';

import { useGroupMembersActions } from '@/app/dashboard/overview/groups/[groupId]/store/groupMembers.store';
import {
  useGroupProfile,
  useGroupProfileActions,
  useIsDeletingGroup,
} from '@/app/dashboard/overview/groups/[groupId]/store/groupProfile.store';
import { FieldInput, FounderField, LinksArray } from '@/components/forms';
import ImageUpload from '@/components/ImageUpload';
import SubsectionHeading from '@/components/SubsectionHeading';
import { GroupFormType, groupFormSchema } from '@/constants/schemas';
import { useProfileActions } from '@/store/profile.store';
import GroupFormSkeleton from '../skeletons';
import DeleteGroup from './DeleteGroup';

type Props = { id: string };
const GroupForm = ({ id }: Props) => {
  const router = useRouter();

  const { removeGroupAssociation } = useProfileActions();
  const { initialize: initGroupProfile, delete: deleteGroup, updateGroupProfile } = useGroupProfileActions();
  const { initialize: initGroupMembers } = useGroupMembersActions();
  const groupProfile = useGroupProfile();
  const isDeleting = useIsDeletingGroup();
  const [charsLeft, setCharsLeft] = useState<number>(300 - (groupProfile.description?.length || 0));

  useEffect(() => {
    initGroupProfile(id);
    initGroupMembers(id);
  }, [id, initGroupProfile, initGroupMembers]);

  // TODO: Deleting the group will have consequences for any logged-in user belonging to that group as their state will be out of sync.
  const handleDeleteGroup = async () => {
    await deleteGroup().then(removeGroupAssociation);
    router.push('/dashboard/profile');
  };

  const handleSubmit = (values: GroupFormType, { setSubmitting }: FormikHelpers<GroupFormType>) => {
    try {
      return updateGroupProfile(values).then(() => router.push(`/dashboard/overview/groups/${id}`));
    } catch (error) {
      console.error('Error during group profile update.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  const initValues: GroupFormType = {
    name: groupProfile.name || '',
    email: groupProfile.email || '',
    founder: groupProfile.founder || '',
    description: groupProfile.description || '',
    logo: groupProfile.logo || '',
    banner: groupProfile.banner || '',
    leader: groupProfile.leader || '',
    admins: groupProfile.admins || [],
    links: groupProfile.links || [],
  };

  return (
    <Formik<GroupFormType>
      initialValues={initValues}
      validationSchema={groupFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ values, dirty, isValid, isSubmitting, setFieldValue }: FormikProps<GroupFormType>) => (
        <Suspense fallback={<GroupFormSkeleton />}>
          <Form className="max-w-xl flex flex-col gap-2 sm:gap-5">
            <div className="md:flex md:gap-5">
              <div className="flex min-w-24 flex-col justify-start gap-2">
                <h4>Logo</h4>
                <Field name="logo">
                  {({ field, meta }: FieldProps) => (
                    <ImageUpload
                      {...field}
                      errorMessage={meta.error}
                      isInvalid={meta.touched && !!meta.error}
                      onChange={(file: File) => {
                        setFieldValue('logo', file);
                      }}
                      hideButton
                    />
                  )}
                </Field>
              </div>
              <div className="flex flex-1 flex-col gap-2">
                <h4>Banner</h4>
                <div className="h-full">
                  <Field name="banner">
                    {({ field, meta }: FieldProps) => (
                      <ImageUpload
                        {...field}
                        errorMessage={meta.error}
                        isInvalid={meta.touched && !!meta.error}
                        onChange={(file: File) => {
                          setFieldValue('banner', file);
                        }}
                        hideButton
                        avatarProps={{ className: 'block h-28 w-full cursor-pointer', radius: 'md' }}
                      />
                    )}
                  </Field>
                </div>
              </div>
            </div>
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
              {(helpers) => (
                <LinksArray {...helpers} links={values.links} ownerId={groupProfile.id} setFieldValue={setFieldValue} />
              )}
            </FieldArray>

            <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
              <DeleteGroup deleteGroup={handleDeleteGroup} isDeleting={isDeleting} />
              <Button
                type="submit"
                className="flex w-full items-center"
                color="primary"
                isLoading={isSubmitting}
                disabled={!dirty || !isValid}
              >
                Update group
              </Button>
            </div>
          </Form>
        </Suspense>
      )}
    </Formik>
  );
};

export default GroupForm;
