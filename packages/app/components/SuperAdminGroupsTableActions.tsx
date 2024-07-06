'use client';

import { Button, Popover, PopoverContent, PopoverTrigger } from '@nextui-org/react';
import { EllipsisVerticalIcon } from 'lucide-react';
import { useState } from 'react';

const SuperAdminGroupsTableActions = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <Popover isOpen={isOpen} onOpenChange={(open) => setIsOpen(open)} classNames={{}}>
      <PopoverTrigger>
        <Button variant="light" size="sm" className="!min-h-[unset] !min-w-[unset] h-6 w-6" isIconOnly>
          <EllipsisVerticalIcon className="w-4 h-4 text-default-500" />
        </Button>
      </PopoverTrigger>
      <PopoverContent className="p-1" onClick={() => setIsOpen(false)}>
        hi
      </PopoverContent>
    </Popover>
  );
};
export default SuperAdminGroupsTableActions;
