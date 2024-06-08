'use client';

import { groupSchema } from '@/constants/schemas';
import { useGroupFounder } from '@/store/groupMembers.store';
import {
  useGroupProfile,
  useGroupProfileActions,
  useIsGroupProfileInitialized,
  useIsInitializingGroupProfile,
} from '@/store/groupProfile.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input, Textarea } from '@nextui-org/input';
import { useEffect } from 'react';
import { Controller, /*useFieldArray,*/ useForm } from 'react-hook-form';
import ImageUpload from './ImageUpload';
import SelectUser from './SelectUser';
import SubsectionHeading from './SubsectionHeading';
import UserCard from './UserCard';
import GroupFormSkeleton from './skeletons/GroupFormSkeleton';

type Props = { id: string };
const GroupForm = ({ id }: Props) => {
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();
  const founder = useGroupFounder();
  const isInitialilzingGroupProfile = useIsInitializingGroupProfile();
  const isGroupProfileInitialized = useIsGroupProfileInitialized();

  useEffect(() => {
    groupProfileActions.initialize(id);
  }, [id, groupProfileActions]);

  const {
    control,
    // register,
    handleSubmit,
    watch,
    // formState: { errors },
    setValue,
  } = useForm({
    resolver: yupResolver(groupSchema),
  });

  useEffect(() => {
    if (!groupProfile?.id) return;
    const { name, description, logo, banner, leader, founder, verified, links, admins } = groupProfile;
    if (name) setValue('name', name);
    if (description) setValue('description', description);
    if (logo) setValue('logo', logo);
    if (banner) setValue('banner', banner);
    if (leader) setValue('leader', leader);
    if (founder) setValue('founder', founder);
    if (verified) setValue('verified', verified);
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

  // console.log(groupProfile.founder);

  return (
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
      <div className="mb-5 max-w-xs">
        <label className="mb-2 inline-block text-sm">Founder</label>
        <UserCard isLoading={true} user={founder} />
      </div>
      <Controller
        control={control}
        name="leader"
        render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
          return (
            <SelectUser
              ref={ref}
              label="Leader"
              placeholder="Search group members"
              userId={value}
              onChange={(adminId: string | undefined) => (adminId ? onChange({ id: adminId }) : null)}
              onBlur={onBlur}
              errorMessage={error?.message}
              className="mb-5"
            />
          );
        }}
      />
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
    </form>
  );
};
export default GroupForm;
