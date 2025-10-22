'use client';

import { useEffect } from 'react';
import { Button } from '@heroui/react';
import { useRouter } from 'next/navigation';
import { PATHS } from '@/config/constants';

const VerifyEmailSuccessPage = () => {
  const router = useRouter();

  useEffect(() => {
    // Auto-redirect after 3 seconds
    const timeout = setTimeout(() => {
      router.push(PATHS.profile);
    }, 3000);

    return () => clearTimeout(timeout);
  }, [router]);

  return (
    <div className="flex flex-col gap-4 max-w-md mx-auto items-center text-center py-8">
      <div className="text-6xl mb-4">✓</div>
      <h2 className="text-3xl text-success font-semibold">Email Verified!</h2>
      <p className="text-default-600">Your email has been successfully verified.</p>
      <p className="text-default-500 text-sm">Redirecting you to your profile...</p>

      <Button color="primary" onPress={() => router.push(PATHS.profile)} className="mt-4">
        Go to Profile Now
      </Button>
    </div>
  );
};

export default VerifyEmailSuccessPage;
