import { useAtom } from 'jotai';
import { useEffect } from 'react';

import { useFetchUserProfile } from '@/query/user';
import { userProfileAtom } from './state/user';

export const useInitUser = (userId: string) => {
  const [userProfile, setUserProfile] = useAtom(userProfileAtom);
  const { data: profile, error, isPending } = useFetchUserProfile(userId);
  useEffect(() => {
    if (profile) setUserProfile(profile);
  }, [profile, setUserProfile]);

  return { userProfile, error, isPending };
};
  