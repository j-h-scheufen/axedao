'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Field, FieldProps, Form, Formik, FormikProps } from 'formik';
import { Camera } from 'lucide-react';
import { useCallback, useEffect, useRef, useState } from 'react';

import { ImageUploadForm, imageUploadSchema } from '@/config/validation-schema';
import { useUpdateAvatarMutation } from '@/query/currentUser';
import { getImageUrl } from '@/utils';

type Props = {
  value?: File | string;
  hideButton?: boolean;
  avatarProps?: Omit<AvatarProps, 'onClick' | 'onBlur' | 'ref'>;
};

const ImageUpload = ({ value, hideButton, avatarProps }: Props) => {
  const { mutateAsync: updateAvatar, error: uploadError } = useUpdateAvatarMutation();
  const [imagePreview, setImagePreview] = useState<string | undefined>(
    typeof value === 'string' ? getImageUrl(value) : undefined,
  );
  const fileInputRef = useRef<HTMLInputElement | null>(null);

  useEffect(() => {
    if (!value) return;
    if (typeof value === 'string') {
      setImagePreview(getImageUrl(value));
    } else if (value instanceof File) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result as string);
      };
      reader.readAsDataURL(value);
    }
  }, [value]);

  const selectImageFile = () => {
    fileInputRef.current?.click();
  };

  const handleSubmit = useCallback(
    async (values: ImageUploadForm) => {
      try {
        if (values.file && values.file instanceof File) {
          return updateAvatar({ file: values.file });
        } else return updateAvatar({ file: undefined });
      } catch (error) {
        console.error('Error during profile update.', error);
        throw error;
      }
    },
    [updateAvatar],
  );

  return (
    <Formik<ImageUploadForm>
      initialValues={{ file: undefined }}
      validationSchema={imageUploadSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ isValid, submitForm }: FormikProps<ImageUploadForm>) => {
        return (
          <Form className="">
            <Field name="file">
              {({ field }: FieldProps) => (
                <div>
                  <input
                    {...field}
                    ref={fileInputRef}
                    type="file"
                    accept="image/*"
                    onChange={(e) => {
                      field.onChange(e);
                      const file = e.target.files && e.target.files[0];
                      if (file) {
                        setImagePreview(file ? URL.createObjectURL(file) : '');
                        submitForm();
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
                      color={!isValid ? 'danger' : undefined}
                      src={imagePreview}
                      fallback={
                        <Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />
                      }
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
                  {uploadError && (
                    <span className="mt-1 inline-block text-small text-danger">{uploadError.message}</span>
                  )}
                </div>
              )}
            </Field>
          </Form>
        );
      }}
    </Formik>
  );
};

export default ImageUpload;
