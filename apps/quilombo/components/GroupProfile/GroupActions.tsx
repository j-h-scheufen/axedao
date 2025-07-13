'use client';

import { Button, useDisclosure } from '@heroui/react';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { useCallback } from 'react';

import { groupIdAtom, isCurrentUserGroupAdminAtom, isCurrentUserGroupMemberAtom } from '@/hooks/state/group';
import { useLeaveGroup } from '@/hooks/useCurrentUser';
import { useAtomValue } from 'jotai';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const groupId = useAtomValue(groupIdAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const isGroupMember = useAtomValue(isCurrentUserGroupMemberAtom);
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const pathname = usePathname();
  const { leaveGroup, isPending } = useLeaveGroup();

  const handleGroupExit = useCallback(async () => {
    if (!groupId) return;
    await leaveGroup(groupId);
  }, [leaveGroup, groupId]);

  return (
    <div className="flex gap-3 justify-end">
      <LeaveGroupConfirmationModal
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        onDelete={handleGroupExit}
        isDeleting={isPending}
      />
      {isGroupMember && !isGroupAdmin && (
        <Button variant="light" size="sm" color="danger" onPress={onOpen} isLoading={isPending}>
          Leave Group
        </Button>
      )}
      {isGroupAdmin && (
        <Button
          as={Link}
          href={`${pathname}/edit`}
          size="sm"
          variant="light"
          startContent={<SettingsIcon className="h-4 w-4" />}
        >
          Edit Group
        </Button>
      )}
    </div>
  );
};

export default GroupActions;
