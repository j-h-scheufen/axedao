'use client';

import { ForwardedRef, forwardRef, useEffect, useRef, useState } from 'react';
import { Avatar, AvatarProps } from '@nextui-org/react';
import { Camera } from 'lucide-react';
import { Button } from '@nextui-org/button';

type Props = {
  value?: File;
  onChange: (...event: any[]) => void;
  onBlur: (...event: any[]) => void;
  isInvalid?: boolean;
  errorMessage?: string;
  hideButton?: boolean;
  avatarProps?: Omit<AvatarProps, 'onClick' | 'onBlur' | 'ref'>;
};
const ImageUpload = (
  { value, onChange, onBlur = (e) => null, isInvalid, errorMessage, hideButton = false, avatarProps = {} }: Props,
  ref: ForwardedRef<any>,
) => {
  const [imagePreview, setImagePreview] = useState<string>('https://images.unsplash.com/broken');
  const imageInputRef = useRef<HTMLInputElement | null>(null);

  useEffect(() => {
    if (!value) return;
    const reader = new FileReader();
    reader.onloadend = () => {
      setImagePreview(reader.result as string);
    };
    reader.readAsDataURL(value as File);
  }, [value]);

  const selectImageFile = () => {
    imageInputRef.current && imageInputRef.current.click();
  };

  return (
    <div>
      <input
        ref={imageInputRef}
        type="file"
        accept="image/*"
        onChange={(e) => e.target.files?.length && onChange(e.target.files[0])}
        className="hidden"
        hidden
      />
      <div className="flex items-end gap-3">
        <Avatar
          ref={ref}
          isFocusable
          showFallback
          isBordered
          color={isInvalid ? 'danger' : undefined}
          src={imagePreview}
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-32 w-full max-w-32 cursor-pointer"
          onClick={selectImageFile}
          onBlur={onBlur}
          {...avatarProps}
        />
        {!hideButton && (
          <Button type="button" size="sm" className="w-fit" onPress={selectImageFile} onBlur={onBlur}>
            {value ? 'Change' : 'Upload'} image
          </Button>
        )}
      </div>
      {errorMessage && <span className="mt-1 inline-block text-small text-danger">{errorMessage}</span>}
    </div>
  );
};
export default forwardRef(ImageUpload);
