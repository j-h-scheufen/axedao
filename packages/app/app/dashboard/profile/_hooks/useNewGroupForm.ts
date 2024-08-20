import { createNewGroupFormSchema } from '@/app/dashboard/profile/schema';
import { useCreateGroupError, useIsCreatingGroup, useProfileActions } from '@/app/dashboard/profile/store';
import { yupResolver } from '@hookform/resolvers/yup';
import { useForm } from 'react-hook-form';

const useNewGroupForm = () => {
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
  };
};

export default useNewGroupForm;
