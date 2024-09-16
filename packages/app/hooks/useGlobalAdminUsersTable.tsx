'use client';

import { Link } from '@nextui-org/link';
import { getKeyValue } from '@nextui-org/react';
import { User } from '@nextui-org/user';
import { isEqual } from 'lodash';
import { useCallback, useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import { useIsLoadingUsers, useSearchResults, useUserSearchActions } from '@/store/user-search.store';
import { User as UserType } from '@/types/model';
import { getUserDisplayName } from '@/utils';
import { useProfileUser } from '../store/profile.store';

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

  const user = useProfileUser();
  const usersActions = useUserSearchActions();
  const users = useSearchResults();
  const isLoading = useIsLoadingUsers();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const getCellValue = useCallback(
    ({ item, key }: { item: UserType; key: string }) => {
      if (key === 'user') {
        const user = item as UserType;
        const isLoggedInUser = user.id === user.id;
        return (
          <Link href={`/search/users/${user.id}`} className="text-[unset]">
            <User
              avatarProps={{ radius: 'full', src: user.avatar || '' }}
              description={user.email}
              name={`${getUserDisplayName(user)} ${isLoggedInUser ? '(You)' : ''}`}
              className="cursor-pointer"
            >
              {user.email}
            </User>
          </Link>
        );
      }
      return getKeyValue(item, key) || 'N/A';
    },
    [user.id],
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