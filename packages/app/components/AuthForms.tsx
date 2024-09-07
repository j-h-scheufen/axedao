'use client';

import { Spinner } from '@nextui-org/spinner';
import { Tab, Tabs } from '@nextui-org/tabs';
import { useSession } from 'next-auth/react';
import { useSearchParams } from 'next/navigation';

import useUpdateSearchParams from '@/hooks/useUpdateSearchParams';
import RegistrationForm from './RegistrationForm';
import SignInForm from './SignInForm';

const AuthForms = () => {
  // const router = useRouter();

  // const { setIsSignedIn } = useProfileActions();
  const session = useSession();
  const searchParams = useSearchParams();
  const tab = searchParams.get('tab');
  const updateSearchParams = useUpdateSearchParams(searchParams);

  // useEffect(() => {
  //   if (session.status === 'authenticated') {
  //     setIsSignedIn(true);
  //     router.push('/dashboard/profile');
  //   }
  // }, [session.status, setIsSignedIn, router]);

  const isLoading = session.status === 'loading';

  return (
    <>
      {isLoading && (
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
