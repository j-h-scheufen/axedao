'use client';

import { PropsWithChildren } from 'react';
import { RainbowKitProvider } from '@rainbow-me/rainbowkit';
import { WagmiProvider } from 'wagmi';

import { QueryClientProvider, QueryClient } from '@tanstack/react-query';

import '@rainbow-me/rainbowkit/styles.css';

import wagmiConfig from '@/config/wagmi';

const appInfo = {
  appName: 'Quilombo',
};

const queryClient = new QueryClient();

export function Provider({ children }: PropsWithChildren) {
  return (
    <WagmiProvider config={wagmiConfig}>
      <QueryClientProvider client={queryClient}>
        <RainbowKitProvider appInfo={appInfo}>{children}</RainbowKitProvider>
      </QueryClientProvider>
    </WagmiProvider>
  );
}
