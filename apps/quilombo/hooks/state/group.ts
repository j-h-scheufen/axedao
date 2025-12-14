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
import { getImageUrl } from '@/utils';
import { currentUserIdAtom } from './currentUser';

// This atom is special because it's used to trigger the loading of a group profile
export const triggerGroupIdAtom = atom<string | undefined>();

export const groupAtom = atomWithQuery<Group | undefined>((get) => fetchGroupOptions(get(triggerGroupIdAtom)));

export const groupMembersAtom = atomWithQuery<User[]>((get) => fetchGroupMembersOptions(get(triggerGroupIdAtom)));

export const groupAdminIdsAtom = atomWithQuery<string[]>((get) => {
  const groupId = get(triggerGroupIdAtom);
  // Add dependency on adminCount so atom refetches when admin list changes
  const _adminCount = get(groupAtom).data?.adminCount;
  return fetchGroupAdminsOptions(groupId);
});

export const groupIdAtom = atom<string | undefined>((get) => get(groupAtom).data?.id);

export const groupLinksAtom = atom<SocialLink[] | undefined>((get) => get(groupAtom).data?.links);

export const groupLogoAtom = atom<string | undefined>((get) => get(groupAtom).data?.logo ?? undefined);

export const groupLogoUrlAtom = atom<string | undefined>((get) => getImageUrl(get(groupAtom).data?.logo));

export const groupBannerAtom = atom<string | undefined>((get) => get(groupAtom).data?.banner ?? undefined);

export const groupBannerUrlAtom = atom<string | undefined>((get) => {
  const group = get(groupAtom).data;
  if (!group) return undefined;

  // If group has a custom banner, use it
  if (group.banner) return getImageUrl(group.banner);

  // If group is not actively managed (no admins), use default banner
  if (group.adminCount === 0) return '/images/default-group-banner.webp';

  // Otherwise, no banner
  return undefined;
});

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

// Note: isCurrentUserGroupMemberAtom has been removed.
// Group membership is now tracked via genealogy statements (member_of predicate).
// To check if user is a member, query the genealogy statements API.

// Legacy atoms for backward compatibility (deprecated - use the ones above)
export const isCurrentUserGroupAdminAtomLegacy = atom<boolean>(
  (get) => get(groupAdminIdsAtom)?.data?.includes(get(currentUserIdAtom) ?? '') ?? false
);

export const groupLocationsAtom = atomWithQuery<GroupLocation[]>((get) =>
  fetchGroupLocationsOptions(get(triggerGroupIdAtom))
);
