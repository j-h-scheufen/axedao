'use client';

import { Avatar, type AvatarProps, Spinner } from '@heroui/react';
import { Camera, Trash2 } from 'lucide-react';
import { enqueueSnackbar } from 'notistack';
import { useCallback, useRef, useState } from 'react';

import { type ImageUploadForm, imageUploadSchema } from '@/config/validation-schema';
import type { UseFileUploadMutation } from '@/query';
import { getImageUrl } from '@/utils';
import { cn } from '@/utils/tailwind';
import { ImageCropModal } from '@/components/image';

type Props = {
  value?: string;
  ownerId: string;
  useFileUploadMutation: UseFileUploadMutation;
  classname?: string;
  avatarProps?: Omit<AvatarProps, 'onClick' | 'onBlur' | 'ref'>;
  /**
   * Aspect ratio for cropping (e.g., 4 for banner, 1 for avatar/logo)
   * If not provided, no cropping will be performed
   */
  cropAspect?: number;
  /**
   * Title for the crop modal
   */
  cropTitle?: string;
};

/**
 * Autonomous image upload component that allows the user to select an image file and upload it to the server.
 * The component uses a dynamic mutation of type UseFileUploadMutation to handle the file upload and delete operations.
 * If cropAspect is provided, the user will be able to crop the image before uploading.
 */
const ImageUpload = ({
  value,
  ownerId,
  useFileUploadMutation: useDynamicMutation,
  classname,
  avatarProps,
  cropAspect,
  cropTitle = 'Crop Image',
}: Props) => {
  const { mutateAsync, error: uploadError, isPending } = useDynamicMutation();
  const [imagePreview, setImagePreview] = useState<string | undefined>(value ? (getImageUrl(value) ?? '') : '');
  const [validationError, setValidationError] = useState<string | null>(null);
  const [isCropModalOpen, setIsCropModalOpen] = useState(false);
  const [selectedFile, setSelectedFile] = useState<File | null>(null);
  const fileInputRef = useRef<HTMLInputElement | null>(null);

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
    [mutateAsync, ownerId]
  );

  const handleDelete = useCallback(
    async () =>
      mutateAsync({ ownerId, file: undefined }).then(() => {
        setImagePreview('');
        enqueueSnackbar('Image deleted successfully', { variant: 'success' });
      }),
    [mutateAsync, ownerId]
  );

  const handleCropComplete = useCallback(
    async (_croppedBlob: Blob, croppedFile: File) => {
      // Upload the cropped image
      setImagePreview(URL.createObjectURL(croppedFile));
      await handleSubmit({ file: croppedFile });
    },
    [handleSubmit]
  );

  const handleFileSelect = useCallback(
    (file: File) => {
      setValidationError(null);

      if (cropAspect) {
        // Open crop modal if aspect ratio is provided
        setSelectedFile(file);
        setIsCropModalOpen(true);
      } else {
        // Upload directly without cropping
        setImagePreview(URL.createObjectURL(file));
        handleSubmit({ file });
      }
    },
    [cropAspect, handleSubmit]
  );

  return (
    <div className="flex flex-col gap-1 w-full items-center">
      <div className={cn('relative', cropAspect === 1 ? 'w-32 h-32' : 'w-full', classname)}>
        <input
          ref={fileInputRef}
          type="file"
          accept="image/*"
          onChange={(e) => {
            const file = e.target.files?.[0];
            if (file) {
              handleFileSelect(file);
            }
            // Reset input value to allow selecting the same file again
            e.target.value = '';
          }}
          className="hidden"
          hidden
        />
        <Avatar
          isFocusable
          showFallback
          isBordered
          color={validationError ? 'danger' : undefined}
          src={imagePreview}
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-600" strokeWidth={1} size={20} />}
          className={cn(cropAspect === 1 ? 'aspect-square' : '', 'h-full w-full cursor-pointer')}
          onClick={selectImageFile}
          {...avatarProps}
        />
        {/* Spinner overlay */}
        {isPending ? (
          <div className="absolute inset-0 flex items-center justify-center bg-transparent">
            <Spinner />
          </div>
        ) : (
          value && (
            <div className="absolute inset-0 flex items-center justify-center bg-transparent p-3 gap-1">
              <Camera
                className="h-[28px] sm:h-[35px] w-[28px] sm:w-[35px] cursor-pointer stroke-black fill-primary"
                onClick={selectImageFile}
              />
              <Trash2
                className="h-[28px] sm:h-[35px] w-[28px] sm:w-[35px] cursor-pointer stroke-black fill-primary"
                onClick={() => handleDelete()}
              />
            </div>
          )
        )}
      </div>
      {uploadError && <span className="mt-1 inline-block text-small text-danger">{uploadError.message}</span>}
      {validationError && <span className="mt-1 inline-block text-small text-danger">{validationError}</span>}

      {/* Crop Modal */}
      {cropAspect && (
        <ImageCropModal
          isOpen={isCropModalOpen}
          onClose={() => {
            setIsCropModalOpen(false);
            setSelectedFile(null);
          }}
          onCropComplete={handleCropComplete}
          imageFile={selectedFile}
          aspect={cropAspect}
          title={cropTitle}
        />
      )}
    </div>
  );
};

export default ImageUpload;
