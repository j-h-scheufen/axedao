'use client';

import { Provider as JotaiProvider } from 'jotai';
import { queryClientAtom } from 'jotai-tanstack-query';
import { useHydrateAtoms } from 'jotai/react/utils';
import { useSession } from 'next-auth/react';
import type { PropsWithChildren } from 'react';

import { triggerCurrentUserIdAtom } from '@/hooks/state/currentUser';
import { useQueryClient } from '@tanstack/react-query';

/**
 * Injects the current user's profile into the Jotai store, when the user is logged in.
 */
const AppStateProvider = ({ children }: PropsWithChildren) => {
  const { data: session } = useSession();
  const queryClient = useQueryClient();
  // Hydrate currentUser on first page load and page refresh
  useHydrateAtoms([
    [queryClientAtom, queryClient], // This ensures that React Query and Jotai Query atoms are using the same client
    [triggerCurrentUserIdAtom, session?.user?.id],
  ] as const);

  return children;
};

const Provider = ({ children }: PropsWithChildren) => (
  <JotaiProvider>
    <AppStateProvider>{children}</AppStateProvider>
  </JotaiProvider>
);

export default Provider;
