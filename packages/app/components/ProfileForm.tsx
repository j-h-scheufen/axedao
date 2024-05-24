'use client';

import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/select';
import ContactInfoInputs from './ContactInfoInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import titles from '@/constants/titles';
import { SubmitHandler, useForm, Controller, UseFormRegister, FieldErrors } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { ProfileType, profileSchema } from '@/constants/schemas';
import useUser from '@/hooks/useUser';
import { Spinner } from '@nextui-org/react';
import ImageUpload from './ImageUpload';

type Props = { create?: boolean };
const ProfileForm = ({ create = false }: Props) => {
  const {
    createProfileMutation,
    updateProfileMutation,
    // profile
  } = useUser();

  const {
    register,
    control,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(profileSchema),
    // defaultValues: create ? undefined : profile
  });

  const mutation = create ? createProfileMutation : updateProfileMutation;
  const submit = mutation.mutate as SubmitHandler<ProfileType>;

  return (
    <form className="max-w-lg" onSubmit={handleSubmit(submit)}>
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
                defaultSelectedKeys={value ? [value] : undefined}
                onChange={(e) => {
                  onChange && onChange(e.target.value);
                }}
                onBlur={onBlur}
                isInvalid={isInvalid}
                color={isInvalid ? 'danger' : undefined}
                errorMessage={error?.message}
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
        <Input
          {...register('fullName')}
          isInvalid={!!errors?.fullName}
          color={errors?.fullName ? 'danger' : undefined}
          label="Full name"
          placeholder="Enter your full name"
          errorMessage={errors?.fullName?.message}
        />
        <Input
          {...register('nickname')}
          isInvalid={!!errors?.nickname}
          color={errors?.nickname ? 'danger' : undefined}
          label="Nickname"
          placeholder="Enter your nick name"
          errorMessage={errors?.nickname?.message}
        />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputs
        register={register as UseFormRegister<ProfileType>}
        errors={errors as FieldErrors<ProfileType>}
      />
      <Button
        type="submit"
        isLoading={mutation.isPending}
        spinner={<Spinner size="sm" />}
        className="mt-8 flex w-full items-center"
      >
        Update profile
      </Button>
    </form>
  );
};
export default ProfileForm;
