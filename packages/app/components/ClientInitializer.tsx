'use client';

import { useProfileActions, useProfileInitStatus, useProfilErrors } from '@/store/profile.store';
import { useUsersActions, useUsersErrors, useUsersInitStatus } from '@/store/users.store';
import { useSession } from 'next-auth/react';
import { useEffect } from 'react';

/**
 * Empty client component that should be placed high in the component tree
 * to ensure to ensure the app state is initialized correctly when an authenticated session
 * is present. This components useEffect only needs to run once to deal with page reloads.
 * @returns
 */
export default function ClientInitializer() {
  const { initializeProfile } = useProfileActions();
  const { initializeUsers } = useUsersActions();
  const { isProfileInitialized } = useProfileInitStatus();
  const { isUsersInitialized } = useUsersInitStatus();
  const { initializeProfileError } = useProfilErrors();
  const { initializeUsersError } = useUsersErrors();
  const session = useSession();

  useEffect(() => {
    if (session.data) {
      if (!isProfileInitialized && !initializeProfileError) initializeProfile();
      if (!isUsersInitialized && !initializeUsersError) initializeUsers();
    }
  });

  return null;
}
