'use client';

import { Button } from '@heroui/react';
import Link from 'next/link';
import { CheckCircle2 } from 'lucide-react';

import { PATHS } from '@/config/constants';

const VerifyEmailSuccessPage = () => {
  return (
    <div className="auth-container-py items-center text-center">
      <div className="mb-6 flex justify-center">
        <CheckCircle2 className="w-20 h-20 text-success" strokeWidth={1.5} />
      </div>
      <h2 className="text-3xl text-success font-semibold">Email Verified!</h2>
      <p className="text-default-600 mt-2">Your email has been confirmed.</p>
      <p className="text-default-500 mt-4">You can close this tab and return to your sign-up window.</p>
      <p className="text-default-400 text-sm mt-1">Or log in below if you&apos;ve closed that tab.</p>

      <Button as={Link} href={PATHS.login} color="primary" variant="bordered" className="mt-6">
        Go to Login
      </Button>
    </div>
  );
};

export default VerifyEmailSuccessPage;
