import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import type { SocialLink } from '@/db/schema';
import { fetchUserOptions } from '@/query/user';
import type { User } from '@/types/model';
import { getImageUrl } from '@/utils';

export const triggerUserIdAtom = atom<string | undefined>();

export const userAtom = atomWithQuery<User | undefined>((get) => fetchUserOptions(get(triggerUserIdAtom)));

export const userIdAtom = atom<string | undefined>((get) => get(userAtom).data?.id);

// Note: userGroupIdAtom and userGroupAtom have been removed.
// Group membership is now tracked via genealogy statements (member_of predicate).

export const userLinksAtom = atom<SocialLink[] | undefined>((get) => get(userAtom).data?.links);

export const userAvatarUrlAtom = atom<string | undefined>((get) => getImageUrl(get(userAtom).data?.avatar));
