'use client';

import { useState, useEffect } from 'react';
import { Button, Link, Divider, Spinner } from '@heroui/react';
import { signIn as nextAuthSignIn, useSession } from 'next-auth/react';
import { useAccount } from 'wagmi';
import { Formik, Form, Field } from 'formik';
import { useRouter, useSearchParams } from 'next/navigation';
import { setCookie } from 'cookies-next';

import { PATHS, AUTH_COOKIES } from '@/config/constants';
import { signupSchema, type SignupForm as SignupFormValues } from '@/config/validation-schema';
import ErrorText from '@/components/ErrorText';
import FieldInput from '@/components/forms/FieldInput';
import useAuth from '@/hooks/useAuth';
import * as auth from '@/query/auth';
import OrDivider from './OrDivider';
import { PasswordRequirements } from './PasswordRequirements';
import WalletEmailModal from './WalletEmailModal';

// TODO: TEMPORARY INVITE-ONLY - Types for invitation validation
type InvitationType = 'email_bound' | 'open';
type InvitationValidation = {
  valid: boolean;
  type: InvitationType;
  inviterName: string;
  expiresAt: string;
  invitedEmail?: string;
};

// Google email domains for smart ordering
const GOOGLE_EMAIL_DOMAINS = ['gmail.com', 'googlemail.com'];

const isGoogleEmail = (email: string | null | undefined): boolean => {
  if (!email) return false;
  const domain = email.toLowerCase().split('@')[1];
  return GOOGLE_EMAIL_DOMAINS.includes(domain);
};

