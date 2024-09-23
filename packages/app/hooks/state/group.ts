import { atom } from 'jotai';

import { SocialLink } from '@/db/schema';
import { Group, GroupProfile, User } from '@/types/model';
import { isUUID } from '@/utils';
import { currentUserGroupAtom, currentUserIdAtom } from './currentUser';

export const groupProfileAtom = atom<GroupProfile | undefined>();

export const groupIdAtom = atom<string | undefined>((get) => get(groupProfileAtom)?.group.id);

export const groupAtom = atom<Group | undefined>((get) => get(groupProfileAtom)?.group);

export const groupLinksAtom = atom<SocialLink[] | undefined>((get) => get(groupProfileAtom)?.group.links);

export const groupFounderAtom = atom<string | null | undefined>((get) => get(groupProfileAtom)?.group.founder);

export const groupLeaderAtom = atom<string | null | undefined>((get) => get(groupProfileAtom)?.group.leader);

export const groupBannerAtom = atom<string | null | undefined>((get) => get(groupProfileAtom)?.group.banner);

export const groupAdminIdsAtom = atom<string[]>((get) => get(groupProfileAtom)?.adminIds ?? []);

export const isCurrentUserGroupAdminAtom = atom<boolean>(
  (get) => get(groupProfileAtom)?.adminIds.includes(get(currentUserIdAtom) ?? '') ?? false,
);

export const isCurrentUserGroupMemberAtom = atom<boolean>((get) => get(groupIdAtom) === get(currentUserGroupAtom)?.id);

export const isFounderUuidAtom = atom<boolean>((get) => isUUID(get(groupProfileAtom)?.group.founder ?? ''));

export const groupMembersAtom = atom<User[] | undefined>();
