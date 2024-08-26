'use client';

import BottomBar from '@/components/BottomBar';
import Sidebar from '@/components/Sidebar';
import { usePathname, useRouter } from 'next/navigation';
import { ReactNode, useEffect } from 'react';
import { useIsProfileInitialized, useIsSignedIn, useProfileActions } from '../../store/profile.store';

type Props = { children: ReactNode };
const DashboardLayout = ({ children }: Props) => {
  const router = useRouter();
  const pathname = usePathname();
  const isProfileInitialized = useIsProfileInitialized();
  const profileActions = useProfileActions();
  const isSignedIn = useIsSignedIn();

  useEffect(() => {
    // TODO move this to middleware
    if (isSignedIn) {
      if (!isProfileInitialized) profileActions.initializeProfile();
    } else if (!pathname.startsWith('/auth')) {
      router.push('/auth?tab=sign-in');
    }
  }, [isProfileInitialized, profileActions, pathname, router, isSignedIn]);

  return (
    <>
      <Sidebar />
      <BottomBar />
      <div className="flex h-full flex-col md:pl-56">
        <main className="container mx-auto max-w-7xl flex-grow px-6">{children}</main>
      </div>
    </>
  );
};
export default DashboardLayout;
