'use client';

import { Input } from '@nextui-org/input';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useAtom, useAtomValue } from 'jotai';
import { debounce } from 'lodash';
import { Search } from 'lucide-react';
import { useEffect, useMemo, useRef } from 'react';

import { SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import { userSearchResultsAtom, userSearchTermAtom } from '@/hooks/state/search';
import UsersGrid from './UsersGrid';

const Users = () => {
  const inputRef = useRef<HTMLInputElement>(null);
  const [searchTerm, setSearchTerm] = useAtom(userSearchTermAtom);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useAtomValue(userSearchResultsAtom);
  const [, scrollerRef] = useInfiniteScroll({ hasMore: hasNextPage, onLoadMore: fetchNextPage });
  const users = useMemo(() => data?.pages.flatMap((page) => page.data), [data]);
  const debouncedSearch = debounce(setSearchTerm, SEARCH_INPUT_DEBOUNCE);

  useEffect(() => {
    if (inputRef.current && searchTerm) inputRef.current.value = searchTerm;
  });

  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          ref={inputRef}
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full md:max-w-sm"
          placeholder="Search by name or nickname"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          onChange={(e) => {
            if (e.target.value !== searchTerm) debouncedSearch(e.target.value);
          }}
        />
      </div>
      <UsersGrid users={users} isLoading={isFetching || isFetchingNextPage} scrollerRef={scrollerRef} />
    </div>
  );
};
export default Users;
