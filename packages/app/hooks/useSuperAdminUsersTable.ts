'use client';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import { useIsLoadingUsers, useUsers, useUsersActions } from '@/store/users.store';
import { User } from '@/types/model';
import { getKeyValue } from '@nextui-org/react';
import { isEqual } from 'lodash';
import { useCallback, useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

const searchOptions = [
  {
    value: 'name',
    label: 'Name',
  },
  {
    value: 'nickname',
    label: 'Nickname',
  },
];

const columns = [
  {
    key: 'name',
    label: 'NAME',
  },
  {
    key: 'nickname',
    label: 'NICKNAME',
  },
  {
    key: 'title',
    label: 'TITLE',
  },
];

const useSuperAdminUsersTable = () => {
  const [selectedRows, setSelectedRows] = useState<Set<string>>(new Set([]));
  const [query, setQuery] = useOverviewQueries();
  const [debouncedQuery] = useDebounce(query, 500);

  const { searchTerm, searchBy } = query;

  const lastQueryRef = useRef<typeof query | null>(null);

  const usersActions = useUsersActions();
  const users = useUsers();
  const isLoading = useIsLoadingUsers();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const getCellValue = useCallback(({ item, key }: { item: User; key: string }) => {
    return getKeyValue(item, key) || 'N/A';
  }, []);

  const setSearchTerm = (searchTerm: string) => {
    setQuery({ ...query, searchTerm });
  };

  const setSearchBy = (searchBy: string) => {
    setQuery({ ...query, searchBy });
  };

  return {
    searchTerm,
    setSearchTerm,
    searchBy,
    setSearchBy,
    users,
    isLoading,
    selectedRows,
    setSelectedRows,
    searchOptions,
    columns,
    getCellValue,
  };
};

export default useSuperAdminUsersTable;
