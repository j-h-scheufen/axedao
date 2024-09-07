import { getCsrfToken, signIn as nextAuthSignIn, signOut as nextAuthSignOut } from 'next-auth/react';
import { useState } from 'react';
import { SiweMessage } from 'siwe';
import { Address, createWalletClient, custom } from 'viem';

import { getNetwork } from '@/app/_providers/silk.provider';
import { useWallet } from '@/components/WalletContext';
import { useProfileActions } from '@/store/profile.store';

const useAuth = () => {
  const [loginError, setLoginError] = useState<string | null>(null);
  const [signInError, setSignInError] = useState<string | null>(null);
  const { connected, setConnected, walletClient, setWalletClient, userAddress, setUserAddress, currentNetwork } =
    useWallet();
  const { initializeProfile } = useProfileActions();

  const signIn = async () => {
    if (!connected || !walletClient) return;
    const callbackUrl = '/dashboard/profile';
    const nonce = await getCsrfToken();
    const message = new SiweMessage({
      domain: window.location.host,
      address: userAddress,
      statement: 'Axé DAO Sign-In - Please sign this message to log into the Axé DAO app.',
      uri: window.location.origin,
      version: '1',
      chainId: walletClient.chain?.id,
      nonce,
    });
    const signature = await walletClient?.signMessage({
      account: userAddress as Address,
      message: await message.prepareMessage(),
    });
    const res = await nextAuthSignIn('credentials', {
      nonce,
      message: JSON.stringify(message),
      redirect: false,
      signature,
      callbackUrl,
    });
    if (res?.error) {
      setSignInError(
        res?.status === 401
          ? 'No account was found associated with this wallet address. Register if you have not done so, yet, or change the wallet address.'
          : 'An error occurred while signin in: ' + res.error,
      );
    } else {
      initializeProfile();
    }
  };

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const login = async () => {
    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      await (window as any).silk.login();
      const newWalletClient = createWalletClient({
        chain: getNetwork(currentNetwork),
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        transport: custom((window as any).silk as any),
      });
      setWalletClient(newWalletClient);
      setConnected(true);
      const [address] = await newWalletClient.requestAddresses();
      setUserAddress(address);
    } catch (error) {
      console.error(error);
      setLoginError('An error occurred while connecting: ' + error);
    }
  };

  const logout = async () => {
    await nextAuthSignOut();
    setConnected(false);
    setWalletClient(undefined);
    setUserAddress('');
  };

  return { login, logout, signIn, loginError, signInError };
};

export default useAuth;
