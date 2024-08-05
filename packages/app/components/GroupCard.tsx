'use client';
import { Group } from '@/types/model';
import { Button } from '@nextui-org/button';
import { Card, CardFooter, CardHeader } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import { Avatar } from '@nextui-org/react';
import clsx from 'clsx';
import { MapPinIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { ReactNode } from 'react';
import VerificationChip from './VerificationChip';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { group: Group; className?: string; startFooter?: ReactNode; isLoading?: boolean };
const GroupCard = ({ group, className = '', startFooter = null, isLoading = false }: Props) => {
  const router = useRouter();
  const { name, id, logo, verified } = group;
  if (isLoading) return <GroupCardSkeleton className={className} />;
  console.log(JSON.stringify(group));
  return (
    <Card className={clsx('w-full', className)}>
      <CardHeader className="flex gap-3">
        <Avatar src={logo || ''} />
        <div className="flex-1 flex flex-col">
          <div className="flex items-start justify-between gap-3">
            <h3 className="flex items-center gap-2 text-md">{name}</h3>
            <VerificationChip verified={verified} className="position top-[1px]" />
          </div>
          <div className="flex items-center gap-2">
            <span className="flex items-center gap-1 text-small text-default-500">
              <MapPinIcon className="h-3 w-3" /> City, Country
            </span>
          </div>
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
