import { Suspense } from 'react';

import SignUpForm from '@/components/auth/SignUpForm';

const SignupPage = () => {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <div className="flex flex-col text-center">
        <SignUpForm />
      </div>
    </Suspense>
  );
};

export default SignupPage;
