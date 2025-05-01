import type { UseMutationResult } from '@tanstack/react-query';
import type { Address, PublicClient } from 'viem';

import type { Group, User } from '@/types/model';
export * as profile from './currentUser';
export * as group from './group';
export * as location from './location';
export * as user from './user';

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
    searchGroups: 'groups.search',
  },
  currentUser: {
    getUser: 'currentUser.getUser',
  },
  location: {
    getCountries: 'location.getCountries',
    getCities: 'location.getCities',
  },
  membership: {
    getCandidateChanges: 'getCandidateChanges',
    getCandidates: 'getCandidates',
    getTopCandidates: 'getTopCandidates',
  },
} as const;

export type SearchParams = {
  pageSize?: number;
  offset?: number;
};
export type GroupAndUserParams = { groupId: string; userId: string };
export type SearchByAddressParams = { addresses: string[] };
export type FileUploadParams = { ownerId: string; file?: File };
export type GetCandidatesParams = { addresses: Address[]; publicClient?: PublicClient };

export type FileUploadMutationFn = (params: FileUploadParams) => void;
export type UseFileUploadMutation = () => UseMutationResult<
  User | Group | unknown,
  Error,
  FileUploadParams,
  unknown
>;
