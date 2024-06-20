import { Skeleton } from '@nextui-org/react';
import clsx from 'clsx';

type Props = { className?: string };
const ContactInfoSkeleton = ({ className = '' }: Props) => {
  return (
    <div className={clsx('flex flex-wrap gap-x-3 gap-y-5 h-fit w-full text-small text-default-500', className)}>
      {[...Array(2)].map((_, i) => (
        <Skeleton key={i} className="h-3 rounded-md w-full sm:w-80" />
      ))}
    </div>
  );
};
export default ContactInfoSkeleton;
