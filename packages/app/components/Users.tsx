'use client';

import { Input } from '@nextui-org/input';
import { Search } from 'lucide-react';
import { useDebounce } from 'use-debounce';

import { useSearchUsers } from '@/query/user';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useState } from 'react';
import UsersGrid from './UsersGrid';

const Users = () => {
  const [searchTerm, setSearchTerm] = useState<string | undefined>();
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchUsers({
    searchTerm: debouncedSearchTerm,
  });
  const [, scrollerRef] = useInfiniteScroll({ hasMore: hasNextPage, onLoadMore: fetchNextPage });

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          isClearable
          onClear={() => setSearchTerm(undefined)}
          className="w-full md:max-w-sm"
          placeholder="Search"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={searchTerm || ''}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <UsersGrid
        users={data?.pages.flatMap((page) => page.data)}
        isLoading={isFetching || isFetchingNextPage}
        scrollerRef={scrollerRef}
      />
    </div>
  );
};
export default Users;
