'use client';

import { Input, Tabs, Tab } from '@heroui/react';
import { Search } from 'lucide-react';
import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';
import type { Key } from 'react';

import useEventSearchWithInfiniteScroll from '@/hooks/useEventSearchWithInfiniteScroll';
import { useScrollPosition } from '@/hooks/useScrollPosition';

import EventsGrid from './EventsGrid';

const PARAM_KEY_EVENT_QUERY = 'eq';

const Events = () => {
  const [{ view, [PARAM_KEY_EVENT_QUERY]: eq }, setQueryStates] = useQueryStates({
    view: parseAsString.withDefault('list'),
    eq: parseAsString.withDefault(''),
  });

  const [inputValue, setInputValue] = useState(eq || '');
  const { setSearchTerm, events, totalCount, isLoading, scrollerRef } = useEventSearchWithInfiniteScroll();

  // Scroll position restoration - only enabled for list view
  const scrollContainerRef = useScrollPosition({
    key: 'events',
    enabled: view === 'list',
  });

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
    setQueryStates({ eq: value || null });
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
    setQueryStates({ eq: null });
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    setQueryStates({ view: viewKey === 'list' ? null : viewKey });
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <div className="flex h-fit items-center justify-center w-full">
        <Input
          isClearable
          onClear={handleClear}
          className="w-full max-w-sm"
          placeholder="Search by event name"
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
        selectedKey={view}
        onSelectionChange={handleViewChange}
      >
        <Tab key="list" title="List">
          <div className="flex flex-col gap-1 sm:gap-2">
            <p className="text-sm">
              Displaying {events?.length} of {totalCount} results
            </p>
            <div ref={scrollContainerRef} className="overflow-y-auto max-h-[calc(100vh-200px)]">
              <EventsGrid events={events} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
            </div>
          </div>
        </Tab>
        <Tab key="map" title="Map">
          <div className="rounded-lg shadow-lg overflow-hidden">
            <div className="flex flex-col gap-1 sm:gap-2">
              <p className="text-sm">Map view coming soon...</p>
              <div className="h-96 bg-gray-100 rounded-lg flex items-center justify-center">
                <p className="text-gray-500">Event map implementation coming soon</p>
              </div>
            </div>
          </div>
        </Tab>
      </Tabs>
    </div>
  );
};

export default Events;
