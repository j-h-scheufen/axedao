'use client';

import ContactInfoInputs from './ContactInfoInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import { Controller, FieldErrors, UseFormRegister, useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { groupSchema } from '@/constants/schemas';
import ImageUpload from './ImageUpload';
import { Input, Textarea } from '@nextui-org/input';
import SelectUser from './SelectUser';

const GroupForm = () => {
  const {
    control,
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({ resolver: yupResolver(groupSchema) });

  const description = watch('description') || '';
  const descriptionCharsLeft = 200 - description.length;

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
      <Input
        {...register('name')}
        isInvalid={!!errors?.name}
        color={errors?.name ? 'danger' : undefined}
        label="Name"
        placeholder="Enter the group's name"
        className="mb-5"
        classNames={{ inputWrapper: 'min-h-14' }}
        errorMessage={errors?.name?.message}
      />
      <Textarea
        {...register('description')}
        label="Description"
        placeholder="Enter a short description of your group"
        description={`${descriptionCharsLeft} characters left`}
        className="mb-5 w-full"
        classNames={{ description: 'w-fit ml-auto' }}
        color={errors.description ? 'danger' : undefined}
        isInvalid={!!errors.description}
        errorMessage={errors.description?.message}
      />
      <Controller
        control={control}
        name="leader"
        render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
          console.log(value);
          return (
            <SelectUser
              ref={ref}
              userId={value?.id}
              onChange={(userId: string) => onChange({ id: userId })}
              onBlur={onBlur}
              errorMessage={error?.message}
            />
          );
        }}
      />
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputs register={register as UseFormRegister<any>} errors={errors as FieldErrors<any>} />
      <Button type="submit" className="mt-8 flex w-full items-center">
        Update group
      </Button>
    </form>
  );
};
export default GroupForm;
