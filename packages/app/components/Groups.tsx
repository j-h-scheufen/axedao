'use client';

import { useEffect } from 'react';

import { useGroups, useGroupsActions } from '@/store/groups.store';

export default function Groups() {
  const groupsActions = useGroupsActions();
  const groups = useGroups();

  useEffect(() => {
    groupsActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className="flex flex-col gap-2">
      {groups.map((group) => (
        <p key={`p=${group.id}`}>{group.name}</p>
      ))}
    </div>
  );
}
