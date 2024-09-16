import { Profile } from '@/types/model';

export type UserDetailsState = {
  profile: Profile | null;
  isUserInitialized: boolean;
  isInitializingUser: boolean;
  initializeError?: string;
};

export type UserDetailsActions = {
  initializeUser: (userId: string) => Promise<void>;
};

export type UserDetailsStore = UserDetailsState & { actions: UserDetailsActions };
