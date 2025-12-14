import { QueryClient } from '@tanstack/react-query';
import { AxiosError } from 'axios';

import { QueryConfig } from '@/config/constants';
import ENV from '@/config/environment';
import type { User } from '@/types/model';
import type { SelectUser } from '@/db/schema';
import { CID } from 'multiformats/cid';

/**
 * Applies privacy settings to user object(s) by setting email to null if hideEmail is true.
 * This implements server-side privacy protection to prevent email addresses from being
 * transmitted to the client when users have opted out.
 *
 * @param user - Single user or array of users to filter
 * @returns User object(s) with email set to null if hideEmail is true
 */
export function applyUserPrivacyFilter<T extends SelectUser>(user: T): T;
export function applyUserPrivacyFilter<T extends SelectUser>(users: T[]): T[];
export function applyUserPrivacyFilter<T extends SelectUser>(input: T | T[]): T | T[] {
  const filterUser = (user: T): T => ({
    ...user,
    email: user.hideEmail ? null : user.email,
  });

  return Array.isArray(input) ? input.map(filterUser) : filterUser(input);
}

export const generateErrorMessage = (error: unknown, defaultMessage: string) => {
  let message = defaultMessage;
  const isAxiosError = error instanceof AxiosError;
  if (isAxiosError && error.response?.data?.error && error.response?.data?.message) {
    message = error.response?.data?.message;
  } else if (error instanceof Error && typeof error?.message === 'string') {
    message = error.message;
  }

  return message;
};

export const removeTrailingSlash = (val: string) => (val.endsWith('/') ? val.substring(0, val.length - 1) : val);

export const isUUID = (str: string) => {
  const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
  return uuidRegex.test(str);
};

/**
 * Extracts the hostname out of a URL
 * @param url
 * @returns the SLD, domain without the www. prefix and TLD. Example: www.facebook.com -> facebook
 * @throws MalformedUrlError
 */
export const getHostname = (url: string): string | undefined => {
  try {
    // Add a protocol if missing
    if (url.indexOf('//:') === -1) {
      url = `https://${url}` as string;
    }
    const host = new URL(url).hostname;
    const domain = host.replace('www.', '');
    return domain.split('.')[0];
  } catch (_error) {}
  return undefined;
};

/**
 * Returns the display name for a user based on available profile information.
 * Priority order:
 * 1. If both nickname and name exist: "Nickname (Name)"
 * 2. If only nickname exists: "Nickname"
 * 3. If only name exists: "Name"
 * 4. Fallback to email address
 * @param user - The user object
 * @returns The formatted display name
 */
export const getUserDisplayName = (user?: User): string => {
  if (!user) return '';

  // Both nickname and name exist
  if (user.nickname && user.name) {
    return `${user.nickname} (${user.name})`;
  }

  // Only nickname exists
  if (user.nickname) {
    return user.nickname;
  }

  // Only name exists
  if (user.name) {
    return user.name;
  }

  // Fallback to email (only if not hidden)
  if (user.email && !user.hideEmail) {
    return user.email;
  }

  // Final fallback if email is hidden
  return 'Anonymous';
};

export const abbreviateAddress = (input: string): string => {
  return input.replace(/^(.{4}).*(.{4})$/, '$1...$2');
};

export const getImageUrl = (cid: string | null | undefined): string | undefined =>
  cid ? `${ENV.pinataGatewayUrl}/ipfs/${cid}` : undefined;

/**
 * Use this function instead of 'new QueryClient()' to create a QueryClient with
 * the same default options across the app.
 */
export const createDefaultQueryClient = (staleTime?: number) => {
  return new QueryClient({
    defaultOptions: {
      queries: {
        staleTime: staleTime ?? QueryConfig.staleTimeDefault,
      },
    },
  });
};

export const isValidIPFSHash = (hash: string): boolean => {
  try {
    CID.parse(hash);
    return true;
  } catch (_error) {
    return false;
  }
};

const flagCache: Record<string, string> = {};

export function getFlagEmoji(countryCode: string): string {
  const code = countryCode.toUpperCase();
  if (flagCache[code]) return flagCache[code];
  if (!/^[A-Z]{2}$/.test(code)) return '';
  const flag = String.fromCodePoint(...[...code].map((c) => 0x1f1e6 + c.charCodeAt(0) - 65));
  flagCache[code] = flag;
  return flag;
}

/**
 * Returns the CSS class for event type badge styling
 * @param eventType the event type string
 * @returns CSS class string for the badge
 */
export const getEventTypeColor = (eventType: string): string => {
  switch (eventType) {
    case 'workshop':
      return 'bg-blue-100 text-blue-800';
    case 'batizado':
      return 'bg-green-100 text-green-800';
    case 'public_roda':
      return 'bg-purple-100 text-purple-800';
    default:
      return 'bg-gray-100 text-gray-800';
  }
};

/**
 * Returns the display label for event type
 * @param eventType the event type string
 * @returns human-readable label for the event type
 */
export const getEventTypeLabel = (eventType: string): string => {
  switch (eventType) {
    case 'workshop':
      return 'Workshop';
    case 'batizado':
      return 'Batizado';
    case 'public_roda':
      return 'Public Roda';
    default:
      return 'General';
  }
};

export { formatCountryChipLabel } from './country';
