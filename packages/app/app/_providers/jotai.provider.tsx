'use client';

import { createStore, Provider as JotaiProvider } from 'jotai';
import { useSession } from 'next-auth/react';
import { PropsWithChildren, useMemo } from 'react';

import { currentUserProfileAtom } from '@/hooks/state/currentUser';
import { useFetchProfile } from '@/query/profile';

/**
 * Injects the current user's profile into the Jotai store, when the user is logged in.
 * TODO - This should be refactored to use jotai-query atoms. No need to initiate the jotai state here.
 */
export default function Provider({ children }: PropsWithChildren) {
  const { data: session } = useSession();
  const { data: profile } = useFetchProfile();

  const store = useMemo(() => {
    const store = createStore();
    if (session && profile) {
      store.set(currentUserProfileAtom, profile);
    }
    return store;
  }, [session, profile]);

  return <JotaiProvider store={store}>{children}</JotaiProvider>;
}
