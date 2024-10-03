import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import { SocialLink } from '@/db/schema';
import { fetchGroupOptions } from '@/query/group';
import { fetchUserOptions } from '@/query/user';
import { Group, User } from '@/types/model';
import { getImageUrl } from '@/utils';

export const triggerUserIdAtom = atom<string | undefined>();

export const userAtom = atomWithQuery<User | undefined>((get) => fetchUserOptions(get(triggerUserIdAtom)));

export const userGroupAtom = atomWithQuery<Group | undefined>((get) => fetchGroupOptions(get(userGroupIdAtom)));

export const userIdAtom = atom<string | undefined>((get) => get(userAtom).data?.id);

export const userGroupIdAtom = atom<string | undefined>((get) => get(userAtom).data?.groupId ?? undefined);

export const userLinksAtom = atom<SocialLink[] | undefined>((get) => get(userAtom).data?.links);

export const userAvatarUrlAtom = atom<string | undefined>((get) => getImageUrl(get(userAtom).data?.avatar));
