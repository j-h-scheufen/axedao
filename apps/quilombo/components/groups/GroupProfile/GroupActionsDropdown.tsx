'use client';

import { Button, Dropdown, DropdownTrigger, DropdownMenu, DropdownItem, useDisclosure } from '@heroui/react';
import { MoreVerticalIcon, CircleCheckIcon, UserPlusIcon, SettingsIcon, LogOutIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { useCallback } from 'react';
import { useAtomValue } from 'jotai';

import { groupIdAtom, groupAtom, isCurrentUserGroupAdminAtom, isCurrentUserGroupMemberAtom } from '@/hooks/state/group';
import { currentUserIsGlobalAdminAtom } from '@/hooks/state/currentUser';
import { useLeaveGroup } from '@/hooks/useCurrentUser';
import LeaveGroupConfirmationModal from './LeaveGroupConfirmationModal';
import VerifyGroupModal from './VerifyGroupModal';
import ClaimGroupModal from './ClaimGroupModal';

const GroupActionsDropdown = () => {
  const groupId = useAtomValue(groupIdAtom);
  const { data: group } = useAtomValue(groupAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const isGroupMember = useAtomValue(isCurrentUserGroupMemberAtom);
  const isGlobalAdmin = useAtomValue(currentUserIsGlobalAdminAtom);
  const pathname = usePathname();
  const { leaveGroup, isPending } = useLeaveGroup();

  const { isOpen: isLeaveModalOpen, onOpen: onLeaveModalOpen, onOpenChange: onLeaveModalOpenChange } = useDisclosure();
  const {
    isOpen: isVerifyModalOpen,
    onOpen: onVerifyModalOpen,
    onOpenChange: onVerifyModalOpenChange,
  } = useDisclosure();
  const { isOpen: isClaimModalOpen, onOpen: onClaimModalOpen, onOpenChange: onClaimModalOpenChange } = useDisclosure();

  const handleGroupExit = useCallback(async () => {
    if (!groupId) return;
    await leaveGroup(groupId);
  }, [leaveGroup, groupId]);

  const handleAction = (key: string) => {
    switch (key) {
      case 'verify':
        onVerifyModalOpen();
        break;
      case 'claim':
        onClaimModalOpen();
        break;
      case 'leave':
        onLeaveModalOpen();
        break;
      // 'edit' is handled by Link component
    }
  };

  // Show loading state only if group data is not loaded yet
  // Treat null admin/member status as false (happens when no user is logged in or for imported groups)
  if (!group) {
    return (
      <Button isIconOnly variant="light" size="sm" isLoading>
        <MoreVerticalIcon className="h-4 w-4" />
      </Button>
    );
  }

  const isUnclaimed = group.claimedBy === null;
  const canClaim = isUnclaimed && !isGroupAdmin;
  const isUnmanaged = group.adminCount === 0;
  const canEditAsGlobalAdmin = isGlobalAdmin && isUnmanaged;
  const canEdit = isGroupAdmin || canEditAsGlobalAdmin;

  return (
    <>
      <Dropdown>
        <DropdownTrigger>
          <Button isIconOnly variant="light" size="sm">
            <MoreVerticalIcon className="h-4 w-4" />
          </Button>
        </DropdownTrigger>
        <DropdownMenu aria-label="Group actions" onAction={(key) => handleAction(key as string)}>
          <DropdownItem key="verify" startContent={<CircleCheckIcon className="h-4 w-4" />}>
            Verify Group
          </DropdownItem>

          {canClaim ? (
            <DropdownItem key="claim" startContent={<UserPlusIcon className="h-4 w-4" />}>
              Claim Group
            </DropdownItem>
          ) : null}

          {canEdit ? (
            <DropdownItem
              key="edit"
              as={Link}
              href={`${pathname}/edit`}
              startContent={<SettingsIcon className="h-4 w-4" />}
            >
              Edit Group
            </DropdownItem>
          ) : null}

          {isGroupMember && !isGroupAdmin ? (
            <DropdownItem
              key="leave"
              color="danger"
              className="text-danger"
              startContent={<LogOutIcon className="h-4 w-4" />}
            >
              Leave Group
            </DropdownItem>
          ) : null}
        </DropdownMenu>
      </Dropdown>

      <LeaveGroupConfirmationModal
        isOpen={isLeaveModalOpen}
        onOpenChange={onLeaveModalOpenChange}
        onDelete={handleGroupExit}
        isDeleting={isPending}
      />

      <VerifyGroupModal isOpen={isVerifyModalOpen} onOpenChange={onVerifyModalOpenChange} groupId={groupId} />

      <ClaimGroupModal isOpen={isClaimModalOpen} onOpenChange={onClaimModalOpenChange} groupId={groupId} />
    </>
  );
};

export default GroupActionsDropdown;
