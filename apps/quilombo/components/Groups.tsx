'use client';

import { Input } from '@heroui/react';
import { Search } from 'lucide-react';

import { SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import GroupsGrid from './GroupsGrid';
import { debounce } from 'lodash';
import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';

const Groups = () => {
  const { searchTerm, setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll();
  const debouncedSearch = debounce(setSearchTerm, SEARCH_INPUT_DEBOUNCE);

  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full md:max-w-sm"
          placeholder="Search by group name"
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
        Displaying {groups?.length} of {totalCount} results
      </div>
      <GroupsGrid groups={groups} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
    </div>
  );
};
export default Groups;
