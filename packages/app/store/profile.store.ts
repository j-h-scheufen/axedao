import { CreateNewGroupFormType, ProfileFormType } from '@/constants/schemas';
import { UserProfile } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

type ProfileState = {
  profile: UserProfile;
  isInitializingProfile: boolean;
  isProfileInitialized: boolean;
  initializeProfileError?: string;
  isUpdatingProfile: boolean;
  profileUpdateError?: string;
  isExitingGroup: boolean;
  exitGroupError?: string;
  isJoiningGroup: boolean;
  joinGroupError?: string;
  isCreatingGroup: boolean;
  createGroupError?: string;
  isUploadingProfileImage?: boolean;
};

type ProfileActions = {
  uploadProfileImage: (file: File, name?: string) => Promise<string | void>;
  initializeProfile: () => Promise<void>;
  updateProfile: (profileData: ProfileFormType) => Promise<void>;
  joinGroup: (groupId: string) => Promise<void>;
  exitGroup: () => Promise<void>;
  createGroup: (groupProfileData: CreateNewGroupFormType) => Promise<void>;
  removeGroupAssociation: () => void;
};

type ProfileStore = ProfileState & { actions: ProfileActions };

const now = new Date();
export const DEFAULT_PROFILE = {
  id: '',
  createdAt: now,
  name: null,
  updatedAt: now,
  nickname: null,
  title: null,
  avatar: null,
  email: '',
  group_id: null,
  links: [],
};

const DEFAULT_PROPS: ProfileState = {
  profile: DEFAULT_PROFILE,
  isInitializingProfile: false,
  isProfileInitialized: false,
  isUpdatingProfile: false,
  isExitingGroup: false,
  isJoiningGroup: false,
  isCreatingGroup: false,
};

const useProfileStore = create<ProfileStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initializeProfile: async () => {
      const { isInitializingProfile } = get();
      if (isInitializingProfile) return;
      set({ isInitializingProfile: true });
      try {
        const { data: profile } = await axios.get('/api/profile');
        set({ profile, isProfileInitialized: true });
      } catch (error: unknown) {
        const message = error instanceof Error ? error.message : 'An error occured while fetching your profile';
        set({ initializeProfileError: message });
      }
      set({ isInitializingProfile: false });
    },
    uploadProfileImage: async (imageFile: File, name?: string) => {
      const data = new FormData();
      data.set('file', imageFile);
      if (name) data.set('name', name);
      const res = await axios.post('/api/images', data, { headers: { 'Content-Type': 'multipart/form-data' } });
      const url: string = res.data?.url;
      if (url) return url;
    },
    updateProfile: async (_profileData: ProfileFormType) => {
      const {
        profile: { id },
        isUpdatingProfile,
        actions: { uploadProfileImage },
      } = get();
      if (isUpdatingProfile) return;
      set({ isUpdatingProfile: true });
      try {
        const profileData = _profileData;
        if (profileData.avatar && profileData.avatar instanceof File) {
          const imageUrl = await uploadProfileImage(profileData.avatar, id ? `user-${id}` : undefined);
          if (imageUrl) {
            profileData.avatar = imageUrl;
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
        if (!data.success) throw new Error();
        set({ profile: { ...profile, group_id: groupId } });
      } catch (error) {
        const message = error instanceof Error ? error.message : 'An error occured while joining group';
        set({ joinGroupError: message });
      }
      set({ isJoiningGroup: false });
    },
    exitGroup: async () => {
      const { isExitingGroup, profile } = get();
      const { group_id } = profile;
      if (isExitingGroup || !group_id) return;
      set({ isExitingGroup: true });
      try {
        const { data } = await axios.post(`/api/groups/${group_id}/exit`);
        if (!data.success) throw new Error();
        set({ profile: { ...profile, group_id: null } });
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
        set({ profile: { ...profile, group_id: data.id } });
      } catch (error: unknown) {
        const message = generateErrorMessage(error, 'An error occured while creating group');
        set({ createGroupError: message });
      }
      set({ isCreatingGroup: false });
    },
    removeGroupAssociation: async () => {
      const { profile } = get();
      set({ profile: { ...profile, group_id: null } });
    },
  },
}));

export const useProfileActions = (): ProfileActions => useProfileStore((state) => state.actions);

export const useProfile = (): UserProfile => useProfileStore((state) => state.profile);

export const useIsInitializingProfile = (): boolean => useProfileStore((state) => state.isInitializingProfile);

export const useIsProfileInitialized = (): boolean => useProfileStore((state) => state.isProfileInitialized);

export const useIsUpdatingProfile = (): boolean => useProfileStore((state) => state.isUpdatingProfile);

export const useIsJoiningGroup = (): boolean => useProfileStore((state) => state.isJoiningGroup);

export const useIsExitingGroup = (): boolean => useProfileStore((state) => state.isExitingGroup);

export const useIsCreatingGroup = (): boolean => useProfileStore((state) => state.isCreatingGroup);

export const useCreateGroupError = (): string | undefined => useProfileStore((state) => state.createGroupError);
