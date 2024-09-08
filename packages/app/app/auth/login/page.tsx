import { Suspense } from 'react';

import SignInForm from '@/components/SignInForm';

const LoginPage = () => {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <div className="flex min-h-[calc(100vh-100px)] flex-col text-center">
        <SignInForm />
      </div>
    </Suspense>
  );
};
export default LoginPage;
