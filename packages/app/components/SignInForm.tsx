'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { useSession } from 'next-auth/react';
import { useAccount } from 'wagmi';

import useAuth from '@/hooks/useAuth';
import { Link } from '@nextui-org/link';
import ErrorText from './ErrorText';
import SignInHelpModal from './SignInHelpModal';

const SignInForm = () => {
  const { data: session } = useSession();
  const { isOpen, onOpenChange } = useDisclosure();
  const { address } = useAccount();
  const {
    signIn,
    connect,
    state: { loading, error },
  } = useAuth();

  return (
    <div className="flex flex-col gap-2 sm:gap-3 max-w-sm mx-auto items-center">
      <SignInHelpModal isOpen={isOpen} onOpenChange={onOpenChange} />
      <h2 className="text-xl sm:text-3xl text-default-500 sm:text-default-800 mb-2 sm:mb-4">
        Login to the Quilombo App
      </h2>
      {!address && (
        <div className="flex flex-col gap-2 sm:gap-3">
          <p>
            If you are new here, please{' '}
            <div className="inline-block bg-warning-100 rounded-md px-2">
              <Link href="#" onPress={onOpenChange} className="no-underline text-foreground hover:opacity-50">
                read this
              </Link>
            </div>{' '}
            first!
          </p>
          <p>Click the button to create a Silk account or log into an existing one.</p>
          <Button size="lg" color="primary" variant="ghost" className="w-full mt-2" onPress={connect}>
            Connect with Silk
          </Button>
        </div>
      )}
      {address && !session && (
        <div className="flex flex-col gap-2 sm:gap-3 align-center">
          <p className="text-center">
            Your Silk account is connected. <i>Fantastic!</i>
            <br />
            <br />
            In order to complete Login we ask you to sign a message. By doing so you accept the Terms and Conditions of
            the Quilombo app. Click the button below to proceed.
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
    </div>
  );
};

export default SignInForm;
