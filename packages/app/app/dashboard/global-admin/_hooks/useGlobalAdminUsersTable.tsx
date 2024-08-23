'use client';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import { useIsLoadingUsers, useUsers, useUsersActions } from '@/store/users.store';
import { User as UserType } from '@/types/model';
import { Link, User, getKeyValue } from '@nextui-org/react';
import { isEqual } from 'lodash';
import { useCallback, useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';
import { useProfile } from '../../profile/store';

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
    key: 'user',
    label: 'USER',
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

const useGlobalAdminUsersTable = () => {
  const [selectedRows, setSelectedRows] = useState<Set<string>>(new Set([]));
  const [query, setQuery] = useOverviewQueries();
  const [debouncedQuery] = useDebounce(query, 500);

  const { searchTerm, searchBy } = query;

  const lastQueryRef = useRef<typeof query | null>(null);

  const profile = useProfile();
  const usersActions = useUsersActions();
  const users = useUsers();
  const isLoading = useIsLoadingUsers();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const getCellValue = useCallback(
    ({ item, key }: { item: UserType; key: string }) => {
      if (key === 'user') {
        const { id, email, avatar, name } = item as UserType;
        const isLoggedInUser = id === profile.id;
        return (
          <Link href={`/dashboard/overview/users/${id}`} className="text-[unset]">
            <User
              avatarProps={{ radius: 'full', src: avatar || '' }}
              description={email}
              name={`${name} ${isLoggedInUser ? '(You)' : ''}`}
              className="cursor-pointer"
            >
              {email}
            </User>
          </Link>
        );
      }
      return getKeyValue(item, key) || 'N/A';
    },
    [profile.id],
  );

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

export default useGlobalAdminUsersTable;
