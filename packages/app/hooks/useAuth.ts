'use client';

import { RegistrationFormType, SignInFormType } from '@/constants/schemas';
import useAuthStore from '@/store/auth.store';
import { useRouter } from 'next/navigation';

const useAuth = () => {
  const router = useRouter();
  const { actions, ...rest } = useAuthStore();

  return {
    ...rest,
    actions: {
      ...actions,
      // Redirects after authentication or sign out
      register: async (credentials: RegistrationFormType): Promise<void> => {
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
