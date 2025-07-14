'use client';

import { Input, Tabs, Tab } from '@heroui/react';
import { Search } from 'lucide-react';
import { useState } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import type { Key } from 'react';

import GroupsGrid from './GroupsGrid';
import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';
import GroupLocationsMap from './geocode/GroupLocationsMap';
import { useAtomValue } from 'jotai';
import { filteredLocationsAtom } from '@/hooks/state/location';

const Groups = () => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const urlView = searchParams.get('view') || 'list';
  const urlSearchTerm = searchParams.get('gq') || '';

  const [inputValue, setInputValue] = useState(urlSearchTerm);
  const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll();
  const locations = useAtomValue(filteredLocationsAtom);

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    const params = new URLSearchParams(searchParams);
    if (viewKey === 'list') {
      params.delete('view');
    } else {
      params.set('view', viewKey);
    }
    router.replace(`?${params.toString()}`, { scroll: false });
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <div className="flex h-fit items-center justify-center w-full">
        <Input
          isClearable
          onClear={handleClear}
          className="w-full max-w-sm"
          placeholder="Search by group name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={inputValue}
          onChange={(e) => handleSearchChange(e.target.value)}
        />
      </div>
      <Tabs
        aria-label="List / Map View"
        fullWidth
        classNames={{ panel: 'px-0 py-0' }}
        selectedKey={urlView}
        onSelectionChange={handleViewChange}
      >
        <Tab key="list" title="List">
          <div className="flex flex-col gap-1 sm:gap-2">
            <p className="text-sm">
              Displaying {groups?.length} of {totalCount} results
            </p>
            <GroupsGrid groups={groups} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
          </div>
        </Tab>
        <Tab key="map" title="Map">
          <div className="rounded-lg shadow-lg overflow-hidden">
            {locations && (
              <div className="flex flex-col gap-1 sm:gap-2">
                <p className="text-sm">Displaying {locations.features.length} group locations</p>
                <GroupLocationsMap locations={locations} />
              </div>
            )}
          </div>
        </Tab>
      </Tabs>
    </div>
  );
};

export default Groups;
