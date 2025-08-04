import { IMAGE_FORMATS } from '@/config/constants';
import type { ImageType } from '@/types/model';
import sharp, { type ResizeOptions } from 'sharp';
import { fileTypeFromBuffer } from 'file-type';

/**
 * Main image processing logic based on different "ImageType" scenarios.
 * The presented file is processed to fix its orientation and then resized according
 * to the "ImageType" instructions. If the resulting size is not smaller than the
 * original's size, the original buffer is returned.
 * @param file
 * @param type
 * @returns
 */
export const createImageBuffer = async (file: File, type: ImageType): Promise<Buffer> => {
  const buffer = await file.arrayBuffer();

  // Validate file type
  const fileType = await fileTypeFromBuffer(buffer);
  if (!fileType || !['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/svg+xml'].includes(fileType.mime)) {
    throw new Error(`Invalid file type. Supported formats: PNG, JPEG, WebP, SVG. Got: ${fileType?.mime}`);
  }

  const transformer = sharp(buffer).rotate(); // normalize orientation with rotate()

  const metadata = await transformer.metadata();

  const isPortrait = metadata.height && metadata.width && metadata.height > metadata.width;
  const instructions = IMAGE_FORMATS[type];

  // check if we have special portrait/landscape instructions
  let resizeOptions: ResizeOptions;
  if ('portrait' in instructions.resizeOptions && 'landscape' in instructions.resizeOptions) {
    resizeOptions = isPortrait ? instructions.resizeOptions.portrait : instructions.resizeOptions.landscape;
  } else {
    resizeOptions = instructions.resizeOptions as ResizeOptions;
  }

  const webpOptions = instructions.lossless ? { lossless: true } : { quality: 85 }; // consider making quality configurable

  const processedBuffer = await transformer.resize(resizeOptions).webp(webpOptions).toBuffer();

  const originalRotatedBuffer = await transformer.toBuffer();

  return processedBuffer.byteLength < originalRotatedBuffer.byteLength ? processedBuffer : originalRotatedBuffer;
};
