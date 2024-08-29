import { RegistrationFormType } from '@/constants/schemas';
import { User } from '@/types/model';
import { useMutation } from '@tanstack/react-query';
import axios from 'axios';
import { useRouter } from 'next/navigation';
import useSignIn from './useSignIn';

const useRegister = () => {
  const router = useRouter();

  const { signInMutation } = useSignIn();

  const handleRegistration = async (values: RegistrationFormType) => {
    try {
      const { data } = await axios.post<User>('/api/auth/register', values);
      await signInMutation.mutateAsync(); // TODO this should talk to the profile store which then calls the sign-in mutation
      return data;
    } catch (error) {
      // Email or wallet address already registered, but we don't want to reveal which exactly.
      if (axios.isAxiosError(error) && error.response?.status === 400) {
        throw new Error(
          "Registration failed. Please check your email and wallet address. If you're already registered, please go to Sign-In.",
        );
      }
      throw error;
    }
  };

  const registrationMutation = useMutation({
    mutationKey: ['registration'],
    mutationFn: handleRegistration,
    onSuccess: () => {
      router.push('/dashboard/profile');
    },
  });

  return { registrationMutation };
};

export default useRegister;
