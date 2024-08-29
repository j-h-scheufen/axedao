import { PropsWithChildren, createContext, useContext, useRef } from 'react';
import { createStore } from 'zustand';
import { useStoreWithEqualityFn } from 'zustand/traditional';

import { Profile } from '@/app/dashboard/profile/types';

/**
 * NOTE: this store is currently not in use, but can be used to manage user profile data per component in the future.
 */
export interface UserState {
  profile?: Profile;
}

export type UserStore = UserState;

// Vanilla profile store that can be initialized with props
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
const createUserStore = (initProps?: Partial<UserState>) => {
  return createStore<UserStore>()(() => ({
    ...initProps,
  }));
};

type VanillaProfileStore = ReturnType<typeof createUserStore>;

type UserProviderProps = PropsWithChildren & Partial<UserState>;

const UserContext = createContext<VanillaProfileStore | null>(null);

// wraps the ProfileContext.Provider for the vanilla ProfileStore
export function UserProvider({ children, ...props }: UserProviderProps) {
  const storeRef = useRef<VanillaProfileStore>();
  if (!storeRef.current) {
    storeRef.current = createUserStore(props);
  }
  return <UserContext.Provider value={storeRef.current}>{children}</UserContext.Provider>;
}

// custom hook for the context-based ProfileStore
export function useUserContext<T>(selector: (state: UserStore) => T, equalityFn?: (left: T, right: T) => boolean): T {
  const store = useContext(UserContext);
  if (!store) throw new Error('Missing UserProvider in the tree');
  return useStoreWithEqualityFn(store, selector, equalityFn);
}

export const useUser = (): Profile | undefined => useUserContext((state) => state.profile);
