'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/spinner';
import { Camera } from 'lucide-react';
import { enqueueSnackbar } from 'notistack';
import { useCallback, useRef, useState } from 'react';

import { ImageUploadForm, imageUploadSchema } from '@/config/validation-schema';
import { UseFileUploadMutation } from '@/query';
import { getImageUrl } from '@/utils';

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
        setImagePreview('');
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
      <div className="flex flex-row items-end gap-3">
        <div className="relative w-32 h-32">
          <Avatar
            isFocusable
            showFallback
            isBordered
            color={validationError ? 'danger' : undefined}
            src={imagePreview}
            fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
            className="aspect-square h-full w-full cursor-pointer"
            onClick={selectImageFile}
            {...avatarProps}
          />
          {/* Spinner overlay */}
          {isPending && (
            <div className="absolute inset-0 flex items-center justify-center bg-transparent">
              <Spinner />
            </div>
          )}
        </div>
        {!hideButton && (
          <Button type="button" size="sm" className="w-fit" onPress={selectImageFile} disabled={isPending}>
            {value ? 'Change' : 'Upload'} Image
          </Button>
        )}
        {value && (
          <Button type="button" size="sm" className="w-fit" onPress={() => handleDelete()} disabled={isPending}>
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
