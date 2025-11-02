import { useSetAtom } from 'jotai';
import { getCsrfToken, getSession, signIn as nextAuthSignIn, signOut as nextAuthSignOut } from 'next-auth/react';
import { useSearchParams } from 'next/navigation';
import { useEffect, useState } from 'react';
import { SiweMessage } from 'siwe';
import { UserRejectedRequestError } from 'viem';
import { useAccount, useConnect, useDisconnect, useSignMessage } from 'wagmi';
import type { SilkEthereumProviderInterface } from '@silk-wallet/silk-wallet-sdk';

import { PATHS, AUTH_ERRORS } from '@/config/constants';
import { getDefaultChain } from '@/config/wagmi';
import { silkInitOptions } from '@/config/silk';
import silk from '@/utils/silk.connector';
import { setCookie } from 'cookies-next';
import { enqueueSnackbar } from 'notistack';
import { triggerCurrentUserIdAtom } from './state/currentUser';
import { useQueryClient } from '@tanstack/react-query';

/**
 * Handles authentication for all three methods:
 * 1. Human Wallet (SIWE)
 * 2. Email/Password
 * 3. Google OAuth (handled by next-auth, not in this hook)
 *
 * Only a single 'loading' and 'error' field are stored in state and used across
 * all functions.
 */
const useAuth = () => {
  const [state, setState] = useState<{
    loading?: boolean;
    nonce?: string;
    error?: Error;
    emailRequired?: boolean; // For first-time wallet users
  }>({});
  const setCurrentUserId = useSetAtom(triggerCurrentUserIdAtom);
  const { address, chainId } = useAccount();
  const { connect: wagmiConnect, error: connectError, connectors } = useConnect();
  const { disconnect } = useDisconnect();
  const { signMessageAsync } = useSignMessage();
  const queryClient = useQueryClient();
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
  // biome-ignore lint/correctness/useExhaustiveDependencies: we want to fetch the nonce only once after the component is mounted
  useEffect(() => {
    fetchNonce();
  }, []);

  /**
   * Sign in with Human Wallet (SIWE)
   * @param email - Optional email for first-time wallet users (auto-fetched from SDK if not provided)
   */
  const signIn = async (email?: string) => {
    try {
      if (!address || !chainId) return;

      setState((x) => ({ ...x, loading: true, error: undefined, emailRequired: false }));

      // Auto-fetch email from Human Wallet SDK if not provided
      // Human Wallet stores verified emails, so we can trust this value
      if (!email) {
        try {
          const silkConnector = connectors.find((c) => c.id === 'silk');
          if (silkConnector) {
            const provider = (await silkConnector.getProvider()) as SilkEthereumProviderInterface;
            email = (await provider.requestEmail()) as string;
          }
        } catch (error) {
          console.warn('Could not fetch email from Human Wallet:', error);
          // Continue without email - backend will request it if needed
        }
      }

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

      const preparedMessage = message.prepareMessage();

      const signature = await signMessageAsync({
        message: preparedMessage,
      });

      const res = await nextAuthSignIn('ethereum', {
        message: JSON.stringify(message),
        signature,
        email: email || undefined,
        callbackUrl,
        redirect: false,
      });

      if (res?.error === AUTH_ERRORS.EMAIL_REQUIRED) {
        // First-time wallet user needs to provide email
        setState((x) => ({ ...x, loading: false, emailRequired: true }));
        return;
      }

      if (res?.error === AUTH_ERRORS.REGISTRATION_FAILED) {
        // Generic error to prevent user enumeration
        setState((x) => ({
          ...x,
          loading: false,
          error: new Error(
            'Unable to create account. If you already have an account, please sign in or use the forgot password link.'
          ),
        }));
        return;
      }

      if (res?.ok && !res.error) {
        const session = await getSession();
        console.info('User signed in:', session?.user?.id);
        setCurrentUserId(session?.user?.id);
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

  /**
   * Sign in with email and password
   */
  const signInWithPassword = async (email: string, password: string) => {
    setState((x) => ({ ...x, loading: true, error: undefined }));

    try {
      const res = await nextAuthSignIn('email-password', {
        email,
        password,
        callbackUrl,
        redirect: false,
      });

      if (res?.ok && !res.error) {
        const session = await getSession();
        console.info('User signed in:', session?.user?.id);
        setCurrentUserId(session?.user?.id);
        setState((x) => ({ ...x, loading: false }));
        // Redirect to callbackUrl after successful login
        window.location.href = callbackUrl;
      } else if (res?.error === 'EMAIL_NOT_VERIFIED') {
        setState((x) => ({
          ...x,
          loading: false,
          error: new Error('Please verify your email before logging in'),
        }));
      } else {
        setState((x) => ({
          ...x,
          loading: false,
          error: new Error('Invalid email or password'),
        }));
      }
    } catch (error) {
      setState((x) => ({
        ...x,
        loading: false,
        error: error as Error,
      }));
    }
  };

  const logout = async () => {
    const silkConnector = connectors.find((connector) => connector.id === 'silk');
    disconnect();
    if (silkConnector) {
      const provider = await silkConnector.getProvider();
      await (provider as SilkEthereumProviderInterface).logout();
    }
    // remove the skipOnboarding flag, so the user sees the onboarding modal again on next login
    setCookie('quilombo.skipOnboarding', false);
    nextAuthSignOut().then(() => {
      setCurrentUserId(undefined);
      setState({});
      queryClient.clear();
    });
  };

  const connect = async () => {
    setState((x) => ({ ...x, loading: true, error: undefined }));
    const silkConnector = connectors.find((connector) => connector.id === 'silk');
    const defaultChain = getDefaultChain();
    try {
      // There should already be a silk connector in the wagmi config which also
      // enables automatic reconnect on page refresh, but if not, we need to use the factory.
      const connectorToUse = silkConnector || silk(silkInitOptions);

      wagmiConnect({
        connector: connectorToUse,
        chainId: defaultChain.id,
      });
      setState((x) => ({ ...x, loading: false }));
    } catch (error) {
      console.error('Error connecting to wallet:', error);
      if (error instanceof UserRejectedRequestError)
        enqueueSnackbar('Operation cancelled by user.', { variant: 'info' });
      else setState((x) => ({ ...x, loading: false, error: error as Error }));
    }
  };

  return { signIn, signInWithPassword, logout, connect, connectError, state };
};

export default useAuth;
