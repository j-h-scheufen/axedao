'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { useIsExitingGroup, useProfileActions, useProfileUser } from '@/store/profile.store';
import { useGroupProfile, useIsGroupAdmin } from '../store/groupProfile.store';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();

  const pathname = usePathname();

  const user = useProfileUser();
  const groupProfile = useGroupProfile();
  const isGroupMember = user.groupId === groupProfile.id;
  const isGroupAdmin = useIsGroupAdmin();

  const { exitGroup } = useProfileActions();
  const isExitingGroup = useIsExitingGroup();

  const exitGroupHandler = async () => {
    await exitGroup();
    router.push(PATHS.profile);
  };

  return (
    <div className="flex gap-3 justify-end">
      <LeaveGroupConfirmationModal
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        onDelete={exitGroupHandler}
        isDeleting={isExitingGroup}
      />
      {isGroupMember && !isGroupAdmin && (
        <Button variant="light" size="sm" color="danger" onPress={onOpen} isLoading={isExitingGroup}>
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
