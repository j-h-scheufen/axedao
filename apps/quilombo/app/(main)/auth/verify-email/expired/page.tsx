'use client';

import { useState } from 'react';
import { Button, Input, Link } from '@heroui/react';
import { Formik, Form } from 'formik';
import { useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { forgotPasswordSchema } from '@/config/validation-schema';
import ErrorText from '@/components/ErrorText';

const VerifyEmailExpiredPage = () => {
  const router = useRouter();
  const [resent, setResent] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleResend = async (values: { email: string }) => {
    setError(null);

    try {
      const response = await fetch('/api/auth/resend-verification', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(values),
      });

      if (response.ok || response.status === 204) {
        setResent(true);
      } else {
        const data = await response.json();
        setError(data.error || 'Failed to resend verification email');
      }
    } catch (err) {
      setError('An unexpected error occurred. Please try again.');
      console.error('Resend verification error:', err);
    }
  };

  if (resent) {
    return (
      <div className="flex flex-col gap-4 max-w-md mx-auto items-center text-center py-8">
        <div className="text-6xl mb-4">📧</div>
        <h2 className="text-2xl text-default-700 font-semibold">Verification Email Sent</h2>
        <p className="text-default-600">Check your inbox for a new verification link.</p>
        <Button color="primary" onPress={() => router.push(PATHS.login)} className="mt-4">
          Go to Login
        </Button>
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-4 max-w-md mx-auto items-center text-center py-8">
      <div className="text-6xl mb-4">⏰</div>
      <h2 className="text-3xl text-default-700 font-semibold">Link Expired</h2>
      <p className="text-default-600">This verification link has expired or is invalid.</p>
      <p className="text-default-500 text-sm">
        Verification links expire after 30 minutes for security. Request a new one below.
      </p>

      <div className="mt-6 w-full">
        <Formik initialValues={{ email: '' }} validationSchema={forgotPasswordSchema} onSubmit={handleResend}>
          {({ errors, touched, isSubmitting, handleChange, handleBlur, values }) => (
            <Form className="flex flex-col gap-4">
              <Input
                name="email"
                type="email"
                label="Email"
                placeholder="your@email.com"
                value={values.email}
                onChange={handleChange}
                onBlur={handleBlur}
                isInvalid={touched.email && !!errors.email}
                errorMessage={touched.email && errors.email}
                isRequired
              />
              <Button type="submit" color="primary" size="lg" isLoading={isSubmitting}>
                Resend Verification Email
              </Button>
            </Form>
          )}
        </Formik>

        {error && <ErrorText message={error} />}
      </div>

      <div className="mt-6">
        <Link href={PATHS.login} color="secondary" size="sm">
          Back to Login
        </Link>
      </div>
    </div>
  );
};

export default VerifyEmailExpiredPage;
