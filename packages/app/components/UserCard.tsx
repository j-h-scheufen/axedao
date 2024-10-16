'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import { UserRoundIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { ForwardedRef, ReactNode, forwardRef } from 'react';

import { PATHS } from '@/config/constants';
import { User } from '@/types/model';
import { getImageUrl } from '@/utils';

export type UserCardProps = CardProps & {
  user?: User | null;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
};

const UserCard = (
  { user, endContent = null, avatarProps, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  const router = useRouter();
  if (!user) return 'Missing User';

  return (
    <Link as="div" onPress={() => router.push(`${PATHS.users}/${user.id}`)} className="inline-block cursor-pointer">
      <Card ref={ref} {...props}>
        <CardBody className="flex gap-3 justify-between">
          <Avatar
            radius="full"
            size="md"
            src={getImageUrl(user.avatar)}
            fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-10"
            {...avatarProps}
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-1">
            <h4 className="text-small font-semibold leading-none text-default-600">{user.name}</h4>
            <h5 className="text-small tracking-tight text-default-400">{user.email}</h5>
          </div>
          {endContent}
        </CardBody>
      </Card>
    </Link>
  );
};

export default forwardRef(UserCard);
