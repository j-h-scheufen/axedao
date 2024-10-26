import { QueryClient } from '@tanstack/react-query';
import { AxiosError } from 'axios';

import { QueryConfig } from '@/config/constants';
import ENV from '@/config/environment';
import { GroupMemberRole, User } from '@/types/model';
import { CID } from 'multiformats/cid';

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

/**
 * Returns an array of roles for a user in a group by comparing the user id with the various
 * fields in the group.
 * Note: The 'member' role not returned, because it is implied that the user is a member of the group.
 * @param userId
 * @param founder
 * @param leader
 * @param adminIds
 * @returns
 */
export const getGroupMemberRoles = (
  userId: string,
  founder?: string | null,
  leader?: string | null,
  adminIds?: string[],
): GroupMemberRole[] => {
  const roles: GroupMemberRole[] = [];
  if (userId === founder) {
    roles.push('founder');
  }
  if (userId === leader) {
    roles.push('leader');
  }
  if (adminIds?.includes(userId)) {
    roles.push('admin');
  }
  // roles.push('member');
  return roles;
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
      url = `https://${url}`;
    }
    const host = new URL(url).hostname;
    const domain = host.replace('www.', '');
    return domain.split('.')[0];
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
  } catch (error) {}
  return undefined;
};

export const getUserDisplayName = (user?: User): string => {
  if (!user) return '';
  let displayName = '';
  if (user.nickname) {
    displayName = user.nickname;
  } else if (user.name) {
    displayName = user.name;
  }
  return displayName || `User (${abbreviateAddress(user.walletAddress)})`;
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
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
  } catch (error) {
    return false;
  }
};
