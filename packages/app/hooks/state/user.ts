import { atom } from 'jotai';

import { SocialLink } from '@/db/schema';
import { User, UserProfile } from '@/types/model';

export const userProfileAtom = atom<UserProfile | undefined>();

export const userIdAtom = atom<string | undefined>((get) => get(userProfileAtom)?.user.id);

export const userAtom = atom<User | undefined>((get) => get(userProfileAtom)?.user);

export const userLinksAtom = atom<SocialLink[] | undefined>((get) => get(userProfileAtom)?.user.links);

export const userAvatarAtom = atom<string | null | undefined>((get) => get(userProfileAtom)?.user.avatar);
