'use client';

import RegistrationForm from '@/components/RegistrationForm';
import SignInForm from '@/components/SignInForm';
import useUpdateSearchParams from '@/hooks/useUpdateSearchParams';
import { useAuthActions, useSilk } from '@/store/auth.store';
import { Spinner } from '@nextui-org/react';
import { Tab, Tabs } from '@nextui-org/tabs';
import { useSearchParams } from 'next/navigation';
import { useEffect } from 'react';

const AuthForms = () => {
  const searchParams = useSearchParams();
  const updateSearchParams = useUpdateSearchParams(searchParams);
  const tab = searchParams.get('tab');

  const silk = useSilk();
  const authActions = useAuthActions();

  useEffect(() => {
    authActions.initializeSilk();
  }, [authActions]);

  return (
    <>
      {!silk && (
        <div className="absolute left-0 top-0 z-20 flex h-full w-full items-center justify-center bg-background/60 backdrop-blur-sm">
          <Spinner />
        </div>
      )}
      <Tabs
        variant="bordered"
        aria-label="Options"
        classNames={{ tabList: 'mx-auto' }}
        defaultSelectedKey={tab || 'register'}
        onSelectionChange={(key) => updateSearchParams('tab', key.toString())}
      >
        <Tab key="register" title={<h1>Register</h1>} className="pt-0">
          <p className="mb-8 mt-2 text-neutral-500">Create and account. You only have to do this once.</p>
          <RegistrationForm />
        </Tab>
        <Tab key="sign-in" title={<h1>Sign in</h1>} className="pt-0">
          <p className="mb-8 mt-2 text-neutral-500">Sign in to your account.</p>
          <SignInForm />
        </Tab>
      </Tabs>
    </>
  );
};
export default AuthForms;
