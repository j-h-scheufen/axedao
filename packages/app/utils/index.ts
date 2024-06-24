import axios, { AxiosError } from 'axios';

export const generateErrorMessage = (error: unknown, defaultMessage: string) => {
  return error instanceof AxiosError
    ? error.response?.data
    : error instanceof Error && error.message
      ? error.message
      : defaultMessage;
};

export const uploadImage = async (imageFile: File, name?: string) => {
  const data = new FormData();
  data.set('file', imageFile);
  if (name) data.set('name', name);
  const res = await axios.post('/api/images', data, { headers: { 'Content-Type': 'multipart/form-data' } });
  const url: string = res.data?.url;
  if (url) return url;
};
