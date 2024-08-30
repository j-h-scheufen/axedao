'use client';

import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';
import { AxiosError } from 'axios';
import { Field, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { useSession } from 'next-auth/react';
import { useEffect } from 'react';
import { useAccount, useConnect } from 'wagmi';
import { injected } from 'wagmi/connectors';

import { signInFormSchema, SignInFormType } from '@/constants/schemas';
import useSignIn from '@/hooks/useSignIn';
import { FieldInput } from './forms';

type Props = { className?: string };

const SignInForm = ({ className }: Props) => {
  const session = useSession();
  const { connect } = useConnect();
  const { signInMutation } = useSignIn();
  const resetSubmitMutation = signInMutation.reset;
  const isLoading = session.status === 'loading';
  const isSubmitting = signInMutation.isPending;
  const submitError: AxiosError | Error | null = signInMutation.error;

  const FormikForm = ({ setFieldValue, dirty, isValid }: FormikProps<SignInFormType>) => {
    const { address, isConnected } = useAccount();
    useEffect(() => {
      if (isConnected && address) {
        setFieldValue('walletAddress', address);
        resetSubmitMutation();
      }
    }, [address, isConnected, setFieldValue]);

    return (
      <Form className="m-auto flex h-fit w-full max-w-sm flex-col gap-3">
        <Field
          name="walletAddress"
          label="Wallet address (MetaMask)"
          as={FieldInput}
          classNames={{
            inputWrapper: '!min-h-14 data-[hover=true]:bg-initial',
            input: 'text-sm !text-default-500',
            errorMessage: 'text-left',
          }}
          readOnly
        />
        <Button
          size="sm"
          variant="ghost"
          className="ml-auto w-fit mt-2"
          onPress={() => connect({ connector: injected() })}
        >
          {address ? 'Change' : 'Connect'}
        </Button>
        {submitError && (
          <div className="my-2 text-center text-small text-danger">
            {(submitError as AxiosError<{ error: string }>).response?.data?.error || submitError.message}
          </div>
        )}
        <Button
          key="sign-in-button"
          type="submit"
          color="primary"
          className={cn('mt-5 w-full', className)}
          isLoading={isSubmitting}
          disabled={isLoading || isSubmitting || !dirty || !isValid}
        >
          Sign in
        </Button>
      </Form>
    );
  };

  const handleSubmit = (values: SignInFormType, { setSubmitting }: FormikHelpers<SignInFormType>) => {
    try {
      signInMutation.mutate();
    } catch (error) {
      console.error('Error during registration.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: SignInFormType = {
    walletAddress: '',
  };

  return (
    <Formik<SignInFormType> initialValues={initValues} onSubmit={handleSubmit} validationSchema={signInFormSchema}>
      {(props) => FormikForm(props)}
    </Formik>
  );
};

export default SignInForm;
