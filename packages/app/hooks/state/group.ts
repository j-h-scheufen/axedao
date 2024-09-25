import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import { SocialLink } from '@/db/schema';
import { groupMembersOptions, groupProfileOptions } from '@/query/group';
import { Group, GroupProfile, User } from '@/types/model';
import { getImageUrl, isUUID } from '@/utils';
import { currentUserGroupAtom, currentUserIdAtom } from './currentUser';

// This atom is special because it's used to trigger the loading of a group profile
export const triggerGroupIdAtom = atom<string | undefined>();

export const groupProfileAtom = atomWithQuery<GroupProfile | undefined>((get) =>
  groupProfileOptions(get(triggerGroupIdAtom)),
);

export const groupMembersAtom = atomWithQuery<User[]>((get) => groupMembersOptions(get(triggerGroupIdAtom)));

export const groupAtom = atom<Group | undefined>((get) => get(groupProfileAtom)?.data?.group);

export const groupIdAtom = atom<string | undefined>((get) => get(groupAtom)?.id);

export const groupLinksAtom = atom<SocialLink[] | undefined>((get) => get(groupAtom)?.links);

export const groupFounderAtom = atom<string | null | undefined>((get) => get(groupAtom)?.founder);

export const groupLeaderAtom = atom<string | null | undefined>((get) => get(groupAtom)?.leader);

export const groupLogoUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom)?.logo));

export const groupBannerUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom)?.banner));

export const groupAdminIdsAtom = atom<string[]>((get) => get(groupProfileAtom)?.data?.adminIds ?? []);

export const isCurrentUserGroupAdminAtom = atom<boolean>(
  (get) => get(groupProfileAtom)?.data?.adminIds.includes(get(currentUserIdAtom) ?? '') ?? false,
);

export const isCurrentUserGroupMemberAtom = atom<boolean>((get) => get(groupIdAtom) === get(currentUserGroupAtom)?.id);

export const isFounderUuidAtom = atom<boolean>((get) => isUUID(get(groupFounderAtom) ?? ''));
