'use client';

import { Input } from '@heroui/react';
import { Search } from 'lucide-react';

import { SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import UsersGrid from './UsersGrid';
import { debounce } from 'lodash';
import useUserSearchWithInfiniteScroll from '@/hooks/useUserSearchWithInfiniteScroll';

const Users = () => {
  const { searchTerm, setSearchTerm, users, totalCount, isLoading, scrollerRef } = useUserSearchWithInfiniteScroll();
  const debouncedSearch = debounce(setSearchTerm, SEARCH_INPUT_DEBOUNCE);

  return (
    <div className="flex flex-col gap-4 mt-1 sm:mt-3">
      <div className="flex h-fit items-center justify-center w-full">
        <Input
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full max-w-sm"
          placeholder="Search by name or nickname"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={searchTerm || ''}
          onChange={(e) => {
            const value = e.target.value;
            if (value !== searchTerm) debouncedSearch(value);
          }}
        />
      </div>
      <div>
        Displaying {users?.length} of {totalCount} results
      </div>
      <UsersGrid users={users} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
    </div>
  );
};
export default Users;
