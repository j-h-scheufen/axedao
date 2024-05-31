'use client';

import { useRouter } from 'next/navigation';
import useAuthStore from '@/store/auth.store';
import { SignInFormType } from '@/constants/schemas';

const useAuth = () => {
  const router = useRouter();
  const { actions, ...rest } = useAuthStore();

  return {
    ...rest,
    actions: {
      ...actions,
      // Redirects after authentication or sign out
      register: async (credentials: SignInFormType): Promise<void> => {
        await actions.register(credentials);
        router.push('/dashboard/profile');
      },
      signIn: async (credentials: SignInFormType): Promise<void> => {
        await actions.signIn(credentials);
        router.push('/dashboard/profile');
      },
      signOut: async (): Promise<void> => {
        await actions.signOut();
        router.push('/auth?tab=sign-in');
      },
    },
  };
};

export default useAuth;
