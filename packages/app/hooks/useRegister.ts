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
    const { data } = await axios.post<User>('/api/auth/register', values);
    await signInMutation.mutateAsync(undefined);
    return data;
  };

  const registrationMutation = useMutation({
    mutationKey: ['registration'],
    mutationFn: handleRegistration,
    onSuccess: (user) => {
      console.log('Successful registration');
      // useProfileStore.setState({ profile: user });
      router.push('/dashboard/profile');
    },
  });

  return { registrationMutation };
};

export default useRegister;
