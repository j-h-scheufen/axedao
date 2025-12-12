'use client';

import { useDisclosure } from '@heroui/react';
import { CircleCheckIcon, UserPlusIcon, SettingsIcon, LogOutIcon } from 'lucide-react';
import { usePathname } from 'next/navigation';
import { useCallback } from 'react';
import { useAtomValue } from 'jotai';

import { groupIdAtom, groupAtom, isCurrentUserGroupAdminAtom, isCurrentUserGroupMemberAtom } from '@/hooks/state/group';
import { currentUserIsGlobalAdminAtom } from '@/hooks/state/currentUser';
import { useLeaveGroup } from '@/hooks/useCurrentUser';
import { ActionsDropdown, type ActionItem } from '@/components/ui';
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

  // Show loading state only if group data is not loaded yet
  // Treat null admin/member status as false (happens when no user is logged in or for imported groups)
  const isLoading = !group;

  const isUnclaimed = group?.claimedBy === null;
  const canClaim = isUnclaimed && !isGroupAdmin;
  const isUnmanaged = group?.adminCount === 0;
  const canEditAsGlobalAdmin = isGlobalAdmin && isUnmanaged;
  const canEdit = isGroupAdmin || canEditAsGlobalAdmin;
  const canLeave = isGroupMember && !isGroupAdmin;

  const items: ActionItem[] = [
    {
      key: 'verify',
      label: 'Verify Group',
      icon: <CircleCheckIcon className="h-4 w-4" />,
      onAction: onVerifyModalOpen,
    },
    {
      key: 'claim',
      label: 'Claim Group',
      icon: <UserPlusIcon className="h-4 w-4" />,
      onAction: onClaimModalOpen,
      hidden: !canClaim,
    },
    {
      key: 'edit',
      label: 'Edit Group',
      icon: <SettingsIcon className="h-4 w-4" />,
      href: `${pathname}/edit`,
      hidden: !canEdit,
    },
    {
      key: 'leave',
      label: 'Leave Group',
      icon: <LogOutIcon className="h-4 w-4" />,
      color: 'danger',
      onAction: onLeaveModalOpen,
      hidden: !canLeave,
    },
  ];

  return (
    <>
      <ActionsDropdown items={items} isLoading={isLoading} ariaLabel="Group actions" />

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
