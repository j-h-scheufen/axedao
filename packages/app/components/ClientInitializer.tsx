'use client';

import { useIsProfileInitialized, useProfileActions } from '@/store/profile.store';
import { useSession } from 'next-auth/react';
import { useEffect } from 'react';

/**
 * Empty client component that should be placed high in the component tree
 * to ensure the user profile is initialized when an authenticated session is present.
 * This helps with page reloads.
 * @returns
 */
export default function ClientInitializer() {
  const { initializeProfile } = useProfileActions();
  const isProfileInitialized = useIsProfileInitialized();
  const session = useSession();

  useEffect(() => {
    if (!isProfileInitialized && session.data) {
      initializeProfile();
    }
  });

  return null;
}
