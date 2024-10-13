import { isValidIPFSHash } from '@/utils';
import { InferType, array, boolean, mixed, number, object, string } from 'yup';
import { linkTypes, titles, validFileExtensions } from './constants';

export type Title = (typeof titles)[number];
export type LinkTypes = (typeof linkTypes)[number];
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
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
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
  avatar: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: unknown) => {
      if (value === undefined) return true; // avatar is optional
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      } else if (typeof value === 'string') {
        return isValidIPFSHash(value);
      }
      return false;
    })
    .test('is-valid-size', 'Maximum image size allowed is 3MB', (value: unknown) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(3);
      }
      return true;
    }),
  title: string().nullable().oneOf(titles, 'Not a valid title'),
  name: string().nullable(),
  nickname: string().nullable(),
  email: string().email('Not a valid email').optional(),
  phone: string().optional(),
  links: linksSchema,
});

export type ProfileForm = InferType<typeof profileFormSchema>;

export const createNewGroupFormSchema = object({
  name: string().required('Group name is required'),
  verified: boolean().default(false),
  city: string(),
  country: string().required('Country is required'),
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
    .test('is-address', 'Invalid address', (value) => {
      // basic address validation, not checksummed
      return /^(0x)?[0-9a-f]{40}$/i.test(value || '');
    }),
});

export type AxeTransferForm = InferType<typeof axeTransferForm>;

/***************************
 * Schemas for API routes and forms
 ***************************/
export const updateGroupSchema = object({
  name: string().required('Group name is required'),
  founder: string().optional().nullable(),
  email: string().email().optional().nullable(),
  description: string().test('max-chars', 'Description cannot exceed 500 characters', (value: string | undefined) =>
    value ? value.length <= 500 : true,
  ),
  logo: mixed()
    .test('is-valid-type', 'Not a valid image type', (value) => {
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return true;
    })
    .test('is-valid-size', 'Max image size allowed is 3MB', (value) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(3);
      }
      return true;
    }),
  banner: mixed()
    .test('is-valid-type', 'Not a valid image type', (value) => {
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return true;
    })
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .test('is-valid-size', 'Max image size allowed is 5MB', (value: any) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(5);
      }
      return true;
    }),
  links: linksSchema,
});

export type UpdateGroupForm = InferType<typeof updateGroupSchema>;

export const searchParamsSchema = object({
  offset: number().optional(),
  pageSize: number().optional(),
  searchTerm: string().optional(),
});

export type SearchParams = InferType<typeof searchParamsSchema>;

export const groupSearchSchema = searchParamsSchema.concat(
  object({
    city: string().optional(),
    country: string().optional(),
    verified: boolean().optional(),
  }),
);

export type GroupSearchParams = InferType<typeof groupSearchSchema>;
