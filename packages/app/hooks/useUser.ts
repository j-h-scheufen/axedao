import { useRouter } from 'next/navigation';
import { useMutation } from '@tanstack/react-query';
import axios from 'axios';

const useUser = () => {
  const router = useRouter();

  const createProfile = async (profileData: any) => {
    const { data: profile } = await axios.post('/dashboard/profile/api', profileData);
    return profile;
  };

  const createProfileMutation = useMutation({
    mutationKey: ['create-profile'],
    mutationFn: createProfile,
    onSuccess: (profile) => {
      console.log(profile);
      // optimistically update user object
      router.push('/dashboard/profile');
    },
  });

  const updateProfile = async (profileData: any) => {
    const { data: profile } = await axios.post('/dashboard/profile/api', profileData);
    return profile;
  };

  const updateProfileMutation = useMutation({
    mutationKey: ['update-profile'],
    mutationFn: updateProfile,
    onSuccess: (profile) => {
      console.log(profile);
      // optimistically update user object
      router.push('/dashboard/profile');
    },
  });

  return {
    // user,
    updateProfileMutation,
    createProfileMutation,
  };
};

export default useUser;
