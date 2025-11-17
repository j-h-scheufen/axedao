import type { UseMutationResult } from '@tanstack/react-query';
import type { Address, PublicClient } from 'viem';

import type { Group, User } from '@/types/model';

// Re-export QUERY_KEYS from its own file to avoid circular dependencies
export { QUERY_KEYS } from './keys';

export * as profile from './currentUser';
export * as group from './group';
export * as user from './user';
export * as location from './location';
export * as event from './event';
export * as admin from './admin';
export * as invitation from './invitation';
export * as auth from './auth';

export type SearchParams = { pageSize?: number; offset?: number };
export type GroupAndLocationParams = { groupId: string; locationId: string };
export type GroupAndUserParams = { groupId: string; userId: string };
export type SearchByAddressParams = { addresses: string[] };
export type FileUploadParams = { ownerId: string; file?: File };
export type GetCandidatesParams = { addresses: Address[]; publicClient?: PublicClient };

export type FileUploadMutationFn = (params: FileUploadParams) => void;
export type UseFileUploadMutation = () => UseMutationResult<User | Group | unknown, Error, FileUploadParams, unknown>;
