import axios from 'axios';
import { create } from 'zustand';

import { ProfileForm } from '@/config/validation-schema';
import { Group, Link, User, UserProfile } from '@/types/model';
import { uploadImage } from '@/utils';

export type ProfileState = UserProfile & {
  isInitialized: boolean;
  isInitializing: boolean;
  initializeProfileError?: string;
  isUpdatingProfile: boolean;
  profileUpdateError?: string;
  isExitingGroup: boolean;
  exitGroupError?: string;
  isJoiningGroup: boolean;
  joinGroupError?: string;
  isUploadingAvatar?: boolean;
  isSignedIn: boolean;
};

export type ProfileActions = {
  initializeProfile: () => Promise<void>;
  uploadAvatar: (file: File, name?: string) => Promise<string | void>;
  updateProfile: (profileData: ProfileForm) => Promise<void>;
  joinGroup: (groupId: string) => Promise<void>;
  exitGroup: () => Promise<void>;
  removeGroupAssociation: () => void;
  setIsSignedIn: (isSignedIn: boolean) => void;
  clearProfile: () => void;
  updateGroup: (group: Group) => void;
};

export type ProfileStore = ProfileState & { actions: ProfileActions };

const now = new Date();
export const DEFAULT_PROFILE: UserProfile = {
  user: {
    id: '',
    createdAt: now,
    name: null,
    updatedAt: now,
    nickname: null,
    title: null,
    avatar: null,
    email: '',
    groupId: null,
    walletAddress: '',
    phone: '',
    isGlobalAdmin: false,
  },
  links: [],
  group: null,
};

const DEFAULT_STATE: ProfileState = {
  ...DEFAULT_PROFILE,
  isInitialized: false,
  isInitializing: false,
  isUpdatingProfile: false,
  isExitingGroup: false,
  isJoiningGroup: false,
  isSignedIn: false,
};

export const useProfileStore = create<ProfileStore>()((set, get) => ({
  ...DEFAULT_STATE,
  actions: {
    initializeProfile: async () => {
      const { isInitialized, isInitializing } = get();
      if (isInitialized || isInitializing) return;
      set({ isInitializing: true });
      try {
        const { data: profile } = await axios.get('/api/profile');
        set({ ...profile, isInitialized: true });
      } catch (error: unknown) {
        const message =
          error instanceof Error
            ? error.message
            : 'An error occured while fetching the user profile during profile.store initialization';
        set({ initializeProfileError: message });
      } finally {
        set({ isInitializing: false });
      }
    },
    uploadAvatar: async (file: File, name?: string) => {
      set({ isUploadingAvatar: true });
      const url = await uploadImage(file, name);
      set({ isUploadingAvatar: false });
      return url;
    },
    updateProfile: async (profileData: ProfileForm) => {
      const {
        user: { id },
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
        set({ ...profile });
      } catch (error: unknown) {
        const message = error instanceof Error ? error.message : 'An error occured while updating your profile';
        set({ profileUpdateError: message });
      }
      set({ isUpdatingProfile: false });
    },
    joinGroup: async (groupId: string) => {
      const { isJoiningGroup } = get();
      if (isJoiningGroup) return;
      set({ isJoiningGroup: true });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/join`);
        if (!data.group) throw new Error('An error occurred while joining group');
        const { group } = data;
        set((state) => ({ ...state, user: { ...state.user, groupId: group.id }, group }));
      } catch (error) {
        const message = error instanceof Error ? error.message : 'An error occured while joining group';
        set({ joinGroupError: message });
      }
      set({ isJoiningGroup: false });
    },
    exitGroup: async () => {
      const {
        isExitingGroup,
        user: { groupId },
      } = get();
      if (isExitingGroup || !groupId) return;
      set({ isExitingGroup: true });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/exit`);
        if (!data.success) throw new Error(data.message || 'An error occurred while exiting group');
        set((state) => ({ ...state, user: { ...state.user, groupId: null }, group: null }));
      } catch (error) {
        const message = error instanceof Error ? error.message : 'An error occured while exiting group';
        set({ exitGroupError: message });
      }
      set({ isExitingGroup: false });
    },
    removeGroupAssociation: async () => {
      set((state) => ({ ...state, user: { ...state.user, groupId: null }, group: null }));
    },
    setIsSignedIn: (isSignedIn) => {
      set({ isSignedIn });
    },
    clearProfile: () => {
      set({ ...DEFAULT_STATE });
    },
    updateGroup: (group) => {
      set((state) => ({ ...state, user: { ...state.user, groupId: group.id }, group }));
    },
  },
}));

export const useProfileActions = (): ProfileActions => useProfileStore((state) => state.actions);

export const useProfile = (): UserProfile =>
  useProfileStore((state) => ({ user: state.user, links: state.links, group: state.group }));

export const useProfileUser = (): User => useProfileStore((state) => state.user);
export const useProfileGroup = (): Group | null => useProfileStore((state) => state.group);
export const useProfileLinks = (): Link[] => useProfileStore((state) => state.links);

export const useIsSignedIn = (): boolean => useProfileStore((state) => state.isSignedIn);

export const useIsProfileInitialized = (): boolean => useProfileStore((state) => state.isInitialized);

export const useIsExitingGroup = (): boolean => useProfileStore((state) => state.isExitingGroup);

export const useProfileErrors = () =>
  useProfileStore((state) => ({
    initializeProfileError: state.initializeProfileError,
    profileUpdateError: state.profileUpdateError,
    joinGroupError: state.joinGroupError,
    exitGroupError: state.exitGroupError,
  }));
