'use client';

import { useGroups, useGroupsActions, useIsLoadingGroups } from '@/store/groups.store';
import { isEqual } from 'lodash';
import { parseAsBoolean, parseAsString, useQueryStates } from 'nuqs';
import { useEffect, useRef } from 'react';
import { useDebounce } from 'use-debounce';

export const verificationStatuses = ['all', 'verified', 'unverified'];

const params = {
  searchTerm: parseAsString,
  verified: parseAsBoolean,
  country: parseAsString,
  city: parseAsString,
};

export type GroupsQueryParams = typeof params;

const useGroupsTable = () => {
  const [query, setQuery] = useQueryStates(params);
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const actions = useGroupsActions();
  const groups = useGroups();
  const isLoading = useIsLoadingGroups();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    actions.search(debouncedQuery);
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, actions, lastQueryRef]);

  return {
    groups,
    isLoading,
    query,
    setQuery,
  };
};

export default useGroupsTable;
