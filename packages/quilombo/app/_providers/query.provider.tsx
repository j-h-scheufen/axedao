'use client';

import { QueryClientProvider } from '@tanstack/react-query';

import { createDefaultQueryClient } from '@/utils';

const queryClient = createDefaultQueryClient();

export default function Provider({ children }: { children: React.ReactNode }) {
  return <QueryClientProvider client={queryClient}>{children} </QueryClientProvider>;
}
