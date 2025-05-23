'use client';

import { Button } from "@heroui/button";
import { useDisclosure } from "@heroui/use-disclosure";
import { useSession } from 'next-auth/react';
import { useAccount } from 'wagmi';

import useAuth from '@/hooks/useAuth';
import { Link } from "@heroui/link";
import ErrorText from './ErrorText';
import SignInHelpModal from './SignInHelpModal';

const SignInForm = () => {
  const { data: session } = useSession();
  const { isOpen, onOpenChange } = useDisclosure();
  const { address, isConnecting, isConnected } = useAccount();
  const {
    signIn,
    connect,
    state: { loading, error },
  } = useAuth();

  return (
    <div className="flex flex-col gap-2 sm:gap-3 max-w-sm mx-auto items-center">
      <h2 className="text-3xl text-default-700 sm:text-default-800 mb-2 sm:mb-4">Quilombo Login</h2>
      {!address && (
        <div className="flex flex-col gap-4 sm:gap-5">
          <p>
            Here at <i>Quilombo</i> we use{' '}
            <Link href="https://wallet.human.tech/" color="secondary">
              Human Wallet
            </Link>{' '}
            for your digital identity.
          </p>
          <p>Click the button to create a Human Wallet account or connect an existing one.</p>
          <Button
            size="lg"
            color="primary"
            variant="ghost"
            className="w-full mt-2"
            onPress={connect}
            isLoading={loading || isConnecting}
          >
            Connect Human Wallet
          </Button>
        </div>
      )}
      {address && isConnected && !session && (
        <div className="flex flex-col gap-2 sm:gap-3 align-center">
          <p className="text-center">
            Your Human Wallet is connected. <i>Fantastic!</i>
            <br />
            <br />
            In order to complete Login we ask you to provide a digital signature. By doing so you accept the Terms and
            Conditions of the Quilombo app. Click the button below to proceed.
          </p>
          <Button
            size="lg"
            color="primary"
            variant="solid"
            className="w-full mt-2"
            onPress={() => signIn()}
            isLoading={loading}
          >
            Sign In
          </Button>
        </div>
      )}
      {error && <ErrorText message={error.message} />}
      <SignInHelpModal isOpen={isOpen} onOpenChange={onOpenChange} />
    </div>
  );
};

export default SignInForm;
