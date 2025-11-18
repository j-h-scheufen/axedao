import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';
import type { Address } from 'viem';

import type { SocialLink } from '@/db/schema';
import { fetchCurrentUserOptions } from '@/query/currentUser';
import { fetchGroupOptions } from '@/query/group';
import type { Group, User } from '@/types/model';
import { getImageUrl, getUserDisplayName } from '@/utils';

export const triggerCurrentUserIdAtom = atom<string | undefined>();

export const currentUserAtom = atomWithQuery<User | undefined>((get) =>
  fetchCurrentUserOptions(get(triggerCurrentUserIdAtom))
);

export const currentUserGroupAtom = atomWithQuery<Group | undefined>((get) =>
  fetchGroupOptions(get(currentUserGroupIdAtom))
);

export const currentUserDisplayNameAtom = atom<string>((get) => getUserDisplayName(get(currentUserAtom).data));

export const currentUserIdAtom = atom<string | undefined>((get) => get(currentUserAtom).data?.id);

export const currentUserGroupIdAtom = atom<string | undefined>(
  (get) => get(currentUserAtom).data?.groupId ?? undefined
);

export const currentUserLinksAtom = atom<SocialLink[] | undefined>((get) => get(currentUserAtom).data?.links);

export const currentUserAvatarAtom = atom<string | undefined>((get) => get(currentUserAtom).data?.avatar ?? undefined);

export const currentUserWalletAddressAtom = atom<Address | undefined>(
  (get) => get(currentUserAtom).data?.walletAddress as Address | undefined
);

export const currentUserAvatarUrlAtom = atom<string | undefined>((get) =>
  getImageUrl(get(currentUserAtom).data?.avatar)
);

export const currentUserIsGlobalAdminAtom = atom<boolean>((get) => get(currentUserAtom).data?.isGlobalAdmin ?? false);
