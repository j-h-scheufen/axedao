export * as group from './group';
export * as location from './location';
export * as profile from './profile';
export * as user from './user';

/**
 * Query keys for react-query
 * The keys are prefixed with the different categories (e.g. user, group, profile, location)
 * in order to be able to invalidate all queries for a specific entity category.
 */
export const QUERY_KEYS = {
  user: { getUser: 'user.getUser', getUserProfile: 'user.getUserProfile', searchUsers: 'users.search' },
  group: {
    getGroup: 'group.getGroup',
    getGroupProfile: 'group.getGroupProfile',
    getGroupMembers: 'group.getGroupMembers',
    getGroupAdmins: 'group.getGroupAdmins',
    searchGroups: 'groups.search',
  },
  profile: {
    getProfile: 'profile.getProfile',
  },
  location: {
    getCountries: 'location.getCountries',
    getCities: 'location.getCities',
  },
} as const;

export type GroupAndUserParams = { groupId: string; userId: string };
