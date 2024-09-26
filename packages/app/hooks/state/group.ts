import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import { SocialLink } from '@/db/schema';
import { fetchGroupAdminsOptions, fetchGroupMembersOptions, fetchGroupOptions } from '@/query/group';
import { Group, User } from '@/types/model';
import { getImageUrl, isUUID } from '@/utils';
import { currentUserGroupIdAtom, currentUserIdAtom } from './currentUser';

// This atom is special because it's used to trigger the loading of a group profile
export const triggerGroupIdAtom = atom<string | undefined>();

export const groupAtom = atomWithQuery<Group | undefined>((get) => fetchGroupOptions(get(triggerGroupIdAtom)));

export const groupMembersAtom = atomWithQuery<User[]>((get) => fetchGroupMembersOptions(get(triggerGroupIdAtom)));

export const groupAdminIdsAtom = atomWithQuery<string[]>((get) => fetchGroupAdminsOptions(get(triggerGroupIdAtom)));

export const groupIdAtom = atom<string | undefined>((get) => get(groupAtom).data?.id);

export const groupLinksAtom = atom<SocialLink[] | undefined>((get) => get(groupAtom).data?.links);

export const groupFounderAtom = atom<string | null | undefined>((get) => get(groupAtom).data?.founder);

export const groupLeaderAtom = atom<string | null | undefined>((get) => get(groupAtom).data?.leader);

export const groupLogoUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom).data?.logo));

export const groupBannerUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom).data?.banner));

export const isCurrentUserGroupAdminAtom = atom<boolean>(
  (get) => get(groupAdminIdsAtom)?.data?.includes(get(currentUserIdAtom) ?? '') ?? false,
);

export const isCurrentUserGroupMemberAtom = atom<boolean>((get) => get(groupIdAtom) === get(currentUserGroupIdAtom));

export const isFounderUuidAtom = atom<boolean>((get) => isUUID(get(groupFounderAtom) ?? ''));
