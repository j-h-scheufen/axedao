import { getCsrfToken, signIn as nextAuthSignIn, signOut as nextAuthSignOut } from 'next-auth/react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useState } from 'react';
import { SiweMessage } from 'siwe';
import { Address, createWalletClient, custom } from 'viem';

import { getNetwork } from '@/app/_providers/silk.provider';
import { useWallet } from '@/components/WalletContext';
import { PATHS } from '@/config/constants';
import { useProfileActions } from '@/store/profile.store';

/**
 * Hook for handling Silk authentication and sign-in
 * @returns {Object}  Object containing login, logout, signIn, loginError, and signInError
 */
const useAuth = () => {
  const [loginError, setLoginError] = useState<string | null>(null);
  const [signInError, setSignInError] = useState<string | null>(null);
  const [silkEmail, setSilkEmail] = useState<string | null>(null);
  const { connected, setConnected, walletClient, setWalletClient, userAddress, setUserAddress, currentNetwork } =
    useWallet();
  const router = useRouter();
  const { initializeProfile, clearProfile } = useProfileActions();
  const params = useSearchParams();
  const callbackUrl = params.get('callbackUrl') || PATHS.profile;

  const signIn = async () => {
    if (!connected || !walletClient) return;
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

    // Get the user's signature
    const signature = await walletClient?.signMessage({
      account: userAddress as Address,
      message: await message.prepareMessage(),
    });

    const res = await nextAuthSignIn('credentials', {
      message: JSON.stringify(message),
      redirect: false,
      signature,
    });

    if (res?.ok && !res.error) {
      initializeProfile();
      if (callbackUrl) {
        router.push(callbackUrl);
      }
    } else if (res?.error) {
      const msg = `An error occurred while signin in. Code: ${res.status} - ${res.error}`;
      console.error(msg);
      setSignInError(msg);
    }
  };

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const login = async () => {
    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      await (window as any).silk.login();
      // const email = (await (window as any).silk.requestEmail()) as string | undefined;
      // if (!email) {
      //   setLoginError('Please allow access to your email address in Silk to continue.');
      //   return;
      // }
      // setSilkEmail(email);

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
      setLoginError('Error during login: ' + error);
    }
  };

  const logout = async () => {
    await nextAuthSignOut();
    clearProfile();
    setConnected(false);
    setWalletClient(undefined);
    setUserAddress('');
  };

  return { login, logout, signIn, loginError, signInError };
};

export default useAuth;
