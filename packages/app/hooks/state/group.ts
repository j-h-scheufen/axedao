import { atom } from 'jotai';

import { SocialLink } from '@/db/schema';
import { Group, GroupProfile, User } from '@/types/model';
import { getImageUrl, isUUID } from '@/utils';
import { currentUserGroupAtom, currentUserIdAtom } from './currentUser';

export const groupProfileAtom = atom<GroupProfile | undefined>();

export const groupAtom = atom<Group | undefined>((get) => get(groupProfileAtom)?.group);

export const groupIdAtom = atom<string | undefined>((get) => get(groupAtom)?.id);

export const groupLinksAtom = atom<SocialLink[] | undefined>((get) => get(groupAtom)?.links);

export const groupFounderAtom = atom<string | null | undefined>((get) => get(groupAtom)?.founder);

export const groupLeaderAtom = atom<string | null | undefined>((get) => get(groupAtom)?.leader);

export const groupLogoUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom)?.logo));

export const groupBannerUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom)?.banner));

export const groupAdminIdsAtom = atom<string[]>((get) => get(groupProfileAtom)?.adminIds ?? []);

export const isCurrentUserGroupAdminAtom = atom<boolean>(
  (get) => get(groupProfileAtom)?.adminIds.includes(get(currentUserIdAtom) ?? '') ?? false,
);

export const isCurrentUserGroupMemberAtom = atom<boolean>((get) => get(groupIdAtom) === get(currentUserGroupAtom)?.id);

export const isFounderUuidAtom = atom<boolean>((get) => isUUID(get(groupProfileAtom)?.group.founder ?? ''));

export const groupMembersAtom = atom<User[] | undefined>();
