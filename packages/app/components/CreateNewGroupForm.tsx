import { createNewGroupFormSchema } from '@/constants/schemas';
import { useCreateGroupError, useIsCreatingGroup, useProfileActions } from '@/store/profile.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Spinner } from '@nextui-org/react';
import { ReactNode } from 'react';
import { useForm } from 'react-hook-form';
import ErrorText from './ErrorText';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };

const CreateNewGroupForm = ({ secondaryButton }: Props) => {
  const profileActions = useProfileActions();
  const isCreatingGroup = useIsCreatingGroup();
  const createGroupError = useCreateGroupError();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(createNewGroupFormSchema),
  });

  return (
    <form onSubmit={handleSubmit(profileActions.createGroup)}>
      <Input
        {...register('name')}
        label="Name"
        placeholder="Enter group's name"
        errorMessage={errors?.name?.message}
        color={!!errors?.name ? 'danger' : undefined}
      />
      {/* <Input
        {...register('location')}
        label="Location"
        placeholder="Enter group's location"
        // errorMessage={errors?.location?.message}
        color={!!errors?.location ? 'danger' : undefined}
      /> */}
      <ErrorText message={createGroupError} />
      <div className="mt-5 flex justify-between gap-3">
        {secondaryButton && secondaryButton}
        <Button type="submit" className="w-full flex-1" isLoading={isCreatingGroup} spinner={<Spinner size="sm" />}>
          Create group
        </Button>
      </div>
    </form>
  );
};
export default CreateNewGroupForm;
