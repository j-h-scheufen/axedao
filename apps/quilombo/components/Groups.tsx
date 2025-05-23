'use client';

import { Input } from '@heroui/react';
import { useInfiniteScroll } from '@heroui/use-infinite-scroll';
import { useAtom, useAtomValue } from 'jotai';
import { debounce } from 'lodash';
import { Search } from 'lucide-react';
import { useEffect, useMemo, useRef } from 'react';

import { SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import { groupSearchResultsAtom, groupSearchTermAtom } from '@/hooks/state/search';
import GroupsGrid from './GroupsGrid';

const Groups = () => {
  const inputRef = useRef<HTMLInputElement>(null);
  const [searchTerm, setSearchTerm] = useAtom(groupSearchTermAtom);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useAtomValue(groupSearchResultsAtom);
  const [, scrollerRef] = useInfiniteScroll({ hasMore: hasNextPage, onLoadMore: fetchNextPage });
  const groups = useMemo(() => data?.pages.flatMap((page) => page.data), [data]);
  const debouncedSearch = debounce(setSearchTerm, SEARCH_INPUT_DEBOUNCE);

  useEffect(() => {
    if (inputRef.current && searchTerm) inputRef.current.value = searchTerm;
  });

  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          ref={inputRef}
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full md:max-w-sm"
          placeholder="Search by group name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          onChange={(e) => {
            if (e.target.value !== searchTerm) debouncedSearch(e.target.value);
          }}
        />
      </div>
      <GroupsGrid groups={groups} isLoading={isFetching || isFetchingNextPage} scrollerRef={scrollerRef} />
    </div>
  );
};
export default Groups;
