'use client';
import { ProfileFormType, profileFormSchema } from '@/constants/schemas';
import titles from '@/constants/titles';
import {
  useIsInitializingProfile,
  useIsProfileInitialized,
  useIsUpdatingProfile,
  useProfile,
  useProfileActions,
} from '@/store/profile.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Spinner } from '@nextui-org/react';
import { Select, SelectItem } from '@nextui-org/select';
import { useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { Controller, useForm } from 'react-hook-form';
import ContactInfoInputs from './ContactInfoInputs';
import ImageUpload from './ImageUpload';
import SubsectionHeading from './SubsectionHeading';
import ProfileFormSkeleton from './skeletons/ProfileFormSkeleton';

const ProfileForm = () => {
  const router = useRouter();

  const profile = useProfile();
  const isInitializingProfile = useIsInitializingProfile();
  const isProfileInitialized = useIsProfileInitialized();
  const profileActions = useProfileActions();
  const isUpdatingProfile = useIsUpdatingProfile();

  const {
    control,
    handleSubmit,
    setValue,
    watch,
    formState: { dirtyFields },
  } = useForm({
    resolver: yupResolver(profileFormSchema),
    defaultValues: {
      email: profile.email,
    },
  });

  useEffect(() => {
    if (!profile.id) return;
    const { name, email, nickname, title, links = [] } = profile;
    setValue('email', email);
    if (name) setValue('name', name);
    if (nickname) setValue('nickname', nickname);
    if (title) setValue('title', title);
    if (links) setValue('links', links);
  }, [profile, setValue]);

  const onSubmit = async (profileData: ProfileFormType) => {
    await profileActions.updateProfile(profileData);
    router.push('/dashboard/profile');
  };

  const isFormDirty = !!Object.keys(dirtyFields).length;

  if (isInitializingProfile || !isProfileInitialized) return <ProfileFormSkeleton />;

  return (
    <form className="max-w-lg" onSubmit={handleSubmit(onSubmit)}>
      <SubsectionHeading>General Information</SubsectionHeading>
      <div className="flex flex-col gap-5">
        <Controller
          control={control}
          name="image"
          render={({ field: { onChange, onBlur, value, ref }, fieldState: { error } }) => {
            return (
              <ImageUpload
                ref={ref}
                value={value as File}
                onChange={onChange}
                onBlur={onBlur}
                errorMessage={error?.message}
              />
            );
          }}
        />
        <Controller
          control={control}
          name="title"
          render={({ field: { onChange, onBlur, value, ref }, fieldState: { error } }) => {
            const isInvalid = !!error;
            return (
              <Select
                ref={ref}
                label="Title"
                placeholder="Select title"
                selectedKeys={value ? [value] : []}
                onChange={(e) => {
                  onChange && onChange(e.target.value);
                }}
                onBlur={onBlur}
                isInvalid={isInvalid}
                color={isInvalid ? 'danger' : undefined}
                errorMessage={error?.message}
                classNames={{ value: 'capitalize' }}
              >
                {titles.map((title) => (
                  <SelectItem key={title} value={title} className="capitalize">
                    {title}
                  </SelectItem>
                ))}
              </Select>
            );
          }}
        />
        <Controller
          control={control}
          name="name"
          render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
            const errorMessage = error?.message;
            return (
              <Input
                ref={ref}
                value={value || ''}
                onBlur={onBlur}
                onChange={onChange}
                label="Full name"
                placeholder="Enter your full name"
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
              />
            );
          }}
        />
        <Controller
          control={control}
          name="nickname"
          render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
            const errorMessage = error?.message;
            return (
              <Input
                ref={ref}
                value={value || ''}
                onBlur={onBlur}
                onChange={onChange}
                label="Nickname"
                placeholder="Enter your nickname"
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
              />
            );
          }}
        />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputs control={control} setValue={setValue} watch={watch} />
      <Button
        type="submit"
        isLoading={isUpdatingProfile}
        spinner={<Spinner size="sm" />}
        className="mt-8 flex w-full items-center"
        disabled={!isProfileInitialized || !isFormDirty}
      >
        Update profile
      </Button>
    </form>
  );
};
export default ProfileForm;
