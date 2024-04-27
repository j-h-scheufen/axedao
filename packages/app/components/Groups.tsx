'use client';

import { Input } from '@nextui-org/input';
import { Button, ButtonGroup } from '@nextui-org/button';
import { Search, Table, LayoutGrid } from 'lucide-react';
import GroupCard from './GroupCard';

const Groups = () => {
  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          size="sm"
          isClearable
          className="w-full sm:max-w-[44%]"
          placeholder="Search by name"
          startContent={<Search className="h-4 w-4" />}
        />
        <ButtonGroup>
          <Button isIconOnly>
            <LayoutGrid className="h-4 w-4 text-default-500" />
          </Button>
          <Button variant="faded" isIconOnly>
            <Table className="h-4 w-4 text-default-500" />
          </Button>
        </ButtonGroup>
      </div>
      <div className="flex items-center justify-between">
        <span className="text-small text-default-400">75 total groups</span>
      </div>
      <div className="grid w-fit grid-cols-2 gap-5 lg:grid-cols-3 xl:grid-cols-4">
        {[...Array(75)].map((_, i) => (
          <GroupCard key={i} />
        ))}
      </div>
    </div>
  );
};
export default Groups;
