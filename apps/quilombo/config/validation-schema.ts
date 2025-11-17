import { isValidIPFSHash } from '@/utils';
import { array, boolean, type InferType, mixed, number, object, string, ref } from 'yup';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import {
  linkTypes,
  styles,
  titles,
  eventTypes,
  validFileExtensions,
  MAX_IMAGE_UPLOAD_SIZE_MB,
  invitationTypes,
} from './constants';

// ISO 8601 validation regex
const ISO_8601_REGEX = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d{3})?Z$/;

export const isValidISO8601 = (value: string): boolean => {
  if (!value) return false;
  return ISO_8601_REGEX.test(value) && !Number.isNaN(new Date(value).getTime());
};

export type Title = (typeof titles)[number];
export type LinkTypes = (typeof linkTypes)[number];
export type EventType = (typeof eventTypes)[number];
export type Link = InferType<typeof linkSchema>;
export type LinksCollection = InferType<typeof linksSchema>;

type ValidFileExtensionsType = keyof typeof validFileExtensions;
type ValidImageExtensionsType = (typeof validFileExtensions.image)[number];

export const isValidFileType = (fileName: string, fileType: ValidFileExtensionsType) => {
  return (
    !!fileName && validFileExtensions[fileType].indexOf(fileName.split('.').pop() as ValidImageExtensionsType) > -1
  );
};

export const isValidUrl = (url: string | undefined, validHostnames?: string[], regex?: RegExp): boolean => {
  if (!url) return false;
  let valid = false;
  try {
    const parsedUrl = new URL(url);
    valid = true;

    if (validHostnames?.length && !validHostnames.includes(parsedUrl.hostname)) {
      valid = false;
    }
    if (regex) {
      valid = regex.test(parsedUrl.pathname);
    }
    // biome-ignore lint/correctness/noUnusedVariables: Ignoring the error
  } catch (error) {
    valid = false;
  }
  return valid;
};

// const isValidFacebookProfileUrl = (url: string | undefined): boolean => {
//   const profilePathRegex = /^\/[a-zA-Z0-9.]+\/?$/;
//   const validHostnames = ['www.facebook.com', 'facebook.com', 'm.facebook.com', 'fb.com'];
//   return isValidUrl(url, validHostnames, profilePathRegex);
// };

// const isValidProfileInstagramUrl = (url: string | undefined): boolean => {
//   const validHostnames = ['www.instagram.com', 'instagram.com'];
//   const profilePathRegex = /^\/[a-zA-Z0-9._]+\/?$/;
//   return isValidUrl(url, validHostnames, profilePathRegex);
// };

// const isValidProfileTwitterUrl = (url: string | undefined): boolean => {
//   const validHostnames = ['www.twitter.com', 'twitter.com', 'www.x.com', 'x.com'];
//   const profilePathRegex = /^\/[a-zA-Z0-9_]+\/?$/;
//   return isValidUrl(url, validHostnames, profilePathRegex);
// };

export const megabytesToBytes = (mb: number) => 1024 * 1024 * mb; //3MB

export const linkSchema = object({
  url: string()
    .required()
    .test('is-valid-url', 'Enter a valid URL incl. https://', (value) => isValidUrl(value)),
  type: string().optional().oneOf(linkTypes),
});

export const linksSchema = array().of(linkSchema).default([]);

export const profileFormSchema = object({
  title: string().nullable().oneOf(titles, 'Not a valid title'),
  name: string().nullable(),
  nickname: string().nullable(),
  email: string().email('Not a valid email').optional(),
  phone: string().optional(),
  links: linksSchema,
});

export type ProfileForm = InferType<typeof profileFormSchema>;

