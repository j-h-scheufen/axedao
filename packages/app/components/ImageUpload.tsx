'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Camera } from 'lucide-react';
import { useEffect, useRef, useState } from 'react';

type Props = {
  value?: File | string;
  onChange: (file: File) => void;
  isInvalid?: boolean;
  errorMessage?: string;
  hideButton?: boolean;
  avatarProps?: Omit<AvatarProps, 'onClick' | 'onBlur' | 'ref'>;
};

const ImageUpload = ({
  value,
  onChange,
  isInvalid,
  errorMessage,
  hideButton = false,
  avatarProps = {},
  ...props
}: Props) => {
  const [imagePreview, setImagePreview] = useState<string | undefined>(typeof value === 'string' ? value : undefined);
  const imageInputRef = useRef<HTMLInputElement | null>(null);

  useEffect(() => {
    if (!value) return;
    if (typeof value === 'string') {
      setImagePreview(value);
    } else if (value instanceof File) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result as string);
      };
      reader.readAsDataURL(value);
    }
  }, [value]);

  const selectImageFile = () => {
    imageInputRef.current?.click();
  };

  return (
    <div>
      <input
        ref={imageInputRef}
        type="file"
        accept="image/*"
        onChange={(e) => {
          if (!!e.target.files?.length) onChange(e.target.files[0]);
          e.target.value = '';
        }}
        className="hidden"
        hidden
        {...props}
      />
      <div className="flex items-end gap-3">
        <Avatar
          isFocusable
          showFallback
          isBordered
          color={isInvalid ? 'danger' : undefined}
          src={imagePreview}
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-32 w-full max-w-32 cursor-pointer"
          onClick={selectImageFile}
          {...avatarProps}
        />
        {!hideButton && (
          <Button type="button" size="sm" className="w-fit" onPress={selectImageFile}>
            {value ? 'Change' : 'Upload'} image
          </Button>
        )}
      </div>
      {errorMessage && <span className="mt-1 inline-block text-small text-danger">{errorMessage}</span>}
    </div>
  );
};

export default ImageUpload;
