import { useAtom } from 'jotai';
import { enqueueSnackbar } from 'notistack';

import { GroupVerificationParams, useGroupVerificationMutation } from '@/query/admin';
import { currentUserProfileAtom } from './state/currentUser';

export const useGroupVerification = () => {
  const [currentUserProfile, setCurrentUserProfile] = useAtom(currentUserProfileAtom);
  const { mutateAsync, error, isPending } = useGroupVerificationMutation();
  const setGroupVerification = async (data: GroupVerificationParams) =>
    mutateAsync(data, {
      onError: (error) => enqueueSnackbar(`An error occured trying to change the group verification: ${error.message}`),
    }).then((groupUpdate) => {
      if (currentUserProfile) {
        currentUserProfile.group = groupUpdate;
        setCurrentUserProfile(currentUserProfile);
      }
    });
  return { setGroupVerification, error, isPending };
};
