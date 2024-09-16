import { getCsrfToken, signIn as nextAuthSignIn, signOut as nextAuthSignOut } from 'next-auth/react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useEffect, useState } from 'react';
import { SiweMessage } from 'siwe';
import { useAccount, useDisconnect, useSignMessage } from 'wagmi';

import { PATHS } from '@/config/constants';
import { useGroupsActions } from '@/store/groups.store';
import { useProfileActions } from '@/store/profile.store';
import { useUsersActions } from '@/store/users.store';

const useSignIn = () => {
  const [state, setState] = useState<{
    loading?: boolean;
    nonce?: string;
    error?: Error;
  }>({});
  const { address, chainId } = useAccount();
  const { disconnect } = useDisconnect();
  const { signMessageAsync } = useSignMessage();
  const { initializeProfile, clearProfile } = useProfileActions();
  const { initializeUsers } = useUsersActions();
  const { initializeGroups } = useGroupsActions();
  const router = useRouter();
  const params = useSearchParams();
  const callbackUrl = params.get('callbackUrl') || PATHS.profile;

  const fetchNonce = async () => {
    try {
      const nonce = await getCsrfToken();
      setState((x) => ({ ...x, nonce }));
    } catch (error) {
      setState((x) => ({ ...x, error: error as Error }));
    }
  };

  // Pre-fetch random nonce when component using the hook is rendered
  useEffect(() => {
    fetchNonce();
  }, []);

  const signIn = async () => {
    try {
      if (!address || !chainId) return;

      setState((x) => ({ ...x, loading: true }));
      // Create SIWE message with pre-fetched nonce and sign with wallet
      const message = new SiweMessage({
        domain: window.location.host,
        address,
        statement: 'Quilombo Login - Please sign this message to log in to the app.',
        uri: window.location.origin,
        version: '1',
        chainId,
        nonce: state.nonce,
      });

      const signature = await signMessageAsync({
        message: message.prepareMessage(),
      });

      const res = await nextAuthSignIn('credentials', {
        message: JSON.stringify(message),
        redirect: false,
        signature,
      });

      if (res?.ok && !res.error) {
        initializeProfile();
        initializeUsers();
        initializeGroups();
        if (callbackUrl) {
          router.replace(callbackUrl);
        }
      } else if (res?.error) {
        const msg = `An error occurred while signin in. Code: ${res.status} - ${res.error}`;
        console.error(msg);
        setState((x) => ({ ...x, error: new Error(res.error || 'Unable to authenticate the message') }));
      }

      setState((x) => ({ ...x, loading: false }));
    } catch (error) {
      setState((x) => ({ ...x, loading: false, error: error as Error, nonce: undefined }));
      fetchNonce();
    }
  };

  const logout = async () => {
    await nextAuthSignOut();
    // TODO how to logout from Silk?
    disconnect();
    clearProfile();
    setState({});
  };

  return { signIn, logout, state };
};

export default useSignIn;
