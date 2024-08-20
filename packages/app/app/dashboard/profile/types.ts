import { Group, Link, User } from '@/types/model';
import { CreateNewGroupFormType, ProfileFormType } from './schema';

export type Profile = User & { links: Link[]; group: Group | null };

export type ProfileState = {
  profile: Profile;
  isInitializingProfile: boolean;
  isProfileInitialized: boolean;
  initializeProfileError?: string;
  isUpdatingProfile: boolean;
  profileUpdateError?: string;
  isExitingGroup: boolean;
  exitGroupError?: string;
  isJoiningGroup: boolean;
  joinGroupError?: string;
  isCreatingGroup: boolean;
  createGroupError?: string;
  isUploadingAvatar?: boolean;
  isSignedIn?: boolean;
};

export type ProfileActions = {
  initializeProfile: () => Promise<void>;
  uploadAvatar: (file: File, name?: string) => Promise<string | void>;
  updateProfile: (profileData: ProfileFormType) => Promise<void>;
  joinGroup: (groupId: string) => Promise<void>;
  exitGroup: () => Promise<void>;
  createGroup: (groupProfileData: CreateNewGroupFormType) => Promise<void>;
  removeGroupAssociation: () => void;
  setIsSignedIn: (isSignedIn: boolean) => void;
  clearProfile: () => void;
};

export type ProfileStore = ProfileState & { actions: ProfileActions };
