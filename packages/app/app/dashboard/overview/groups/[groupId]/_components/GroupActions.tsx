'use client';

import { useIsExitingGroup, useProfile, useProfileActions } from '@/store/profile.store';
import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/react';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useGroupProfile, useIsGroupAdmin, useIsInitializingGroupProfile } from '../store/groupProfile.store';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();

  const pathname = usePathname();

  const profile = useProfile();
  const groupProfile = useGroupProfile();
  const isGroupMember = profile.groupId === groupProfile.id;
  const isGroupAdmin = useIsGroupAdmin();
  const isLoading = useIsInitializingGroupProfile();

  const profileActions = useProfileActions();
  const isExitingGroup = useIsExitingGroup();

  const exitGroupHandler = async () => {
    await profileActions.exitGroup();
    router.push('/dashboard/profile');
  };

  return (
    <div className="flex gap-3 justify-end">
      {!isLoading && (
        <>
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
        </>
      )}
    </div>
  );
};
export default GroupActions;
