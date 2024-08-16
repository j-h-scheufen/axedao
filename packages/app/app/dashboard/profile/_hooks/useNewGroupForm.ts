import { createNewGroupFormSchema } from '@/app/dashboard/profile/schema';
import { useCreateGroupError, useIsCreatingGroup, useProfileActions } from '@/app/dashboard/profile/store';
import useGroupLocation from '@/hooks/useGroupLocation';
import { yupResolver } from '@hookform/resolvers/yup';
import { useForm } from 'react-hook-form';

const useNewGroupForm = () => {
  const groupLocationOptions = useGroupLocation();

  const profileActions = useProfileActions();

  const isCreatingGroup = useIsCreatingGroup();
  const createGroupError = useCreateGroupError();

  const form = useForm({
    resolver: yupResolver(createNewGroupFormSchema),
  });

  return {
    form,
    profileActions,
    isCreatingGroup,
    createGroupError,
    ...groupLocationOptions,
  };
};

export default useNewGroupForm;
