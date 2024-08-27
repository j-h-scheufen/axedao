import { Profile } from '@/app/dashboard/profile/types';

export type UserDetailsState = {
  user: Profile | null;
  isUserInitialized: boolean;
  isInitializingUser: boolean;
  initializeError?: string;
};

export type UserDetailsActions = {
  initializeUser: (userId: string) => Promise<void>;
};

export type UserDetailsStore = UserDetailsState & { actions: UserDetailsActions };
