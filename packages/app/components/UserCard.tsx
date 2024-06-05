'use client';
import { User } from '@/types/model';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Avatar, AvatarProps } from '@nextui-org/react';
import { ForwardedRef, ReactNode, forwardRef } from 'react';

export type UserCardProps = CardProps & { user: User; endContent?: ReactNode | null; avatarProps?: AvatarProps };
const UserCard = (
  { user, endContent = null, avatarProps, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  const { name, email, avatar = 'https://nextui.org/avatars/avatar-1.png' } = user;
  return (
    <Card ref={ref} {...props}>
      <CardBody className="justify-between">
        <div className="flex gap-5">
          <Avatar radius="full" size="md" src={avatar!} {...avatarProps} />
          <div className="flex flex-col items-start justify-center gap-1">
            <h4 className="text-small font-semibold leading-none text-default-600">{name}</h4>
            <h5 className="text-small tracking-tight text-default-400">{email}</h5>
          </div>
          {endContent}
        </div>
      </CardBody>
    </Card>
  );
};
export default forwardRef(UserCard);