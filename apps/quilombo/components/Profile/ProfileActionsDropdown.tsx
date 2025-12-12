'use client';

import { SettingsIcon, GlobeIcon } from 'lucide-react';
import { useAtomValue } from 'jotai';

import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { ActionsDropdown, type ActionItem } from '@/components/ui';

/**
 * Actions dropdown for user profile page.
 * Similar to GroupActionsDropdown, provides access to:
 * - Edit Profile (private user data)
 * - Genealogy Profile (public genealogy presence)
 */
const ProfileActionsDropdown = () => {
  const { data: user, isFetching } = useAtomValue(currentUserAtom);

  const hasGenealogyProfile = !!user?.profileId;

  const items: ActionItem[] = [
    {
      key: 'edit',
      label: 'Edit Profile',
      icon: <SettingsIcon className="h-4 w-4" />,
      href: `${PATHS.profile}/edit`,
    },
    {
      key: 'genealogy',
      label: hasGenealogyProfile ? 'Edit Genealogy Profile' : 'Publish to Genealogy',
      icon: <GlobeIcon className="h-4 w-4" />,
      href: `${PATHS.profile}/genealogy`,
    },
  ];

  return <ActionsDropdown items={items} isLoading={!user || isFetching} ariaLabel="Profile actions" />;
};

export default ProfileActionsDropdown;
