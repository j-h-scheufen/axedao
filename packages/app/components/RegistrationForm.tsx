'use client';

import { Button } from '@nextui-org/button';
import { AxiosError } from 'axios';
import { Field, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { useSession } from 'next-auth/react';
import { useEffect } from 'react';
import { useAccount, useConnect } from 'wagmi';
import { injected } from 'wagmi/connectors';

import { registrationFormSchema, RegistrationFormType } from '@/constants/schemas';
import useRegister from '@/hooks/useRegister';
import { FieldInput } from './forms';

const RegistrationForm = () => {
  const session = useSession();
  const { connect } = useConnect();
  const { registrationMutation } = useRegister();
  const resetSubmitMutation = registrationMutation.reset;
  const isLoading = session.status === 'loading';
  const submitError: AxiosError | Error | null = registrationMutation.error;

  const FormikForm = ({ setFieldValue, dirty, isValid, isSubmitting }: FormikProps<RegistrationFormType>) => {
    const { address, isConnected } = useAccount();
    useEffect(() => {
      if (isConnected && address) {
        setFieldValue('walletAddress', address);
        resetSubmitMutation();
      }
    }, [address, isConnected, setFieldValue]);

    return (
      <Form className="m-auto flex h-fit w-full max-w-sm flex-col gap-3">
        <Field name="name" label="Name" as={FieldInput} />
        <Field name="email" label="Email" type="email" as={FieldInput} />
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
          key="register-button"
          type="submit"
          color="primary"
          className="mt-5 w-full"
          isLoading={isSubmitting}
          disabled={isLoading || !dirty || !isValid}
        >
          Register
        </Button>
      </Form>
    );
  };

  const handleSubmit = (values: RegistrationFormType, { setSubmitting }: FormikHelpers<RegistrationFormType>) => {
    setSubmitting(true);
    try {
      registrationMutation.mutate(values);
    } catch (error) {
      console.error('Error during registration.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: RegistrationFormType = {
    name: '',
    email: '',
    walletAddress: '',
  };

  return (
    <Formik<RegistrationFormType>
      initialValues={initValues}
      onSubmit={handleSubmit}
      validationSchema={registrationFormSchema}
    >
      {(props) => FormikForm(props)}
    </Formik>
  );
};

export default RegistrationForm;
