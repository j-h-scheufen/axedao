import { enqueueSnackbar } from 'notistack';

import { useJoinGroupMutation, useLeaveGroupMutation } from '@/query/currentUser';

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
