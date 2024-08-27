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
