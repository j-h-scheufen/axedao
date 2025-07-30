import type { UseMutationResult } from '@tanstack/react-query';
import type { Address, PublicClient } from 'viem';

import type { Group, User } from '@/types/model';
export * as profile from './currentUser';
export * as group from './group';
export * as user from './user';
export * as location from './location';
export * as event from './event';

/**
 * Query keys for react-query
 * The keys are prefixed with the different categories (e.g. user, group, profile, location)
 * in order to be able to invalidate all queries for a specific entity category, if needed.
 */
export const QUERY_KEYS = {
  global: {
    blockNumber: 'global.blockNumber',
  },
  user: {
    getUser: 'user.getUser',
    getUserProfile: 'user.getUserProfile',
    searchUsers: 'users.search',
    searchByAddresses: 'users.searchByAddress',
  },
  group: {
    getGroup: 'group.getGroup',
    getGroupMembers: 'group.getGroupMembers',
    getGroupAdmins: 'group.getGroupAdmins',
    getGroupLocations: 'group.getGroupLocations',
    searchGroups: 'groups.search',
  },
  location: {
    getLocations: 'location.getLocations',
  },
  event: {
    getEvent: 'event.getEvent',
    searchEvents: 'events.search',
  },
  currentUser: {
    getUser: 'currentUser.getUser',
  },
  membership: {
    getCandidateChanges: 'getCandidateChanges',
    getCandidates: 'getCandidates',
    getTopCandidates: 'getTopCandidates',
  },
  dao: {
    getProposals: 'dao.getProposals',
  },
} as const;

export type SearchParams = { pageSize?: number; offset?: number };
export type GroupAndLocationParams = { groupId: string; locationId: string };
export type GroupAndUserParams = { groupId: string; userId: string };
export type SearchByAddressParams = { addresses: string[] };
export type FileUploadParams = { ownerId: string; file?: File };
export type GetCandidatesParams = { addresses: Address[]; publicClient?: PublicClient };

export type FileUploadMutationFn = (params: FileUploadParams) => void;
export type UseFileUploadMutation = () => UseMutationResult<User | Group | unknown, Error, FileUploadParams, unknown>;
