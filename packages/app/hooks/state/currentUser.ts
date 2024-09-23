import { atom } from 'jotai';

import { SocialLink } from '@/db/schema';
import { Group, User, UserProfile } from '@/types/model';
import { getImageUrl } from '@/utils';

export const currentUserProfileAtom = atom<UserProfile | undefined>();

export const currentUserIdAtom = atom<string | undefined>((get) => get(currentUserProfileAtom)?.user.id);

export const currentUserAtom = atom<User | undefined>((get) => get(currentUserProfileAtom)?.user);

export const currentUserLinksAtom = atom<SocialLink[] | undefined>((get) => get(currentUserProfileAtom)?.user.links);

export const currentUserGroupAtom = atom<Group | undefined>((get) => get(currentUserProfileAtom)?.group ?? undefined);

export const currentUserAvatarUrlAtom = atom<string | undefined>((get) => getImageUrl(get(currentUserAtom)?.avatar));
