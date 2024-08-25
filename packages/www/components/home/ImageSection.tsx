import { Image } from '@nextui-org/react';

interface ImageSectionProps {
  src: string;
  alt: string;
}

export default function ImageSection({
  src,
  alt,
}: ImageSectionProps): JSX.Element {
  return (
    <div className="flex w-full items-center justify-center">
      <Image
        src={src}
        alt={alt}
        className=" w-full max-w-[800px] md:rounded-3xl"
      />
    </div>
  );
}
