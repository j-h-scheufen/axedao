'use client';
import { useIsProfileInitialized, useProfileActions } from '@/store/profile.store';
import { useSession } from 'next-auth/react';
import { ReactNode, useEffect } from 'react';

type Props = { children: ReactNode };
const Layout = ({ children }: Props) => {
  const session = useSession();
  const isProfileInitialized = useIsProfileInitialized();
  const profileActions = useProfileActions();

  useEffect(() => {
    if (!isProfileInitialized && session.data?.user?.email) profileActions.initializeProfile();
  }, [isProfileInitialized, session, profileActions]);

  return <>{children}</>;
};
export default Layout;
