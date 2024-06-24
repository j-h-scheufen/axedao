'use client';

import { groupFormSchema } from '@/constants/schemas';
import { useGroupAdmins, useGroupMembersActions, useIsInitializingGroupAdmins } from '@/store/groupMembers.store';
import {
  useGroupProfile,
  useGroupProfileActions,
  useIsDeletingGroup,
  useIsGroupProfileInitialized,
  useIsInitializingGroupProfile,
} from '@/store/groupProfile.store';
import { useProfile, useProfileActions } from '@/store/profile.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input, Textarea } from '@nextui-org/input';
import { useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { Controller, /*useFieldArray,*/ useForm } from 'react-hook-form';
import ImageUpload from './ImageUpload';
import SelectUser from './SelectUser';
import SubsectionHeading from './SubsectionHeading';
import GroupFormSkeleton from './skeletons/GroupFormSkeleton';

type Props = { id: string };
const GroupForm = ({ id }: Props) => {
  const router = useRouter();

  const user = useProfile();

  const profileActions = useProfileActions();
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();
  const isInitialilzingGroupProfile = useIsInitializingGroupProfile();
  const isGroupProfileInitialized = useIsGroupProfileInitialized();
  const isDeleting = useIsDeletingGroup();
  const groupAdmins = useGroupAdmins();
  const groupMembersActions = useGroupMembersActions();
  const isInitializingGroupAdmins = useIsInitializingGroupAdmins();
  const isGroupLeader = user.id === groupProfile.leader;

  useEffect(() => {
    groupProfileActions.initialize(id);
    groupMembersActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const { control, handleSubmit, watch, setValue } = useForm({
    resolver: yupResolver(groupFormSchema),
  });

  useEffect(() => {
    if (!groupProfile?.id) return;
    const { name, description, logo, banner, leader, links, admins } = groupProfile;
    if (name) setValue('name', name);
    if (description) setValue('description', description);
    if (logo) setValue('logo', logo);
    if (banner) setValue('banner', banner);
    if (leader) setValue('leader', leader);
    if (links) setValue('links', links);
    if (admins?.length) setValue('admins', admins);
  }, [setValue, groupProfile]);

  // const adminsField = useFieldArray({
  //   control,
  //   name: 'admins',
  // });

  if (isInitialilzingGroupProfile) {
    return <GroupFormSkeleton />;
  }
  if (!isGroupProfileInitialized) return null;

  const description = watch('description') || '';
  const descriptionCharsLeft = 300 - description.length;
  console.log(groupAdmins);

  return (
    <>
      <form className="max-w-xl" onSubmit={handleSubmit(console.log)}>
        <SubsectionHeading>Images</SubsectionHeading>
        <div className="mb-5 md:flex md:gap-5">
          <div className="flex min-w-24 flex-col justify-start gap-2">
            <h4>Logo</h4>
            <Controller
              control={control}
              name="logo"
              render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
                return (
                  <ImageUpload
                    ref={ref}
                    value={value as File}
                    onChange={onChange}
                    onBlur={onBlur}
                    errorMessage={error?.message}
                    hideButton
                  />
                );
              }}
            />
          </div>
          <div className="flex flex-1 flex-col gap-2">
            <h4>Banner</h4>
            <div className="aspect-[4] max-h-24 w-full max-w-sm">
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
                      avatarProps={{ className: 'block h-24 w-full cursor-pointer', radius: 'md' }}
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
                classNames={{ inputWrapper: 'min-h-12' }}
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
              />
            );
          }}
        />
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
        <SubsectionHeading>Leader</SubsectionHeading>
        {isGroupLeader && (
          <Controller
            control={control}
            name="leader"
            render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
              return (
                <SelectUser
                  ref={ref}
                  label="Search group admins"
                  userId={value}
                  users={groupAdmins}
                  onChange={(adminId: string | undefined) => (adminId ? onChange({ id: adminId }) : null)}
                  onBlur={onBlur}
                  errorMessage={error?.message}
                  className="mb-5"
                  isLoading={isInitializingGroupAdmins}
                />
              );
            }}
          />
        )}
        <div className="mb-5">
          <label className="mb-2 inline-block text-sm">Admins</label>
          {/* <Controller
          control={control}
          name="admins"
          render={({ field: { onBlur, ref, name, value }, fieldState: { error } }) => {
            return (
              <SelectMultipleUsers
                ref={ref}
                control={control}
                name={name}
                placeholder="Search group members"
                errorMessage={error?.message}
                onBlur={onBlur}
                selectedUsers={value}
                fields={adminsField.fields}
                onChange={(adminId) => {
                  if (!adminId) return;
                  // const selected = !!value?.length && value.find((admin) => admin.id === adminId.toString());
                  let selected, selectedIndex;
                  if (value?.length) {
                    for (let i = 0; i < value.length; i++) {
                      const admin = value[i];
                      if (admin.id === adminId.toString()) {
                        selected = true;
                        selectedIndex = i;
                      }
                    }
                  }
                  if (selected) {
                    adminsField.remove(selectedIndex);
                  } else {
                    adminsField.append({ id: adminId });
                  }
                }}
                onRemove={adminsField.remove}
              />
            );
          }}
        /> */}
        </div>
        <SubsectionHeading>Links</SubsectionHeading>
        {/* <ContactInfoInputs
        register={register as UseFormRegister<ContactInfoField>}
        errors={errors as FieldErrors<ContactInfoField>}
      /> */}
        <Button type="submit" className="mt-8 flex w-full items-center">
          Update group
        </Button>
        <Button
          variant="bordered"
          type="button"
          color="danger"
          className="mt-8 flex w-full items-center"
          onPress={async () => {
            await groupProfileActions.delete();
            profileActions.removeGroupAssociation();
            router.push('/dashboard/overview?tab=groups');
          }}
          isLoading={isDeleting}
        >
          Delete group
        </Button>
      </form>
    </>
  );
};
export default GroupForm;
