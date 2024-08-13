'use client';

import useSignIn from '@/hooks/useSignIn';
import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { useSession } from 'next-auth/react';

type Props = { className?: string };
const SignInButton = ({ className }: Props) => {
  const session = useSession();

  const { signInMutation } = useSignIn();

  const isLoading = session.status === 'loading';
  const isSigningIn = signInMutation.isPending;

  return (
    <Button
      key="sign-in-button"
      type="submit"
      color="primary"
      className={cn('mt-5 w-full', className)}
      isLoading={isSigningIn}
      spinner={<Spinner size="sm" />}
      onPress={signInMutation.mutate}
      disabled={isLoading || isSigningIn}
    >
      Sign in
    </Button>
  );
};
export default SignInButton;
