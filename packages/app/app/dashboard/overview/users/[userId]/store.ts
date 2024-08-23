import { Profile } from '@/app/dashboard/profile/types';
import axios, { AxiosError } from 'axios';
import { create } from 'zustand';
import { UserDetailsState, UserDetailsStore } from './types';

const now = new Date();
export const DEFAULT_USER_DETAILS: Profile = {
  id: '',
  createdAt: now,
  name: null,
  updatedAt: now,
  nickname: null,
  title: null,
  avatar: null,
  email: '',
  groupId: null,
  group: null,
  walletAddress: '',
  links: [],
  phone: '',
  isGlobalAdmin: false,
};

const DEFAULT_STATE: UserDetailsState = {
  user: DEFAULT_USER_DETAILS,
  isInitializingUser: false,
  isUserInitialized: false,
};

export const useUserDetailsStore = create<UserDetailsStore>()((set, get) => ({
  ...DEFAULT_STATE,
  actions: {
    initializeUser: async (userId) => {
      const { isInitializingUser } = get();
      if (isInitializingUser) return;
      set({ isInitializingUser: true });
      try {
        const { data } = await axios.get<Profile>(`/api/users/${userId}`);
        if (data.id) set({ user: data });
      } catch (error) {
        const fetchError = error as Error | AxiosError;
        const errorMessage = (fetchError as AxiosError<{ error: string }>).response?.data?.error || fetchError.message;
        set({ initializeError: errorMessage });
      }
      set({ isInitializingUser: false });
    },
  },
}));

export const useUserActions = () => useUserDetailsStore((state) => state.actions);
export const useUser = () => useUserDetailsStore((state) => state.user);
export const useIsInitializingUser = () => useUserDetailsStore((state) => state.isInitializingUser);
export const useIsUserInitialized = () => useUserDetailsStore((state) => state.isUserInitialized);
export const useInitializeUserError = () => useUserDetailsStore((state) => state.initializeError);