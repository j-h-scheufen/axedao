'use client';

import { useState } from 'react';
import { Button, Link } from '@heroui/react';
import { Formik, Form, Field } from 'formik';
import { useRouter } from 'next/navigation';
import { Mail } from 'lucide-react';

import { PATHS } from '@/config/constants';
import { forgotPasswordSchema, type ForgotPasswordForm } from '@/config/validation-schema';
import ErrorText from '@/components/ErrorText';
import FieldInput from '@/components/forms/FieldInput';

const ForgotPasswordPage = () => {
  const router = useRouter();
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (values: ForgotPasswordForm) => {
    setError(null);

    try {
      const response = await fetch('/api/auth/forgot-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(values),
      });

      // Always show success message (no user enumeration)
      if (response.ok || response.status === 204) {
        setSubmitted(true);
      } else {
        const data = await response.json();
        setError(data.error || 'Failed to send reset email');
      }
    } catch (err) {
      setError('An unexpected error occurred. Please try again.');
      console.error('Forgot password error:', err);
    }
  };

  if (submitted) {
    return (
      <div className="auth-container-py items-center text-center">
        <div className="mb-6 flex justify-center">
          <Mail className="w-20 h-20 text-primary" strokeWidth={1.5} />
        </div>
        <h2 className="text-2xl text-default-700 font-semibold">Check Your Email</h2>
        <p className="text-default-600">
          If an account exists with that email address, we've sent password reset instructions.
        </p>
        <p className="text-default-500 text-sm">
          The reset link will expire in 60 minutes. If you don't receive an email, check your spam folder.
        </p>
        <Button color="primary" onPress={() => router.push(PATHS.login)} className="mt-4">
          Back to Login
        </Button>
      </div>
    );
  }

  return (
    <div className="auth-container-py">
      <h2 className="text-3xl text-default-700 font-semibold text-center mb-2">Forgot Password?</h2>
      <p className="text-default-600 text-center mb-4">
        Enter your email address and we'll send you instructions to reset your password.
      </p>

      <Formik
        initialValues={{ email: '' }}
        validationSchema={forgotPasswordSchema}
        validateOnBlur={false}
        onSubmit={handleSubmit}
      >
        {({ isSubmitting }) => (
          <Form className="flex flex-col gap-4">
            <Field
              name="email"
              type="email"
              label="Email"
              placeholder="your@email.com"
              isRequired
              autoFocus
              as={FieldInput}
            />
            <Button type="submit" color="primary" size="lg" isLoading={isSubmitting}>
              Send Reset Instructions
            </Button>
          </Form>
        )}
      </Formik>

      {error && <ErrorText message={error} />}

      <div className="text-center mt-4">
        <Link href={PATHS.login} color="secondary" size="sm">
          Back to Login
        </Link>
      </div>
    </div>
  );
};

export default ForgotPasswordPage;
