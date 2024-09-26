import { useAtom } from 'jotai';
import { enqueueSnackbar } from 'notistack';

import { CreateNewGroupForm, UpdateGroupForm } from '@/config/validation-schema';
import { GroupAndUserParams } from '@/query';
import {
  useAddAdminMutation,
  useCreateGroupMutation,
  useDeleteGroupMutation,
  useRemoveAdminMutation,
  useRemoveMemberMutation,
  useUpdateGroupMutation,
} from '@/query/group';
import { FileUploadParams, useUploadImageMutation } from '@/query/image';
import { groupMembersAtom } from './state/group';

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
  const { mutateAsync: mutateImage } = useUploadImageMutation();
  const updateGroup = async (params: { groupId: string; data: UpdateGroupForm }) => {
    if (params.data.logo && params.data.logo instanceof File) {
      const uploadParams: FileUploadParams = {
        file: params.data.logo,
        name: params.groupId ? `group-logo-${params.groupId}` : undefined,
      };
      const hash = await mutateImage(uploadParams);
      if (hash) params.data.logo = hash;
      else {
        console.warn('Logo upload successful, but no hash returned.');
        delete params.data.logo;
      }
    }

    if (params.data.banner && params.data.banner instanceof File) {
      const uploadParams: FileUploadParams = {
        file: params.data.banner,
        name: params.groupId ? `group-logo-${params.groupId}` : undefined,
      };
      const hash = await mutateImage(uploadParams);
      if (hash) params.data.banner = hash;
      else {
        console.warn('Logo upload successful, but no hash returned.');
        delete params.data.banner;
      }
    }

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
  const [, setGroupMembers] = useAtom(groupMembersAtom);
  const { mutateAsync, error, isPending } = useRemoveMemberMutation();
  const removeMember = async (params: GroupAndUserParams) =>
    mutateAsync(params, {
      onError: (error) => enqueueSnackbar(`An error occured trying to remove the group member: ${error.message}`),
    });
  return { removeMember, error, isPending };
};
