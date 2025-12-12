import { useSetAtom } from 'jotai';
import { getCsrfToken, getSession, signIn as nextAuthSignIn, signOut as nextAuthSignOut } from 'next-auth/react';
import { useRouter, useSearchParams } from 'next/navigation';
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
  // biome-ignore lint/correctness/useExhaustiveDependencies: we want to fetch the nonce only once after the component is mounted
  useEffect(() => {
    fetchNonce();
  }, []);

  /**
   * Sign in with Human Wallet (SIWE)
   * @param email - Optional email for first-time wallet users (auto-fetched from SDK if not provided)
   *
   * Flow:
   * 1. Sign SIWE message with wallet
   * 2. Try NextAuth signIn (handles existing users)
   * 3. If user doesn't exist (signIn fails), call /api/auth/siwe-signup to register
   * 4. If signup succeeds, call signIn again to create session
   */
  const signIn = async (email?: string) => {
    try {
      if (!address || !chainId) return;

      setState((x) => ({ ...x, loading: true, error: undefined, emailRequired: false }));

      // Track if email came from SDK (trusted) vs provided externally
      let emailFromSdk = false;

      // Auto-fetch email from Human Wallet SDK if not provided
      // Human Wallet stores verified emails, so we can trust this value
      if (!email) {
        try {
          const silkConnector = connectors.find((c) => c.id === 'silk');
          if (silkConnector) {
            const provider = (await silkConnector.getProvider()) as SilkEthereumProviderInterface;
            email = (await provider.requestEmail()) as string;
            emailFromSdk = true; // Mark as SDK-sourced (trusted)
          }
        } catch (error) {
          console.warn('Could not fetch email from Human Wallet:', error);
          // Continue without email - will prompt for it if needed
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
      const messageJson = JSON.stringify(message);

      const signature = await signMessageAsync({
        message: preparedMessage,
      });

      // Try to sign in (works for existing users)
      const res = await nextAuthSignIn('ethereum', {
        message: messageJson,
        signature,
        email: email || undefined,
        callbackUrl,
        redirect: false,
      });

      // Handle successful login
      if (res?.ok && !res.error) {
        const session = await getSession();
        console.info('User signed in:', session?.user?.id);
        setCurrentUserId(session?.user?.id);
        setState((x) => ({ ...x, loading: false }));
        router.push(callbackUrl);
        return;
      }

      // Handle specific errors
      if (res?.error === AUTH_ERRORS.REGISTRATION_FAILED) {
        setState((x) => ({
          ...x,
          loading: false,
          error: new Error(
            'Unable to sign in. The email associated with this wallet does not match. Please use the correct wallet.'
          ),
        }));
        return;
      }

      // If signIn returned error (user doesn't exist), try to register via API
      // This happens when authorize() returns null for new users
      if (res?.error === 'CredentialsSignin' || !res?.ok) {
        // First-time user - need email for registration
        if (!email) {
          setState((x) => ({ ...x, loading: false, emailRequired: true }));
          return;
        }

        // Call signup API
        const signupRes = await fetch('/api/auth/siwe-signup', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            message: messageJson,
            signature,
            email,
            emailFromSdk,
          }),
        });

        const signupData = await signupRes.json();

        if (!signupRes.ok) {
          // Handle signup errors
          setState((x) => ({
            ...x,
            loading: false,
            error: new Error(signupData.error || 'Failed to create account'),
          }));
          return;
        }

        // Check if email verification is required
        if (signupData.requiresVerification) {
          router.push(`${PATHS.verifyEmail}/sent?email=${encodeURIComponent(signupData.email)}`);
          setState((x) => ({ ...x, loading: false }));
          return;
        }

        // Signup successful, now sign in to create session
        // Need to refetch nonce first as it may have been consumed
        await fetchNonce();

        // Small delay to ensure nonce is updated in state
        await new Promise((resolve) => setTimeout(resolve, 100));

        const loginRes = await nextAuthSignIn('ethereum', {
          message: messageJson,
          signature,
          email,
          callbackUrl,
          redirect: false,
        });

        if (loginRes?.ok && !loginRes.error) {
          const session = await getSession();
          console.info('User signed in after signup:', session?.user?.id);
          setCurrentUserId(session?.user?.id);
          setState((x) => ({ ...x, loading: false }));
          router.push(callbackUrl);
          return;
        }

        // If login after signup failed, show error
        console.error('Login after signup failed:', loginRes?.error);
        setState((x) => ({
          ...x,
          loading: false,
          error: new Error('Account created but failed to sign in. Please try signing in again.'),
        }));
        return;
      }

      // Fallback error handling
      if (res?.error) {
        console.error('Sign in error:', res.error);
        setState((x) => ({ ...x, loading: false, error: new Error(res.error || 'Unable to sign in') }));
      } else {
        setState((x) => ({ ...x, loading: false }));
      }
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
        router.push(callbackUrl);
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

    // There should already be a silk connector in the wagmi config which also
    // enables automatic reconnect on page refresh, but if not, we need to use the factory.
    const connectorToUse = silkConnector || silk(silkInitOptions);

    // wagmiConnect is not async - it triggers connection and errors are handled via callbacks
    wagmiConnect(
      {
        connector: connectorToUse,
        chainId: defaultChain.id,
      },
      {
        onSuccess: () => {
          setState((x) => ({ ...x, loading: false }));
        },
        onError: (error) => {
          console.error('Error connecting to wallet:', error);
          if (error instanceof UserRejectedRequestError) {
            enqueueSnackbar('Connecting wallet cancelled by user', { variant: 'info' });
            setState((x) => ({ ...x, loading: false }));
          } else {
            setState((x) => ({ ...x, loading: false, error }));
          }
        },
      }
    );
  };

  return { signIn, signInWithPassword, logout, connect, connectError, state };
};

export default useAuth;
