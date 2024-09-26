import { GROUP_ROLES } from '@/config/constants';
import { SelectGroup, SelectUser } from '../db/schema';

/**
 * This file defines API and app-level types that are wrapping the DB schema types in order to create a layer of separation
 */

export type Group = Omit<SelectGroup, 'updatedAt'>;

export type User = Omit<SelectUser, 'updatedAt'>;

export type UserProfile = { user: User; group: Group | null };

export type UserSession = {
  id: string;
  walletAddress: string;
  isGlobalAdmin: boolean;
};

export type Country = { name: string; isoCode: string };

export type City = {
  name: string;
  stateCode?: string;
};

export type GroupMemberRole = (typeof GROUP_ROLES)[number];

export type GroupMember = User & { roles: GroupMemberRole[] };

/**
 * Search types used in the search routes
 */
export type UserSearchResult = {
  data: User[];
  nextOffset: number | null;
};
export type GroupSearchResult = {
  data: Group[];
  nextOffset: number | null;
};

export type SearchCitiesParams = { countryCode: string; searchTerm?: string };
