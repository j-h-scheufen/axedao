import axios, { AxiosError } from 'axios';

export const generateErrorMessage = (error: unknown, defaultMessage: string) => {
  let message = defaultMessage;
  const isAxiosError = error instanceof AxiosError;
  if (error instanceof Error && typeof error?.message === 'string') {
    message = error.message;
  }
  if (isAxiosError && error.response?.data?.error && error.response?.data?.message) {
    message = error.response?.data?.message;
  }

  return message;
};

export const uploadImage = async (imageFile: File, name?: string) => {
  const data = new FormData();
  data.set('file', imageFile);
  if (name) data.set('name', name);
  const res = await axios.post('/api/images', data, { headers: { 'Content-Type': 'multipart/form-data' } });
  const url: string = res.data?.url;
  if (url) return url;
};
