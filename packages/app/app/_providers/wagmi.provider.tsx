'use client';

import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { PropsWithChildren } from 'react';
import { WagmiProvider } from 'wagmi';

import wagmiConfig from '@/config/wagmi';

const queryClient = new QueryClient();

export default function Provider({ children }: PropsWithChildren) {
  return (
    <WagmiProvider config={wagmiConfig}>
      <QueryClientProvider client={queryClient}>{children} </QueryClientProvider>
    </WagmiProvider>
  );
}
