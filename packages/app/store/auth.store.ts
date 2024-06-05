import { RegistrationFormType, SignInFormType } from '@/constants/schemas';
import { initSilk } from '@silk-wallet/silk-wallet-sdk';
import { SilkEthereumProviderInterface } from '@silk-wallet/silk-wallet-sdk/dist/lib/provider/types';
import axios from 'axios';
import { signIn, signOut } from 'next-auth/react';
import { create } from 'zustand';

export type AuthState = {
  silk: SilkEthereumProviderInterface | null;
  silkInitializationError?: string;
  isRegistering: boolean;
  registrationError?: string;
  isAuthenticating: boolean;
  isAuthenticated: boolean;
  authenticationError?: string;
  isSigningOut: boolean;
  signOutError?: string;
};

type AuthActions = {
  initializeSilk: () => Promise<void>;
  register: (credentials: RegistrationFormType) => Promise<void>;
  signIn: (credentials: SignInFormType) => Promise<void>;
  signOut: () => Promise<void>;
};

export type AuthStore = AuthState & { actions: AuthActions };

const DEFAULT_PROPS: AuthState = {
  silk: null,
  isRegistering: false,
  isAuthenticating: false,
  isAuthenticated: false,
  isSigningOut: false,
};

const useAuthStore = create<AuthStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initializeSilk: async () => {
      const { silk } = get();
      if (!silk) {
        const silk = initSilk();
        window.ethereum = silk;
        set({ silk });
      }
    },
    register: async (credentials: RegistrationFormType) => {
      const { isRegistering, isAuthenticating } = get();
      if (isRegistering || isAuthenticating) return;
      set({ isRegistering: true });
      try {
        await axios.post('/api/auth/register', credentials);
      } catch (error) {
        const message =
          error instanceof Error && error.message ? error.message : 'An error occured during registration';
        set({ registrationError: message });
      }
      set({ isRegistering: false });
      await get().actions.signIn({ email: credentials.email });
    },
    signIn: async (credentials: SignInFormType) => {
      const { isRegistering, isAuthenticating, silk } = get();
      if (isRegistering || isAuthenticating || !silk) return;
      set({ isAuthenticating: true });
      try {
        await silk.login();
        const accounts = (await silk.request({ method: 'eth_requestAccounts' })) as string[] | undefined;
        // const email = await silk.requestEmail();
        console.log('Accounts: ', accounts);
        const walletAddress = accounts?.length ? accounts[0] : null;
        if (!walletAddress) {
          throw new Error('Silk authentication was unsuccessful');
        }

        const res = await signIn('credentials', { ...credentials, walletAddress, redirect: false });
        const error = res?.error;
        if (error) throw new Error(error);
      } catch (error) {
        console.log(error);
        const message = error instanceof Error && error.message ? error.message : 'An error occured while signing in';
        set({ authenticationError: message });
      }
      set({ isAuthenticating: false });
    },
    signOut: async () => {
      set({ isSigningOut: true });
      try {
        await signOut({ redirect: false });
        set(DEFAULT_PROPS);
      } catch (error) {
        const message = error instanceof Error && error.message ? error.message : 'An error occured while signing out';
        set({ signOutError: message, isSigningOut: false });
      }
    },
  },
}));

export default useAuthStore;

export const useAuthActions = (): AuthActions => useAuthStore((state) => state.actions);

export const useSilk = (): SilkEthereumProviderInterface | null => useAuthStore((state) => state.silk);

export const useIsRegistering = (): boolean => useAuthStore((state) => state.isRegistering);

export const useRegistrationError = (): string | undefined => useAuthStore((state) => state.registrationError);

export const useIsAuthenticating = (): boolean => useAuthStore((state) => state.isAuthenticating);

export const useIsAuthenticated = (): boolean => useAuthStore((state) => state.isAuthenticated);

export const useIsSigningOut = (): boolean => useAuthStore((state) => state.isSigningOut);
