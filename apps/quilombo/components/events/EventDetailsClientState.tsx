'use client';

import { triggerEventIdAtom } from '@/hooks/state/event';
import { useAtomValue } from 'jotai';
import { useHydrateAtoms } from 'jotai/react/utils';
import type { PropsWithChildren } from 'react';

type Props = PropsWithChildren & { eventId: string };

/**
 * This component makes sure that the triggerEventIdAtom is set to the specified eventId
 * to load the event data into state in the nearest Jotai provider.
 * Any client components within that provider are therefore guaranteed to have access to
 * all atoms derived of the trigger event ID.
 * @param eventId the ID of the event to load into state
 * @returns
 */
const EventDetailsClientState = ({ eventId, children }: Props) => {
  const triggerId = useAtomValue(triggerEventIdAtom);
  useHydrateAtoms(!triggerId || triggerId !== eventId ? new Map([[triggerEventIdAtom, eventId]]) : new Map(), {
    dangerouslyForceHydrate: true, // REQUIRED to force the correct trigger ID also on next page navigation
  });
  return children;
};

export default EventDetailsClientState;
