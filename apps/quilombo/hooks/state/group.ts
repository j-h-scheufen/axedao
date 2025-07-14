import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import type { SocialLink } from '@/db/schema';
import {
  fetchGroupAdminsOptions,
  fetchGroupLocationsOptions,
  fetchGroupMembersOptions,
  fetchGroupOptions,
} from '@/query/group';
import type { Group, GroupLocation, User } from '@/types/model';
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

export const groupLogoAtom = atom<string | undefined>((get) => get(groupAtom).data?.logo ?? undefined);

export const groupLogoUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom).data?.logo));

export const groupBannerAtom = atom<string | undefined>((get) => get(groupAtom).data?.banner ?? undefined);

export const groupBannerUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom).data?.banner));

// Atoms that properly handle loading states
export const isCurrentUserGroupAdminAtom = atom<boolean | null>((get) => {
  const groupAdminIds = get(groupAdminIdsAtom);
  const currentUserId = get(currentUserIdAtom);

  // Return null if still loading or if currentUserId is not available
  if (groupAdminIds.isLoading || groupAdminIds.isError || !currentUserId) {
    return null;
  }

  return groupAdminIds.data?.includes(currentUserId) ?? false;
});

export const isCurrentUserGroupMemberAtom = atom<boolean | null>((get) => {
  const group = get(groupAtom);
  const currentUserGroupId = get(currentUserGroupIdAtom);

  // Return null if still loading or if currentUserGroupId is not available
  if (group.isLoading || group.isError || !currentUserGroupId) {
    return null;
  }

  return group.data?.id === currentUserGroupId;
});

// Legacy atoms for backward compatibility (deprecated - use the ones above)
export const isCurrentUserGroupAdminAtomLegacy = atom<boolean>(
  (get) => get(groupAdminIdsAtom)?.data?.includes(get(currentUserIdAtom) ?? '') ?? false
);

export const isFounderUuidAtom = atom<boolean>((get) => isUUID(get(groupFounderAtom) ?? ''));

export const groupLocationsAtom = atomWithQuery<GroupLocation[]>((get) =>
  fetchGroupLocationsOptions(get(triggerGroupIdAtom))
);
