import { Card, CardBody, Skeleton } from '@heroui/react';

const EventCardSkeleton = () => {
  return (
    <Card>
      <CardBody className="flex flex-col gap-3 p-4">
        <div className="flex items-start justify-between">
          <Skeleton className="h-6 w-3/4 rounded-lg" />
          <Skeleton className="h-5 w-16 rounded-full" />
        </div>

        <div className="flex flex-col gap-2">
          <div className="flex items-center gap-2">
            <Skeleton className="h-4 w-4 rounded" />
            <Skeleton className="h-4 w-32 rounded" />
          </div>

          <div className="flex items-center gap-2">
            <Skeleton className="h-3 w-3 rounded" />
            <Skeleton className="h-4 w-8 rounded" />
            <Skeleton className="h-4 w-6 rounded" />
          </div>

          <div className="flex items-center gap-2">
            <Skeleton className="h-3 w-3 rounded" />
            <Skeleton className="h-3 w-24 rounded" />
          </div>
        </div>
      </CardBody>
    </Card>
  );
};

export default EventCardSkeleton;
