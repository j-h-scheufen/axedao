'use client';

import { Button } from '@nextui-org/button';
import { Select, SelectItem } from '@nextui-org/select';
import { Field, FieldArray, FieldProps, Form, Formik, FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { Mail, Phone } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { Suspense, useCallback } from 'react';

import { FieldInput, LinksArray } from '@/components/forms';
import ImageUpload from '@/components/ImageUpload';
import ProfileFormSkeleton from '@/components/skeletons/ProfileFormSkeleton';
import SubsectionHeading from '@/components/SubsectionHeading';
import { PATHS, titles } from '@/config/constants';
import { ProfileForm as FormType, profileFormSchema } from '@/config/validation-schema';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { useUpdateProfile } from '@/hooks/useCurrentUser';
import { Spinner } from '@nextui-org/spinner';

const ProfileForm = () => {
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);
  const { updateProfile } = useUpdateProfile();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      try {
        /**
         * TODO: We should really only update the profile fields that have changed in order to avoid future
         * API validation conflicts. See https://medium.com/@tonyeder11/formik-enablereinitialize-example-fixing-backend-validation-errors-76d26031d5f7
         * At least the images can be updated separately from the rest of the profile.
         */
        return updateProfile(values).then(() => router.push(PATHS.profile));
      } catch (error) {
        console.error('Error during profile update.', error);
        throw error;
      }
    },
    [updateProfile, router],
  );

  if (!user) return <Spinner />;

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    name: user.name || '',
    nickname: user.nickname || '',
    title: user.title || undefined,
    email: user.email || '',
    phone: user.phone || '',
    avatar: user.avatar || undefined,
    links: user.links || [],
  };

  return (
    <Formik<FormType>
      initialValues={initValues}
      validationSchema={profileFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting, setFieldValue, values }: FormikProps<FormType>) => (
        <Suspense fallback={<ProfileFormSkeleton />}>
          <Form className="">
            <Field name="avatar">
              {({ field, meta }: FieldProps) => (
                <ImageUpload
                  {...field}
                  errorMessage={meta.error}
                  isInvalid={meta.touched && !!meta.error}
                  onChange={(file: File) => {
                    setFieldValue('avatar', file);
                  }}
                />
              )}
            </Field>
            <SubsectionHeading>General Information</SubsectionHeading>
            <div className="flex flex-col gap-2 sm:gap-4">
              <Field name="name" label="Name" as={FieldInput} />
              <Field name="nickname" label="Nickname" as={FieldInput} />
              <Field name="title">
                {({ field, meta }: FieldProps) => (
                  <Select
                    {...field}
                    label="Title"
                    placeholder="Select title"
                    selectedKeys={field.value ? [field.value] : []}
                    onChange={(e) => setFieldValue('title', e.target.value)}
                    isInvalid={meta.touched && !!meta.error}
                    color={meta.touched && !!meta.error ? 'danger' : undefined}
                    classNames={{ value: 'capitalize' }}
                  >
                    {titles.map((title) => (
                      <SelectItem key={title} value={title} className="capitalize">
                        {title}
                      </SelectItem>
                    ))}
                  </Select>
                )}
              </Field>
              <Field
                name="email"
                type="email"
                as={FieldInput}
                size="sm"
                classNames={{ inputWrapper: 'h-10' }}
                startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
                disabled
              />
              <Field
                name="phone"
                type="phone"
                as={FieldInput}
                size="sm"
                placeholder="+xxx xxxx xxxx"
                classNames={{ inputWrapper: 'h-10' }}
                startContent={<Phone className="pointer-events-none h-4 w-4 min-w-4 flex-shrink-0 text-default-400" />}
              />
            </div>
            <SubsectionHeading>Social Links</SubsectionHeading>
            <FieldArray name="links">
              {(helpers) => (
                <LinksArray {...helpers} links={values.links} ownerId={user.id} setFieldValue={setFieldValue} />
              )}
            </FieldArray>

            <Button
              type="submit"
              color="primary"
              isLoading={isSubmitting}
              className="mt-8 flex w-full items-center"
              disabled={!dirty || !isValid}
            >
              Update profile
            </Button>
          </Form>
        </Suspense>
      )}
    </Formik>
  );
};
export default ProfileForm;
