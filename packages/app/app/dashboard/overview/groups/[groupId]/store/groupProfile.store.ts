import axios from 'axios';
import { produce } from 'immer';
import { omit } from 'lodash';
import { create } from 'zustand';

import { GroupFormType } from '@/constants/schemas';
import { ProfileState, useProfileStore } from '@/store/profile.store';
import { GroupProfile } from '@/types/model';
import { generateErrorMessage, uploadImage } from '@/utils';

export type GroupProfileState = {
  groupProfile: GroupProfile;
  isGroupAdmin: boolean;
  isInitializingGroupProfile: boolean;
  isGroupProfileInitialized: boolean;
  initializeGroupError?: string;
  isDeleting: boolean;
  isUpdatingGroupProfile: boolean;
  groupProfileUpdateError?: string;
  isUploadingLogo?: boolean;
  isUploadingBanner?: boolean;
};

export type GroupProfileActions = {
  initialize: (id: string) => Promise<void>;
  uploadLogo: (file: File, name?: string) => Promise<string | void>;
  uploadBanner: (file: File, name?: string) => Promise<string | void>;
  updateGroupProfile: (groupProfileData: GroupFormType) => Promise<void>;
  delete: () => Promise<void>;
  setGroupProfileFields: (groupProfileData: Partial<GroupProfile>) => void;
};

export type GroupStore = GroupProfileState & { actions: GroupProfileActions };

const now = new Date();
const DEFAULT_PROPS: GroupProfileState = {
  groupProfile: {
    id: '',
    createdAt: now,
    name: '',
    updatedAt: now,
    description: null,
    logo: null,
    banner: null,
    leader: null,
    founder: null,
    verified: false,
    links: [],
    city: '',
    country: '',
  },
  isGroupAdmin: false,
  isGroupProfileInitialized: false,
  isInitializingGroupProfile: false,
  isUpdatingGroupProfile: false,
  isDeleting: false,
};

const useGroupProfileStore = create<GroupStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (id: string) => {
      const { isInitializingGroupProfile, groupProfile } = get();
      if (isInitializingGroupProfile || groupProfile.id === id) return;
      set({ isInitializingGroupProfile: true });
      try {
        const { data } = await axios.get(`/api/groups/${id}`);
        if (!data?.groupProfile) throw new Error();
        const { groupProfile, isAdmin } = data || {};
        set({ groupProfile, isGroupAdmin: isAdmin, isGroupProfileInitialized: true });
      } catch (error: unknown) {
        console.log(error);
        const message = generateErrorMessage(error, 'An error occured while fetching group');
        set({ initializeGroupError: message });
      }
      set({ isInitializingGroupProfile: false });
    },
    uploadLogo: async (file: File, name?: string) => {
      set({ isUploadingLogo: true });
      const url = await uploadImage(file, name);
      set({ isUploadingLogo: false });
      return url;
    },
    uploadBanner: async (file: File, name?: string) => {
      set({ isUploadingBanner: true });
      const url = await uploadImage(file, name);
      set({ isUploadingBanner: false });
      return url;
    },
    updateGroupProfile: async (_groupProfileData: GroupFormType) => {
      const {
        groupProfile: { id },
        isUpdatingGroupProfile,
        actions: { uploadBanner, uploadLogo },
      } = get();
      if (isUpdatingGroupProfile || !id) return;
      set({ isUpdatingGroupProfile: true });
      try {
        const groupProfileData = _groupProfileData;
        if (groupProfileData.logo && groupProfileData.logo instanceof File) {
          const logo = await uploadLogo(groupProfileData.logo, id ? `user-${id}` : undefined);
          if (logo) {
            groupProfileData.logo = logo;
          } else {
            delete groupProfileData.logo;
          }
        }
        if (groupProfileData.banner && groupProfileData.banner instanceof File) {
          const banner = await uploadBanner(groupProfileData.banner, id ? `user-${id}` : undefined);
          if (banner) {
            groupProfileData.banner = banner;
          } else {
            delete groupProfileData.banner;
          }
        }
        const { data } = await axios.patch<Omit<GroupProfile, 'admins'>>(`/api/groups/${id}`, groupProfileData);
        const groupProfile = { ...data, admins: get().groupProfile?.admins };
        set({ groupProfile });
        useProfileStore.setState(
          produce((state: ProfileState) => {
            state.profile.group = omit(data, ['links']);
          }),
        );
      } catch (error: unknown) {
        const message = error instanceof Error ? error.message : 'An error occured while updating your profile';
        set({ groupProfileUpdateError: message });
      }
      set({ isUpdatingGroupProfile: false });
    },
    delete: async () => {
      const { groupProfile, isDeleting } = get();
      const groupId = groupProfile.id;
      if (!groupId || isDeleting) return;
      set({ isDeleting: true });
      try {
        const { data } = await axios.delete(`/api/groups/${groupId}`);
        if (!data.success) throw new Error('An error occurred while deleting group');
        set({ ...DEFAULT_PROPS });
      } catch (error) {
        console.error(error);
      }
      set({ isDeleting: false });
    },
    setGroupProfileFields: (groupProfileData: Partial<GroupProfile>) => {
      const { groupProfile } = get();
      set({ groupProfile: { ...groupProfile, ...groupProfileData } });
    },
  },
}));

export default useGroupProfileStore;

export const useGroupProfileActions = (): GroupProfileActions => useGroupProfileStore((state) => state.actions);

export const useIsUpdatingGroupProfile = (): boolean => useGroupProfileStore((state) => state.isUpdatingGroupProfile);

export const useGroupProfile = (): GroupProfile => useGroupProfileStore((state) => state.groupProfile);

export const useIsInitializingGroupProfile = (): boolean =>
  useGroupProfileStore((state) => state.isInitializingGroupProfile);

export const useIsGroupProfileInitialized = (): boolean =>
  useGroupProfileStore((state) => state.isGroupProfileInitialized);

export const useInitializeGroupError = (): string | undefined =>
  useGroupProfileStore((state) => state.initializeGroupError);

export const useIsGroupAdmin = (): boolean => useGroupProfileStore((state) => state.isGroupAdmin);

export const useIsDeletingGroup = (): boolean => useGroupProfileStore((state) => state.isDeleting);
