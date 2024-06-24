'use client';
import BottomBar from '@/components/BottomBar';
import Sidebar from '@/components/Sidebar';
import { useIsProfileInitialized, useProfileActions } from '@/store/profile.store';
import { useSession } from 'next-auth/react';
import { ReactNode, useEffect } from 'react';

type Props = { children: ReactNode };
const DashboardLayout = ({ children }: Props) => {
  const session = useSession();
  const isProfileInitialized = useIsProfileInitialized();
  const profileActions = useProfileActions();

  useEffect(() => {
    if (!isProfileInitialized && session.data?.user?.email) profileActions.initializeProfile();
  }, [isProfileInitialized, session, profileActions]);

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
