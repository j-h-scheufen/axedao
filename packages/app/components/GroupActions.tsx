'use client';

import { useIsExitingGroup, useProfileActions } from '@/app/dashboard/profile/store';
import { useIsGroupAdmin, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/react';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();

  const pathname = usePathname();

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
          <Button variant="light" size="sm" color="danger" onPress={onOpen} isLoading={isExitingGroup}>
            Leave group
          </Button>
          {isGroupAdmin && (
            <Button
              as={Link}
              href={`${pathname}/edit`}
              size="sm"
              variant="light"
              color="primary"
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
