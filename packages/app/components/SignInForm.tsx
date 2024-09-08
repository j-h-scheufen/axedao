'use client';

import { Button } from '@nextui-org/button';
import { useSession } from 'next-auth/react';

import useAuth from '@/hooks/useAuth';
import ErrorText from './ErrorText';
import { useWallet } from './WalletContext';

const SignInForm = () => {
  const { status } = useSession();
  const { connected, userAddress } = useWallet();
  const { login, signIn, loginError, signInError } = useAuth();

  return (
    <div className="flex flex-col gap-2 sm:gap-3 max-w-sm mx-auto">
      <h2 className="text-xl sm:text-3xl text-default-500 sm:text-default-800 mb-2 sm:mb-4">
        Login to the Quilombo App
      </h2>
      {!connected && (
        <div className="flex flex-col gap-2 sm:gap-3">
          <p>
            <b>
              <i>Silk</i>
            </b>{' '}
            is a digital identity app that allows you to securely use to the Quilombo App. Please click the below button
            and follow the instructions to create a Silk account or log into an existing one.
          </p>
          <Button size="lg" color="primary" variant="ghost" className="w-full mt-2" onPress={() => login()}>
            Connect with Silk
          </Button>
          {loginError && <ErrorText message={loginError} />}
        </div>
      )}
      {connected && userAddress && status === 'unauthenticated' && (
        <div className="flex flex-col gap-2 sm:gap-3 align-center">
          <p className="text-center">
            Your Silk account is connected. <i>Fantastic!</i>
            <br />
            <br />
            In order to complete Login we ask you to sign a message. By doing so you accept the Terms and Conditions of
            the app. Click the below button to proceed.
          </p>
          <Button size="lg" color="primary" variant="solid" className="w-full mt-2" onPress={() => signIn()}>
            Sign In
          </Button>
          {signInError && <ErrorText message={signInError} />}
        </div>
      )}
    </div>
  );
};

export default SignInForm;
