'use client';

import { Link } from '@nextui-org/link';
import { getKeyValue } from '@nextui-org/react';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { User } from '@nextui-org/user';
import { useCallback, useState } from 'react';
import { useDebounce } from 'use-debounce';

import { PATHS } from '@/config/constants';
import { useSearchUsers } from '@/query/user';
import { User as UserType } from '@/types/model';
import { getUserDisplayName } from '@/utils';
import { useProfileUser } from '../store/profile.store';
import useUserSearch from './useUserSearch';

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
  const user = useProfileUser();
  const [selectedRows, setSelectedRows] = useState<Set<string>>(new Set([]));
  const { searchTerm, setSearchTerm, users, isLoading, loaderRef, scrollerRef} = useUserSearch();

  const getCellValue = useCallback(
    ({ item, key }: { item: UserType; key: string }) => {
      if (key === 'user') {
        const user = item as UserType;
        const isLoggedInUser = user.id === user.id;
        return (
          <Link href={`${PATHS.users}/${user.id}`} className="text-[unset]">
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

  return {
    searchTerm,
    setSearchTerm,
    users,
    isLoading,
    selectedRows,
    setSelectedRows,
    columns,
    getCellValue,
    loaderRef,
    scrollerRef,
  };
};

export default useGlobalAdminUsersTable;
