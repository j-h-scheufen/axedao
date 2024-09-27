'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { SettingsIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { useLeaveGroup } from '@/query/profile';
import { useProfileActions, useProfileUser } from '@/store/profile.store';
import { useGroupProfile, useIsGroupAdmin } from '../store/groupProfile.store';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';

const GroupActions = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();
  const pathname = usePathname();
  const { mutateAsync: leaveGroup, isPending } = useLeaveGroup();
  const { updateGroup: updateUserProfileGroup } = useProfileActions();
  const user = useProfileUser();
  const groupProfile = useGroupProfile();
  const isGroupAdmin = useIsGroupAdmin();

  const isGroupMember = user.groupId === groupProfile.group.id;

  const exitGroupHandler = async () => {
    return leaveGroup(groupProfile.group.id).then(() => {
      updateUserProfileGroup(null);
      router.push(PATHS.profile);
    });
  };

  return (
    <div className="flex gap-3 justify-end">
      <LeaveGroupConfirmationModal
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        onDelete={exitGroupHandler}
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
