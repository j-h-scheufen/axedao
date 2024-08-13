import { useMutation } from '@tanstack/react-query';
import { getCsrfToken, signIn } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import { SiweMessage } from 'siwe';
import { useAccount, useConnect, useSignMessage } from 'wagmi';
import { injected } from 'wagmi/connectors';

const useSignIn = () => {
  const router = useRouter();

  const { signMessageAsync } = useSignMessage();
  const { address, isConnected, chain } = useAccount();
  const { connect } = useConnect();

  const handleSignIn = async () => {
    if (!isConnected) connect({ connector: injected() });
    const callbackUrl = '/protected';
    const message = new SiweMessage({
      domain: window.location.host,
      address: address,
      statement: 'Sign in with Ethereum to the app.',
      uri: window.location.origin,
      version: '1',
      chainId: chain?.id,
      nonce: await getCsrfToken(),
    });
    const signature = await signMessageAsync({
      message: message.prepareMessage(),
    });
    signIn('credentials', {
      message: JSON.stringify(message),
      redirect: false,
      signature,
      callbackUrl,
    });
  };

  const signInMutation = useMutation({
    mutationKey: ['sign-in'],
    mutationFn: handleSignIn,
    onSuccess: () => {
      router.push('/dashboard/profile');
    },
    onError: (error) => {
      console.error(error);
      // TODO show alert here
    },
  });

  return { signInMutation };
};

export default useSignIn;
