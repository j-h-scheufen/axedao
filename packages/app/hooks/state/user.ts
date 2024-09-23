import { atom } from 'jotai';

import { SocialLink } from '@/db/schema';
import { User, UserProfile } from '@/types/model';
import { getImageUrl } from '@/utils';

export const userProfileAtom = atom<UserProfile | undefined>();

export const userAtom = atom<User | undefined>((get) => get(userProfileAtom)?.user);

export const userIdAtom = atom<string | undefined>((get) => get(userAtom)?.id);

export const userLinksAtom = atom<SocialLink[] | undefined>((get) => get(userAtom)?.links);

export const userAvatarUrlAtom = atom<string | undefined>((get) => getImageUrl(get(userAtom)?.avatar));
