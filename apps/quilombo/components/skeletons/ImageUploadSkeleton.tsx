import { Skeleton } from '@nextui-org/skeleton';

type Props = { hideButton?: boolean };
const ImageUploadSkeleton = ({ hideButton = false }: Props) => {
  return (
    <div className="flex items-end gap-3">
      <Skeleton className="aspect-square h-full max-h-40 w-full max-w-40 rounded-full" />
      {!hideButton && <Skeleton className="h-8 w-24 rounded-md" />}
    </div>
  );
};
export default ImageUploadSkeleton;
