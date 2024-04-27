'use client';

import { Avatar } from '@nextui-org/avatar';
import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/select';
import { Camera } from 'lucide-react';
import LinkInputs from './LinkInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import Link from 'next/link';

const titles = [
  {
    name: 'None',
    id: 0,
  },
  {
    name: 'Mestre',
    id: 1,
  },
  {
    name: 'Contra-Mestre',
    id: 2,
  },
  {
    name: 'Mestrando',
    id: 3,
  },
  {
    name: 'Professor',
    id: 4,
  },
  {
    name: 'Instructor',
    id: 5,
  },
  {
    name: 'Monitor',
    id: 6,
  },
  {
    name: 'Aluno Graduado',
    id: 7,
  },
  {
    name: 'Aluno',
    id: 8,
  },
  {
    name: 'Iniciante',
    id: 9,
  },
];

const ProfileForm = () => {
  return (
    <div className="max-w-lg">
      <SubsectionHeading>General Information</SubsectionHeading>
      <div className="flex flex-col gap-5">
        <Avatar
          showFallback
          src="https://images.unsplash.com/broken"
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-32 w-full max-w-32"
        />
        <Select label="Title" placeholder="Select title" defaultSelectedKeys={[1]}>
          {titles.map(({ name, id }) => (
            <SelectItem key={id} value={id}>
              {name}
            </SelectItem>
          ))}
        </Select>
        <Input label="Full name" placeholder="Enter your full name" defaultValue="John Doe" />
        <Input label="Nickname" placeholder="Enter your nick name" defaultValue="JD" />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <LinkInputs />
      <Button as={Link} href="/dashboard/profile" className="mt-8 flex w-full items-center">
        Update profile
      </Button>
    </div>
  );
};
export default ProfileForm;
