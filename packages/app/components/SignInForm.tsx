'use client';

import { SignInFormType, signInFormSchema } from '@/constants/schemas';
import useAuth from '@/hooks/useAuth';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Spinner } from '@nextui-org/react';
import { useForm } from 'react-hook-form';

const SignInForm = () => {
  const {
    silk,
    actions: { signIn },
    isAuthenticating,
  } = useAuth();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SignInFormType>({
    resolver: yupResolver(signInFormSchema),
  });

  const emailErrorMessage = errors.email?.message;

  return (
    <form className="m-auto flex h-fit w-full max-w-sm flex-col gap-3" onSubmit={handleSubmit(signIn)}>
      <Input
        {...register('email')}
        label="Email"
        type="email"
        className="w-full"
        classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
        color={emailErrorMessage ? 'danger' : undefined}
        isInvalid={!!emailErrorMessage}
        errorMessage={emailErrorMessage}
      />
      <Button
        key="sign-in-button"
        type="submit"
        className="mt-5 w-full"
        isLoading={isAuthenticating}
        spinner={<Spinner size="sm" />}
        disabled={!silk}
      >
        Sign in
      </Button>
    </form>
  );
};
export default SignInForm;
