import type { EventType, ImageType, AccountStatus, SearchParamKey } from '@/types/model';
import type { ResizeOptions } from 'sharp';

export const titles = [
  'mestra',
  'mestre',
  'contra-mestra',
  'contra-mestre',
  'mestranda',
  'mestrando',
  'treinel',
  'professora',
  'professor',
  'instrutora',
  'instrutor',
  'graduada',
  'graduado',
  'formada',
  'formado',
  'estagiaria',
  'estagiario',
  'estagianda',
  'estagiando',
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

export const styles = ['angola', 'regional', 'contemporanea', 'mixed'] as const;

export const linkTypes = ['website', 'twitter', 'facebook', 'instagram', 'linkedin'] as const;

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
  verifyEmailSuccess: '/auth/verify-email/success',
  verifyEmailExpired: '/auth/verify-email/expired',
  forgotPassword: '/auth/forgot-password',
  resetPassword: '/auth/reset-password',
  search: '/search',
  profile: '/profile',
  invites: '/invites',
  admin: '/admin',
  axe: '/axe',
  dao: '/dao',
  users: '/users',
  groups: '/groups',
  events: '/events',
  settings: '/settings',
  genealogy: '/genealogy',
};

// Authentication error codes
export const AUTH_ERRORS = {
  EMAIL_REQUIRED: 'EMAIL_REQUIRED',
  REGISTRATION_FAILED: 'REGISTRATION_FAILED',
  ACCOUNT_EXISTS: 'ACCOUNT_EXISTS',
  // TODO: TEMPORARY INVITE-ONLY - Invitation-related errors
  INVITATION_REQUIRED: 'INVITATION_REQUIRED',
  INVALID_INVITATION: 'INVALID_INVITATION',
  INVITATION_EMAIL_MISMATCH: 'INVITATION_EMAIL_MISMATCH',
  EMAIL_VERIFICATION_REQUIRED: 'EMAIL_VERIFICATION_REQUIRED',
} as const;

// Authentication cookie names
export const AUTH_COOKIES = {
  GOOGLE_LINKING: 'quilombo_google_linking',
  GOOGLE_LINKING_USER: 'quilombo_google_linking_user',
  PENDING_OAUTH_LINK: 'quilombo_pending_oauth_link',
  // TODO: TEMPORARY INVITE-ONLY - Cookie for OAuth/wallet invitation flow
  INVITATION_CODE: 'quilombo_invitation_code',
} as const;

// Account statuses for user accounts
export const accountStatuses = ['pending_verification', 'active', 'disabled'] as const;

// Invitation system constants
export const invitationTypes = ['email_bound', 'open'] as const;
export const invitationStatuses = ['pending', 'accepted', 'expired'] as const;

// Group claim statuses
export const groupClaimStatuses = ['pending', 'approved', 'rejected'] as const;

// Group claim types (genealogy_group = claiming existing genealogy profile, new_group = registering new group)
export const groupClaimTypes = ['genealogy_group', 'new_group'] as const;

// Person claim statuses (same as group claim statuses, but separate for semantic clarity)
export const personClaimStatuses = ['pending', 'approved', 'rejected'] as const;

// Reasons why a person profile may or may not be claimable (returned from getPersonProfileClaimStatus)
export const personClaimStatusReasons = ['not_found', 'deceased', 'already_claimed', 'claimable'] as const;

// ============================================================================
// GENEALOGY SCHEMA CONSTANTS
// ============================================================================

// Entity types for statements (who can be subjects/objects)
export const ENTITY_TYPE = {
  PERSON: 'person',
  GROUP: 'group',
} as const;

export const entityTypes = [ENTITY_TYPE.PERSON, ENTITY_TYPE.GROUP] as const;

// Date precision for historical data with uncertainty
export const datePrecisions = ['exact', 'month', 'year', 'decade', 'approximate', 'unknown'] as const;

// Confidence levels for statement verification (object as source of truth)
export const ConfidenceLevel = {
  VERIFIED: 'verified',
  LIKELY: 'likely',
  UNVERIFIED: 'unverified',
  DISPUTED: 'disputed',
  UNCERTAIN: 'uncertain',
} as const;

// Array for Drizzle schema (must be a const tuple for type inference)
export const confidenceLevels = [
  ConfidenceLevel.VERIFIED,
  ConfidenceLevel.LIKELY,
  ConfidenceLevel.UNVERIFIED,
  ConfidenceLevel.DISPUTED,
  ConfidenceLevel.UNCERTAIN,
] as const;

// Default confidence level for self-declared relationships
export const SELF_DECLARED_CONFIDENCE = ConfidenceLevel.LIKELY;

// Legal structure types for groups
export const legalStructures = [
  'for_profit',
  'non_profit',
  'nonprofit_501c3',
  'association_ev',
  'association_loi1901',
  'informal',
  'mixed',
] as const;

// Relationship predicates (19 total)
// Direction convention: predicates flow from "younger/newer" to "older/established"
// (student → mestre, child → parent, new group → predecessor)
//
// Person-to-Person: Training & Lineage (3)
// Person-to-Person: Recognition (2)
// Person-to-Person: Family (1)
// Person-to-Group: Founding & Leadership (4)
// Person-to-Group: Membership & Affiliation (5)
// Group-to-Group: Hierarchical (1)
// Group-to-Group: Evolution (3)
// Group-to-Group: Affiliation (2)
export const predicates = [
  // Person-to-Person: Training & Lineage (3)
  'student_of',
  'trained_under',
  'influenced_by',
  // Person-to-Person: Recognition (2)
  'received_title_from', // Person received title FROM mestre (consistent with subject-receives-from-object pattern)
  'baptized_by', // Person was baptized BY mestre (received apelido from)
  // Person-to-Person: Family (1)
  'family_of',
  // Person-to-Group: Founding & Leadership (4)
  'founded',
  'co_founded',
  'leads',
  'regional_coordinator_of',
  // Person-to-Group: Membership & Affiliation (5)
  'member_of',
  'teaches_at',
  'cultural_pioneer_of',
  'associated_with',
  'departed_from',
  // Group-to-Group: Hierarchical (1)
  'part_of',
  // Group-to-Group: Evolution (3)
  'split_from_group',
  'merged_into',
  'evolved_from',
  // Group-to-Group: Affiliation (2)
  'affiliated_with',
  'cooperates_with',
] as const;

// Note: The order of these roles in the array is used to sort group members by role in the UI
export const GROUP_ROLES = ['admin', 'member'] as const;

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
  userAvatar: { lossless: true, resizeOptions: { width: 300, height: 300, fit: 'inside' } },
  groupLogo: { lossless: true, resizeOptions: { width: 200, height: 200, fit: 'inside' } },
  groupBanner: { resizeOptions: { width: 800 } },
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

// Re-export types for backward compatibility (types are defined in @/types/model)
export type { AccountStatus, SearchParamKey };
