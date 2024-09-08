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

export const megabytesToBytes = (mb: number) => 1024 * 1024 * mb; //3MB

export const linkSchema = object({
  id: number(),
  url: string().required(),
  type: mixed().oneOf(linkTypes).nullable(),
  ownerId: string().required(),
});

export const linksSchema = array().of(linkSchema).default([]);

export const registrationFormSchema = object({
  email: string().email('Not a valid email').required('Email is required'),
  name: string().required('Please enter your name'),
  walletAddress: string().required('Please connect your MetaMask wallet'),
});

export type RegistrationFormType = InferType<typeof registrationFormSchema>;

export const signInFormSchema = object({
  walletAddress: string().required('Please connect your MetaMask wallet'),
});

export type SignInFormType = InferType<typeof signInFormSchema>;

export const confirmationFormSchema = object({
  otp: string().required('Please input your OTP.'),
});

export type ConfirmationFormType = InferType<typeof confirmationFormSchema>;

export const groupFormSchema = object({
  name: string().required('Group name is required'),
  founder: string().optional().nullable(),
  email: string().email(),
  description: string().test('max-chars', 'Description cannot exceed 300 characters', (value: string | undefined) =>
    value ? value.length <= 300 : true,
  ),
  logo: mixed()
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return true;
    })
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .test('is-valid-size', 'Max image size allowed is 3MB', (value: any) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(3);
      }
      return true;
    }),
  banner: mixed()
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .test('is-valid-type', 'Not a valid image type', (value: any) => {
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      return true;
    })
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .test('is-valid-size', 'Max image size allowed is 5MB', (value: any) => {
      if (value instanceof File) {
        return value.size <= megabytesToBytes(3);
      }
      return true;
    }),
  links: linksSchema,
  admins: array().of(
    object({
      id: string().required(),
    }),
  ),
  leader: string(),
});

export type GroupFormType = InferType<typeof groupFormSchema>;

export const profileFormSchema = object({
  avatar: mixed()
    .test('is-valid-type', 'Not a valid image type', (value: unknown) => {
      if (value instanceof File) {
        return isValidFileType(value && value.name?.toLowerCase(), 'image');
      }
      // TODO check if its a url
      return true;
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
  email: string().email('Not a valid email').required('Email is required'),
  phone: string(),
  links: linksSchema,
});

export type ProfileFormType = InferType<typeof profileFormSchema>;

export const createNewGroupFormSchema = object({
  name: string().required('Group name is required'),
  verified: boolean().default(false),
  city: string(),
  country: string().required('Country is required'),
});

export type CreateNewGroupFormType = InferType<typeof createNewGroupFormSchema>;

export const joinGroupFormSchema = object({
  id: string().required('Please select a group'),
});

export type JoinGroupFormType = InferType<typeof joinGroupFormSchema>;