export const imageUploadSchema = object({
  file: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: unknown) => {
      if (value === undefined) return true;
      if (value instanceof File) {
        return isValidFileType(value?.name?.toLowerCase(), 'image');
      }
      if (typeof value === 'string') {
        return isValidIPFSHash(value);
      }
      return false;
    })
    .test('is-valid-size', `Maximum image size allowed is ${MAX_IMAGE_UPLOAD_SIZE_MB}MB`, (value: unknown) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(MAX_IMAGE_UPLOAD_SIZE_MB);
      }
      return true;
    }),
});

export type ImageUploadForm = InferType<typeof imageUploadSchema>;

export const createNewGroupFormSchema = object({
  name: string().required('Group name is required'),
  verified: boolean().default(false),
});

export type CreateNewGroupForm = InferType<typeof createNewGroupFormSchema>;

export const joinGroupFormSchema = object({
  id: string().required('Please select a group'),
});

export type JoinGroupForm = InferType<typeof joinGroupFormSchema>;

export const axeTransferForm = object({
  amount: string()
    .required('Amount is required')
    .test('is-numeric', 'Amount must be a positive number greater zero', (value) => {
      return /^(?=.*[1-9])\d*(?:\.\d*)?$/.test(value || '');
    }),
  to: string()
    .required('Recipient is required')
    .test('is-address', 'Invalid address', (value) => testForAddress(value)),
});

export type AxeTransferForm = InferType<typeof axeTransferForm>;

export const updateGroupSchema = object({
  name: string().required('Group name is required'),
  founder: string().optional().nullable(),
  email: string().email().optional().nullable(),
  description: string().test('max-chars', 'Description cannot exceed 500 characters', (value: string | undefined) =>
    value ? value.length <= 500 : true
  ),
  style: string().nullable().oneOf(styles, 'Not a valid style'),
  links: linksSchema,
});

export type UpdateGroupForm = InferType<typeof updateGroupSchema>;

export const searchParamsSchema = object({
  offset: number().optional(),
  pageSize: number().optional(),
  searchTerm: string().optional(),
});

export type SearchParams = InferType<typeof searchParamsSchema>;

// ========================================
// UNIFIED SEARCH FILTERS ARCHITECTURE
// ========================================

/**
 * Base filters shared across all entity searches
 */
export const baseSearchFiltersSchema = object({
  countryCodes: array().of(string().length(2, 'Country code must be 2 characters')).optional(),
});

export type BaseSearchFilters = InferType<typeof baseSearchFiltersSchema>;

/**
 * Group-specific search filters
 */
export const groupFiltersSchema = baseSearchFiltersSchema.concat(
  object({
    verified: boolean().optional(),
    styles: array().of(string().oneOf(styles, 'Invalid style')).optional(),
  })
);

export type GroupFilters = InferType<typeof groupFiltersSchema>;

/**
 * User-specific search filters
 */
export const userFiltersSchema = baseSearchFiltersSchema.concat(
  object({
    hasWallet: boolean().optional(),
    titles: array().of(string().oneOf(titles, 'Invalid title')).optional(),
  })
);

export type UserFilters = InferType<typeof userFiltersSchema>;

/**
 * Event-specific search filters
 */
export const eventFiltersSchema = baseSearchFiltersSchema.concat(
  object({
    eventTypes: array().of(string().oneOf(eventTypes, 'Invalid event type')).optional(),
    startDate: string()
      .optional()
      .test('is-valid-date', 'Invalid start date', (value) => {
        if (!value) return true;
        return isValidISO8601(value);
      }),
    endDate: string()
      .optional()
      .test('is-valid-date', 'Invalid end date', (value) => {
        if (!value) return true;
        return isValidISO8601(value);
      }),
  })
);

export type EventFilters = InferType<typeof eventFiltersSchema>;

/**
 * Unified search params with filters for groups
 */
export const groupSearchParamsSchema = object({
  offset: number().optional(),
  pageSize: number().optional(),
  searchTerm: string().optional(),
  filters: groupFiltersSchema.optional(),
});

export type GroupSearchParamsWithFilters = InferType<typeof groupSearchParamsSchema>;

