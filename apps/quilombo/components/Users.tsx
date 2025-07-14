'use client';

import { Input } from '@heroui/react';
import { Search } from 'lucide-react';
import { useState } from 'react';
import { useSearchParams } from 'next/navigation';

import UsersGrid from './UsersGrid';
import useUserSearchWithInfiniteScroll from '@/hooks/useUserSearchWithInfiniteScroll';

const Users = () => {
  const searchParams = useSearchParams();
  const urlSearchTerm = searchParams.get('uq') || '';

  const [inputValue, setInputValue] = useState(urlSearchTerm);
  const { setSearchTerm, users, totalCount, isLoading, scrollerRef } = useUserSearchWithInfiniteScroll();

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
  };

  return (
    <div className="flex flex-col gap-4 mt-1 sm:mt-3">
      <div className="flex h-fit items-center justify-center w-full">
        <Input
          isClearable
          onClear={handleClear}
          className="w-full max-w-sm"
          placeholder="Search by name or nickname"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={inputValue}
          onChange={(e) => handleSearchChange(e.target.value)}
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
