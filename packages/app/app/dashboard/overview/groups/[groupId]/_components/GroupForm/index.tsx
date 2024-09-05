'use client';

import { useGroupMembersActions } from '@/app/dashboard/overview/groups/[groupId]/store/groupMembers.store';
import {
  useGroupProfile,
  useGroupProfileActions,
  useIsDeletingGroup,
} from '@/app/dashboard/overview/groups/[groupId]/store/groupProfile.store';
import ImageUpload from '@/components/ImageUpload';
import { GroupFormType, groupFormSchema } from '@/constants/schemas';
import { Button } from '@nextui-org/button';
import { Field, FieldProps, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { useRouter } from 'next/navigation';
import { Suspense, useEffect } from 'react';
import GroupFormSkeleton from '../skeletons';
import DeleteGroup from './DeleteGroup';

type Props = { id: string };
const GroupForm = ({ id }: Props) => {
  const router = useRouter();

  // const { removeGroupAssociation } = useProfileActions();
  const { initialize: initGroupProfile, delete: deleteGroup, updateGroupProfile } = useGroupProfileActions();
  const { initialize: initGroupMembers } = useGroupMembersActions();
  const groupProfile = useGroupProfile();
  const isDeleting = useIsDeletingGroup();

  useEffect(() => {
    initGroupProfile(id);
    initGroupMembers(id);
  }, [id, initGroupProfile, initGroupMembers]);

  // TODO: Deleting the group will have consequences for any logged-in user belonging to that group as their state will be out of sync.
  // const handleDeleteGroup = async () => {
  //   await deleteGroup().then(removeGroupAssociation);
  //   router.push('/dashboard/profile');
  // };

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
    description: groupProfile.description || '',
    logo: groupProfile.logo || '',
    banner: groupProfile.banner || '',
    leader: groupProfile.leader || '',
    admins: groupProfile.admins || [],
    links: groupProfile.links || [],
  };

  // const description = watch('description') || '';
  // const descriptionCharsLeft = 300 - description.length;

  return (
    <Formik<GroupFormType>
      initialValues={initValues}
      validationSchema={groupFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting, setFieldValue }: FormikProps<GroupFormType>) => (
        <Suspense fallback={<GroupFormSkeleton />}>
          <Form className="max-w-xl">
            <div className="mb-5 md:flex md:gap-5">
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
            <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
              <DeleteGroup deleteGroup={deleteGroup} isDeleting={isDeleting} />
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

// <FormProvider {...form}>
//   <form className="max-w-xl" onSubmit={handleSubmit(submit)}>
//     <div className="mb-5 md:flex md:gap-5">
//       <div className="flex min-w-24 flex-col justify-start gap-2">
//         <h4>Logo</h4>
//         <Controller
//           control={control}
//           name="logo"
//           render={({ field: { value, onChange }, fieldState: { error } }) => {
//             return (
//               <div className="h-28 w-28">
//                 <ImageUpload value={value as File} onChange={onChange} errorMessage={error?.message} hideButton />
//               </div>
//             );
//           }}
//         />
//       </div>
//       <div className="flex flex-1 flex-col gap-2">
//         <h4>Banner</h4>
//         <div className="h-full">
//           <Controller
//             control={control}
//             name="banner"
//             render={({ field: { value, onChange }, fieldState: { error } }) => {
//               return (
//                 <ImageUpload
//                   value={value as File}
//                   onChange={onChange}
//                   errorMessage={error?.message}
//                   hideButton
//                   avatarProps={{ className: 'block h-28 w-full cursor-pointer', radius: 'md' }}
//                 />
//               );
//             }}
//           />
//         </div>
//       </div>
//     </div>
//     <Controller
//       control={control}
//       name="name"
//       render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
//         const errorMessage = error?.message;
//         return (
//           <Input
//             ref={ref}
//             value={value || ''}
//             onBlur={onBlur}
//             onChange={onChange}
//             label="Name"
//             placeholder="Enter your group's name"
//             className="mb-5"
//             // classnames={{ inputWrapper: '!min-h-12' }}
//             errorMessage={errorMessage}
//             isInvalid={!!errorMessage}
//             color={!!errorMessage ? 'danger' : undefined}
//           />
//         );
//       }}
//     />
//     <FounderField />
//     <Controller
//       control={control}
//       name="description"
//       render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
//         const errorMessage = error?.message;
//         return (
//           <Textarea
//             ref={ref}
//             value={value || ''}
//             onBlur={onBlur}
//             onChange={onChange}
//             label="Description"
//             placeholder="Enter a short description of your group"
//             description={`${descriptionCharsLeft} characters left`}
//             className="mb-5 w-full"
//             classNames={{ description: 'w-fit ml-auto' }}
//             errorMessage={errorMessage}
//             isInvalid={!!errorMessage}
//             color={!!errorMessage ? 'danger' : undefined}
//           />
//         );
//       }}
//     />
//     <SubsectionHeading>Links</SubsectionHeading>
//     <LinkInputs control={control} setValue={setValue} watch={watch} />
//     <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
//       <DeleteGroup deleteGroup={deleteGroup} isDeleting={isDeleting} />
//       <Button type="submit" className="flex w-full items-center" isLoading={isUpdating}>
//         Update group
//       </Button>
//     </div>
//   </form>
// </FormProvider>

export default GroupForm;
