'use client';

import { Button } from '@nextui-org/button';
import { Select, SelectItem } from '@nextui-org/select';
import { Spinner } from '@nextui-org/spinner';
import { SilkEthereumProviderInterface } from '@silk-wallet/silk-wallet-sdk/dist/lib/provider/types';
import { Field, FieldArray, FieldProps, Form, Formik, FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { Mail, Phone, XIcon } from 'lucide-react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { enqueueSnackbar } from 'notistack';
import { Suspense, useCallback } from 'react';
import { useConnect } from 'wagmi';

import { FieldInput, LinksArray } from '@/components/forms';
import ProfileFormSkeleton from '@/components/skeletons/ProfileFormSkeleton';
import SubsectionHeading from '@/components/SubsectionHeading';
import { PATHS, titles } from '@/config/constants';
import { ProfileForm as FormType, profileFormSchema } from '@/config/validation-schema';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { useUpdateCurrentUserMutation } from '@/query/currentUser';

const ProfileForm = () => {
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);
  const { mutateAsync: updateProfile } = useUpdateCurrentUserMutation();
  const { connectors } = useConnect();

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
    [updateProfile, router],
  );

  if (!user) return <Spinner />;

  const silk = connectors.find((connector) => connector.id === 'silk');

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: FormType = {
    name: user.name || '',
    nickname: user.nickname || '',
    title: user.title || undefined,
    email: user.email || '',
    phone: user.phone || '',
    links: user.links || [],
  };

  return (
    <Formik<FormType>
      initialValues={initValues}
      validationSchema={profileFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting, values, setFieldValue }: FormikProps<FormType>) => (
        <Suspense fallback={<ProfileFormSkeleton />}>
          <Form>
            <SubsectionHeading>General Information</SubsectionHeading>
            <div className="flex flex-col gap-2 sm:gap-4">
              <Field name="name" label="Name" as={FieldInput} />
              <Field name="nickname" label="Nickname" as={FieldInput} />
              <Field name="title">
                {({ field, form }: FieldProps) => (
                  <Select
                    {...field}
                    // label="Title"
                    size="lg"
                    placeholder="Select title"
                    selectedKeys={field.value ? [field.value] : []}
                    classNames={{ value: 'capitalize' }}
                    endContent={
                      field.value ? (
                        <Button
                          as={Link}
                          href="#"
                          variant="light"
                          className=" items-center"
                          onPress={() => form.setFieldValue('title', undefined)}
                          isIconOnly
                        >
                          <XIcon className="h-4 w-4 sm:h-5 sm:w-5" strokeWidth={1} />
                        </Button>
                      ) : undefined
                    }
                  >
                    {titles.map((title) => (
                      <SelectItem key={title} value={title} className="capitalize">
                        {title}
                      </SelectItem>
                    ))}
                  </Select>
                )}
              </Field>
              <div className="flex w-full items-center gap-2">
                <Field
                  name="email"
                  type="email"
                  label="Email"
                  placeholder="jane.doe@gmail.com"
                  as={FieldInput}
                  startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
                  disabled
                />
                {silk && (
                  <Button
                    variant="ghost"
                    size="lg"
                    color="primary"
                    className="text-sm p-5 sm:p-6"
                    onPress={() =>
                      (silk as unknown as SilkEthereumProviderInterface)
                        .requestEmail()
                        .then((email) => {
                          if (email) setFieldValue('email', email);
                        })
                        .catch((error) => enqueueSnackbar(error.message, { variant: 'error' }))
                    }
                  >
                    Import Email
                    <br />
                    from Silk
                  </Button>
                )}
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
