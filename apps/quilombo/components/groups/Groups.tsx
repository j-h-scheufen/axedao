'use client';

import { Tabs, Tab } from '@heroui/react';
import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';
import { useAtomValue } from 'jotai';
import type { Key } from 'react';

import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';
import { filteredLocationsAtom } from '@/hooks/state/location';
import { useScrollPosition } from '@/hooks/useScrollPosition';

import SearchBar from '@/components/SearchBar';
import FilterButton from '@/components/FilterButton';
import GroupsGrid from '@/components/groups/GroupsGrid';
import GroupLocationsMap from '@/components/geocode/GroupLocationsMap';
import CountryFilter from '@/components/groups/CountryFilter';
import CountryFilterChip from '@/components/groups/CountryFilterChip';
import { PARAM_KEY_GROUP_QUERY } from '@/config/constants';

const Groups = () => {
  const [{ view, [PARAM_KEY_GROUP_QUERY]: gq, countries }, setQueryStates] = useQueryStates({
    view: parseAsString.withDefault('list'),
    [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
    countries: parseAsString.withDefault(''),
  });

  const [inputValue, setInputValue] = useState(gq || '');
  const selectedCountries = countries ? countries.split(',').filter(Boolean) : [];

  const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll({
    countryCodes: selectedCountries.length > 0 ? selectedCountries : undefined,
  });

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

  const handleCountriesChange = (newCountries: string[]) => {
    setQueryStates({
      countries: newCountries.length > 0 ? newCountries.join(',') : null,
    });
  };

  const handleClearCountries = () => {
    setQueryStates({ countries: null });
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    setQueryStates({ view: viewKey === 'list' ? null : viewKey });
  };

  const handleFilterClick = () => {
    // TODO: Implement filter functionality for groups (verification, style, etc.)
    console.log('Group filter clicked');
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <SearchBar
        placeholder="Search by group name"
        searchTerm={inputValue}
        onSearchChange={handleSearchChange}
        onClear={handleClear}
        leftContent={
          <CountryFilter
            selectedCountries={selectedCountries}
            onCountriesChange={handleCountriesChange}
            isActive={selectedCountries.length > 0}
          />
        }
        filterContent={<FilterButton onPress={handleFilterClick} />}
      />

      {/* Active Filter Chip */}
      {selectedCountries.length > 0 && (
        <CountryFilterChip selectedCountries={selectedCountries} onClear={handleClearCountries} />
      )}

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
