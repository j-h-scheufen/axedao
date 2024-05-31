import { create } from 'zustand';
import { GroupProfile } from '@/types/model';

export type GroupProfileState = {
  groupProfile: GroupProfile;
  initialized: boolean;
  isLoading: boolean;
};

type GroupProfileActions = {
  initialize: (id: string) => Promise<void>;
  load: (id: string) => Promise<void>;
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
  initialized: false,
  isLoading: false,
};

const useGroupProfileStore = create<GroupStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (id: string): Promise<void> => {
      if (!get().initialized) {
        get().actions.load(id);
        set({ initialized: true });
      }
    },
    load: async (id: string) => {
      set({ isLoading: true });
      const response = await fetch(`/api/groups/${id}`);
      const groupProfile = await response.json();
      set({ isLoading: false, groupProfile });
    },
  },
}));

export default useGroupProfileStore;

export const useGroupProfileActions = (): GroupProfileActions => useGroupProfileStore((state) => state.actions);

export const useGroupProfile = (): GroupProfile => useGroupProfileStore((state) => state.groupProfile);

export const useGroupProfileIsLoading = (): boolean => useGroupProfileStore((state) => state.isLoading);

export const useGroupProfileIsInitialized = (): boolean => useGroupProfileStore((state) => state.initialized);
