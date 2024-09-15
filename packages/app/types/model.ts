import { SelectGroup, SelectLink, SelectUser } from '../db/schema';

/**
 * This file defines app-level types that are wrapping the DB schema types in order to create a layer of separation
 */

export type Group = SelectGroup;

export type User = SelectUser;

export type Link = SelectLink;

export type GroupProfile = SelectGroup & {
  links: Array<Link>;
  admins: Array<User>;
};

export type UserSession = {
  id: string;
  walletAddress: string;
  isGlobalAdmin: boolean;
};

export type Profile = { user: User; links: Link[]; group: Group | null };

export type Country = { name: string; isoCode: string };

export type City = {
  name: string;
  stateCode?: string;
};
