'use client';

import { Button } from '@nextui-org/button';
import { Tooltip } from '@nextui-org/tooltip';
import { ShieldCheckIcon, ShieldOffIcon } from 'lucide-react';
import { useState } from 'react';

import { useSuperAdminActions } from '@/store/super-admin.store';
import { Group } from '@/types/model';

type Props = { group: Group };
const ActionCell = ({ group }: Props) => {
  const [isUpdating, setIsUpdating] = useState(false);

  const { updateGroupVerification } = useSuperAdminActions();

  const { verified } = group;

  const updateVerification = async () => {
    setIsUpdating(true);
    try {
      await updateGroupVerification(group.id, !verified);
    } catch (error) {
      console.error(error);
    }
    setIsUpdating(false);
  };

  return (
    <Tooltip content={verified ? 'Unverify group' : 'Verify group'}>
      <Button
        variant="ghost"
        size="sm"
        className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
        onPress={updateVerification}
        isLoading={isUpdating}
        isIconOnly
      >
        {verified ? <ShieldOffIcon className="w-4" /> : <ShieldCheckIcon className="w-4" />}
      </Button>
    </Tooltip>
  );
};
export default ActionCell;
