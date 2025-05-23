import { Skeleton } from '@heroui/react';
import clsx from 'clsx';

type Props = { className?: string };
const ContactInfoSkeleton = ({ className = '' }: Props) => {
  return (
    <div className={clsx('flex flex-col gap-3 h-fit w-full text-small text-default-500 sm:flex-row', className)}>
      {[...Array(2)].map((_, i) => (
        // biome-ignore lint/suspicious/noArrayIndexKey: safe to use index as key for skeleton
        <Skeleton key={i} className="block h-4 rounded-md w-full max-w-[200px]" />
      ))}
    </div>
  );
};
export default ContactInfoSkeleton;
