'use client';
import { Group } from '@/types/model';
import { Button } from '@nextui-org/button';
import { Card, CardFooter, CardHeader } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import { Avatar } from '@nextui-org/react';
import clsx from 'clsx';
import { useRouter } from 'next/navigation';
import { ReactNode } from 'react';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { group: Group; className?: string; startFooter?: ReactNode; isLoading?: boolean };
const GroupCard = ({ group, className = '', startFooter = null, isLoading = false }: Props) => {
  const router = useRouter();
  const { name, id, logo } = group;
  if (isLoading) return <GroupCardSkeleton className={className} />;
  return (
    <Card className={clsx('w-full', className)}>
      <CardHeader className="flex gap-3">
        <Avatar src={logo || ''} />
        <div className="flex flex-col">
          <p className="text-md">{name}</p>
          {/* <div className="flex items-center gap-1 text-small text-default-500">
            <MapPin className="h-3 w-3" /> SP, São Paulo
          </div> */}
        </div>
      </CardHeader>
      <CardFooter className="flex-row justify-between">
        {startFooter}
        <Button
          as={Link}
          variant="bordered"
          size="sm"
          onPress={() => router.push(`/dashboard/overview/groups/${id}`)}
          className="ml-auto w-fit"
        >
          View group
        </Button>
      </CardFooter>
    </Card>
  );
};
export default GroupCard;
