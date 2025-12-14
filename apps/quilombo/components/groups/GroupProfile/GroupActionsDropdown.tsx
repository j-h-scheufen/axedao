'use client';

import { useDisclosure } from '@heroui/react';
import { CircleCheckIcon, SettingsIcon } from 'lucide-react';
import { usePathname } from 'next/navigation';
import { useAtomValue } from 'jotai';

import { groupIdAtom, groupAtom, isCurrentUserGroupAdminAtom } from '@/hooks/state/group';
import { currentUserIsGlobalAdminAtom } from '@/hooks/state/currentUser';
import { ActionsDropdown, type ActionItem } from '@/components/ui';
import VerifyGroupModal from './VerifyGroupModal';

/**
 * Actions dropdown for group profile page.
 *
 * Note: Leave group functionality has been removed.
 * Group membership is now managed via genealogy statements (member_of predicate).
 * Users manage their membership through their genealogy profile.
 */
const GroupActionsDropdown = () => {
  const groupId = useAtomValue(groupIdAtom);
  const { data: group } = useAtomValue(groupAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const isGlobalAdmin = useAtomValue(currentUserIsGlobalAdminAtom);
  const pathname = usePathname();

  const {
    isOpen: isVerifyModalOpen,
    onOpen: onVerifyModalOpen,
    onOpenChange: onVerifyModalOpenChange,
  } = useDisclosure();

  // Show loading state only if group data is not loaded yet
  // Treat null admin status as false (happens when no user is logged in or for imported groups)
  const isLoading = !group;

  const isUnmanaged = group?.adminCount === 0;
  const canEditAsGlobalAdmin = isGlobalAdmin && isUnmanaged;
  const canEdit = isGroupAdmin || canEditAsGlobalAdmin;

  const items: ActionItem[] = [
    {
      key: 'verify',
      label: 'Verify Group',
      icon: <CircleCheckIcon className="h-4 w-4" />,
      onAction: onVerifyModalOpen,
    },
    {
      key: 'edit',
      label: 'Edit Group',
      icon: <SettingsIcon className="h-4 w-4" />,
      href: `${pathname}/edit`,
      hidden: !canEdit,
    },
  ];

  return (
    <>
      <ActionsDropdown items={items} isLoading={isLoading} ariaLabel="Group actions" />
      <VerifyGroupModal isOpen={isVerifyModalOpen} onOpenChange={onVerifyModalOpenChange} groupId={groupId} />
    </>
  );
};

export default GroupActionsDropdown;
