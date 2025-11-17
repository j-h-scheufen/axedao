'use client';

import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';

import SearchBar from './SearchBar';
import UsersGrid from './UsersGrid';
import UserFilters, { type UserFilterValues } from './users/UserFilters';
import useUserSearchWithInfiniteScroll from '@/hooks/useUserSearchWithInfiniteScroll';
import { useScrollPosition } from '@/hooks/useScrollPosition';
import { PARAM_KEY_USER_QUERY } from '@/config/constants';

const Users = () => {
  const [{ [PARAM_KEY_USER_QUERY]: uq, titles: titlesParam }, setQueryStates] = useQueryStates({
    [PARAM_KEY_USER_QUERY]: parseAsString.withDefault(''),
    titles: parseAsString.withDefault(''),
  });

  const [inputValue, setInputValue] = useState(uq || '');

  // Parse filter values from URL params
  const [userFilters, setUserFilters] = useState<Partial<UserFilterValues>>({
    titles: titlesParam ? (titlesParam.split(',').filter(Boolean) as UserFilterValues['titles']) : undefined,
  });

  const { setSearchTerm, users, totalCount, isLoading, scrollerRef } = useUserSearchWithInfiniteScroll({
    filters: {
      titles: userFilters.titles && userFilters.titles.length > 0 ? userFilters.titles : undefined,
    },
  });

  // Scroll position restoration
  const scrollContainerRef = useScrollPosition({ key: 'users' });

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
    setQueryStates({ [PARAM_KEY_USER_QUERY]: value || null });
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
    setQueryStates({ [PARAM_KEY_USER_QUERY]: null });
  };

  const handleFiltersChange = (newFilters: Partial<UserFilterValues>) => {
    setUserFilters(newFilters);
    setQueryStates({
      titles: newFilters.titles && newFilters.titles.length > 0 ? newFilters.titles.join(',') : null,
    });
  };

  return (
    <div className="flex flex-col gap-4 mt-1 sm:mt-3">
      <div className="flex gap-2 items-center">
        <div className="flex-1 min-w-0">
          <SearchBar
            placeholder="Search by name or nickname"
            searchTerm={inputValue}
            onSearchChange={handleSearchChange}
            onClear={handleClear}
          />
        </div>
        <div className="flex-shrink-0">
          <UserFilters
            filters={userFilters}
            onFiltersChange={handleFiltersChange}
            isActive={!!(userFilters.titles && userFilters.titles.length > 0)}
          />
        </div>
      </div>
      <div>
        Displaying {users?.length} of {totalCount} results
      </div>
      <div ref={scrollContainerRef} className="overflow-visible">
        <UsersGrid users={users} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
      </div>
    </div>
  );
};

export default Users;
