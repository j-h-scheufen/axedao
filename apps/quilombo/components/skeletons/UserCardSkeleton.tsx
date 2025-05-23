import { Card, CardBody, type CardProps, Skeleton } from '@heroui/react';

export type UserCardProps = CardProps;

const UserCardSkeleton = (props: UserCardProps) => {
  return (
    <Card {...props}>
      <CardBody className="justify-between">
        <div className="flex gap-3">
          <Skeleton className="flex rounded-full min-w-10 w-10 h-10" />
          <div className="flex-1 flex flex-col items-start justify-center gap-1">
            <Skeleton className="h-2 mb-2 w-3/5 rounded-lg" />
            <Skeleton className="h-2 block w-4/5 rounded-lg" />
          </div>
        </div>
      </CardBody>
    </Card>
  );
};

export default UserCardSkeleton;
