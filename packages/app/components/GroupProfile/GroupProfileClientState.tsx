'use client';

import { PropsWithChildren } from 'react';

import { triggerGroupIdAtom } from '@/hooks/state/group';
import { useHydrateAtoms } from 'jotai/react/utils';

type Props = PropsWithChildren & { groupId: string };

const GroupProfileClientState = ({ groupId, children }: Props) => {
  useHydrateAtoms(new Map([[triggerGroupIdAtom, groupId]]));
  return children;
};

export default GroupProfileClientState;
