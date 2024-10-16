import { LinkType } from '@/db/schema';

export const titles = [
  'mestre',
  'mestra',
  'contra-mestre',
  'contra-mestra',
  'mestrando',
  'mestranda',
  'professor',
  'professora',
  'instrutor',
  'instrutora',
  'monitor',
  'monitora',
  'aluno',
  'aluna',
  'iniciante',
] as const;

export const linkTypes = ['twitter', 'facebook', 'instagram', 'linkedin'] as const;

export const validFileExtensions = { image: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'webp'] } as const;

export const linkBaseUrls = [
  {
    type: 'twitter',
    baseUrls: ['twitter.com', 'twitter.co', 'x.com', 'twitterinc.com'],
  },
  {
    type: 'facebook',
    baseUrls: ['facebook.com', 'facebook.co', 'facebook.net', 'fb.com', 'fb.me'],
  },
  {
    type: 'instagram',
    baseUrls: ['instagram.com', 'ig.me'],
  },
  {
    type: 'linkedin',
    baseUrls: ['linkedin.com', 'linkedin.cn'],
  },
];

export const PATHS = {
  login: '/auth/login',
  search: '/search',
  profile: '/profile',
  admin: '/admin',
  axe: '/axe',
  dao: '/dao',
  users: '/search/users',
  groups: '/search/groups',
};

export type IconDictionary = Record<LinkType, JSX.Element>; // TODO not used

// Note: The order of these roles in the array is used to sort group members by role in the UI
export const GROUP_ROLES = ['founder', 'leader', 'admin', 'member'] as const;

export const QUERY_DEFAULT_PAGE_SIZE = 25;

export const QueryConfig = {
  staleTimeDefault: 1000 * 60 * 15, // 15 minutes
  staleTimeGroup: 1000 * 60 * 60 * 24, // 24 hours
  staleTimeGroupMembers: 1000 * 60 * 60, // 1 hour
  staleTimeUser: 1000 * 60 * 60 * 24, // 24 hours
};

export const GROUP_DESCRIPTION_MAX_LENGTH = 500;
