'use client';

import { Button } from '@nextui-org/button';
import { useSession } from 'next-auth/react';
import { sepolia } from 'viem/chains';
import { useAccount, useConnect } from 'wagmi';

import useAuth from '@/hooks/useAuth';
import silk from '@/utils/silk.connector';
import ErrorText from './ErrorText';

const SignInForm = () => {
  const { data: session } = useSession();
  const { address } = useAccount();
  const { connect, error: connectError } = useConnect();
  const {
    signIn,
    state: { loading, error: signInError },
  } = useAuth();

  return (
    <div className="flex flex-col gap-2 sm:gap-3 max-w-sm mx-auto">
      <h2 className="text-xl sm:text-3xl text-default-500 sm:text-default-800 mb-2 sm:mb-4">
        Login to the Quilombo App
      </h2>
      {!address && (
        <div className="flex flex-col gap-2 sm:gap-3">
          <p>
            <b>
              <i>Silk</i>
            </b>{' '}
            is a digital identity app that allows you to securely use the Quilombo App. Please click the below button
            and follow the instructions to create a Silk account or log into an existing one.
          </p>
          <Button
            size="lg"
            color="primary"
            variant="ghost"
            className="w-full mt-2"
            onPress={() => connect({ chainId: sepolia.id, connector: silk() })} // TODO the current network is hardcoded
          >
            Connect with Silk
          </Button>
          {connectError && <ErrorText message={connectError.message} />}
        </div>
      )}
      {address && !session && (
        <div className="flex flex-col gap-2 sm:gap-3 align-center">
          <p className="text-center">
            Your Silk account is connected. <i>Fantastic!</i>
            <br />
            <br />
            In order to complete Login we ask you to sign a message. By doing so you accept the Terms and Conditions of
            the app. Click the below button to proceed.
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
          {signInError && <ErrorText message={signInError.message} />}
        </div>
      )}
    </div>
  );
};

export default SignInForm;
