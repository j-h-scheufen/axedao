import { enqueueSnackbar } from 'notistack';

import { GroupVerificationParams, useGroupVerificationMutation } from '@/query/admin';

export const useGroupVerification = () => {
  const { mutateAsync, error, isPending } = useGroupVerificationMutation();
  const setGroupVerification = async (data: GroupVerificationParams) =>
    mutateAsync(data, {
      onError: (error) => enqueueSnackbar(`An error occured trying to change the group verification: ${error.message}`),
    });
  return { setGroupVerification, error, isPending };
};
