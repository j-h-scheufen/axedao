'use client';

import { Tabs, Tab } from '@nextui-org/tabs';
import { Input } from '@nextui-org/input';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Button } from '@nextui-org/button';
import { Circle, MapPin, Search } from 'lucide-react';
import { ReactNode } from 'react';

const groups = [...Array(10)].map((_, i) => ({
  name: `Group ${i + 1}`,
  id: i,
}));

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };
const JoinGroup = ({ secondaryButton, onSubmit }: Props) => {
  return (
    <div className="max-w-lg">
      <Tabs variant="bordered" aria-label="Options" className="mb-3">
        <Tab key="join-a-group" title="Join a group">
          <Autocomplete
            label="Join a group"
            placeholder="Search groups by name"
            startContent={<Search className="h-4 w-4" strokeWidth={1.4} />}
          >
            {groups.map(({ name, id }) => (
              <AutocompleteItem key={id} value={id} textValue={name}>
                <div className="mb-1">{name}</div>
                <div className="flex items-center gap-2 text-xs text-neutral-400">
                  <span className="flex items-center gap-1">
                    <MapPin className="h-3 w-3" />
                    SP, São Paulo
                  </span>
                  <Circle className="relative top-[2px] h-[5px] w-[5px] fill-neutral-500 stroke-none" />
                  <span>75 members</span>
                  <Circle className="relative top-[2px] h-[5px] w-[5px] fill-neutral-500 stroke-none" />
                  <span>Founded by John Doe</span>
                </div>
              </AutocompleteItem>
            ))}
          </Autocomplete>
        </Tab>
        <Tab key="create-group" title="Create new group" className="flex flex-col gap-5">
          <Input label="Name" placeholder="Enter group's name" />
          <Input label="Location" placeholder="Enter group's location" />
        </Tab>
      </Tabs>
      <div className="mt-5 flex justify-between gap-3">
        {!!secondaryButton && secondaryButton}
        <Button className="w-full flex-1" onPress={() => onSubmit && onSubmit()}>
          Submit
        </Button>
      </div>
    </div>
  );
};
export default JoinGroup;
