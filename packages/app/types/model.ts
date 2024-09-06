import { SelectGroup, SelectLink, SelectUser } from '../db/schema';

/**
 * This file defines app-level types that are wrapping the DB schema types in order to create a layer of separation
 */

export type Group = SelectGroup;

export type User = SelectUser;

export type Link = SelectLink;

export type GroupProfile = SelectGroup & {
  links?: Array<SelectLink>;
  admins?: Array<
    SelectUser & {
      links: Array<SelectLink>;
    }
  >;
};

// TODO, used in the JWT session and should only contain minimal user data and the full object should live in the profile.store.ts
export type UserSession = {
  email: string;
  name: string | null;
  avatar: string | null;
  id: string;
  isGlobalAdmin: boolean;
  walletAddress: string;
};

export type Profile = User & { links: Link[]; group: Group | null };

export type Country = { name: string; isoCode: string };

export type City = {
  name: string;
  stateCode?: string;
};
