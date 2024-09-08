'use client';

import { initSilk } from '@silk-wallet/silk-wallet-sdk';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { PropsWithChildren, useCallback, useEffect, useState } from 'react';
import { WalletClient, createWalletClient, custom } from 'viem';
import { gnosis, sepolia } from 'viem/chains';
import { WagmiProvider } from 'wagmi';

import WalletContext from '@/components/WalletContext';
import wagmiConfig from '@/config/wagmi';

const queryClient = new QueryClient();

export function getNetwork(name: string) {
  let network = null;
  switch (name) {
    case 'gnosis':
      network = gnosis;
      break;
    case 'sepolia':
      network = sepolia;
      break;
    default:
      network = sepolia;
      break;
  }
  return network;
}
export default function Provider({ children }: PropsWithChildren) {
  const [connected, setConnected] = useState<boolean | undefined>(undefined);
  const [walletClient, setWalletClient] = useState<WalletClient | undefined>(undefined);
  const [userAddress, setUserAddress] = useState<string>('');
  const [currentNetwork, setCurrentNetwork] = useState<string>('');

  const initializeWalletClient = useCallback(() => {
    const newWalletClient = createWalletClient({
      chain: getNetwork(currentNetwork),
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      transport: custom((window as any).silk as any),
    });
    setWalletClient(newWalletClient);
  }, [currentNetwork]);

  useEffect(() => {
    if (typeof window === 'undefined') return;

    const silk = initSilk();
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (window as any).silk = silk;

    const checkConnection = async () => {
      try {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const accounts = await (window as any).silk.request({ method: 'eth_accounts' });
        if (accounts.length > 0) {
          setUserAddress(accounts[0]);
          setConnected(true);
          initializeWalletClient();
        } else {
          setConnected(false);
        }
      } catch (err) {
        console.error('Error checking connection:', err);
        setConnected(false);
      }
    };
    checkConnection();
  }, [initializeWalletClient]);

  return (
    <WalletContext.Provider
      value={{
        connected,
        setConnected,
        walletClient,
        setWalletClient,
        userAddress,
        setUserAddress,
        currentNetwork,
        setCurrentNetwork,
        initializeWalletClient,
      }}
    >
      <WagmiProvider config={wagmiConfig}>
        <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>
      </WagmiProvider>
    </WalletContext.Provider>
  );
}
