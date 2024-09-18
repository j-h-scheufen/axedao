import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';

import { GroupFormType } from '@/config/validation-schema';
import { ProfileState, useProfileStore } from '@/store/profile.store';
import { GroupProfile } from '@/types/model';
import { generateErrorMessage, isCurrentUserGroupAdmin, uploadImage } from '@/utils';

/**
 * This store holds the state of a GroupProfile and provides functions to update it.
 * The profile is either loaded via the group ID or set directly.
 */

export type GroupProfileState = {
  groupProfile: GroupProfile;
  isGroupAdmin: boolean;
  loadError?: string;
  isDeleting: boolean;
  updateError?: string;
  isUploadingLogo?: boolean;
  isUploadingBanner?: boolean;
};

export type GroupProfileActions = {
  loadGroupProfile: (id: string) => Promise<void>;
  setGroupProfile(profile: GroupProfile): Promise<void>;
  uploadLogo: (file: File, name?: string) => Promise<string | void>;
  uploadBanner: (file: File, name?: string) => Promise<string | void>;
  updateGroupProfile: (profileData: GroupFormType) => Promise<void>;
  delete: () => Promise<void>;
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
    loadGroupProfile: async (id: string) => {
      try {
        const { data: groupProfile } = await axios.get(`/api/groups/${id}`);
        const isGroupAdmin = await isCurrentUserGroupAdmin(groupProfile.adminIds);
        set({ groupProfile, isGroupAdmin, loadError: undefined });
      } catch (error: unknown) {
        console.error(error);
        const message = generateErrorMessage(error, 'An error occured while fetching group');
        set({ loadError: message });
      }
    },
    setGroupProfile: async (profile: GroupProfile) => {
      const isGroupAdmin = await isCurrentUserGroupAdmin(profile.adminIds);
      set({ groupProfile: profile, isGroupAdmin, loadError: undefined });
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
    updateGroupProfile: async (groupProfileData: GroupFormType) => {
      const {
        groupProfile: {
          group: { id },
        },
        actions: { uploadBanner, uploadLogo },
      } = get();
      try {
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
        // Update the core group data
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
        set({ updateError: message });
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
  },
}));

export default useGroupProfileStore;

export const useGroupProfileActions = (): GroupProfileActions => useGroupProfileStore((state) => state.actions);

export const useGroupProfile = (): GroupProfile => useGroupProfileStore((state) => state.groupProfile);

export const useInitializeGroupError = (): string | undefined => useGroupProfileStore((state) => state.loadError);

export const useIsGroupAdmin = (): boolean => useGroupProfileStore((state) => state.isGroupAdmin);

export const useGroupBanner = (): string | null => useGroupProfileStore((state) => state.groupProfile.group.banner);

export const useIsDeletingGroup = (): boolean => useGroupProfileStore((state) => state.isDeleting);
