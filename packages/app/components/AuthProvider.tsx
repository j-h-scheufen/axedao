'use client';

import { useAuthActions } from '@/store/auth.store';
import { useSession } from 'next-auth/react';
import { ReactNode, useEffect } from 'react';

type Props = { children: ReactNode };
const AuthProvider = ({ children }: Props) => {
  const session = useSession();
  const authActions = useAuthActions();
  useEffect(() => {
    if (session.data?.user) authActions.initializeUser();
  }, [session.data?.user, authActions]);
  return children;
};
export default AuthProvider;
