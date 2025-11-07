import { Suspense } from 'react';

import SignUpForm from '@/components/auth/SignUpForm';

const SignupPage = () => {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <SignUpForm />
    </Suspense>
  );
};

export default SignupPage;
