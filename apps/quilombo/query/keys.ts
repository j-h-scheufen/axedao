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
    getGroupLocations: 'group.getGroupLocations',
    searchGroups: 'groups.search',
    getAvailableCountries: 'groups.getAvailableCountries',
  },
  location: {
    getLocations: 'location.getLocations',
  },
  event: {
    getEvent: 'event.getEvent',
    searchEvents: 'events.search',
    getEventLocations: 'event.getEventLocations',
    getAvailableCountries: 'events.getAvailableCountries',
  },
  currentUser: {
    getUser: 'currentUser.getUser',
    getAuthMethods: 'currentUser.getAuthMethods',
  },
  membership: {
    getCandidateChanges: 'getCandidateChanges',
    getCandidates: 'getCandidates',
    getTopCandidates: 'getTopCandidates',
  },
  dao: {
    getProposals: 'dao.getProposals',
  },
  admin: {
    getClaims: 'admin.getClaims',
  },
  invitation: {
    getInvitations: 'invitation.getInvitations',
  },
} as const;
