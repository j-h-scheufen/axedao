import { useAtom } from 'jotai';
import { enqueueSnackbar } from 'notistack';
import { useEffect } from 'react';

import { ProfileForm } from '@/config/validation-schema';
import {
  useFetchProfile,
  useJoinGroupMutation,
  useLeaveGroupMutation,
  useUpdateProfileMutation,
} from '@/query/profile';
import { currentUserProfileAtom } from './state/currentUser';

export const initProfile = () => {
  const [currentProfile, setCurrentProfile] = useAtom(currentUserProfileAtom);
  const { data: profile, error } = useFetchProfile();
  useEffect(() => {
    if (!currentProfile && profile) setCurrentProfile(profile);
  }, [profile, currentProfile, setCurrentProfile]);

  return { profile: currentProfile, error };
};

export const useUpdateProfile = () => {
  const [, setCurrentUserProfile] = useAtom(currentUserProfileAtom);
  const { mutateAsync, error, isPending } = useUpdateProfileMutation();
  const updateProfile = async (data: ProfileForm) =>
    mutateAsync(data, {
      onError: (error) => enqueueSnackbar(`An error occured trying to update the group: ${error.message}`),
    }).then((profileUpdate) => {
      setCurrentUserProfile(profileUpdate);
    });
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
