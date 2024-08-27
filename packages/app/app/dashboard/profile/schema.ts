import { titles } from '@/constants';
import { isValidFileType, linksSchema, megabytesToBytes } from '@/constants/schemas';
import { InferType, boolean, mixed, object, string } from 'yup';

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
  country: string().required('Group country is required'),
});

export type CreateNewGroupFormType = InferType<typeof createNewGroupFormSchema>;

export const joinGroupFormSchema = object({
  id: string().required('Please select a group'),
});

export type JoinGroupFormType = InferType<typeof joinGroupFormSchema>;
