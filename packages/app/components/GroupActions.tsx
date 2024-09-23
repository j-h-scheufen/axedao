'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useCallback } from 'react';

import { PATHS } from '@/config/constants';
import { groupIdAtom, isCurrentUserGroupAdminAtom, isCurrentUserGroupMemberAtom } from '@/hooks/state/group';
import { useLeaveGroup } from '@/hooks/useCurrentUser';
import { useAtomValue } from 'jotai';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();
  const pathname = usePathname();
  const { leaveGroup, isPending } = useLeaveGroup();
  const groupId = useAtomValue(groupIdAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const isGroupMember = useAtomValue(isCurrentUserGroupMemberAtom);

  const handleGroupExit = useCallback(async () => {
    if (!groupId) return;
    return leaveGroup(groupId).then(() => router.push(PATHS.profile));
  }, [leaveGroup, groupId, router]);

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
          Leave group
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
          Settings
        </Button>
      )}
    </div>
  );
};

export default GroupActions;
