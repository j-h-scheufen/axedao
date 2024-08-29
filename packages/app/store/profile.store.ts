import { generateErrorMessage, uploadImage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';
import { CreateNewGroupFormType, ProfileFormType } from '../app/dashboard/profile/schema';
import { Profile, ProfileActions, ProfileState, ProfileStore } from '../app/dashboard/profile/types';

const now = new Date();
export const DEFAULT_PROFILE: Profile = {
  id: '',
  createdAt: now,
  name: null,
  updatedAt: now,
  nickname: null,
  title: null,
  avatar: null,
  email: '',
  groupId: null,
  links: [],
  group: null,
  walletAddress: '',
  phone: '',
  isGlobalAdmin: false,
};

const DEFAULT_STATE: ProfileState = {
  profile: DEFAULT_PROFILE,
  isProfileInitialized: false,
  isUpdatingProfile: false,
  isExitingGroup: false,
  isJoiningGroup: false,
  isCreatingGroup: false,
  isSignedIn: false,
};

export const useProfileStore = create<ProfileStore>()((set, get) => ({
  ...DEFAULT_STATE,
  actions: {
    initializeProfile: async () => {
      if (get().isProfileInitialized) return;
      try {
        const { data: profile } = await axios.get('/api/profile');
        set({ profile, isProfileInitialized: true });
      } catch (error: unknown) {
        const message =
          error instanceof Error
            ? error.message
            : 'An error occured while fetching the user profile durint profile.store initialization';
        set({ initializeProfileError: message });
      }
    },
    uploadAvatar: async (file: File, name?: string) => {
      set({ isUploadingAvatar: true });
      const url = await uploadImage(file, name);
      set({ isUploadingAvatar: false });
      return url;
    },
    updateProfile: async (profileData: ProfileFormType) => {
      const {
        profile: { id },
        isUpdatingProfile,
        actions: { uploadAvatar },
      } = get();
      if (isUpdatingProfile || !id) return;
      set({ isUpdatingProfile: true });
      try {
        if (profileData.avatar && profileData.avatar instanceof File) {
          const avatar = await uploadAvatar(profileData.avatar, id ? `user-${id}` : undefined);
          if (avatar) {
            profileData.avatar = avatar;
          } else {
            delete profileData.avatar;
          }
        }
        const { data: profile } = await axios.patch('/api/profile', profileData);
        set({ profile });
      } catch (error: unknown) {
        const message = error instanceof Error ? error.message : 'An error occured while updating your profile';
        set({ profileUpdateError: message });
      }
      set({ isUpdatingProfile: false });
    },
    joinGroup: async (groupId: string) => {
      const { isJoiningGroup, profile } = get();
      if (isJoiningGroup) return;
      set({ isJoiningGroup: true });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/join`);
        if (!data.group) throw new Error('An error occurred while joining group');
        const { group } = data;
        set({ profile: { ...profile, group, groupId: group.id } });
      } catch (error) {
        const message = error instanceof Error ? error.message : 'An error occured while joining group';
        set({ joinGroupError: message });
      }
      set({ isJoiningGroup: false });
    },
    exitGroup: async () => {
      const { isExitingGroup, profile } = get();
      const { groupId } = profile;
      if (isExitingGroup || !groupId) return;
      set({ isExitingGroup: true });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/exit`);
        if (!data.success) throw new Error();
        set({ profile: { ...profile, groupId: null, group: null } });
      } catch (error) {
        const message = error instanceof Error ? error.message : 'An error occured while exiting group';
        set({ exitGroupError: message });
      }
      set({ isExitingGroup: false });
    },
    createGroup: async (groupProfileData: CreateNewGroupFormType) => {
      const { isCreatingGroup, profile } = get();
      if (isCreatingGroup) return;
      set({ isCreatingGroup: true });
      try {
        const { data } = await axios.post(`/api/groups`, groupProfileData);
        if (!data.group) throw new Error('An error occurred while creating group');
        const { group } = data;
        set({ profile: { ...profile, group, groupId: group.id } });
      } catch (error: unknown) {
        const message = generateErrorMessage(error, 'An error occured while creating group');
        set({ createGroupError: message });
      }
      set({ isCreatingGroup: false });
    },
    removeGroupAssociation: async () => {
      const { profile } = get();
      set({ profile: { ...profile, groupId: null, group: null } });
    },
    setIsSignedIn: (isSignedIn) => {
      set({ isSignedIn });
    },
    clearProfile: () => {
      set({ ...DEFAULT_STATE });
    },
  },
}));

export const useProfileActions = (): ProfileActions => useProfileStore((state) => state.actions);

export const useProfile = (): Profile => useProfileStore((state) => state.profile);

export const useIsProfileInitialized = (): boolean => useProfileStore((state) => state.isProfileInitialized);

export const useIsUpdatingProfile = (): boolean => useProfileStore((state) => state.isUpdatingProfile);

export const useIsJoiningGroup = (): boolean => useProfileStore((state) => state.isJoiningGroup);

export const useIsExitingGroup = (): boolean => useProfileStore((state) => state.isExitingGroup);

export const useIsCreatingGroup = (): boolean => useProfileStore((state) => state.isCreatingGroup);

export const useCreateGroupError = (): string | undefined => useProfileStore((state) => state.createGroupError);

export const useIsSignedIn = () => useProfileStore((state) => state.isSignedIn);
