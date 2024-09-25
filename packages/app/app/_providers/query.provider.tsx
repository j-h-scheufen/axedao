'use client';

import { QueryClientProvider } from '@tanstack/react-query';
import { queryClientAtom } from 'jotai-tanstack-query';
import { useHydrateAtoms } from 'jotai/react/utils';

import { createDefaultQueryClient } from '@/utils';

const queryClient = createDefaultQueryClient();

export default function Provider({ children }: { children: React.ReactNode }) {
  // This ensures that React Query and Jotai Query atoms are using the same client
  useHydrateAtoms(new Map([[queryClientAtom, queryClient]]));

  return <QueryClientProvider client={queryClient}>{children} </QueryClientProvider>;
}
