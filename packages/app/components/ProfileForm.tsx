'use client';

import { useEffect, useMemo, useRef, useState } from 'react';
import { Avatar } from '@nextui-org/avatar';
import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/select';
import { Camera, Mail, Phone } from 'lucide-react';
import LinkInputs from './LinkInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import Link from 'next/link';
import titles from '@/constants/titles';
import { SubmitHandler, useForm, Controller, UseFormRegister, FieldErrors } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { ProfileType, profileSchema } from '@/constants/schemas';
import useUser from '@/hooks/useUser';
import { Spinner } from '@nextui-org/react';

type Props = { create?: boolean };
const ProfileForm = ({ create = false }: Props) => {
  const [imagePreview, setImagePreview] = useState<string>('https://images.unsplash.com/broken');
  const imageInputRef = useRef<HTMLInputElement | null>(null);

  const {
    createProfileMutation,
    updateProfileMutation,
    // profile
  } = useUser();

  const {
    register,
    control,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(profileSchema),
    // defaultValues: create ? undefined : profile
  });

  const imageFile = watch('image');
  useEffect(() => {
    if (!imageFile) return;
    const reader = new FileReader();
    reader.onloadend = () => {
      setImagePreview(reader.result as string);
    };
    reader.readAsDataURL(imageFile as File);
  }, [imageFile]);

  const mutation = create ? createProfileMutation : updateProfileMutation;
  const submit = mutation.mutate as SubmitHandler<ProfileType>;

  return (
    <form className="max-w-lg" onSubmit={handleSubmit(submit)}>
      <SubsectionHeading>General Information</SubsectionHeading>
      <div className="flex flex-col gap-5">
        <Controller
          control={control}
          name="image"
          render={({ field: { onChange, onBlur, value, ref } }) => {
            const selectImageFile = () => {
              imageInputRef.current && imageInputRef.current.click();
            };

            return (
              <div>
                <input
                  ref={imageInputRef}
                  type="file"
                  accept="image/*"
                  onChange={(e) => e.target.files?.length && onChange(e.target.files[0])}
                  className="hidden"
                  hidden
                />
                <div className="flex items-end gap-3">
                  <Avatar
                    ref={ref}
                    isFocusable
                    showFallback
                    isBordered
                    color={errors.image && 'danger'}
                    src={imagePreview}
                    fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
                    className="aspect-square h-full max-h-32 w-full max-w-32 cursor-pointer"
                    onClick={selectImageFile}
                    onBlur={onBlur}
                  />
                  <Button type="button" size="sm" className="w-fit" onPress={selectImageFile} onBlur={onBlur}>
                    {imageFile ? 'Change' : 'Upload'} image
                  </Button>
                </div>
                {errors.image && (
                  <span className="mt-1 inline-block text-small text-danger">{errors.image.message}</span>
                )}
              </div>
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
                onSelectionChange={(value) => value && onChange((value as any)?.anchorKey)}
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
        <Input
          {...register('email')}
          isInvalid={!!errors?.email}
          color={errors?.email ? 'danger' : undefined}
          type="email"
          label="Email"
          placeholder="you@example.com"
          labelPlacement="outside"
          startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
          errorMessage={errors?.email?.message}
        />
        <Input
          {...register('phone')}
          isInvalid={!!errors?.phone}
          color={errors?.phone ? 'danger' : undefined}
          type="phone"
          label="Phone number"
          placeholder="+XXXX XXX XXXX"
          labelPlacement="outside"
          startContent={<Phone className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
          errorMessage={errors?.phone?.message}
        />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <LinkInputs register={register as UseFormRegister<any>} errors={errors as FieldErrors<any>} />
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
