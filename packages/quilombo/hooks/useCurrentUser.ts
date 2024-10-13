import { useAtomValue } from 'jotai';
import { enqueueSnackbar } from 'notistack';

import { ProfileForm } from '@/config/validation-schema';
import { useJoinGroupMutation, useLeaveGroupMutation, useUpdateCurrentUserMutation } from '@/query/currentUser';
import { FileUploadParams, useUploadImageMutation } from '@/query/image';
import { currentUserIdAtom } from './state/currentUser';

export const useUpdateProfile = () => {
  const userId = useAtomValue(currentUserIdAtom);
  const { mutateAsync: mutateProfile, error, isPending } = useUpdateCurrentUserMutation();
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
    });
  };
  return { updateProfile, error, isPending };
};

export const useJoinGroup = () => {
  const { mutateAsync, error, isPending } = useJoinGroupMutation();
  const joinGroup = async (groupId: string) =>
    mutateAsync(groupId, {
      onError: (error) => enqueueSnackbar(`An error occured trying to join the group: ${error.message}`),
    });
  return { joinGroup, error, isPending };
};

export const useLeaveGroup = () => {
  const { mutateAsync, error, isPending } = useLeaveGroupMutation();
  const leaveGroup = async (groupId: string) =>
    mutateAsync(groupId, {
      onError: (error) => enqueueSnackbar(`An error occured trying to leave the group: ${error.message}`),
    });
  return { leaveGroup, error, isPending };
};
