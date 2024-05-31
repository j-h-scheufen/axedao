import { create } from 'zustand';
import { UserProfile } from '@/types/model';
import { initSilk } from '@silk-wallet/silk-wallet-sdk';
import { RegistrationFormType, SignInFormType } from '@/constants/schemas';
import { signIn, signOut } from 'next-auth/react';
import axios from 'axios';

export type AuthState = {
  userProfile: UserProfile;
  isSilkInitialized: boolean;
  isAuthenticating: boolean;
  isAuthenticated: boolean;
  isSigningOut: boolean;
};

type AuthActions = {
  initializeSilk: () => Promise<void>;
  initializeUser: () => Promise<void>;
  register: (credentials: RegistrationFormType) => Promise<void>;
  signIn: (credentials: SignInFormType) => Promise<void>;
  signOut: () => Promise<void>;
};

export type AuthStore = AuthState & { actions: AuthActions };

const now = new Date();
const DEFAULT_PROPS: AuthState = {
  userProfile: {
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
  },
  isSilkInitialized: typeof window !== 'undefined' ? window.ethereum?.isSilk : false,
  isAuthenticating: false,
  isAuthenticated: false,
  isSigningOut: false,
};

const useAuthStore = create<AuthStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initializeSilk: async (): Promise<void> => {
      if (!get().isSilkInitialized) {
        const silk = initSilk();
        window.ethereum = silk;
        set({ isSilkInitialized: true });
      }
    },
    initializeUser: async () => {
      const res = await axios.get('/api/profile');
      // TODO handle error from above request
      set({ isAuthenticating: false, isAuthenticated: true, userProfile: res.data });
    },
    register: async (credentials: RegistrationFormType): Promise<void> => {
      set({ isAuthenticating: true });
      await axios.post('/api/auth/register', credentials);
      // TODO handle error from above request
      await get().actions.signIn({ email: credentials.email });
    },
    signIn: async (credentials: SignInFormType): Promise<void> => {
      if (!get().isAuthenticating) set({ isAuthenticating: true });
      if (!get().isSilkInitialized) return;
      await window.ethereum.login();
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
      const walletAddress = accounts?.length ? accounts[0] : null;
      if (!walletAddress) {
        // TODO handle error
      }
      const res = await signIn('credentials', { ...credentials, walletAddress, redirect: false });
      if (res?.error) {
        // TODO handle error
      }
      await get().actions.initializeUser();
    },
    signOut: async (): Promise<void> => {
      set({ isSigningOut: true });
      await signOut({ redirect: false });
      set(DEFAULT_PROPS);
    },
  },
}));

export default useAuthStore;

export const useAuthActions = (): AuthActions => useAuthStore((state) => state.actions);

export const useUserProfile = (): UserProfile => useAuthStore((state) => state.userProfile);

export const useIsAuthenticating = (): boolean => useAuthStore((state) => state.isAuthenticating);

export const useIsSilkInitialized = (): boolean => useAuthStore((state) => state.isSilkInitialized);

export const useIsAuthenticated = (): boolean => useAuthStore((state) => state.isAuthenticated);

export const useIsSigningOut = (): boolean => useAuthStore((state) => state.isSigningOut);