const SignUpForm = () => {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [mounted, setMounted] = useState(false);
  const { data: session } = useSession();
  const { address, isConnecting, isConnected } = useAccount();
  const {
    signIn,
    connect,
    state: { loading, error: authError, emailRequired },
  } = useAuth();
  const [googleLoading, setGoogleLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  // TODO: TEMPORARY INVITE-ONLY - Invitation validation state
  const [invitationValid, setInvitationValid] = useState<boolean | null>(null);
  const [inviterName, setInviterName] = useState<string>('');
  const [invitationType, setInvitationType] = useState<InvitationType | null>(null);

  // Use signup mutation from query layer
  const signupMutation = auth.useSignupMutation();

  // Extract invitation code and email from URL params
  const invitationCode = searchParams.get('code');
  const invitedEmail = searchParams.get('email');

  // Prevent hydration mismatch by only rendering after client mount
  useEffect(() => {
    setMounted(true);
  }, []);

  // TODO: TEMPORARY INVITE-ONLY - Validate invitation on mount
  useEffect(() => {
    if (!mounted) return;

    if (!invitationCode) {
      setInvitationValid(false);
      return;
    }

    // Validate invitation via API (public endpoint - no auth required)
    fetch('/api/public/invitations/validate', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
    })
      .then((res) => res.json())
      .then((data: InvitationValidation | { error: string }) => {
        if ('valid' in data && data.valid) {
          setInvitationValid(true);
          setInviterName(data.inviterName);
          setInvitationType(data.type);
          // Set cookie for OAuth/wallet flows (1 hour expiry)
          setCookie(AUTH_COOKIES.INVITATION_CODE, invitationCode, {
            path: '/',
            maxAge: 3600,
            sameSite: 'lax',
          });
        } else {
          setInvitationValid(false);
          setError('error' in data ? data.error : 'Invalid or expired invitation');
        }
      })
      .catch(() => {
        setInvitationValid(false);
        setError('Failed to validate invitation');
      });
  }, [mounted, invitationCode, invitedEmail]);

  // Redirect already authenticated users
  useEffect(() => {
    if (session?.user) {
      const redirectUrl = searchParams.get('callbackUrl') || PATHS.profile;
      router.push(redirectUrl);
    }
  }, [session, router, searchParams]);

  const handleEmailPasswordSubmit = async (values: SignupFormValues) => {
    setError(null);
    try {
      await signupMutation.mutateAsync({
        ...values,
        invitationCode: invitationCode || '',
      });

      setSuccess(true);
      // Redirect to email verification page
      router.push(`${PATHS.verifyEmail}/sent?email=${encodeURIComponent(values.email)}`);
    } catch (err) {
      setError((err as Error).message || 'An unexpected error occurred. Please try again.');
      console.error('Signup error:', err);
    }
  };

  const handleGoogleSignUp = async () => {
    setGoogleLoading(true);
    setError(null);
    try {
      const result = await nextAuthSignIn('google', {
        callbackUrl: PATHS.profile,
        redirect: false,
      });

      if (result?.error) {
        setError('Failed to sign up with Google');
      } else if (result?.ok) {
        // Success - redirect to profile
        router.push(PATHS.profile);
      }
    } catch (err) {
      console.error('Google sign-up error:', err);
      setError('Failed to sign up with Google');
    } finally {
      setGoogleLoading(false);
    }
  };

  const handleWalletEmailSubmit = async (email: string) => {
    await signIn(email);
  };

  // TODO: TEMPORARY INVITE-ONLY - Handle wallet signup with email-bound invites
  const handleWalletSignUp = () => {
    if (invitationType === 'email_bound' && invitedEmail) {
      // Skip modal - use the invitation email directly
      signIn(invitedEmail);
    } else {
      // Normal flow - will auto-fetch from SDK or show modal
      signIn();
    }
  };

  // Show loading state during hydration to prevent mismatch
  if (!mounted) {
    return (
      <div className="auth-container-py">
        <div className="text-center">Loading...</div>
      </div>
    );
  }

  // TODO: TEMPORARY INVITE-ONLY - Show loading while validating invitation
  if (invitationValid === null && invitationCode) {
    return (
      <div className="auth-container-py items-center text-center">
        <Spinner size="lg" />
        <p className="mt-4 text-default-500">Validating invitation...</p>
      </div>
    );
  }

  // TODO: TEMPORARY INVITE-ONLY - Show invite-only message when no valid invitation
  if (invitationValid === false) {
    return (
      <div className="auth-container-py items-center text-center">
        <h2 className="text-2xl text-default-700 mb-4">Invite Only</h2>
        <div className="p-4 bg-secondary-800/20 rounded-lg border border-secondary-600/50 max-w-md">
          {error ? (
            <p className="text-danger-600 mb-4">{error}</p>
          ) : (
            <p className="text-secondary-200 dark:text-secondary-700 mb-4">
              Quilombo is currently invite-only. To join, you need an invitation from an existing member.
            </p>
          )}
          <p className="text-sm text-default-500">
            Already have an account?{' '}
            <Link href={PATHS.login} color="secondary">
              Sign in
            </Link>
          </p>
        </div>
      </div>
    );
  }

  if (success) {
    return (
      <div className="auth-container-py items-center text-center">
        <h2 className="text-2xl text-default-700 mb-2">Check Your Email</h2>
        <p className="text-center text-default-600">
          We've sent a verification link to your email. Please check your inbox and click the link to activate your
          account.
        </p>
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
        error={authError?.message}
        initialEmail={invitationType === 'open' ? invitedEmail || undefined : undefined}
      />

      <div className="auth-container-py">
        <h2 className="text-3xl text-default-700 sm:text-default-800 mb-2 text-center">Create Your Account</h2>

        {/* TODO: TEMPORARY INVITE-ONLY - Show invitation banner */}
        {invitationValid && (
          <div className="mb-4 p-3 bg-success-50 rounded-lg border border-success-200">
            <p className="text-sm text-success-700 text-center">
              {inviterName ? `You were invited by ${inviterName}` : "You're signing up with a valid invitation"}
            </p>
          </div>
        )}

        {/* Signup options - order changes based on email domain */}
        {isGoogleEmail(invitedEmail) ? (
          <>
            {/* Google email detected - show Google option first */}
            <p className="text-xs text-center text-default-500 mb-2">
              We detected a Google email. Sign up quickly with your Google account:
            </p>

            {/* Google OAuth Option */}
            <Button
              size="lg"
              color="primary"
              className="w-full"
              onPress={handleGoogleSignUp}
              isLoading={googleLoading}
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

            <OrDivider />

            {/* Email/Password Form */}
            <Formik
              initialValues={{ email: invitedEmail || '', password: '', invitationCode: invitationCode || '' }}
              validationSchema={signupSchema}
              onSubmit={handleEmailPasswordSubmit}
            >
              {({ isSubmitting, values }) => (
                <Form className="flex flex-col gap-4">
                  <Field
                    name="email"
                    type="email"
                    label="Email"
                    placeholder="your@email.com"
                    isRequired
                    isDisabled={invitationType === 'email_bound'}
                    as={FieldInput}
                  />
                  <Field
                    name="password"
                    type="password"
                    label="Password"
                    placeholder="Create a strong password"
                    isRequired
                    as={FieldInput}
                  />
                  <PasswordRequirements password={values.password} />
                  <Button type="submit" color="default" variant="flat" size="lg" isLoading={isSubmitting}>
                    Create Account with Password
                  </Button>
                </Form>
              )}
            </Formik>

            <OrDivider />

            {/* Human Wallet Option */}
            {!address && (
              <Button
                size="lg"
                color="default"
                variant="flat"
                className="w-full"
                onPress={connect}
                isLoading={!!(loading || isConnecting)}
              >
                Connect Human Wallet
              </Button>
            )}
            {address && isConnected && (
              <div className="flex flex-col gap-3">
                <p className="text-sm text-center text-default-600">
                  Your Human Wallet is connected. Click below to complete sign-up.
                </p>
                <Button
                  size="lg"
                  color="default"
                  variant="flat"
                  className="w-full"
                  onPress={handleWalletSignUp}
                  isLoading={!!loading}
                >
                  Sign Up with Wallet
                </Button>
              </div>
            )}
          </>
        ) : (
          <>
            {/* Default layout - Email/Password first */}
            <Formik
              initialValues={{ email: invitedEmail || '', password: '', invitationCode: invitationCode || '' }}
              validationSchema={signupSchema}
              onSubmit={handleEmailPasswordSubmit}
            >
              {({ isSubmitting, values }) => (
                <Form className="flex flex-col gap-4">
                  <Field
                    name="email"
                    type="email"
                    label="Email"
                    placeholder="your@email.com"
                    isRequired
                    isDisabled={invitationType === 'email_bound'}
                    as={FieldInput}
                  />
                  <Field
                    name="password"
                    type="password"
                    label="Password"
                    placeholder="Create a strong password"
                    isRequired
                    as={FieldInput}
                  />
                  <PasswordRequirements password={values.password} />
                  <Button type="submit" color="primary" size="lg" isLoading={isSubmitting}>
                    Create Account
                  </Button>
                </Form>
              )}
            </Formik>

            <OrDivider />

            <p className="text-xs text-center text-default-500 mb-2">
              Or use one of these identity providers to create an account.
            </p>

            {/* Google OAuth Option */}
            <Button
              size="lg"
              color="default"
              variant="flat"
              className="w-full"
              onPress={handleGoogleSignUp}
              isLoading={googleLoading}
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
            {address && isConnected && (
              <div className="flex flex-col gap-3">
                <p className="text-sm text-center text-default-600">
                  Your Human Wallet is connected. Click below to complete sign-up.
                </p>
                <Button
                  size="lg"
                  color="primary"
                  variant="flat"
                  className="w-full"
                  onPress={handleWalletSignUp}
                  isLoading={!!loading}
                >
                  Sign Up with Wallet
                </Button>
              </div>
            )}
          </>
        )}

        {(error || authError) && <ErrorText message={error || authError?.message || ''} />}

        <Divider className="my-2" />

        <div className="text-center text-sm">
          Already have an account?{' '}
          <Link href={PATHS.login} color="secondary">
            Sign in
          </Link>
        </div>

        <div className="text-center text-xs text-default-500 mt-2">
          By creating an account, you agree to our Terms of Service and Privacy Policy.
        </div>
      </div>
    </>
  );
};

export default SignUpForm;
