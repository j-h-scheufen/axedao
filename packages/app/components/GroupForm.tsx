'use client';

import ContactInfoInputs, { ContactInfoField } from './ContactInfoInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import { Controller, FieldErrors, UseFormRegister, useForm, useFieldArray } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { groupSchema } from '@/constants/schemas';
import ImageUpload from './ImageUpload';
import { Input, Textarea } from '@nextui-org/input';
import SelectUser from './SelectUser';
import UserCard from './UserCard';
import SelectMultipleUsers from './SelectMultipleUsers';

const GroupForm = () => {
  const {
    control,
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({ resolver: yupResolver(groupSchema) });

  const adminsField = useFieldArray({
    control,
    name: 'admins',
  });

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
      <div className="mb-5 max-w-xs">
        <label className="mb-2 inline-block text-sm">Founder</label>
        <UserCard />
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
              userId={value?.id}
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
        <Controller
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
        />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputs
        register={register as UseFormRegister<ContactInfoField>}
        errors={errors as FieldErrors<ContactInfoField>}
      />
      <Button type="submit" className="mt-8 flex w-full items-center">
        Update group
      </Button>
    </form>
  );
};
export default GroupForm;
