'use client';

import { useState } from 'react';
import { Button, Link } from '@heroui/react';
import { useSearchParams } from 'next/navigation';
import { PATHS } from '@/config/constants';
import ErrorText from '@/components/ErrorText';

const VerifyEmailSentPage = () => {
  const searchParams = useSearchParams();
  const email = searchParams.get('email') || '';
  const [resending, setResending] = useState(false);
  const [resent, setResent] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const maskEmail = (email: string) => {
    if (!email) return '';
    const [local, domain] = email.split('@');
    if (!domain) return email;
    const maskedLocal = local.substring(0, 2) + '*'.repeat(Math.max(local.length - 2, 0));
    const [domainName, tld] = domain.split('.');
    const maskedDomain = domainName.substring(0, 2) + '*'.repeat(Math.max(domainName.length - 2, 0));
    return `${maskedLocal}@${maskedDomain}.${tld}`;
  };

  const handleResend = async () => {
    if (!email) {
      setError('Email address is missing');
      return;
    }

    setResending(true);
    setError(null);

    try {
      const response = await fetch('/api/auth/resend-verification', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email }),
      });

      if (response.ok || response.status === 204) {
        setResent(true);
        setTimeout(() => setResent(false), 5000);
      } else {
        const data = await response.json();
        setError(data.error || 'Failed to resend verification email');
      }
    } catch (err) {
      setError('An unexpected error occurred. Please try again.');
      console.error('Resend verification error:', err);
    } finally {
      setResending(false);
    }
  };

  return (
    <div className="auth-container-py items-center text-center">
      <div className="text-6xl mb-4">📧</div>
      <h2 className="text-3xl text-default-700 font-semibold">Check Your Inbox</h2>
      <p className="text-default-600">
        We sent a verification link to <span className="font-medium">{maskEmail(email)}</span>
      </p>
      <p className="text-default-500 text-sm">
        Click the link in the email to verify your account. The link will expire in 30 minutes.
      </p>

      <div className="mt-4 p-4 bg-default-100 rounded-lg w-full">
        <p className="text-sm text-default-700 mb-2">Didn't receive the email?</p>
        <ul className="text-xs text-default-600 text-left space-y-1 mb-3">
          <li>• Check your spam or junk folder</li>
          <li>• Make sure you entered the correct email address</li>
          <li>• Wait a few minutes for the email to arrive</li>
        </ul>
        <Button
          color="secondary"
          variant="flat"
          size="sm"
          onPress={handleResend}
          isLoading={resending}
          isDisabled={resent}
        >
          {resent ? 'Email Resent!' : 'Resend Verification Email'}
        </Button>
      </div>

      {error && <ErrorText message={error} />}

      <div className="mt-6">
        <Link href={PATHS.login} color="secondary" size="sm">
          Back to Login
        </Link>
      </div>
    </div>
  );
};

export default VerifyEmailSentPage;
