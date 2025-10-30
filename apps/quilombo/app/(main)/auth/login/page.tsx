import { Suspense } from 'react';

import SignInForm from '@/components/auth/SignInForm';

const LoginPage = () => {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <SignInForm />
    </Suspense>
  );
};
export default LoginPage;
