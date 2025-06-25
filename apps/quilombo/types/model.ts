import type { GROUP_ROLES, IMAGE_TYPES } from '@/config/constants';
import type { SelectGroup, SelectUser, SelectGroupLocation } from '../db/schema';

/**
 * This file defines API and app-level types that are wrapping the DB schema types in order to create a layer of separation
 * TODO: The app is missing a central types.d.ts definition.
 */

export type Group = Omit<SelectGroup, 'updatedAt'> & { countryCodes: string[] };

export type User = Omit<SelectUser, 'updatedAt'>;

export type GroupLocation = Omit<SelectGroupLocation, 'updatedAt'>;

export type UserSession = {
  id: string;
  walletAddress: string;
  isGlobalAdmin: boolean;
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
