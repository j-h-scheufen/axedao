'use client';

import { useState, useCallback, useEffect } from 'react';
import Cropper from 'react-easy-crop';
import type { Area, Point } from 'react-easy-crop';
import { Modal, ModalContent, ModalHeader, ModalBody, ModalFooter, Button, Slider } from '@heroui/react';

import { getCroppedImg } from '@/utils/image/cropImage';

export interface ImageCropModalProps {
  isOpen: boolean;
  onClose: () => void;
  onCropComplete: (croppedBlob: Blob, croppedFile: File) => void;
  imageFile: File | null;
  aspect?: number;
  title?: string;
  maxSizeMB?: number;
}

/**
 * Reusable image crop modal component
 *
 * Allows users to crop and zoom images before uploading.
 * Works on both mobile (touch) and desktop (mouse) with responsive design.
 * Automatically shows circular crop overlay for 1:1 aspect ratio (avatars/logos).
 *
 * @param isOpen - Whether the modal is open
 * @param onClose - Callback when modal is closed
 * @param onCropComplete - Callback when crop is complete, receives cropped Blob and File
 * @param imageFile - The image file to crop
 * @param aspect - Aspect ratio (e.g., 16/9 for banner, 1 for avatar). When set to 1, shows circular crop overlay. Default: 16/9
 * @param title - Modal title. Default: "Crop Image"
 * @param maxSizeMB - Maximum file size in MB (for validation)
 */
export const ImageCropModal = ({
  isOpen,
  onClose,
  onCropComplete,
  imageFile,
  aspect = 16 / 9,
  title = 'Crop Image',
  maxSizeMB,
}: ImageCropModalProps) => {
  const [imageSrc, setImageSrc] = useState<string>('');
  const [crop, setCrop] = useState<Point>({ x: 0, y: 0 });
  const [zoom, setZoom] = useState(1);
  const [rotation, setRotation] = useState(0);
  const [croppedAreaPixels, setCroppedAreaPixels] = useState<Area | null>(null);
  const [isProcessing, setIsProcessing] = useState(false);

  // Determine crop shape based on aspect ratio (round for 1:1, rect for others)
  const cropShape = aspect === 1 ? 'round' : 'rect';

  // Container matches crop aspect ratio for accurate coordinates
  // Use "cover" to fill container completely (no black space) - users pan/zoom to position
  const isCircularCrop = aspect === 1;
  const cropAreaClasses = isCircularCrop
    ? 'relative w-full aspect-square max-w-[500px] mx-auto bg-black rounded-lg overflow-hidden'
    : 'relative w-full aspect-[4/1] max-w-[800px] mx-auto bg-black rounded-lg overflow-hidden';

  // Load image when file changes
  useEffect(() => {
    if (imageFile) {
      const reader = new FileReader();
      reader.onload = () => {
        setImageSrc(reader.result as string);
      };
      reader.readAsDataURL(imageFile);
    } else {
      setImageSrc('');
    }
  }, [imageFile]);

  // Reset state when modal opens/closes
  useEffect(() => {
    if (isOpen) {
      setCrop({ x: 0, y: 0 });
      setZoom(1);
      setRotation(0);
      setCroppedAreaPixels(null);
    }
  }, [isOpen]);

  const onCropCompleteInternal = useCallback((_croppedArea: Area, croppedAreaPixels: Area) => {
    setCroppedAreaPixels(croppedAreaPixels);
  }, []);

  const handleSave = async () => {
    if (!croppedAreaPixels || !imageSrc || !imageFile) {
      return;
    }

    try {
      setIsProcessing(true);

      // Get cropped image as blob
      const croppedBlob = await getCroppedImg(imageSrc, croppedAreaPixels, rotation);

      // Check file size if maxSizeMB is specified
      if (maxSizeMB && croppedBlob.size > maxSizeMB * 1024 * 1024) {
        alert(`Image size must be less than ${maxSizeMB}MB. Please crop a smaller area or use a smaller image.`);
        setIsProcessing(false);
        return;
      }

      // Create a File from the blob with the original filename
      const croppedFile = new File([croppedBlob], imageFile.name, {
        type: 'image/jpeg',
        lastModified: Date.now(),
      });

      onCropComplete(croppedBlob, croppedFile);
      onClose();
    } catch (error) {
      console.error('Error cropping image:', error);
      alert('Failed to crop image. Please try again.');
    } finally {
      setIsProcessing(false);
    }
  };

  const handleCancel = () => {
    onClose();
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      size="2xl"
      scrollBehavior="inside"
      classNames={{
        backdrop: 'bg-black/50',
      }}
      isDismissable={!isProcessing}
      hideCloseButton={isProcessing}
    >
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1">{title}</ModalHeader>
        <ModalBody>
          {/* Crop area */}
          <div className={cropAreaClasses}>
            {imageSrc && (
              <Cropper
                image={imageSrc}
                crop={crop}
                zoom={zoom}
                rotation={rotation}
                aspect={aspect}
                cropShape={cropShape}
                showGrid={false}
                onCropChange={setCrop}
                onZoomChange={setZoom}
                onRotationChange={setRotation}
                onCropComplete={onCropCompleteInternal}
                objectFit="cover"
              />
            )}
          </div>

          {/* Controls */}
          <div className="flex flex-col gap-4 mt-4">
            {/* Zoom control */}
            <div>
              <p className="text-sm font-medium mb-2">Zoom</p>
              <Slider
                size="sm"
                value={zoom}
                onChange={(value) => setZoom(value as number)}
                minValue={1}
                maxValue={3}
                step={0.1}
                aria-label="Zoom"
                classNames={{
                  track: 'bg-default-200',
                  filler: 'bg-primary',
                }}
              />
            </div>

            {/* Rotation control */}
            <div>
              <p className="text-sm font-medium mb-2">Rotation</p>
              <Slider
                size="sm"
                value={rotation}
                onChange={(value) => setRotation(value as number)}
                minValue={0}
                maxValue={360}
                step={1}
                aria-label="Rotation"
                classNames={{
                  track: 'bg-default-200',
                  filler: 'bg-primary',
                }}
              />
            </div>
          </div>

          {/* Helper text */}
          <div className="mt-2">
            <p className="text-xs text-default-500">
              <span className="hidden sm:inline">Drag to reposition, scroll to zoom</span>
              <span className="sm:hidden">Pinch to zoom, drag to reposition</span>
            </p>
          </div>
        </ModalBody>
        <ModalFooter>
          <Button variant="light" onPress={handleCancel} isDisabled={isProcessing}>
            Cancel
          </Button>
          <Button color="primary" onPress={handleSave} isLoading={isProcessing}>
            {isProcessing ? 'Processing...' : 'Save'}
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default ImageCropModal;
