import { useMutation, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

export type FileUploadParams = { file: File; name?: string };

export const uploadImage = async ({ file, name }: FileUploadParams): Promise<string> => {
  const data = new FormData();
  data.set('file', file);
  data.set('name', name ? name : file.name);
  return axios
    .post('/api/images', data, { headers: { 'Content-Type': 'multipart/form-data' } })
    .then((response) => response.data);
};

// HOOKS
export const useUploadImageMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: FileUploadParams) => uploadImage(params),
  });
};
