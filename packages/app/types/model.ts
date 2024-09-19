import { GROUP_ROLES } from '@/config/constants';
import { SelectGroup, SelectLink, SelectUser } from '../db/schema';

/**
 * This file defines app-level types that are wrapping the DB schema types in order to create a layer of separation
 */

export type Group = SelectGroup;

export type User = SelectUser;

export type Link = SelectLink;

export type UserProfile = { user: User; links: Link[]; group: Group | null };

export type GroupProfile = {
  group: Group;
  links: Array<Link>;
  adminIds: Array<string>;
};

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
export type UserSearchParams = {
  offset: number;
  pageSize?: number;
  searchTerm?: string;
};
export type UserSearchResult = {
  data: User[];
  nextOffset: number | null;
};
