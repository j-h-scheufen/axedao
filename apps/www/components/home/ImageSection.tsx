import { Image } from '@heroui/react';

interface ImageSectionProps {
  src: string;
  alt: string;
}

export default function ImageSection({ src, alt }: ImageSectionProps) {
  return (
    <div className="flex w-full items-center justify-center">
      <Image src={src} alt={alt} className="w-full max-w-[800px] md:rounded-3xl" />
    </div>
  );
}
