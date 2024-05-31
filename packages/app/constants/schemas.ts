import * as Yup from 'yup';
import { InferType, array, boolean, mixed, object, string, ref } from 'yup';
import YupPassword from 'yup-password';
import titles from './titles';
YupPassword(Yup);

const validFileExtensions = { image: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'webp'] } as const;
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

export const profileSchema = object({
  image: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      return isValidFileType(value && value.name?.toLowerCase(), 'image');
    })
    .test('is-valid-size', 'Maximum image size allowed is 3MB', (value: any) => {
      if (!value) return true;
      return value.size <= megabytesToBytes(3);
    }),
  title: string().required('Please select a title').oneOf(titles, 'Not a valid title'),
  fullName: string().required('Full name is required'),
  nickname: string(),
  email: string().email('Not a valid email').required('Email is required'),
  phone: string().required('Phone number is required'),
  links: object({
    website: string().test('is-valid-url', 'Not a valid url', (value) => (value ? isValidUrl(value) : true)),
    instagram: string().test('is-valid-instagram-url', 'Not a valid instagram url', (value) =>
      value ? isValidProfileInstagramUrl(value) : true,
    ),
    facebook: string().test('is-valid-facebook-url', 'Not a valid facebook url', (value) =>
      value ? isValidFacebookProfileUrl(value) : true,
    ),
    twitter: string().test('is-valid-twitter-url', 'Not a valid twitter url', (value) =>
      value ? isValidProfileTwitterUrl(value) : true,
    ),
  }),
});

export type ProfileType = InferType<typeof profileSchema>;

export const joinGroupFormSchema = object({
  id: string().required('Please select a group'),
});

export type JoinGroupFormType = InferType<typeof joinGroupFormSchema>;

export const createNewGroupFormSchema = object({
  name: string().required('Group name is required'),
  location: mixed(),
});

export type CreateNewGroupFormType = InferType<typeof createNewGroupFormSchema>;

export const groupSchema = object({
  name: string().required('Group name is required'),
  description: string().test(
    'max-chars',
    'Description cannot exceed 200 characters',
    (value: string | undefined) => !!value && value.length <= 200,
  ),
  email: string().email('Not a valid email').required('Group email is required'),
  phone: string().required('Phone number is required'),
  logo: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      return isValidFileType(value && value.name?.toLowerCase(), 'image');
    })
    .test('is-valid-size', 'Max image size allowed is 3MB', (value: any) => {
      if (!value) return true;
      return value.size <= megabytesToBytes(3);
    }),
  banner: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      return isValidFileType(value && value.name?.toLowerCase(), 'image');
    })
    .test('is-valid-size', 'Max image size allowed is 5MB', (value: any) => {
      if (!value) return true;
      return value.size <= megabytesToBytes(5);
    }),
  links: object({
    website: string().test('is-valid-url', 'Not a valid url', (value) => (value ? isValidUrl(value) : true)),
    instagram: string().test('is-valid-instagram-url', 'Not a valid instagram url', (value) =>
      value ? isValidProfileInstagramUrl(value) : true,
    ),
    facebook: string().test('is-valid-facebook-url', 'Not a valid facebook url', (value) =>
      value ? isValidFacebookProfileUrl(value) : true,
    ),
    twitter: string().test('is-valid-twitter-url', 'Not a valid twitter url', (value) =>
      value ? isValidProfileTwitterUrl(value) : true,
    ),
  }),
  admins: array().of(
    object({
      id: string().required(),
    }),
  ),
  leader: object({
    id: string().required(),
  }),
  founder: object({
    id: string().required(),
  }),
  locations: array().of(mixed()),
  members: array().of(
    object({
      id: string().required(),
    }),
  ),
  verified: boolean(),
});

export type GroupType = InferType<typeof groupSchema>;
