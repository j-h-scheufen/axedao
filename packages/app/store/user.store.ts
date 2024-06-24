import { User } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

type UserState = {
  profile: User;
  isInitializing?: boolean;
  initializeProfileError?: string;
};

type UserActions = {
  initialize: (userId: string) => Promise<void>;
};

type UserStore = UserState & { actions: UserActions };

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

export const DEFAULT_PROPS: UserState = {
  profile: DEFAULT_PROFILE,
  isInitializing: false,
};

const useUserStore = create<UserStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (userId: string) => {
      const { isInitializing } = get();
      if (isInitializing) return;
      set({ isInitializing: true });
      try {
        const { data } = await axios.get(`/api/users/${userId}`);
        if (data?.id) set({ profile: data as User });
      } catch (error) {
        const message = generateErrorMessage(error as Error, 'An error occurred while fetching user');
        set({ initializeProfileError: message });
      }
      set({ isInitializing: false });
    },
  },
}));

export const useUserActions = (): UserActions => useUserStore((state) => state.actions);

export const useInitializeUserError = (): string | undefined => useUserStore((state) => state.initializeProfileError);

export const useIsInitializingUser = (): boolean | undefined => useUserStore((state) => state.isInitializing);

export const useUserProfile = (): User => useUserStore((state) => state.profile);
