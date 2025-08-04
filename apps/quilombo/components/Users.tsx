'use client';

import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';

import SearchBar from './SearchBar';
import UsersGrid from './UsersGrid';
import useUserSearchWithInfiniteScroll from '@/hooks/useUserSearchWithInfiniteScroll';
import { useScrollPosition } from '@/hooks/useScrollPosition';
import { PARAM_KEY_USER_QUERY } from '@/config/constants';

const Users = () => {
  const [{ [PARAM_KEY_USER_QUERY]: uq }, setQueryStates] = useQueryStates({
    [PARAM_KEY_USER_QUERY]: parseAsString.withDefault(''),
  });

  const [inputValue, setInputValue] = useState(uq || '');
  const { setSearchTerm, users, totalCount, isLoading, scrollerRef } = useUserSearchWithInfiniteScroll();

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

  return (
    <div className="flex flex-col gap-4 mt-1 sm:mt-3">
      <SearchBar
        placeholder="Search by name or nickname"
        searchTerm={inputValue}
        onSearchChange={handleSearchChange}
        onClear={handleClear}
      />
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
