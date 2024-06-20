'use client';
import { User } from '@/types/model';
import { Card, CardBody, CardFooter, CardProps } from '@nextui-org/card';
import { Avatar, AvatarProps, Button, Link, Popover, PopoverContent, PopoverTrigger } from '@nextui-org/react';
import { ArrowDownIcon, ArrowUpIcon, EllipsisVerticalIcon, UserRoundIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { ForwardedRef, ReactNode, forwardRef, useState } from 'react';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

export type UserCardProps = CardProps & {
  user?: User & { role?: string };
  endContent?: ReactNode | null;
  startFooter?: ReactNode | null;
  avatarProps?: AvatarProps;
  isLoading?: boolean;
};
const GroupMemberCard = (
  { user, /*endContent = null, startFooter,*/ avatarProps, isLoading, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  const [isOpen, setIsOpen] = useState(false);
  const router = useRouter();

  if (!user || isLoading) return <UserCardSkeleton ref={ref} {...props} />;

  const { role } = user;

  return (
    <Card ref={ref} {...props}>
      <CardBody className="justify-between">
        <div className="flex gap-3">
          <Avatar
            radius="full"
            size="sm"
            src={user?.avatar || ''}
            fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-8"
            {...avatarProps}
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-1">
            <h4 className="text-small font-semibold leading-none text-default-600">{user?.name}</h4>
            <h5 className="text-small tracking-tight text-default-400 text-ellipsis">{user?.email}</h5>
          </div>
          {role?.toLowerCase() !== 'founder' && (
            <Popover isOpen={isOpen} onOpenChange={(open) => setIsOpen(open)} classNames={{}}>
              <PopoverTrigger>
                <Button variant="light" size="sm" className="w-5" isIconOnly>
                  <EllipsisVerticalIcon size={16} />
                </Button>
              </PopoverTrigger>
              <PopoverContent onClick={() => setIsOpen(false)}>
                <div className="flex flex-col gap-2 px-1 py-2">
                  {role?.toLowerCase() === 'leader' && (
                    <Button
                      size="sm"
                      variant="light"
                      startContent={<ArrowDownIcon className="h-4 w-4" />}
                      className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                    >
                      Demote to admin
                    </Button>
                  )}
                  {role === 'admin' && (
                    <>
                      <Button
                        size="sm"
                        variant="light"
                        startContent={<ArrowUpIcon className="h-4 w-4" />}
                        className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                      >
                        Promote to leader
                      </Button>
                      <Button
                        size="sm"
                        variant="light"
                        startContent={<ArrowDownIcon className="h-4 w-4" />}
                        className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                      >
                        Demote to member
                      </Button>
                    </>
                  )}
                  {role?.toLowerCase() === 'member' && (
                    <Button
                      size="sm"
                      variant="light"
                      startContent={<ArrowUpIcon className="h-4 w-4" />}
                      className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                    >
                      Promote to admin
                    </Button>
                  )}
                </div>
              </PopoverContent>
            </Popover>
          )}
        </div>
      </CardBody>
      <CardFooter className="flex-row justify-between pt-0">
        {user.role && (
          <span className="capitalize inline-block bg-default-100 border border-default-200 px-2 py-1 rounded-md text-xs">
            {user.role}
          </span>
        )}
        <Button
          as={Link}
          variant="bordered"
          size="sm"
          onPress={() => router.push(`/dashboard/overview/users/${user.id}`)}
          className="ml-auto w-fit"
        >
          View user
        </Button>
      </CardFooter>
    </Card>
  );
};
export default forwardRef(GroupMemberCard);
