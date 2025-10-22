import type { EventType, ImageType } from '@/types/model';
import type { ResizeOptions } from 'sharp';

export const titles = [
  'mestra',
  'mestre',
  'contra-mestra',
  'contra-mestre',
  'mestranda',
  'mestrando',
  'professora',
  'professor',
  'instrutora',
  'instrutor',
  'monitora',
  'monitor',
  'aluna',
  'aluno',
  'iniciante',
] as const;

// used to sort titles in the UI
export const TitleEnum = titles.reduce<Record<string, number>>((acc, title, index) => {
  acc[title] = index;
  return acc;
}, {});

export const styles = ['angola', 'regional', 'contemporânea'] as const;

export const linkTypes = ['twitter', 'facebook', 'instagram', 'linkedin'] as const;

export const eventTypes = ['general', 'workshop', 'batizado', 'public_roda'] as const;

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
  signup: '/auth/signup',
  verifyEmail: '/auth/verify-email',
  forgotPassword: '/auth/forgot-password',
  resetPassword: '/auth/reset-password',
  search: '/search',
  profile: '/profile',
  admin: '/admin',
  axe: '/axe',
  dao: '/dao',
  users: '/users',
  groups: '/groups',
  events: '/events',
  settings: '/settings',
};

// Note: The order of these roles in the array is used to sort group members by role in the UI
export const GROUP_ROLES = ['founder', 'leader', 'admin', 'member'] as const;

export const QUERY_DEFAULT_PAGE_SIZE = 25;

export const QueryConfig = {
  staleTimeDefault: 1000 * 60 * 15, // 15 minutes
  staleTimeGroup: 1000 * 60 * 60 * 24, // 24 hours
  staleTimeGroupMembers: 1000 * 60 * 60, // 1 hour
  staleTimeUser: 1000 * 60 * 60 * 24, // 24 hours
  staleTimeSync: 1000 * 60 * 10, // 10 minutes
};

export const GROUP_DESCRIPTION_MAX_LENGTH = 500;

export const SEARCH_INPUT_DEBOUNCE = 750;

// Search parameter keys for URL synchronization
export const SEARCH_PARAM_KEYS = {
  USER_QUERY: 'uq',
  GROUP_QUERY: 'gq',
  EVENT_QUERY: 'eq',
  VIEW: 'view',
} as const;

// Type for search parameter keys
export type SearchParamKey = keyof typeof SEARCH_PARAM_KEYS;

// Individual exports for backward compatibility
export const PARAM_KEY_USER_QUERY = SEARCH_PARAM_KEYS.USER_QUERY;
export const PARAM_KEY_GROUP_QUERY = SEARCH_PARAM_KEYS.GROUP_QUERY;
export const PARAM_KEY_EVENT_QUERY = SEARCH_PARAM_KEYS.EVENT_QUERY;
export const PARAM_KEY_VIEW = SEARCH_PARAM_KEYS.VIEW;

export const IMAGE_TYPES = ['userAvatar', 'groupLogo', 'groupBanner', 'eventImage'] as const;

export const FILE_PREFIXES: Record<ImageType, string> = {
  userAvatar: 'user-avatar',
  groupLogo: 'group-logo',
  groupBanner: 'group-banner',
  eventImage: 'event-image',
};

export type ImageProcessingInstructions = {
  lossless?: boolean;
  resizeOptions: ResizeOptions | { portrait: ResizeOptions; landscape: ResizeOptions };
};

export const IMAGE_FORMATS: Record<ImageType, ImageProcessingInstructions> = {
  userAvatar: { lossless: true, resizeOptions: { width: 300, height: 300 } },
  groupLogo: { lossless: true, resizeOptions: { width: 200, height: 200 } },
  groupBanner: { resizeOptions: { height: 250, width: 800, fit: 'cover', position: 'attention' } },
  eventImage: {
    resizeOptions: {
      portrait: { width: 900, withoutEnlargement: true },
      landscape: { width: 1200, withoutEnlargement: true },
    },
  },
};

export const MAX_IMAGE_UPLOAD_SIZE_MB = 4.5; // 4.5 MB is the current limit for Vercel serverless functions! https://vercel.com/docs/concepts/limits/overview#serverless-function-payload-size-limit

export const EVENT_ICONS: Record<EventType, string> = {
  general: '/images/events/event-black-64.png',
  workshop: '/images/events/workshop-black-64.png',
  batizado: '/images/events/batizado-black-64.png',
  public_roda: '/images/events/roda-black-64.png',
};
