'use client';

import { Tabs, Tab } from '@heroui/react';
import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';
import { useAtomValue } from 'jotai';
import type { Key } from 'react';

import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';
import { filteredLocationsAtom } from '@/hooks/state/location';
import { useScrollPosition } from '@/hooks/useScrollPosition';

import SearchBar from './SearchBar';
import FilterButton from './FilterButton';
import GroupsGrid from './GroupsGrid';
import GroupLocationsMap from './geocode/GroupLocationsMap';
import { PARAM_KEY_GROUP_QUERY } from '@/config/constants';

const Groups = () => {
  const [{ view, [PARAM_KEY_GROUP_QUERY]: gq }, setQueryStates] = useQueryStates({
    view: parseAsString.withDefault('list'),
    [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
  });

  const [inputValue, setInputValue] = useState(gq || '');
  const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll();
  const locations = useAtomValue(filteredLocationsAtom);

  // Scroll position restoration - only enabled for list view
  const scrollContainerRef = useScrollPosition({
    key: 'groups',
    enabled: view === 'list',
  });

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
    setQueryStates({ [PARAM_KEY_GROUP_QUERY]: value || null });
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
    setQueryStates({ [PARAM_KEY_GROUP_QUERY]: null });
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    setQueryStates({ view: viewKey === 'list' ? null : viewKey });
  };

  const handleFilterClick = () => {
    // TODO: Implement filter functionality for groups
    console.log('Group filter clicked');
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <SearchBar
        placeholder="Search by group name"
        searchTerm={inputValue}
        onSearchChange={handleSearchChange}
        onClear={handleClear}
        filterContent={<FilterButton onPress={handleFilterClick} />}
      />
      <Tabs
        aria-label="List / Map View"
        fullWidth
        classNames={{ panel: 'px-0 py-0' }}
        selectedKey={view}
        onSelectionChange={handleViewChange}
      >
        <Tab key="list" title="List">
          <div className="flex flex-col gap-1 sm:gap-2">
            <p className="text-sm">
              Displaying {groups?.length} of {totalCount} results
            </p>
            <div ref={scrollContainerRef} className="overflow-visible">
              <GroupsGrid groups={groups} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
            </div>
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
