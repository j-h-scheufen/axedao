'use client';

import {
  useAdminBeingDemotedToMember,
  useAdminBeingPromotedToLeader,
  useGroupMembersActions,
  useMemberBeingPromotedToAdmin,
} from '@/store/groupMembers.store';
import { useGroupProfileActions } from '@/store/groupProfile.store';
import { User } from '@/types/model';
import { Card, CardBody, CardFooter, CardProps } from '@nextui-org/card';
import {
  Avatar,
  AvatarProps,
  Button,
  Link,
  Popover,
  PopoverContent,
  PopoverTrigger,
  Spinner,
  useDisclosure,
} from '@nextui-org/react';
import { ArrowDownIcon, ArrowUpIcon, EllipsisVerticalIcon, UserRoundIcon } from 'lucide-react';
import { useSession } from 'next-auth/react';
import { ForwardedRef, ReactNode, forwardRef, useState } from 'react';
import ConfirmPromotionToLeaderModal from './ConfirmPromotionToLeaderModal';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

export type UserCardProps = CardProps & {
  user?: User & { role?: string };
  endContent?: ReactNode | null;
  startFooter?: ReactNode | null;
  avatarProps?: AvatarProps;
  isLoading?: boolean;
};
const GroupMemberCard = (
  { user: member, /*endContent = null, startFooter,*/ avatarProps, isLoading, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  const [isOpen, setIsOpen] = useState(false);
  const leaderPromotionDisclosure = useDisclosure();

  const session = useSession();
  const groupProfileActions = useGroupProfileActions();
  const groupMembersActions = useGroupMembersActions();
  const memberBeingPromotedToAdmin = useMemberBeingPromotedToAdmin();
  const adminBeingDemotedToMember = useAdminBeingDemotedToMember();
  const adminBeingPromotedToLeader = useAdminBeingPromotedToLeader();

  const promoteToLeader = () => {
    groupMembersActions.promoteToLeader(id, () => groupProfileActions.setGroupProfileFields({ leader: id }));
  };

  if (!member || isLoading) return <UserCardSkeleton ref={ref} {...props} />;

  const { role, email, id, avatar, name } = member;

  const isLoggedInUser = email === session.data?.user?.email;
  const isPromotingToAdmin = memberBeingPromotedToAdmin ? memberBeingPromotedToAdmin === id : false;
  const isDemotingToMember = adminBeingDemotedToMember ? adminBeingDemotedToMember === id : false;
  const isPromotingToLeader = adminBeingPromotedToLeader ? adminBeingPromotedToLeader === id : false;

  return (
    <>
      <ConfirmPromotionToLeaderModal
        isOpen={leaderPromotionDisclosure.isOpen}
        onOpenChange={leaderPromotionDisclosure.onOpenChange}
        onProceed={promoteToLeader}
        isLoading={isPromotingToLeader}
      />
      <Card ref={ref} {...props}>
        <CardBody className="justify-between">
          <div className="flex gap-3">
            <Avatar
              radius="full"
              size="sm"
              src={avatar || ''}
              fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
              className="min-w-8"
              {...avatarProps}
            />
            <div className="flex-1 flex flex-col items-start justify-center gap-1">
              <h4 className="text-small font-semibold leading-none text-default-600">
                {name}
                {isLoggedInUser ? ' (You)' : null}
              </h4>
              <h5 className="text-small tracking-tight text-default-400 text-ellipsis">{email}</h5>
            </div>
            {role?.toLowerCase() !== 'founder' && (
              <Popover isOpen={isOpen} onOpenChange={(open) => setIsOpen(open)} classNames={{}}>
                <PopoverTrigger>
                  <Button variant="light" size="sm" className="w-5" isIconOnly>
                    <EllipsisVerticalIcon size={16} />
                  </Button>
                </PopoverTrigger>
                <PopoverContent className="p-1" onClick={() => setIsOpen(false)}>
                  <div className="flex flex-col gap-2 p-0">
                    {/* {role?.toLowerCase() === 'leader' && (
                      <Button
                        size="sm"
                        variant="light"
                        startContent={<ArrowDownIcon className="h-4 w-4" />}
                        className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                      >
                        Demote to admin
                      </Button>
                    )} */}
                    {role === 'admin' && (
                      <>
                        {/* <Button
                          size="sm"
                          variant="light"
                          startContent={<ArrowUpIcon className="h-4 w-4" />}
                          className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                          onPress={() => leaderPromotionDisclosure.onOpen()}
                        >
                          Promote to leader
                        </Button> */}
                        <Button
                          size="sm"
                          variant="light"
                          startContent={
                            isDemotingToMember ? <Spinner size="sm" /> : <ArrowDownIcon className="h-4 w-4" />
                          }
                          className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                          onPress={() => groupMembersActions.demoteToMember(id)}
                        >
                          Demote to member
                        </Button>
                      </>
                    )}
                    {role?.toLowerCase() === 'member' && (
                      <Button
                        size="sm"
                        variant="light"
                        startContent={isPromotingToAdmin ? <Spinner size="sm" /> : <ArrowUpIcon className="h-4 w-4" />}
                        className="w-full max-w-[200px] text-default-700 justify-start hover:text-primary"
                        onPress={() => groupMembersActions.promoteToAdmin(id)}
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
          {role && (
            <span className="capitalize inline-block bg-primary/10 text-primary/70 font-medium px-2 py-1 rounded-md text-xs">
              {role}
            </span>
          )}
          <Button
            as={Link}
            href={isLoggedInUser ? '/dashboard/profile' : `/dashboard/overview/users/${id}`}
            variant="bordered"
            size="sm"
            className="ml-auto w-fit"
          >
            View user
          </Button>
        </CardFooter>
      </Card>
    </>
  );
};
export default forwardRef(GroupMemberCard);
