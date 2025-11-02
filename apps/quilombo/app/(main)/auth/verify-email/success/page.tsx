'use client';

import { useEffect } from 'react';
import { Button } from '@heroui/react';
import { useRouter } from 'next/navigation';
import { CheckCircle2 } from 'lucide-react';

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
    <div className="auth-container-py items-center text-center">
      <div className="mb-6 flex justify-center">
        <CheckCircle2 className="w-20 h-20 text-success" strokeWidth={1.5} />
      </div>
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
