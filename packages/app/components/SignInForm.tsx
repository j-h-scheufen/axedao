'use client';

import { Button } from '@nextui-org/button';
import { useSession } from 'next-auth/react';
import { Suspense } from 'react';

import useAuth from '@/hooks/useAuth';
import ErrorText from './ErrorText';
import { useWallet } from './WalletContext';

const SignInForm = () => {
  const session = useSession();
  const { connected, userAddress } = useWallet();
  const { login, signIn, logout, loginError, signInError } = useAuth();
  const isLoading = session.status === 'loading';

  return (
    <Suspense fallback={<div>Loading...</div>}>
      {isLoading ? (
        <div>Loading ...</div>
      ) : (
        <div className="flex flex-col gap-2 sm:gap-3 max-w-sm mx-auto">
          <div>
            <h4>Account: {userAddress || 'Not logged in'}</h4>
            <h4>Session: {session.status}</h4>
          </div>
          {!connected && (
            <div>
              <Button size="sm" variant="ghost" className="ml-auto w-fit mt-2" onPress={() => login()}>
                Connect with Silk
              </Button>
              {loginError && <ErrorText message={loginError} />}
            </div>
          )}
          {connected && userAddress && session.status === 'unauthenticated' ? (
            <div>
              <Button size="sm" variant="solid" className="ml-auto w-fit mt-2" onPress={() => signIn()}>
                Sign In
              </Button>
              {signInError && <ErrorText message={signInError} />}
            </div>
          ) : (
            <div>
              <Button size="sm" variant="ghost" className="ml-auto w-fit mt-2" onPress={() => logout()}>
                Logout
              </Button>
            </div>
          )}
        </div>
      )}
    </Suspense>
  );
};

export default SignInForm;
