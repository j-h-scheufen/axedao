'use client';

import { useSession } from 'next-auth/react';
import { useEffect } from 'react';

import { useGroupsActions, useGroupsErrors, useGroupsInitStatus } from '@/store/groups.store';
import { useIsProfileInitialized, useProfileActions, useProfileErrors } from '@/store/profile.store';
import { useUsersActions, useUsersErrors, useUsersInitStatus } from '@/store/users.store';

/**
 * Empty client component that should be placed high in the component tree
 * to ensure to ensure the app state is initialized correctly when an authenticated session
 * is present. This components useEffect only needs to run once to deal with page reloads.
 * @returns
 */
export default function ClientInitializer() {
  const { initializeProfile } = useProfileActions();
  const isProfileInitialized = useIsProfileInitialized();
  const { initializeProfileError } = useProfileErrors();

  const { initializeUsers } = useUsersActions();
  const { isUsersInitialized } = useUsersInitStatus();
  const { initializeUsersError } = useUsersErrors();

  const { initializeGroups } = useGroupsActions();
  const { isGroupsInitialized } = useGroupsInitStatus();
  const { initializeGroupsError } = useGroupsErrors();

  const session = useSession();

  useEffect(() => {
    if (session.data) {
      if (!isProfileInitialized && !initializeProfileError) initializeProfile();
      if (!isUsersInitialized && !initializeUsersError) initializeUsers();
      if (!isGroupsInitialized && !initializeGroupsError) initializeGroups();
    }
  });

  return null;
}
