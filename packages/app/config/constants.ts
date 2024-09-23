export const titles = [
  'mestre',
  'contra-mestre',
  'mestrando',
  'professor',
  'instrutor',
  'monitor',
  'aluno-graduado',
  'aluno',
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

// Note: The order of these roles in the array is used to sort group members by role in the UI
export const GROUP_ROLES = ['founder', 'leader', 'admin', 'member'] as const;

export const QUERY_DEFAULT_STALE_TIME_MINUTES = 30;
export const QUERY_DEFAULT_PAGE_SIZE = 20;
export const GROUP_DESCRIPTION_MAX_LENGTH = 500;
