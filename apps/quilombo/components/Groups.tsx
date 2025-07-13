'use client';

import { Input, Tabs, Tab } from '@heroui/react';
import { Search } from 'lucide-react';
import { useState } from 'react';

import GroupsGrid from './GroupsGrid';
import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';
import GroupLocationsMap from './geocode/GroupLocationsMap';
import { useAtomValue } from 'jotai';
import { filteredLocationsAtom } from '@/hooks/state/location';

const Groups = () => {
  const [inputValue, setInputValue] = useState('');
  const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll();
  const locations = useAtomValue(filteredLocationsAtom);

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <div className="flex h-fit items-center justify-center w-full">
        <Input
          isClearable
          onClear={() => {
            setInputValue('');
            setSearchTerm('');
          }}
          className="w-full max-w-sm"
          placeholder="Search by group name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={inputValue}
          onChange={(e) => {
            const value = e.target.value;
            setInputValue(value);
            setSearchTerm(value);
          }}
        />
      </div>
      <Tabs aria-label="List / Map View" fullWidth classNames={{ panel: 'px-0 py-0' }}>
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