/**
 * Unified search params with filters for users
 */
export const userSearchParamsSchema = object({
  offset: number().optional(),
  pageSize: number().optional(),
  searchTerm: string().optional(),
  filters: userFiltersSchema.optional(),
});

export type UserSearchParamsWithFilters = InferType<typeof userSearchParamsSchema>;

/**
 * Unified search params with filters for events
 */
export const eventSearchParamsSchema = object({
  offset: number().optional(),
  pageSize: number().optional(),
  searchTerm: string().optional(),
  filters: eventFiltersSchema.optional(),
});

export type EventSearchParamsWithFilters = InferType<typeof eventSearchParamsSchema>;

// Type aliases for backward compatibility with existing code
export type UserSearchParams = UserSearchParamsWithFilters;
export type GroupSearchParams = GroupSearchParamsWithFilters;

export const membershipDelegateSchema = object({
  candidate: string()
    .required('Please select a candidate')
    .test('is-address', 'Invalid address', (value) => testForAddress(value)),
});

export type MembershipDelegateForm = InferType<typeof membershipDelegateSchema>;

export const testForAddress = (value: string) => {
  // basic address validation, not checksummed
  return /^(0x)?[0-9a-f]{40}$/i.test(value || '');
};

// Reusable password validation field (for required passwords)
const passwordValidationRules = () =>
  string()
    .min(12, 'Password must be at least 12 characters')
    .matches(/[A-Z]/, 'Password must contain at least one uppercase letter')
    .matches(/[a-z]/, 'Password must contain at least one lowercase letter')
    .matches(/[0-9]/, 'Password must contain at least one number')
    .matches(/[!@#$%^&*(),.?":{}|<>]/, 'Password must contain at least one special character');

// Helper for required password field
export const passwordField = (label = 'Password') => passwordValidationRules().required(`${label} is required`);

// Helper for new password field with confirmation
export const newPasswordWithConfirmation = () => ({
  newPassword: passwordField('New password'),
  confirmPassword: string()
    .required('Please confirm your new password')
    .oneOf([ref('newPassword')], 'Passwords must match'),
});

// Reusable Ethereum address validation field
export const ethereumAddressField = () =>
  string()
    .required('Wallet address is required')
    .test('is-address', 'Invalid Ethereum address', (value) => testForAddress(value || ''));

// Group Location validation schemas
export const createLocationFormSchema = object({
  name: string().required('Location name is required'),
  description: string().optional(),
  feature: mixed<Feature<Geometry, GeoJsonProperties>>().required('Please select a location from the map'),
});

export type CreateLocationForm = InferType<typeof createLocationFormSchema>;

export const updateLocationFormSchema = createLocationFormSchema.partial();

export type UpdateLocationForm = InferType<typeof updateLocationFormSchema>;

export const createEventFormSchema = object({
  name: string().required('Event name is required'),
  description: string().optional(),
  start: string()
    .required('Start date is required')
    .test('is-valid-date', 'Invalid start date', (value) => isValidISO8601(value)),
  end: string()
    .optional()
    .test('is-valid-date', 'Invalid end date', (value) => {
      if (!value) return true;
      return isValidISO8601(value);
    })
    .test('is-after-start', 'End date must be after start date', function (value) {
      const { start } = this.parent;
      if (!start || !value) return true;
      return new Date(value) > new Date(start);
    }),
  isAllDay: boolean().required('All day status is required'),
  feature: mixed<Feature<Geometry, GeoJsonProperties>>()
    .nullable()
    .test('location-required', 'Location is required', (value) => {
      return value !== undefined && value !== null;
    }),
  type: string().required('Event type is required').oneOf(eventTypes, 'Invalid event type'),
  url: string()
    .optional()
    .test('is-valid-url', 'Enter a valid URL incl. https://', (value) => {
      if (!value) return true; // Allow empty URLs since field is optional
      return isValidUrl(value);
    }),
  image: string().optional(),
  imageChanged: boolean().optional(),
  countryCode: string().length(2, 'Country code must be 2 characters').optional(),
  associatedGroups: array().of(string().uuid('Invalid group ID')).default([]),
  associatedUsers: array().of(string().uuid('Invalid user ID')).default([]),
});

export const updateEventFormSchema = createEventFormSchema.partial();

export type CreateEventForm = InferType<typeof createEventFormSchema>;
export type UpdateEventForm = InferType<typeof updateEventFormSchema>;

// Invitation validation schemas
export const invitationSchema = object({
  type: string().oneOf(invitationTypes, 'Invalid invitation type').required('Invitation type is required'),
  invitedEmail: string()
    .email('Invalid email address')
    .lowercase()
    .trim()
    .when('type', ([type], schema) => {
      return type === 'email_bound'
        ? schema.required('Email is required for email-bound invitations')
        : schema.optional();
    }),
  sendEmail: boolean().optional(), // Only for email_bound
});

export const validateInvitationSchema = object({
  code: string().uuid('Invalid invitation code').required('Invitation code is required'),
  email: string().email('Invalid email address').lowercase().trim().optional(), // Optional - only validated for email_bound
});

export type InvitationForm = InferType<typeof invitationSchema>;
export type ValidateInvitationForm = InferType<typeof validateInvitationSchema>;

// Authentication validation schemas
export const signupSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
  password: passwordField(),
  // TODO: TEMPORARY - Will be required for invite-only mode once UI is implemented
  invitationCode: string().uuid('Invalid invitation code').optional(),
});

