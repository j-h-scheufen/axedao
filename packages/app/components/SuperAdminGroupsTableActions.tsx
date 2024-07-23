'use client';

import { useSuperAdminActions } from '@/store/super-admin.store';
import { Group } from '@/types/model';
import { Button, Popover, PopoverContent, PopoverTrigger } from '@nextui-org/react';
import { EllipsisVerticalIcon } from 'lucide-react';
import { useState } from 'react';

type Props = { group: Group };
const SuperAdminGroupsTableActions = ({ group }: Props) => {
  const [isOpen, setIsOpen] = useState(false);
  const [isUpdating, setIsUpdating] = useState(false);

  const { updateGroupVerification } = useSuperAdminActions();

  const { verified } = group;

  const verify = async () => {
    setIsUpdating(true);
    try {
      await updateGroupVerification(group.id, !verified);
    } catch (error) {
      console.log(error);
    }
    setIsUpdating(false);
  };

  return (
    <Popover isOpen={isOpen} onOpenChange={(open) => setIsOpen(open)} classNames={{}}>
      <PopoverTrigger>
        <Button variant="light" size="sm" isIconOnly>
          <EllipsisVerticalIcon className="w-4 h-4 text-default-500" />
        </Button>
      </PopoverTrigger>
      <PopoverContent className="p-1 rounded-xl" onClick={() => setIsOpen(false)}>
        <Button size="sm" isLoading={isUpdating} onPress={verify}>
          {verified ? 'Unverify' : 'Verify'}
        </Button>
      </PopoverContent>
    </Popover>
  );
};
export default SuperAdminGroupsTableActions;
