'use client';

import { triggerUserIdAtom } from '@/hooks/state/user';
import { useAtomValue } from 'jotai';
import { useHydrateAtoms } from 'jotai/react/utils';
import { PropsWithChildren } from 'react';

type Props = PropsWithChildren & { userId: string };

/**
 * This component makes sure that the triggerGroupIdAtom is set to the specified userId
 * to load the user profile data into state in the nearest Jotai provider.
 * Any client components within that provider are therefore guaranteed to have access to
 * all atoms derived of the trigger user ID.
 * @param userId the ID of the user to load into state
 * @returns
 */
const UserProfileClientState = ({ userId, children }: Props) => {
  const triggerId = useAtomValue(triggerUserIdAtom);
  useHydrateAtoms(!triggerId || triggerId !== userId ? new Map([[triggerUserIdAtom, userId]]) : new Map());
  return children;
};

export default UserProfileClientState;
