'use client';

import { SignInFormType } from '@/constants/schemas';
import useAuth from '@/hooks/useAuth';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { useForm } from 'react-hook-form';

const SignInForm = () => {
  const {
    silk,
    actions: { signIn },
    isAuthenticating,
  } = useAuth();

  const { handleSubmit } = useForm<SignInFormType>();

  return (
    <form className="m-auto flex h-fit w-full max-w-sm flex-col gap-3" onSubmit={handleSubmit(signIn)}>
      <Button
        key="sign-in-button"
        type="submit"
        color="primary"
        className="mt-5 w-full"
        isLoading={isAuthenticating}
        spinner={<Spinner size="sm" />}
        disabled={!silk}
      >
        Sign in with Silk
      </Button>
    </form>
  );
};
export default SignInForm;
