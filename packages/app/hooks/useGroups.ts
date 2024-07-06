'use client';

import { useGroupsActions, useGroups as useStoreGroups } from '@/store/groups.store';
import { isEqual } from 'lodash';
import { parseAsString, useQueryStates } from 'nuqs';
import { useEffect, useRef } from 'react';

const params = {
  searchTerm: parseAsString,
};

const useGroups = () => {
  const [query, setQuery] = useQueryStates(params, { throttleMs: 500 });

  const lastQueryRef = useRef<typeof query | null>(null);

  const actions = useGroupsActions();
  const groups = useStoreGroups();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, query)) return;
    actions.initialize();
    lastQueryRef.current = query;
  }, [query, actions, lastQueryRef]);

  return {
    groups,
    searchTerm: query.searchTerm,
    setSearchTerm: (searchTerm: string) => {
      setQuery({ ...query, searchTerm });
    },
  };
};

export default useGroups;
