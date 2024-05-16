'use client';
import { ForwardedRef, forwardRef } from 'react';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Avatar } from '@nextui-org/react';

const UserCard = (props: CardProps, ref: ForwardedRef<HTMLDivElement>) => {
  return (
    <Card ref={ref} {...props}>
      <CardBody className="justify-between">
        <div className="flex gap-5">
          <Avatar radius="full" size="md" src="https://nextui.org/avatars/avatar-1.png" />
          <div className="flex flex-col items-start justify-center gap-1">
            <h4 className="text-small font-semibold leading-none text-default-600">John Doe</h4>
            <h5 className="text-small tracking-tight text-default-400">johndoe@gmail.com</h5>
          </div>
        </div>
      </CardBody>
    </Card>
  );
};
export default forwardRef(UserCard);
