'use client';

import { triggerGroupIdAtom } from '@/hooks/state/group';
import { useAtomValue } from 'jotai';
import { useHydrateAtoms } from 'jotai/react/utils';
import { PropsWithChildren } from 'react';

type Props = PropsWithChildren & { groupId: string };

/**
 * This component makes sure that the triggerGroupIdAtom is set to the specified groupId
 * to load the group profile data into state in the nearest Jotai provider.
 * Any client components within that provider are therefore guaranteed to have access to
 * all atoms derived of the trigger group ID.
 * @param groupId the ID of the group to load into state
 * @returns
 */
const GroupProfileClientState = ({ groupId, children }: Props) => {
  const triggerId = useAtomValue(triggerGroupIdAtom);
  useHydrateAtoms(!triggerId || triggerId !== groupId ? new Map([[triggerGroupIdAtom, groupId]]) : new Map(), {
    dangerouslyForceHydrate: true, // REQUIRED to force the correct trigger ID also on next page navigation
  });
  return children;
};

export default GroupProfileClientState;
