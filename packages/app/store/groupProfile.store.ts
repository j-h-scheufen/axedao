import { GroupFormType } from '@/constants/schemas';
import { GroupProfile } from '@/types/model';
import { generateErrorMessage, uploadImage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

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

type GroupProfileActions = {
  initialize: (id: string) => Promise<void>;
  uploadLogo: (file: File, name?: string) => Promise<string | void>;
  uploadBanner: (file: File, name?: string) => Promise<string | void>;
  updateGroupProfile: (groupProfileData: GroupFormType) => Promise<void>;
  delete: () => Promise<void>;
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
      const { isInitializingGroupProfile } = get();
      if (isInitializingGroupProfile) return;
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
        const groupGrofileData = _groupProfileData;
        if (groupGrofileData.logo && groupGrofileData.logo instanceof File) {
          const logo = await uploadLogo(groupGrofileData.logo, id ? `user-${id}` : undefined);
          if (logo) {
            groupGrofileData.logo = logo;
          } else {
            delete groupGrofileData.logo;
          }
        }
        if (groupGrofileData.banner && groupGrofileData.banner instanceof File) {
          const banner = await uploadBanner(groupGrofileData.banner, id ? `user-${id}` : undefined);
          if (banner) {
            groupGrofileData.banner = banner;
          } else {
            delete groupGrofileData.banner;
          }
        }
        // const { data: profile } = await axios.patch('/api/profile', groupGrofileData);
        // set({ profile });
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
  },
}));

export default useGroupProfileStore;

export const useGroupProfileActions = (): GroupProfileActions => useGroupProfileStore((state) => state.actions);

export const useGroupProfile = (): GroupProfile => useGroupProfileStore((state) => state.groupProfile);

export const useIsInitializingGroupProfile = (): boolean =>
  useGroupProfileStore((state) => state.isInitializingGroupProfile);

export const useIsGroupProfileInitialized = (): boolean =>
  useGroupProfileStore((state) => state.isGroupProfileInitialized);

export const useInitializeGroupError = (): string | undefined =>
  useGroupProfileStore((state) => state.initializeGroupError);

export const useIsGroupAdmin = (): boolean => useGroupProfileStore((state) => state.isGroupAdmin);

export const useIsDeletingGroup = (): boolean => useGroupProfileStore((state) => state.isDeleting);
