'use client';
import { Card, CardFooter, CardHeader } from '@nextui-org/card';
import { Skeleton } from '@nextui-org/skeleton';
import clsx from 'clsx';

type Props = { className?: string };
const GroupCardSkeleton = ({ className = '' }: Props) => {
  return (
    <Card className={clsx('w-full', className)}>
      <CardHeader className="flex gap-3">
        <Skeleton className="flex rounded-full min-w-10 w-10 h-10" />
        <div className="flex-1 flex flex-col items-start justify-center gap-2">
          <Skeleton className="h-3 mb-2 w-4/5 rounded-lg" />
          <Skeleton className="h-3 block w-3/5 rounded-lg" />
        </div>
      </CardHeader>
      <CardFooter className="flex-row justify-between">
        <Skeleton className="h-8 w-24 ml-auto rounded-md" />
      </CardFooter>
    </Card>
  );
};
export default GroupCardSkeleton;
