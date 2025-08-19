'use client';

import { Button, Image } from '@heroui/react';

interface EventImageUploadSectionProps {
  selectedImage: File | null;
  imagePreview: string | null;
  imageUploadId: string;
  handleImageChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
  handleRemoveImage: () => void;
}

const EventImageUploadSection = ({
  selectedImage,
  imagePreview,
  imageUploadId,
  handleImageChange,
  handleRemoveImage,
}: EventImageUploadSectionProps) => {
  return (
    <div className="flex flex-col gap-2">
      <div className="flex items-center gap-4">
        <input type="file" accept="image/*" onChange={handleImageChange} className="hidden" id={imageUploadId} />
        <label
          htmlFor={imageUploadId}
          className="cursor-pointer px-4 py-2 bg-default-100 hover:bg-default-200 rounded-lg text-sm font-medium transition-colors"
        >
          Choose Event Image (Optional)
        </label>
        {selectedImage && (
          <Button size="sm" variant="light" color="danger" onPress={handleRemoveImage}>
            Remove
          </Button>
        )}
      </div>
      {imagePreview && (
        <div className="mt-2">
          <Image src={imagePreview} alt="Event preview" className="w-32 h-32 object-cover rounded-lg" />
        </div>
      )}
    </div>
  );
};

export default EventImageUploadSection;
