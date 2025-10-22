'use client';

import { useState } from 'react';
import { Button, Input, Link } from '@heroui/react';
import { Formik, Form } from 'formik';
import { useSearchParams, useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { resetPasswordFormSchema, type ResetPasswordFormValues } from '@/config/validation-schema';
import ErrorText from '@/components/ErrorText';

const PasswordRequirements = ({ password }: { password: string }) => {
  const requirements = [
    { label: 'At least 12 characters', test: (p: string) => p.length >= 12 },
    { label: 'One uppercase letter', test: (p: string) => /[A-Z]/.test(p) },
    { label: 'One lowercase letter', test: (p: string) => /[a-z]/.test(p) },
    { label: 'One number', test: (p: string) => /[0-9]/.test(p) },
    { label: 'One special character', test: (p: string) => /[!@#$%^&*(),.?":{}|<>]/.test(p) },
  ];

  if (!password) return null;

  return (
    <div className="text-xs space-y-1 mb-2">
      <p className="text-default-600 font-medium">Password Requirements:</p>
      {requirements.map((req) => (
        <div key={req.label} className="flex items-center gap-2">
          <span className={req.test(password) ? 'text-success' : 'text-default-400'}>
            {req.test(password) ? '✓' : '○'}
          </span>
          <span className={req.test(password) ? 'text-success' : 'text-default-600'}>{req.label}</span>
        </div>
      ))}
    </div>
  );
};

const ResetPasswordPage = () => {
  const router = useRouter();
  const searchParams = useSearchParams();
  const token = searchParams.get('token') || '';
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!token) {
    return (
      <div className="flex flex-col gap-4 max-w-md mx-auto items-center text-center py-8">
        <div className="text-6xl mb-4">⚠️</div>
        <h2 className="text-2xl text-default-700 font-semibold">Invalid Reset Link</h2>
        <p className="text-default-600">This password reset link is invalid or missing.</p>
        <Button color="primary" onPress={() => router.push(PATHS.forgotPassword)}>
          Request New Reset Link
        </Button>
      </div>
    );
  }

  const handleSubmit = async (values: ResetPasswordFormValues) => {
    setError(null);

    try {
      const response = await fetch('/api/auth/reset-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          token,
          newPassword: values.newPassword,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        if (response.status === 400) {
          setError('This reset link has expired or is invalid. Please request a new one.');
        } else {
          setError(data.error || 'Failed to reset password');
        }
        return;
      }

      setSuccess(true);
    } catch (err) {
      setError('An unexpected error occurred. Please try again.');
      console.error('Reset password error:', err);
    }
  };

  if (success) {
    return (
      <div className="flex flex-col gap-4 max-w-md mx-auto items-center text-center py-8">
        <div className="text-6xl mb-4">✓</div>
        <h2 className="text-2xl text-success font-semibold">Password Updated!</h2>
        <p className="text-default-600">Your password has been successfully reset.</p>
        <p className="text-default-500 text-sm">You can now sign in with your new password.</p>
        <Button color="primary" onPress={() => router.push(PATHS.login)} className="mt-4">
          Go to Login
        </Button>
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-4 max-w-md mx-auto items-stretch py-8">
      <h2 className="text-3xl text-default-700 font-semibold text-center mb-2">Reset Password</h2>
      <p className="text-default-600 text-center mb-4">Enter your new password below.</p>

      <Formik
        initialValues={{ newPassword: '', confirmPassword: '' }}
        validationSchema={resetPasswordFormSchema}
        onSubmit={handleSubmit}
      >
        {({ errors, touched, isSubmitting, handleChange, handleBlur, values }) => (
          <Form className="flex flex-col gap-4">
            <Input
              name="newPassword"
              type="password"
              label="New Password"
              placeholder="Create a strong password"
              value={values.newPassword}
              onChange={handleChange}
              onBlur={handleBlur}
              isInvalid={touched.newPassword && !!errors.newPassword}
              errorMessage={touched.newPassword && errors.newPassword}
              isRequired
              autoFocus
            />
            <PasswordRequirements password={values.newPassword} />
            <Input
              name="confirmPassword"
              type="password"
              label="Confirm New Password"
              placeholder="Re-enter your password"
              value={values.confirmPassword}
              onChange={handleChange}
              onBlur={handleBlur}
              isInvalid={touched.confirmPassword && !!errors.confirmPassword}
              errorMessage={touched.confirmPassword && errors.confirmPassword}
              isRequired
            />
            <Button type="submit" color="primary" size="lg" isLoading={isSubmitting}>
              Reset Password
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

export default ResetPasswordPage;
