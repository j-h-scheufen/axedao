'use client';

import { Button } from '@nextui-org/button';
import { Tooltip } from '@nextui-org/tooltip';
import { ShieldCheckIcon, ShieldOffIcon } from 'lucide-react';
import { useCallback } from 'react';

import { useGroupVerification } from '@/hooks/useAdmin';
import { Group } from '@/types/model';

type Props = { group: Group };

const ActionCell = ({ group }: Props) => {
  const { setGroupVerification, isPending } = useGroupVerification();
  const { id: groupId, verified } = group;

  const updateVerification = useCallback(async () => {
    return setGroupVerification({ groupId, verified: !verified });
  }, [groupId, verified, setGroupVerification]);

  return (
    <Tooltip content={verified ? 'Unverify group' : 'Verify group'}>
      <Button
        variant="ghost"
        size="sm"
        className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
        onPress={updateVerification}
        isLoading={isPending}
        isIconOnly
      >
        {verified ? <ShieldOffIcon className="w-4" /> : <ShieldCheckIcon className="w-4" />}
      </Button>
    </Tooltip>
  );
};
export default ActionCell;
