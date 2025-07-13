import { enqueueSnackbar } from 'notistack';

import type {
  CreateLocationForm,
  CreateNewGroupForm,
  UpdateGroupForm,
  UpdateLocationForm,
} from '@/config/validation-schema';
import type { GroupAndLocationParams, GroupAndUserParams } from '@/query';
import {
  useAddAdminMutation,
  useCreateGroupLocationMutation,
  useCreateGroupMutation,
  useDeleteGroupLocationMutation,
  useDeleteGroupMutation,
  useRemoveAdminMutation,
  useRemoveMemberMutation,
  useUpdateGroupLocationMutation,
  useUpdateGroupMutation,
} from '@/query/group';

export const useCreateGroup = () => {
  const { mutateAsync, error, isPending } = useCreateGroupMutation();
  const createGroup = async (data: CreateNewGroupForm) =>
    mutateAsync(data, {
      onError: (error) => enqueueSnackbar(`An error occured trying to create the group: ${error.message}`),
    });
  return { createGroup, error, isPending };
};

export const useDeleteGroup = () => {
  const { mutateAsync, error, isPending } = useDeleteGroupMutation();
  const deleteGroup = async (groupId: string) =>
    mutateAsync(groupId, {
      onError: (error) => enqueueSnackbar(`An error occured trying to delete the group: ${error.message}`),
    });
  return { deleteGroup, error, isPending };
};

export const useUpdateGroup = () => {
  const { mutateAsync, error, isPending } = useUpdateGroupMutation();
  const updateGroup = async (params: { groupId: string; data: UpdateGroupForm }) => {
    return mutateAsync(params, {
      onError: (error) => enqueueSnackbar(`An error occured trying to update the group: ${error.message}`),
    });
  };
  return { updateGroup, error, isPending };
};

export const useAddAdmin = () => {
  const { mutateAsync, error, isPending } = useAddAdminMutation();
  const addAdmin = async (params: GroupAndUserParams) =>
    mutateAsync(params, {
      onError: (error) => enqueueSnackbar(`An error occured trying to add the admin to the group: ${error.message}`),
    });
  return { addAdmin, error, isPending };
};

export const useRemoveAdmin = () => {
  const { mutateAsync, error, isPending } = useRemoveAdminMutation();
  const removeAdmin = async (params: GroupAndUserParams) =>
    mutateAsync(params, {
      onError: (error) =>
        enqueueSnackbar(`An error occured trying to remove the admin from the group: ${error.message}`),
    });
  return { removeAdmin, error, isPending };
};

export const useRemoveMember = () => {
  const { mutateAsync, error, isPending } = useRemoveMemberMutation();
  const removeMember = async (params: GroupAndUserParams) =>
    mutateAsync(params, {
      onError: (error) =>
        enqueueSnackbar(`An error occured trying to remove the member from the group: ${error.message}`),
    });
  return { removeMember, error, isPending };
};

export const useCreateGroupLocation = () => {
  const { mutateAsync, error, isPending } = useCreateGroupLocationMutation();
  const createGroupLocation = async ({ groupId, data }: { groupId: string; data: CreateLocationForm }) =>
    mutateAsync(
      { groupId, data },
      {
        onError: (error) => enqueueSnackbar(`An error occurred trying to create the location: ${error.message}`),
      }
    );
  return { createGroupLocation, error, isPending };
};

export const useUpdateGroupLocation = () => {
  const { mutateAsync, error, isPending } = useUpdateGroupLocationMutation();
  const updateGroupLocation = async ({
    groupId,
    locationId,
    data,
  }: GroupAndLocationParams & { data: UpdateLocationForm }) =>
    mutateAsync(
      { groupId, locationId, data },
      {
        onError: (error) => enqueueSnackbar(`An error occurred trying to update the location: ${error.message}`),
      }
    );
  return { updateGroupLocation, error, isPending };
};

export const useDeleteGroupLocation = () => {
  const { mutateAsync, error, isPending } = useDeleteGroupLocationMutation();
  const deleteGroupLocation = async (params: GroupAndLocationParams) =>
    mutateAsync(params, {
      onError: (error) => enqueueSnackbar(`An error occurred trying to delete the location: ${error.message}`),
    });
  return { deleteGroupLocation, error, isPending };
};
