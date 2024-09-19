import { PropsWithChildren, createContext, useContext, useRef } from 'react';
import { createStore } from 'zustand';
import { useStoreWithEqualityFn } from 'zustand/traditional';

import { useFetchUser } from '@/query/user';
import { Link, UserProfile } from '@/types/model';

/**
 * This is a store for the user profile to be used within a React Context to
 * provide a user profile to children components.
 * This enables the use of react-query hooks to sync the profile with the server.
 */
export interface UserProfileState {
  profile?: UserProfile;
}

export interface UserProfileActions {
  initialize: () => Promise<void>;
}

export type UserProfileStore = UserProfileState;

// Vanilla profile store that can be initialized with props
const createUserStore = (initProps?: Partial<UserProfileState>) => {
  return createStore<UserProfileStore>()(() => ({
    ...initProps,
    initialize: async () => {
      const user = useFetchUser('me');
    },
  }));
};

type VanillaProfileStore = ReturnType<typeof createUserStore>;

type UserProfileProviderProps = PropsWithChildren & Partial<UserProfileState>;

const UserProfileContext = createContext<VanillaProfileStore | null>(null);

// wraps the ProfileContext.Provider for the vanilla store
export function UserProvider({ children, ...props }: UserProfileProviderProps) {
  const storeRef = useRef<VanillaProfileStore>();
  if (!storeRef.current) {
    storeRef.current = createUserStore(props);
  }
  return <UserProfileContext.Provider value={storeRef.current}>{children}</UserProfileContext.Provider>;
}

// custom hook for the context-based ProfileStore
export function useUserProfileContext<T>(
  selector: (state: UserProfileStore) => T,
  equalityFn?: (left: T, right: T) => boolean,
): T {
  const store = useContext(UserProfileContext);
  if (!store) throw new Error('Missing UserProvider in the tree');
  return useStoreWithEqualityFn(store, selector, equalityFn);
}

export const useUserProfile = (): UserProfile | undefined => useUserProfileContext((state) => state.profile);

export const useLinks = (): Link[] => useUserProfileContext((state) => state.profile?.links ?? []);
