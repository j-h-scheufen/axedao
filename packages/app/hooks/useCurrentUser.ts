import { useAtom, useAtomValue } from 'jotai';
import { enqueueSnackbar } from 'notistack';

import { ProfileForm } from '@/config/validation-schema';
import { FileUploadParams, useUploadImageMutation } from '@/query/image';
import { useJoinGroupMutation, useLeaveGroupMutation, useUpdateProfileMutation } from '@/query/profile';
import { currentUserIdAtom, currentUserProfileAtom } from './state/currentUser';

export const useUpdateProfile = () => {
  const [, setCurrentUserProfile] = useAtom(currentUserProfileAtom);
  const userId = useAtomValue(currentUserIdAtom);
  const { mutateAsync: mutateProfile, error, isPending } = useUpdateProfileMutation();
  const { mutateAsync: mutateImage } = useUploadImageMutation();
  const updateProfile = async (data: ProfileForm) => {
    if (data.avatar && data.avatar instanceof File) {
      const params: FileUploadParams = { file: data.avatar, name: userId ? `user-avatar-${userId}` : undefined };
      const avatar = await mutateImage(params);
      if (avatar) data.avatar = avatar;
      else {
        console.warn('Avatar upload successful, but no hash returned.');
        delete data.avatar;
      }
    }

    return mutateProfile(data, {
      onError: (error) => enqueueSnackbar(`An error occured trying to update the group: ${error.message}`),
    }).then((profileUpdate) => {
      setCurrentUserProfile(profileUpdate);
    });
  };
  return { updateProfile, error, isPending };
};

export const useJoinGroup = () => {
  const [, setCurrentProfile] = useAtom(currentUserProfileAtom);
  const { mutateAsync, error, isPending } = useJoinGroupMutation();
  const joinGroup = async (groupId: string) =>
    mutateAsync(groupId, {
      onError: (error) => enqueueSnackbar(`An error occured trying to join the group: ${error.message}`),
    }).then((data) => setCurrentProfile(data));
  return { joinGroup, error, isPending };
};

export const useLeaveGroup = () => {
  const [, setCurrentProfile] = useAtom(currentUserProfileAtom);
  const { mutateAsync, error, isPending } = useLeaveGroupMutation();
  const leaveGroup = async (groupId: string) =>
    mutateAsync(groupId, {
      onError: (error) => enqueueSnackbar(`An error occured trying to leave the group: ${error.message}`),
    }).then((data) => setCurrentProfile(data));
  return { leaveGroup, error, isPending };
};

export const clearProfile = () => {
  const [, setCurrentProfile] = useAtom(currentUserProfileAtom);
  setCurrentProfile(undefined);
};
