import { AxiosError } from 'axios';

export const generateErrorMessage = (error: unknown, defaultMessage: string) => {
  return error instanceof AxiosError
    ? error.response?.data?.message
    : error instanceof Error && error.message
      ? error.message
      : defaultMessage;
};
