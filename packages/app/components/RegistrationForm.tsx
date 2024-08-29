'use client';

import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { AxiosError } from 'axios';
import { Field, FieldProps, Form, Formik, FormikHelpers, FormikProps, useField } from 'formik';
import { useSession } from 'next-auth/react';
import { useEffect } from 'react';
import { useAccount, useConnect } from 'wagmi';
import { injected } from 'wagmi/connectors';

import { registrationFormSchema, RegistrationFormType } from '@/constants/schemas';
import useRegister from '@/hooks/useRegister';

/**
 * A simple text-based input field for Formik Field components.
 */
const TextInput = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);
  return (
    <Input
      {...field}
      className="w-full"
      classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
      color={meta.touched && meta.error ? 'danger' : undefined}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      {...props}
    />
  );
};

const RegistrationForm = () => {
  const session = useSession();
  const { connect } = useConnect();
  const { registrationMutation } = useRegister();
  const resetSubmitMutation = registrationMutation.reset;
  const isSubmitting = registrationMutation.isPending;
  const isLoading = session.status === 'loading';
  const submitError: AxiosError | Error | null = registrationMutation.error;

  const FormikForm = ({ setFieldValue, dirty, isValid }: FormikProps<RegistrationFormType>) => {
    const { address, isConnected } = useAccount();
    useEffect(() => {
      if (isConnected && address) {
        setFieldValue('walletAddress', address);
        resetSubmitMutation();
      }
    }, [address, isConnected, setFieldValue]);

    return (
      <Form className="m-auto flex h-fit w-full max-w-sm flex-col gap-3">
        <Field name="name" label="Name" as={TextInput} />
        <Field name="email" label="Email" type="email" as={TextInput} />
        <Field
          name="walletAddress"
          label="Wallet address (MetaMask)"
          as={TextInput}
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
          disabled={isLoading || isSubmitting || !dirty || !isValid}
        >
          Register
        </Button>
      </Form>
    );
  };

  const handleSubmit = (values: RegistrationFormType, { setSubmitting }: FormikHelpers<RegistrationFormType>) => {
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
