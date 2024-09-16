import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';

import { GroupFormType } from '@/config/validation-schema';
import { ProfileState, useProfileStore } from '@/store/profile.store';
import { GroupProfile } from '@/types/model';
import { generateErrorMessage, uploadImage } from '@/utils';

export type GroupProfileState = {
  groupProfile: GroupProfile;
  isGroupAdmin: boolean;
  initializeGroupError?: string;
  isDeleting: boolean;
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
    group: {
      id: '',
      email: '',
      createdAt: now,
      name: '',
      updatedAt: now,
      description: null,
      logo: null,
      banner: null,
      leader: null,
      founder: null,
      verified: false,
      city: '',
      country: '',
    },
    links: [],
    adminIds: [],
  },
  isGroupAdmin: false,
  isDeleting: false,
};

const useGroupProfileStore = create<GroupStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (id: string) => {
      try {
        const { data } = await axios.get(`/api/groups/${id}`);
        if (!data?.groupProfile) throw new Error();
        const { groupProfile, isAdmin } = data || {};
        set({ groupProfile, isGroupAdmin: isAdmin });
      } catch (error: unknown) {
        console.error(error);
        const message = generateErrorMessage(error, 'An error occured while fetching group');
        set({ initializeGroupError: message });
      }
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
        groupProfile: {
          group: { id },
        },
        actions: { uploadBanner, uploadLogo },
      } = get();
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
        const { data } = await axios.patch<Omit<GroupProfile, 'adminIds'>>(`/api/groups/${id}`, groupProfileData);
        const groupProfile = { ...data, adminIds: get().groupProfile?.adminIds };
        set({ groupProfile });
        // update the user's group in profile store
        useProfileStore.setState(
          produce((state: ProfileState) => {
            state.group = data.group;
          }),
        );
      } catch (error: unknown) {
        const message = error instanceof Error ? error.message : 'An error occured while updating your profile';
        set({ groupProfileUpdateError: message });
      }
    },
    delete: async () => {
      const { groupProfile, isDeleting } = get();
      const groupId = groupProfile.group.id;
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

export const useGroupProfile = (): GroupProfile => useGroupProfileStore((state) => state.groupProfile);

export const useInitializeGroupError = (): string | undefined =>
  useGroupProfileStore((state) => state.initializeGroupError);

export const useIsGroupAdmin = (): boolean => useGroupProfileStore((state) => state.isGroupAdmin);

export const useGroupBanner = (): string | null => useGroupProfileStore((state) => state.groupProfile.group.banner);

export const useIsDeletingGroup = (): boolean => useGroupProfileStore((state) => state.isDeleting);
