import { InferType, TestFunction, array, mixed, object, string } from 'yup';
import titles from './titles';

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

export const registrationFormSchema = object({
  email: string().email('Not a valid email').required('Email is required'),
});

export type RegistrationFormType = InferType<typeof registrationFormSchema>;

export const confirmationFormSchema = object({
  otp: string().required('Please input your OTP.'),
});

export type ConfirmationFormType = InferType<typeof confirmationFormSchema>;

const MAX_PROFILE_IMAGE_FILE_SIZE = 1024 * 1024 * 3; //3MB

export const profileSchema = object({
  image: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (!value) return true;
      return isValidFileType(value && value.name?.toLowerCase(), 'image');
    })
    .test('is-valid-size', 'Max allowed size is 100KB', (value: any) => {
      if (!value) return true;
      return value.size <= MAX_PROFILE_IMAGE_FILE_SIZE;
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
