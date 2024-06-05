import { InferType, array, boolean, mixed, number, object, string } from 'yup';
import titles from './titles';

export const linkTypes = ['twitter', 'facebook', 'instagram', 'linkedin'] as const;
export type LinkType = (typeof linkTypes)[number];

export const validFileExtensions = { image: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'webp'] } as const;
type ValidFileExtensionsType = keyof typeof validFileExtensions;
type ValidImageExtensionsType = (typeof validFileExtensions.image)[number];

const isValidFileType = (fileName: string, fileType: ValidFileExtensionsType) => {
  return (
    !!fileName && validFileExtensions[fileType].indexOf(fileName.split('.').pop() as ValidImageExtensionsType) > -1
  );
};

const isValidUrl = (url: string | undefined, validHostnames?: string[], regex?: RegExp): boolean => {
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
  } catch (_) {
    valid = false;
  }
  return valid;
};

const isValidFacebookProfileUrl = (url: string | undefined): boolean => {
  const profilePathRegex = /^\/[a-zA-Z0-9.]+\/?$/;
  const validHostnames = ['www.facebook.com', 'facebook.com', 'm.facebook.com', 'fb.com'];
  return isValidUrl(url, validHostnames, profilePathRegex);
};

const isValidProfileInstagramUrl = (url: string | undefined): boolean => {
  const validHostnames = ['www.instagram.com', 'instagram.com'];
  const profilePathRegex = /^\/[a-zA-Z0-9._]+\/?$/;
  return isValidUrl(url, validHostnames, profilePathRegex);
};

const isValidProfileTwitterUrl = (url: string | undefined): boolean => {
  const validHostnames = ['www.twitter.com', 'twitter.com', 'www.x.com', 'x.com'];
  const profilePathRegex = /^\/[a-zA-Z0-9_]+\/?$/;
  return isValidUrl(url, validHostnames, profilePathRegex);
};

const megabytesToBytes = (mb: number) => 1024 * 1024 * mb; //3MB

const linksSchema = array()
  .of(
    object({
      id: number(),
      url: string().required(),
      type: mixed().oneOf(linkTypes).nullable(),
      ownerId: string().required(),
    }),
  )
  .default([]);

export const registrationFormSchema = object({
  email: string().email('Not a valid email').required('Email is required'),
});

export type RegistrationFormType = InferType<typeof registrationFormSchema>;

export const signInFormSchema = object({
  email: string().email('Not a valid email').required('Email is required'),
});

export type SignInFormType = InferType<typeof signInFormSchema>;

export const confirmationFormSchema = object({
  otp: string().required('Please input your OTP.'),
});

export type ConfirmationFormType = InferType<typeof confirmationFormSchema>;

export const profileFormSchema = object({
  image: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      return isValidFileType(value && value.name?.toLowerCase(), 'image');
    })
    .test('is-valid-size', 'Maximum image size allowed is 3MB', (value: any) => {
      if (!value) return true;
      return value.size <= megabytesToBytes(3);
    }),
  title: string().nullable().oneOf(titles, 'Not a valid title'),
  name: string().nullable(),
  nickname: string().nullable(),
  email: string().email('Not a valid email').required('Email is required'),
  phone: string(),
  links: linksSchema,
});

export type ProfileFormType = InferType<typeof profileFormSchema>;

export const joinGroupFormSchema = object({
  id: string().required('Please select a group'),
});

export type JoinGroupFormType = InferType<typeof joinGroupFormSchema>;

export const createNewGroupFormSchema = object({
  name: string().required('Group name is required'),
  // location: mixed(),
  verified: boolean().default(false),
});

export type CreateNewGroupFormType = InferType<typeof createNewGroupFormSchema>;

export const groupSchema = object({
  name: string().required('Group name is required'),
  description: string().test(
    'max-chars',
    'Description cannot exceed 300 characters',
    (value: string | undefined) => !!value && value.length <= 300,
  ),
  logo: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value || typeof value === 'string') return true;
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return false;
    })
    .test('is-valid-size', 'Max image size allowed is 3MB', (value: any) => {
      if (!value || typeof value === 'string') return true;
      return value.size <= megabytesToBytes(3);
    }),
  banner: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return false;
    })
    .test('is-valid-size', 'Max image size allowed is 5MB', (value: any) => {
      if (!value || typeof value === 'string') return true;
      return value.size <= megabytesToBytes(5);
    }),
  links: linksSchema,
  admins: array().of(
    object({
      id: string().required(),
    }),
  ),
  leader: string(),
  founder: string(),
  // locations: array().of(mixed()),
  members: array().of(
    object({
      id: string().required(),
    }),
  ),
  verified: boolean(),
});

export type GroupType = InferType<typeof groupSchema>;
