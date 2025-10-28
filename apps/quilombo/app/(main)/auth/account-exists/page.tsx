'use client';

import { useRouter } from 'next/navigation';
import { Button, Card, CardBody } from '@heroui/react';
import { PATHS } from '@/config/constants';

/**
 * Interstitial page shown when attempting to sign up with Google OAuth
 * but the email is already registered with another auth method
 */
const AccountExistsPage = () => {
  const router = useRouter();

  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-4">
      <Card className="max-w-md w-full">
        <CardBody className="gap-6 p-6">
          <div className="text-center">
            <div className="text-5xl mb-4">⚠️</div>
            <h1 className="text-2xl font-bold text-default-900 mb-2">Account Already Exists</h1>
          </div>

          <div className="bg-warning-50 border border-warning-200 rounded-lg p-4">
            <p className="text-sm text-default-700 mb-2">
              Unable to create a new account. You may already have a Quilombo account with this email address.
            </p>
            <p className="text-sm text-default-600">
              If you already have an account, please sign in using your existing authentication method (Email/Password
              or Human Wallet).
            </p>
          </div>

          <div className="space-y-3">
            <Button color="primary" size="lg" className="w-full" onPress={() => router.push(PATHS.login)}>
              Go to Sign In
            </Button>

            <Button
              color="default"
              variant="flat"
              size="lg"
              className="w-full"
              onPress={() => router.push(PATHS.signup)}
            >
              Back to Sign Up
            </Button>
          </div>

          <div className="bg-default-100 rounded-lg p-4">
            <p className="text-xs text-default-600">
              <strong>Want to link your Google account?</strong>
              <br />
              Sign in first, then go to Settings → Authentication Methods to link your Google account to your existing
              account.
            </p>
          </div>
        </CardBody>
      </Card>
    </div>
  );
};

export default AccountExistsPage;
