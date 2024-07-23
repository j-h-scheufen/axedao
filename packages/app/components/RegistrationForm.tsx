'use client';

import { RegistrationFormType, registrationFormSchema } from '@/constants/schemas';
import {
  useAuthActions,
  useIsAuthenticated,
  useIsAuthenticating,
  useIsRegistering,
  useRegistrationError,
  useSilk,
} from '@/store/auth.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Spinner } from '@nextui-org/react';
import { SubmitHandler, useForm } from 'react-hook-form';

const RegistrationForm = () => {
  const silk = useSilk();
  const authActions = useAuthActions();
  const isRegistering = useIsRegistering();
  const registrationError = useRegistrationError();
  const isAuthenticating = useIsAuthenticating();
  const isAuthenticated = useIsAuthenticated();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<RegistrationFormType>({
    resolver: yupResolver(registrationFormSchema),
    defaultValues: {
      email: '',
    },
  });

  const emailErrorMessage = errors.email?.message;
  const nameErrorMessage = errors.name?.message;

  return (
    <form
      className="m-auto flex h-fit w-full max-w-sm flex-col gap-3"
      onSubmit={handleSubmit(authActions.register as SubmitHandler<RegistrationFormType>)}
    >
      <Input
        {...register('name')}
        label="Full name"
        className="w-full"
        classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
        color={nameErrorMessage ? 'danger' : undefined}
        isInvalid={!!nameErrorMessage}
        errorMessage={nameErrorMessage}
      />
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
      {registrationError && <div className="my-2 text-center text-small text-danger">{registrationError}</div>}
      <Button
        key="register-button"
        type="submit"
        color="primary"
        className="mt-5 w-full"
        isLoading={isRegistering || isAuthenticating}
        spinner={<Spinner size="sm" />}
        disabled={!silk || isAuthenticated}
      >
        Register
      </Button>
    </form>
  );
};

export default RegistrationForm;
