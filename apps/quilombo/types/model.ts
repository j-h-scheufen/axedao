import type { GROUP_ROLES, IMAGE_TYPES } from '@/config/constants';
import type { SelectGroup, SelectUser } from '../db/schema';

/**
 * This file defines API and app-level types that are wrapping the DB schema types in order to create a layer of separation
 * TODO: The app is missing a central types.d.ts definition.
 */

export type Group = Omit<SelectGroup, 'updatedAt'> & { countryName: string };

export type User = Omit<SelectUser, 'updatedAt'>;

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

export type ImageType = (typeof IMAGE_TYPES)[number];

export type UserSearchResult = {
  data: User[];
  totalCount: number;
  nextOffset: number | null;
};

export type GroupSearchResult = {
  data: Group[];
  totalCount: number;
  nextOffset: number | null;
};

export type SearchCitiesParams = { countryCode: string; searchTerm?: string };

export type Breadcrumb = {
  pathname: string;
  queryParams: string;
};
