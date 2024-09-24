'use client';

import { createStore, Provider as JotaiProvider } from 'jotai';
import { useSession } from 'next-auth/react';
import { PropsWithChildren, useMemo } from 'react';

import { currentUserProfileAtom } from '@/hooks/state/currentUser';
import { useFetchProfile } from '@/query/profile';

type Props = PropsWithChildren & {};

/**
 * Injects the current user's profile into the Jotai store, once the user is logged in.
 */
export default function Provider({ children }: Props) {
  const { data: session } = useSession();
  const { data: profile } = useFetchProfile();

  const store = useMemo(() => {
    if (session && profile) {
      const store = createStore();
      store.set(currentUserProfileAtom, profile);
      return store;
    }
    return undefined;
  }, [session, profile]);

  return <JotaiProvider store={store}>{children}</JotaiProvider>;
}
