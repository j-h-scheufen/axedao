'use client';

import { Button } from '@nextui-org/button';
import { Select, SelectItem } from '@nextui-org/select';
import { ArrayHelpers, Field, FieldArray, FieldProps, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { useRouter } from 'next/navigation';
import { ChangeEvent, Suspense } from 'react';

import { FieldInput } from '@/components/forms';
import ImageUpload from '@/components/ImageUpload';
import ProfileFormSkeleton from '@/components/skeletons/ProfileFormSkeleton';
import SubsectionHeading from '@/components/SubsectionHeading';
import { getLinkIcon, linkTypes, titles } from '@/constants';
import { Input } from '@nextui-org/input';
import { Mail, Phone, PlusIcon, XIcon } from 'lucide-react';
import { useProfile, useProfileActions } from '../../../../store/profile.store';
import { ProfileFormType, profileFormSchema } from '../schema';

/**
 * Extracts the hostname out of a URL
 * @param url
 * @returns the hostname
 * @throws MalformedUrlError
 */
const getHostname = (url: string): string | undefined => {
  try {
    // Add a protocol if missing
    if (url.indexOf('//:') === -1) {
      url = `https://${url}`;
    }
    const host = new URL(url).hostname;
    const domain = host.replace('www.', '');
    return domain.split('.')[0];
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
  } catch (error) {}
  return undefined;
};

const ProfileForm = () => {
  const router = useRouter();
  const profile = useProfile();
  const { updateProfile } = useProfileActions();

  const handleSubmit = (values: ProfileFormType, { setSubmitting }: FormikHelpers<ProfileFormType>) => {
    setSubmitting(true);
    try {
      /**
       * TODO: We should really only update the profile fields that have changed in order to avoid future
       * API validation conflicts. See https://medium.com/@tonyeder11/formik-enablereinitialize-example-fixing-backend-validation-errors-76d26031d5f7
       */
      return updateProfile(values).then(() => router.push('/dashboard/profile'));
    } catch (error) {
      console.error('Error during profile update.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: ProfileFormType = {
    name: profile.name || '',
    nickname: profile.nickname || '',
    title: profile.title || undefined,
    email: profile.email || '',
    phone: profile.phone || '',
    avatar: profile.avatar || undefined,
    links: profile.links || [],
  };

  return (
    <Formik<ProfileFormType>
      initialValues={initValues}
      validationSchema={profileFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting, setFieldValue, values }: FormikProps<ProfileFormType>) => (
        <Suspense fallback={<ProfileFormSkeleton />}>
          <Form className="max-w-lg">
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
            <div className="flex flex-col gap-5">
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
              {({ remove, push }: ArrayHelpers) => (
                <div>
                  <div className="grid h-fit w-full grid-cols-1 gap-x-3 gap-y-3 text-small text-default-500 sm:grid-cols-2">
                    {values.links.length > 0 ? (
                      values.links.map((link, index) => (
                        <Field
                          name={`links.${index}`}
                          key={index}
                          as={Input}
                          size="sm"
                          value={link.url}
                          onChange={(e: ChangeEvent<HTMLInputElement>) => {
                            const domain = getHostname(e.target.value);
                            // eslint-disable-next-line @typescript-eslint/no-explicit-any
                            if (domain && linkTypes.includes(domain as any)) {
                              setFieldValue(`links.${index}.type`, domain);
                            }
                            setFieldValue(`links.${index}.url`, e.target.value);
                          }}
                          classNames={{ inputWrapper: 'h-10' }}
                          startContent={getLinkIcon(link.type?.toString())}
                          endContent={
                            <Button
                              size="sm"
                              variant="light"
                              className="mt-0.5"
                              onPress={() => remove(index)}
                              isIconOnly
                            >
                              <XIcon className="h-4 w-4" strokeWidth={1} />
                            </Button>
                          }
                        />
                      ))
                    ) : (
                      <></>
                    )}
                  </div>
                  <div className="mt-3 flex justify-end gap-3">
                    <Button
                      variant="bordered"
                      size="sm"
                      className="ml-auto w-fit"
                      onPress={() => {
                        push({ url: '', ownerId: profile.id, type: null });
                      }}
                    >
                      <PlusIcon className="h-4 w-4" strokeWidth={1.25} /> Add link
                    </Button>
                  </div>
                </div>
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
