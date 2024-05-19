import { ReactNode } from 'react';
import { Input } from '@nextui-org/input';
import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { CreateNewGroupFormType, createNewGroupFormSchema } from '@/constants/schemas';
import { useMutation } from '@tanstack/react-query';
import axios from 'axios';
import { Spinner } from '@nextui-org/react';
import { Button } from '@nextui-org/button';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };

const CreateNewGroupForm = ({ secondaryButton, onSubmit }: Props) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(createNewGroupFormSchema),
  });

  const { mutate, isPending } = useMutation({
    mutationKey: ['create-new-group' /*{ userId }*/],
    mutationFn: async (gropuData: CreateNewGroupFormType) => {
      const { data } = await axios.post('/dashboard/profile/api/group-association', gropuData);
      return data;
    },
    onSuccess: (data) => {
      onSubmit && onSubmit();
      if (!data?.id) return;
      // optimistically update profile
    },
  });

  const submit = (data: CreateNewGroupFormType) => mutate(data);

  return (
    <form className="flex flex-col gap-5" onSubmit={handleSubmit(submit)}>
      <Input
        {...register('name')}
        label="Name"
        placeholder="Enter group's name"
        errorMessage={errors?.name?.message}
        color={!!errors?.name ? 'danger' : undefined}
      />
      <Input
        {...register('location')}
        label="Location"
        placeholder="Enter group's location"
        // errorMessage={errors?.location?.message}
        color={!!errors?.location ? 'danger' : undefined}
      />
      <div className="mt-5 flex justify-between gap-3">
        {secondaryButton && secondaryButton}
        <Button type="submit" className="w-full flex-1" isLoading={isPending} spinner={<Spinner size="sm" />}>
          Submit
        </Button>
      </div>
    </form>
  );
};
export default CreateNewGroupForm;