export const loginSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
  password: string().required('Password is required'),
});

export const forgotPasswordSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
});

export const resetPasswordSchema = object({
  token: string().required('Token is required'),
  newPassword: passwordField('New password'),
});

export const resetPasswordFormSchema = object(newPasswordWithConfirmation());

export const walletSignupEmailSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
});

export const changePasswordSchema = object({
  currentPassword: string().required('Current password is required'),
  ...newPasswordWithConfirmation(),
}).shape({
  newPassword: passwordField('New password').test(
    'passwords-different',
    'New password must be different from current password',
    function (value) {
      return value !== this.parent.currentPassword;
    }
  ),
});

export const setPasswordSchema = object({
  currentPassword: string().optional(),
  ...newPasswordWithConfirmation(),
});

export const linkWalletSchema = object({
  walletAddress: ethereumAddressField(),
});

// Authentication method types
export const authMethods = ['password', 'google', 'wallet'] as const;
export type AuthMethod = (typeof authMethods)[number];

export const removeMethodSchema = object({
  method: string().required('Method is required').oneOf(authMethods, 'Invalid auth method'),
});

export type SignupForm = InferType<typeof signupSchema>;
export type LoginForm = InferType<typeof loginSchema>;
export type ForgotPasswordForm = InferType<typeof forgotPasswordSchema>;
export type ResetPasswordForm = InferType<typeof resetPasswordSchema>;
export type ResetPasswordFormValues = InferType<typeof resetPasswordFormSchema>;
export type WalletSignupEmailForm = InferType<typeof walletSignupEmailSchema>;
export type ChangePasswordForm = InferType<typeof changePasswordSchema>;
export type SetPasswordForm = InferType<typeof setPasswordSchema>;
export type LinkWalletForm = InferType<typeof linkWalletSchema>;
export type RemoveMethodForm = InferType<typeof removeMethodSchema>;

// Group Claiming & Verification validation schemas
export const claimGroupFormSchema = object({
  userMessage: string()
    .required('Please explain why you should be the admin of this group')
    .min(20, 'Message must be at least 20 characters'),
});

export const verifyGroupFormSchema = object({
  notes: string().optional(),
});

export type ClaimGroupForm = InferType<typeof claimGroupFormSchema>;
export type VerifyGroupForm = InferType<typeof verifyGroupFormSchema>;
