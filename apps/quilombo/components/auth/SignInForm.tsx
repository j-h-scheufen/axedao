'use client';

import { useState, useEffect } from 'react';
import { Button, Input, Link, Divider } from '@heroui/react';
import { useSession, signIn as nextAuthSignIn } from 'next-auth/react';
import { useAccount } from 'wagmi';
import { Formik, Form } from 'formik';

import useAuth from '@/hooks/useAuth';
import { PATHS } from '@/config/constants';
import { loginSchema } from '@/config/validation-schema';
import ErrorText from '../ErrorText';
import WalletEmailModal from './WalletEmailModal';

type LoginFormValues = {
  email: string;
  password: string;
};

const SignInForm = () => {
  const [mounted, setMounted] = useState(false);
  const { data: session } = useSession();
  const { address, isConnecting, isConnected } = useAccount();

  // Prevent hydration mismatch by only rendering after client mount
  useEffect(() => {
    setMounted(true);
  }, []);
  const {
    signIn,
    signInWithPassword,
    connect,
    state: { loading, error, emailRequired },
  } = useAuth();
  const [googleLoading, setGoogleLoading] = useState(false);

  const handleEmailPasswordSubmit = async (values: LoginFormValues) => {
    await signInWithPassword(values.email, values.password);
  };

  const handleGoogleSignIn = async () => {
    setGoogleLoading(true);
    try {
      await nextAuthSignIn('google', { callbackUrl: PATHS.profile });
    } catch (err) {
      console.error('Google sign-in error:', err);
    } finally {
      setGoogleLoading(false);
    }
  };

  const handleWalletEmailSubmit = async (email: string) => {
    await signIn(email);
  };

  // Show loading state during hydration to prevent mismatch
  if (!mounted) {
    return (
      <div className="auth-container-py">
        <div className="text-center">Loading...</div>
      </div>
    );
  }

  return (
    <>
      <WalletEmailModal
        isOpen={emailRequired || false}
        walletAddress={address || ''}
        onEmailSubmit={handleWalletEmailSubmit}
        onClose={() => {}}
        error={error?.message}
      />

      <div className="auth-container">
        <h2 className="text-3xl text-default-700 sm:text-default-800 mb-2 text-center">Welcome to Quilombo</h2>

        {/* Human Wallet Option */}
        {!address && (
          <Button
            size="lg"
            color="primary"
            variant="flat"
            className="w-full"
            onPress={connect}
            isLoading={!!(loading || isConnecting)}
          >
            Connect Human Wallet
          </Button>
        )}
        {address && isConnected && !session && (
          <div className="flex flex-col gap-3">
            <p className="text-sm text-center text-default-600">
              Your Human Wallet is connected. Click below to complete sign-in.
            </p>
            <Button
              size="lg"
              color="primary"
              variant="flat"
              className="w-full"
              onPress={() => signIn()}
              isLoading={!!loading}
            >
              Sign In with Wallet
            </Button>
          </div>
        )}

        {/* Google OAuth Option */}
        <Button
          size="lg"
          color="default"
          variant="flat"
          className="w-full"
          onPress={handleGoogleSignIn}
          isLoading={!!googleLoading}
          startContent={
            !googleLoading && (
              <svg className="w-5 h-5" viewBox="0 0 24 24" role="img" aria-label="Google logo">
                <path
                  fill="currentColor"
                  d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                />
                <path
                  fill="currentColor"
                  d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                />
                <path
                  fill="currentColor"
                  d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                />
                <path
                  fill="currentColor"
                  d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                />
              </svg>
            )
          }
        >
          Continue with Google
        </Button>

        <div className="relative my-4">
          <Divider />
          <span className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-background px-2 text-sm text-default-400">
            OR
          </span>
        </div>

        {/* Email/Password Form */}
        <Formik
          initialValues={{ email: '', password: '' }}
          validationSchema={loginSchema}
          onSubmit={handleEmailPasswordSubmit}
        >
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
              <Input
                name="password"
                type="password"
                label="Password"
                placeholder="Enter your password"
                value={values.password}
                onChange={handleChange}
                onBlur={handleBlur}
                isInvalid={touched.password && !!errors.password}
                errorMessage={touched.password && errors.password}
                isRequired
              />
              <div className="flex justify-end">
                <Link href={PATHS.forgotPassword} size="sm" color="secondary">
                  Forgot password?
                </Link>
              </div>
              <Button type="submit" color="primary" size="lg" isLoading={!!(isSubmitting || loading)}>
                Sign In
              </Button>
            </Form>
          )}
        </Formik>

        {error && <ErrorText message={error.message} />}

        <Divider className="my-2" />

        <div className="text-center text-sm">
          Don't have an account?{' '}
          <Link href={PATHS.signup} color="secondary">
            Sign up
          </Link>
        </div>
      </div>
    </>
  );
};

export default SignInForm;
