'use client';

import { PropsWithChildren, useEffect } from 'react';
import { WagmiProvider } from 'wagmi';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { initSilk } from '@silk-wallet/silk-wallet-sdk';

import wagmiConfig from '@/config/wagmi';

const queryClient = new QueryClient();

export function Provider({ children }: PropsWithChildren) {
  useEffect(() => {
    try {
      setTimeout(() => {
        const provider = initSilk();
        window.ethereum = provider;
      }, 1000);
    } catch (err) {
      console.error(err);
    }
  }, []);

  return (
    <WagmiProvider config={wagmiConfig}>
      <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>
    </WagmiProvider>
  );
}
