'use client';

import { useEffect, useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { Spinner } from '@heroui/react';

const VerifyEmailPage = () => {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const verifyEmail = async () => {
      const token = searchParams.get('token');

      if (!token) {
        setError('No verification token provided');
        setTimeout(() => router.push('/auth/verify-email/expired'), 2000);
        return;
      }

      try {
        const response = await fetch('/api/auth/verify-email', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ token }),
        });

        if (response.ok) {
          // Success - redirect to success page
          router.push('/auth/verify-email/success');
        } else {
          const data = await response.json();

          // Check if token is expired or invalid
          if (response.status === 400 || response.status === 410) {
            router.push('/auth/verify-email/expired');
          } else {
            setError(data.error || 'Verification failed');
            setTimeout(() => router.push('/auth/verify-email/expired'), 3000);
          }
        }
      } catch (err) {
        console.error('Verification error:', err);
        setError('An error occurred during verification');
        setTimeout(() => router.push('/auth/verify-email/expired'), 3000);
      }
    };

    verifyEmail();
  }, [searchParams, router]);

  return (
    <div className="flex min-h-screen flex-col items-center justify-center p-4">
      <div className="text-center space-y-4">
        <Spinner size="lg" color="primary" />
        <h1 className="text-2xl font-semibold">Verifying your email...</h1>
        {error && <p className="text-danger text-sm mt-2">{error}</p>}
      </div>
    </div>
  );
};

export default VerifyEmailPage;
