'use client';

import { initSilk } from '@silk-wallet/silk-wallet-sdk';
import { SilkEthereumProviderInterface } from '@silk-wallet/silk-wallet-sdk/dist/lib/provider/types';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { PropsWithChildren, useCallback, useEffect, useState } from 'react';
import { Address, createWalletClient, custom, WalletClient } from 'viem';
import { gnosis, sepolia } from 'viem/chains';
import { Config, WagmiProvider } from 'wagmi';

import WalletContext from '@/components/WalletContext';
import defaultWagmiConfig, { createSilkConfig } from '@/config/wagmi';

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

  const initializeWalletClient = useCallback(
    (account: Address) => {
      const newWalletClient = createWalletClient({
        account,
        chain: getNetwork(currentNetwork),
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        transport: custom((window as any).silk as any),
      });
      setWalletClient(newWalletClient);
    },
    [currentNetwork],
  );

  const verifyConnection = useCallback(async () => {
    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const accounts = await (window as any).silk.request({ method: 'eth_accounts' });
      if (accounts.length > 0) {
        setUserAddress(accounts[0]);
        setConnected(true);
        initializeWalletClient(accounts[0]);
      } else {
        setConnected(false);
      }
    } catch (err) {
      console.error('Error checking connection:', err);
      setConnected(false);
    }
  }, [initializeWalletClient]);

  useEffect(() => {
    if (typeof window === 'undefined') return;

    const silk: SilkEthereumProviderInterface = initSilk();
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (window as any).silk = silk;
    verifyConnection();
  }, [initializeWalletClient, verifyConnection]);

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
        verifyConnection,
      }}
    >
      <WagmiWrapper>{children}</WagmiWrapper>
    </WalletContext.Provider>
  );
}

/**
 *
 * @param param0
 * @returns
 */
const WagmiWrapper = ({ children }: PropsWithChildren) => {
  const [wagmiConfig, setWagmiConfig] = useState<Config>(defaultWagmiConfig);
  useEffect(() => {
    console.log('Creating Silk config');
    setWagmiConfig(createSilkConfig());
  }, []);
  return (
    <WagmiProvider config={wagmiConfig}>
      <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>
    </WagmiProvider>
  );
};
