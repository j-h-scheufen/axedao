'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Camera } from 'lucide-react';
import { useCallback, useRef, useState } from 'react';

import { ImageUploadForm, imageUploadSchema } from '@/config/validation-schema';
import { UseFileUploadMutation } from '@/query';
import { getImageUrl } from '@/utils';
import { enqueueSnackbar } from 'notistack';

type Props = {
  value?: string;
  ownerId: string;
  useDynamicMutation: UseFileUploadMutation;
  hideButton?: boolean;
  avatarProps?: Omit<AvatarProps, 'onClick' | 'onBlur' | 'ref'>;
};

/**
 * Autonomous image upload component that allows the user to select an image file and upload it to the server.
 * The component uses a dynamic mutation of type UseFileUploadMutation to handle the file upload and delete operations.
 */
const ImageUpload = ({ value, ownerId, useDynamicMutation, hideButton, avatarProps }: Props) => {
  const { mutateAsync, error: uploadError, isPending } = useDynamicMutation();
  const [imagePreview, setImagePreview] = useState<string | undefined>(value ? (getImageUrl(value) ?? '') : '');
  const [validationError, setValidationError] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement | null>(null);

  console.log('value in ImageUpload', value);
  console.log('imagePreview;', imagePreview);
  const selectImageFile = () => {
    fileInputRef.current?.click();
  };

  const handleSubmit = useCallback(
    async (values: ImageUploadForm) => {
      const isValid = await imageUploadSchema
        .validate(values)
        .then(() => true)
        .catch((error) => setValidationError(error.message));

      if (isValid) {
        return mutateAsync({
          ownerId,
          file: values.file && values.file instanceof File ? values.file : undefined,
        }).then(() => {
          enqueueSnackbar('Image uploaded successfully', { variant: 'success' });
        });
      }
    },
    [mutateAsync, ownerId],
  );

  const handleDelete = useCallback(
    async () =>
      mutateAsync({ ownerId, file: undefined }).then(() => {
        enqueueSnackbar('Image deleted successfully', { variant: 'success' });
      }),
    [mutateAsync, ownerId],
  );

  return (
    <div>
      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        onChange={(e) => {
          setValidationError(null);
          const file = e.target.files && e.target.files[0];
          if (file) {
            setImagePreview(file ? URL.createObjectURL(file) : '');
            handleSubmit({ file });
          }
        }}
        className="hidden"
        hidden
      />
      <div className="flex items-end gap-3">
        <Avatar
          isFocusable
          showFallback
          isBordered
          color={validationError ? 'danger' : undefined}
          src={imagePreview}
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-32 w-full max-w-32 cursor-pointer"
          onClick={selectImageFile}
          {...avatarProps}
        />
        {!hideButton && !isPending && (
          <Button type="button" size="sm" className="w-fit" onPress={selectImageFile}>
            {value ? 'Change' : 'Upload'} image
          </Button>
        )}
        {value && !isPending && (
          <Button type="button" size="sm" className="w-fit" onPress={() => handleDelete()}>
            Delete Image
          </Button>
        )}
      </div>
      {uploadError && <span className="mt-1 inline-block text-small text-danger">{uploadError.message}</span>}
      {validationError && <span className="mt-1 inline-block text-small text-danger">{validationError}</span>}
    </div>
  );
};

export default ImageUpload;
