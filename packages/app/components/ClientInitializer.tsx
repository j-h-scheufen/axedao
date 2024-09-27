'use client';

import { useSession } from 'next-auth/react';
import { useEffect } from 'react';

import { useIsProfileInitialized, useProfileActions, useProfileErrors } from '@/store/profile.store';

/**
 * Empty client component that should be placed high in the component tree
 * to ensure the global app state is initialized correctly on page reloads
 * when an authenticated session is present.
 * @returns
 */
export default function ClientInitializer() {
  const { initializeProfile } = useProfileActions();
  const isProfileInitialized = useIsProfileInitialized();
  const { initializeProfileError } = useProfileErrors();

  const session = useSession();

  useEffect(() => {
    if (session.data) {
      if (!isProfileInitialized && !initializeProfileError) initializeProfile();
    }
  }); // useEffect only needs to run once to deal with page reloads.

  return null;
}
