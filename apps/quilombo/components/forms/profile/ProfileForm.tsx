'use client';

import { Button, Checkbox, Spinner, Tooltip } from '@heroui/react';
import { Field, FieldArray, Form, Formik, type FormikProps, type FieldProps } from 'formik';
import { useAtomValue } from 'jotai';
import { Mail, Phone } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { Suspense, useCallback } from 'react';

import { FieldInput, LinksArray } from '@/components/forms';
import ProfileFormSkeleton from '@/components/skeletons/ProfileFormSkeleton';
import SubsectionHeading from '@/components/SubsectionHeading';
import { PATHS, titles } from '@/config/constants';
import { type ProfileForm as FormType, profileFormSchema } from '@/config/validation-schema';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { useFetchAuthMethods, useUpdateCurrentUserMutation } from '@/query/currentUser';
import StringSelect from '../StringSelect';

const ProfileForm = () => {
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);
  const { mutateAsync: updateProfile } = useUpdateCurrentUserMutation();

  // Fetch auth methods to get notification email
  const { data: authMethods } = useFetchAuthMethods();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      try {
        /**
         * TODO: We should really only update the profile fields that have changed in order to avoid future
         * API validation conflicts. See https://medium.com/@tonyeder11/formik-enablereinitialize-example-fixing-backend-validation-errors-76d26031d5f7
         */
        return updateProfile(values).then(() => router.push(PATHS.profile));
      } catch (error) {
        console.error('Error during profile update.', error);
        throw error;
      }
    },
    [updateProfile, router]
  );

  if (!user) return <Spinner />;

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    name: user.name || '',
    nickname: user.nickname || '',
    title: user.title || undefined,
    email: authMethods?.notificationEmail || undefined,
    phone: user.phone || '',
    links: user.links || [],
    hideEmail: user.hideEmail || false,
  };

  return (
    <Formik<FormType>
      initialValues={initValues}
      validationSchema={profileFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting, values }: FormikProps<FormType>) => (
        <Suspense fallback={<ProfileFormSkeleton />}>
          <Form>
            <SubsectionHeading>General Information</SubsectionHeading>
            <div className="flex flex-col gap-2 sm:gap-4">
              <Field name="title" as={StringSelect} options={titles} label="Title" />
              <Field name="nickname" label="Apelido / Username" as={FieldInput} isRequired />
              <Field name="name" label="Fullname" as={FieldInput} />
              <div className="flex flex-col gap-2">
                <Field
                  name="email"
                  type="email"
                  label="Email"
                  placeholder="jane.doe@gmail.com"
                  as={FieldInput}
                  startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
                  disabled
                />
                <Field name="hideEmail">
                  {({ field, form }: FieldProps) => (
                    <Tooltip
                      content="When enabled, your email will not be shown on your public profile"
                      placement="right"
                      className="max-w-xs"
                    >
                      <Checkbox
                        isSelected={field.value}
                        onValueChange={(checked) => form.setFieldValue('hideEmail', checked)}
                        size="sm"
                        className="ml-1"
                      >
                        Hide Email from Profile
                      </Checkbox>
                    </Tooltip>
                  )}
                </Field>
              </div>
              <Field
                name="phone"
                type="phone"
                label="Phone"
                as={FieldInput}
                placeholder="+xxx xxxx xxxx"
                startContent={<Phone className="pointer-events-none h-4 w-4 min-w-4 flex-shrink-0 text-default-400" />}
              />
            </div>
            <SubsectionHeading>Social Links</SubsectionHeading>
            <FieldArray name="links">
              {(helpers) => <LinksArray links={values.links} actions={{ remove: helpers.remove, add: helpers.push }} />}
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
