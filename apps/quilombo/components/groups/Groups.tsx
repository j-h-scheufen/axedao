'use client';

import { Tabs, Tab } from '@heroui/react';
import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';
import { useAtomValue } from 'jotai';
import type { Key } from 'react';

import useGroupSearchWithInfiniteScroll from '@/hooks/useGroupSearchWithInfiniteScroll';
import { filteredLocationsAtom } from '@/hooks/state/location';
import { useScrollPosition } from '@/hooks/useScrollPosition';
import { useFetchAvailableCountries } from '@/query/group';

import { CountryFilter, FilterChipsContainer } from '@/components/filters';

import SearchBar from '@/components/SearchBar';
import GroupsGrid from '@/components/groups/GroupsGrid';
import GroupLocationsMap from '@/components/geocode/GroupLocationsMap';
import CountryFilterChip from '@/components/groups/CountryFilterChip';
import StylesFilterChip from '@/components/groups/StylesFilterChip';
import VerifiedFilterChip from '@/components/groups/VerifiedFilterChip';
import GroupFilters, { type GroupFilterValues } from '@/components/groups/GroupFilters';
import { PARAM_KEY_GROUP_QUERY } from '@/config/constants';
import type { Style } from '@/types/model';

const Groups = () => {
  const [{ view, [PARAM_KEY_GROUP_QUERY]: gq, countries, styles: stylesParam, verified }, setQueryStates] =
    useQueryStates({
      view: parseAsString.withDefault('list'),
      [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
      countries: parseAsString.withDefault(''),
      styles: parseAsString.withDefault(''),
      verified: parseAsString.withDefault(''),
    });

  const [inputValue, setInputValue] = useState(gq || '');
  const selectedCountries = countries ? countries.split(',').filter(Boolean) : [];

  // Parse filter values from URL params
  const [groupFilters, setGroupFilters] = useState<Partial<GroupFilterValues>>({
    styles: stylesParam ? (stylesParam.split(',').filter(Boolean) as Style[]) : undefined,
    verified: verified === 'true' ? true : verified === 'false' ? false : undefined,
  });

  const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } = useGroupSearchWithInfiniteScroll({
    filters: {
      countryCodes: selectedCountries.length > 0 ? selectedCountries : undefined,
      verified: groupFilters.verified,
      styles: groupFilters.styles && groupFilters.styles.length > 0 ? groupFilters.styles : undefined,
    },
  });

  const locations = useAtomValue(filteredLocationsAtom);

  // Fetch available countries for the filter
  const { data: countriesData, isLoading: isLoadingCountries } = useFetchAvailableCountries();

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

  const handleFiltersChange = (newFilters: Partial<GroupFilterValues>) => {
    setGroupFilters(newFilters);
    setQueryStates({
      styles: newFilters.styles && newFilters.styles.length > 0 ? newFilters.styles.join(',') : null,
      verified: newFilters.verified !== undefined ? String(newFilters.verified) : null,
    });
  };

  const handleClearStyles = () => {
    const newFilters = { ...groupFilters, styles: undefined };
    handleFiltersChange(newFilters);
  };

  const handleClearVerified = () => {
    const newFilters = { ...groupFilters, verified: undefined };
    handleFiltersChange(newFilters);
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    setQueryStates({ view: viewKey === 'list' ? null : viewKey });
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <div className="flex gap-2 items-center">
        <div className="flex-shrink-0">
          <CountryFilter
            selectedCountries={selectedCountries}
            onCountriesChange={handleCountriesChange}
            isActive={selectedCountries.length > 0}
            countryCodes={countriesData?.countryCodes || []}
            isLoading={isLoadingCountries}
          />
        </div>
        <div className="flex-1 min-w-0">
          <SearchBar
            placeholder="Search by group name"
            searchTerm={inputValue}
            onSearchChange={handleSearchChange}
            onClear={handleClear}
          />
        </div>
        <div className="flex-shrink-0">
          <GroupFilters
            filters={groupFilters}
            onFiltersChange={handleFiltersChange}
            isActive={(groupFilters.styles && groupFilters.styles.length > 0) || groupFilters.verified !== undefined}
          />
        </div>
      </div>

      {/* Active Filter Chips */}
      <FilterChipsContainer>
        {selectedCountries.length > 0 && (
          <CountryFilterChip selectedCountries={selectedCountries} onClear={handleClearCountries} />
        )}
        {groupFilters.styles && groupFilters.styles.length > 0 && (
          <StylesFilterChip
            selectedStyles={groupFilters.styles.filter((s): s is NonNullable<typeof s> => s !== undefined)}
            onClear={handleClearStyles}
          />
        )}
        {groupFilters.verified !== undefined && (
          <VerifiedFilterChip verified={groupFilters.verified} onClear={handleClearVerified} />
        )}
      </FilterChipsContainer>

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
