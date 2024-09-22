'use client';

import { PropsWithChildren, createContext, useContext, useRef } from 'react';
import { createStore } from 'zustand';
import { useStoreWithEqualityFn } from 'zustand/traditional';

import { Group, Link, User, UserProfile } from '@/types/model';

/**
 * This is a store for the user profile to be used within a React Context to
 * provide a user profile to children components.
 * This enables the use of react-query hooks to sync the profile with the server.
 */
export type UserProfileState = UserProfile;

export interface UserProfileActions {}

export type UserProfileStore = UserProfileState;

// Vanilla profile store that can be initialized with state
const createUserStore = (profile: UserProfile) => {
  return createStore<UserProfileStore>()(() => ({
    ...profile,
  }));
};

type VanillaProfileStore = ReturnType<typeof createUserStore>;

type UserProfileProviderProps = PropsWithChildren & { profile: UserProfile };

const UserProfileContext = createContext<VanillaProfileStore | null>(null);

// wraps the Provider for the vanilla store
export default function UserProfileProvider({ children, profile }: UserProfileProviderProps) {
  const storeRef = useRef<VanillaProfileStore>();
  if (!storeRef.current) {
    storeRef.current = createUserStore(profile);
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

export const useUser = (): User => useUserProfileContext((state) => state.user);

export const useLinks = (): Link[] => useUserProfileContext((state) => state.links);

export const useGroup = (): Group | null => useUserProfileContext((state) => state.group);
