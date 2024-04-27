'use client';

import { Card, CardBody, CardFooter, CardHeader } from '@nextui-org/card';
import { Button } from '@nextui-org/button';
import { Avatar, AvatarGroup } from '@nextui-org/react';
import { MapPin } from 'lucide-react';
import { Link } from '@nextui-org/link';

type Props = { change?: () => null | void };
const GroupCard = ({ change }: Props) => {
  return (
    <Card className="w-fit min-w-56">
      <CardHeader className="flex gap-3">
        <Avatar src="http://dummyimage.com/100x100.png/888/ffffff" />
        <div className="flex flex-col">
          <p className="text-md">Lorem Ipsum Group</p>
          <div className="flex items-center gap-1 text-small text-default-500">
            <MapPin className="h-3 w-3" /> SP, São Paulo
          </div>
        </div>
      </CardHeader>
      <CardBody>
        <AvatarGroup isBordered max={3} className="justify-start" size="sm">
          <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026024d" />
          <Avatar src="https://i.pravatar.cc/150?u=a04258a2462d826712d" />
          <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026704d" />
          <Avatar src="https://i.pravatar.cc/150?u=a04258114e29026302d" />
          <Avatar src="https://i.pravatar.cc/150?u=a04258114e29026702d" />
          <Avatar src="https://i.pravatar.cc/150?u=a04258114e29026708c" />
        </AvatarGroup>
      </CardBody>
      <CardFooter className="flex-row justify-between">
        {change && (
          <Button variant="light" size="sm" className="block w-fit" onPress={change}>
            Change
          </Button>
        )}
        <Button as={Link} href="/dashboard/groups/1" variant="bordered" size="sm" className="ml-auto w-fit">
          View group
        </Button>
      </CardFooter>
    </Card>
  );
};
export default GroupCard;
