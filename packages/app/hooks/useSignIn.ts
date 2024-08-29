import { useProfileActions } from '@/store/profile.store';
import { useMutation } from '@tanstack/react-query';
import { getCsrfToken, signIn } from 'next-auth/react';
import { SiweMessage } from 'siwe';
import { useAccount, useConnect, useSignMessage } from 'wagmi';
import { injected } from 'wagmi/connectors';

const useSignIn = () => {
  const { signMessageAsync } = useSignMessage();
  const { address, isConnected, chain } = useAccount();
  const { connect } = useConnect();
  const { initializeProfile } = useProfileActions();

  const handleSignIn = async () => {
    if (!isConnected) connect({ connector: injected() });
    const callbackUrl = '/protected';
    const nonce = await getCsrfToken();
    const message = new SiweMessage({
      domain: window.location.host,
      address: address,
      statement: 'Axé DAO Sign-In - Please sign this message to log into the Axé DAO app.',
      uri: window.location.origin,
      version: '1',
      chainId: chain?.id,
      nonce,
    });
    const signature = await signMessageAsync({
      message: message.prepareMessage(),
    });
    const res = await signIn('credentials', {
      nonce,
      message: JSON.stringify(message),
      redirect: false,
      signature,
      callbackUrl,
    });
    if (res?.error) {
      throw new Error(
        res?.status === 401
          ? 'No account was found associated with this wallet address. Register if you have not done so, yet, or change the wallet address.'
          : 'An error occurred while signin in: ' + res.error,
      );
    }
  };

  const signInMutation = useMutation({
    mutationKey: ['sign-in'],
    mutationFn: handleSignIn,
    onError: (error) => {
      console.error('Error during sign-in.', error);
      throw error;
    },
    onSuccess() {
      initializeProfile();
    },
  });

  return { signInMutation };
};

export default useSignIn;
