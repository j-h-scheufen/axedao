'use client';

import { useGroupMembersActions } from '@/app/dashboard/overview/groups/[groupId]/store/groupMembers.store';
import {
  useGroupProfile,
  useGroupProfileActions,
  useIsDeletingGroup,
  useIsGroupProfileInitialized,
  useIsInitializingGroupProfile,
  useIsUpdatingGroupProfile,
} from '@/app/dashboard/overview/groups/[groupId]/store/groupProfile.store';
import { useProfile, useProfileActions } from '@/app/dashboard/profile/store';
import ImageUpload from '@/components/ImageUpload';
import SubsectionHeading from '@/components/SubsectionHeading';
import { GroupFormType, groupFormSchema } from '@/constants/schemas';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input, Textarea } from '@nextui-org/input';
import { useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { Controller, FormProvider, useForm } from 'react-hook-form';
import GroupFormSkeleton from '../skeletons';
import DeleteGroup from './DeleteGroup';
import FounderField from './FounderField';
import LinkInputs from './LinkInputs';

type Props = { id: string };
const GroupForm = ({ id }: Props) => {
  const router = useRouter();

  const profile = useProfile();

  const profileActions = useProfileActions();
  const groupProfileActions = useGroupProfileActions();
  const isUpdating = useIsUpdatingGroupProfile();
  const groupProfile = useGroupProfile();
  const isInitialilzingGroupProfile = useIsInitializingGroupProfile();
  const isGroupProfileInitialized = useIsGroupProfileInitialized();
  const isDeleting = useIsDeletingGroup();
  const groupMembersActions = useGroupMembersActions();

  useEffect(() => {
    groupProfileActions.initialize(id);
    groupMembersActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const form = useForm({
    resolver: yupResolver(groupFormSchema),
  });
  const { control, handleSubmit, watch, setValue } = form;

  useEffect(() => {
    if (!groupProfile?.id || !profile.id) return;
    const { name, description, logo, banner, leader, links, admins } = groupProfile;
    setValue('email', profile.email);
    if (name) setValue('name', name);
    if (description) setValue('description', description);
    if (logo) setValue('logo', logo);
    if (banner) setValue('banner', banner);
    if (leader) setValue('leader', leader);
    if (links) setValue('links', links);
    if (admins?.length) setValue('admins', admins);
  }, [setValue, groupProfile, profile]);

  if (isInitialilzingGroupProfile) {
    return <GroupFormSkeleton />;
  }
  if (!isGroupProfileInitialized) return null;

  const submit = async (values: GroupFormType) => {
    await groupProfileActions.updateGroupProfile(values);
    router.push(`/dashboard/overview/groups/${id}`);
  };

  const deleteGroup = async () => {
    await groupProfileActions.delete();
    profileActions.removeGroupAssociation();
    router.push('/dashboard/profile');
  };

  const description = watch('description') || '';
  const descriptionCharsLeft = 300 - description.length;

  return (
    <FormProvider {...form}>
      <form className="max-w-xl" onSubmit={handleSubmit(submit)}>
        <div className="mb-5 md:flex md:gap-5">
          <div className="flex min-w-24 flex-col justify-start gap-2">
            <h4>Logo</h4>
            <Controller
              control={control}
              name="logo"
              render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
                return (
                  <div className="h-28 w-28">
                    <ImageUpload
                      ref={ref}
                      value={value as File}
                      onChange={onChange}
                      onBlur={onBlur}
                      errorMessage={error?.message}
                      hideButton
                    />
                  </div>
                );
              }}
            />
          </div>
          <div className="flex flex-1 flex-col gap-2">
            <h4>Banner</h4>
            <div className="h-full">
              <Controller
                control={control}
                name="banner"
                render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
                  return (
                    <ImageUpload
                      ref={ref}
                      value={value as File}
                      onChange={onChange}
                      onBlur={onBlur}
                      errorMessage={error?.message}
                      hideButton
                      avatarProps={{ className: 'block h-28 w-full cursor-pointer', radius: 'md' }}
                    />
                  );
                }}
              />
            </div>
          </div>
        </div>
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
                label="Name"
                placeholder="Enter your group's name"
                className="mb-5"
                classNames={{ inputWrapper: '!min-h-12' }}
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
              />
            );
          }}
        />
        <FounderField />
        <Controller
          control={control}
          name="description"
          render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
            const errorMessage = error?.message;
            return (
              <Textarea
                ref={ref}
                value={value || ''}
                onBlur={onBlur}
                onChange={onChange}
                label="Description"
                placeholder="Enter a short description of your group"
                description={`${descriptionCharsLeft} characters left`}
                className="mb-5 w-full"
                classNames={{ description: 'w-fit ml-auto' }}
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
              />
            );
          }}
        />
        <SubsectionHeading>Links</SubsectionHeading>
        <LinkInputs control={control} setValue={setValue} watch={watch} />
        <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
          <DeleteGroup deleteGroup={deleteGroup} isDeleting={isDeleting} />
          <Button type="submit" className="flex w-full items-center" isLoading={isUpdating}>
            Update group
          </Button>
        </div>
      </form>
    </FormProvider>
  );
};
export default GroupForm;
