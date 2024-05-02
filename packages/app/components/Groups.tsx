'use client';

// import { useState } from 'react';
import { Input } from '@nextui-org/input';
// import { Button, ButtonGroup } from '@nextui-org/button';
import {
  Search,
  // Table, LayoutGrid
} from 'lucide-react';
import GroupsGrid from './GroupsGrid';
// import GroupsTable from './GroupsTable';
import clsx from 'clsx';

// const viewOptions = ['table', 'grid'];

const Groups = () => {
  // const [view, setView] = useState<(typeof viewOptions)[number]>('grid');

  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          isClearable
          className="w-full sm:max-w-[44%]"
          placeholder="Search by name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
        />
        {/* <ButtonGroup color="default">
          <Button
            className={clsx('text-default-500 hover:bg-default-50 hover:text-default-700', {
              'bg-default-50 text-default-700': view === 'grid',
            })}
            onPress={() => setView('grid')}
            isIconOnly
          >
            <LayoutGrid className="h-4 w-4" />
          </Button>
          <Button
            className={clsx('text-default-500 hover:bg-default-50 hover:text-default-700', {
              'bg-default-50 text-default-700': view === 'table',
            })}
            onClick={() => setView('table')}
            isIconOnly
          >
            <Table className="h-4 w-4" />
          </Button>
        </ButtonGroup> */}
      </div>
      <div className="flex items-center justify-between">
        <span className="text-small text-default-400">75 total groups</span>
      </div>
      <GroupsGrid />
      {/* {view === 'table' && <GroupsTable />} */}
    </div>
  );
};
export default Groups;
