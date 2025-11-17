'use client';

import { Tabs, Tab, Button } from '@heroui/react';
import { Plus } from 'lucide-react';
import { useState } from 'react';
import { parseAsString, useQueryStates } from 'nuqs';
import type { Key } from 'react';

import useEventSearchWithInfiniteScroll from '@/hooks/useEventSearchWithInfiniteScroll';
import { useScrollPosition } from '@/hooks/useScrollPosition';
import { PARAM_KEY_EVENT_QUERY } from '@/config/constants';
import { useCreateEventMutation, useFetchEventLocations } from '@/query/event';
import type { CreateEventForm } from '@/config/validation-schema';

import SearchBar from '@/components/SearchBar';
import CountryFilter from '@/components/groups/CountryFilter';
import CountryFilterChip from '@/components/groups/CountryFilterChip';
import EventFilters, { type EventFilterValues } from './EventFilters';
import CreateEventModal from './CreateEventModal';
import EventsGrid from './EventsGrid';
import EventsMap from './EventsMap';

const Events = () => {
  const [{ view, [PARAM_KEY_EVENT_QUERY]: eq, countries, eventTypes: eventTypesParam }, setQueryStates] =
    useQueryStates({
      view: parseAsString.withDefault('list'),
      [PARAM_KEY_EVENT_QUERY]: parseAsString.withDefault(''),
      countries: parseAsString.withDefault(''),
      eventTypes: parseAsString.withDefault(''),
    });

  const [inputValue, setInputValue] = useState(eq || '');
  const selectedCountries = countries ? countries.split(',').filter(Boolean) : [];

  // Parse filter values from URL params
  const [eventFilters, setEventFilters] = useState<Partial<EventFilterValues>>({
    eventTypes: eventTypesParam
      ? (eventTypesParam.split(',').filter(Boolean) as Array<'general' | 'workshop' | 'batizado' | 'public_roda'>)
      : undefined,
  });

  const { setSearchTerm, events, totalCount, isLoading, scrollerRef } = useEventSearchWithInfiniteScroll({
    filters: {
      countryCodes: selectedCountries.length > 0 ? selectedCountries : undefined,
      eventTypes: eventFilters.eventTypes && eventFilters.eventTypes.length > 0 ? eventFilters.eventTypes : undefined,
    },
  });
  const [isEventModalOpen, setIsEventModalOpen] = useState(false);

  const createEventMutation = useCreateEventMutation();

  // Fetch event locations for map view with same search parameters
  const { data: eventLocations, isLoading: isLoadingLocations } = useFetchEventLocations({
    searchTerm: eq || undefined,
    showActiveOnly: true,
  });

  // Scroll position restoration - only enabled for list view
  const scrollContainerRef = useScrollPosition({
    key: 'events',
    enabled: view === 'list',
  });

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSearchTerm(value);
    setQueryStates({ [PARAM_KEY_EVENT_QUERY]: value || null });
  };

  const handleClear = () => {
    setInputValue('');
    setSearchTerm('');
    setQueryStates({ [PARAM_KEY_EVENT_QUERY]: null });
  };

  const handleViewChange = (key: Key) => {
    const viewKey = String(key);
    setQueryStates({ view: viewKey === 'list' ? null : viewKey });
  };

  const handleCountriesChange = (newCountries: string[]) => {
    setQueryStates({
      countries: newCountries.length > 0 ? newCountries.join(',') : null,
    });
  };

  const handleClearCountries = () => {
    setQueryStates({ countries: null });
  };

  const handleFiltersChange = (newFilters: Partial<EventFilterValues>) => {
    setEventFilters(newFilters);
    setQueryStates({
      eventTypes: newFilters.eventTypes && newFilters.eventTypes.length > 0 ? newFilters.eventTypes.join(',') : null,
    });
  };

  const handleNewEventClick = () => {
    setIsEventModalOpen(true);
  };

  const handleEventSubmit = async (data: CreateEventForm | FormData) => {
    try {
      await createEventMutation.mutateAsync(data);
      setIsEventModalOpen(false);
      // TODO: Show success message
    } catch (error) {
      console.error('Failed to create event:', error);
      // TODO: Show error message
    }
  };

  const newEventButton = (
    <>
      {/* Mobile: Icon-only button */}
      <Button color="primary" size="sm" isIconOnly onPress={handleNewEventClick} className="flex-1 sm:hidden">
        <Plus className="h-4 w-4" />
      </Button>

      {/* Desktop: Button with icon and text */}
      <Button
        color="primary"
        size="sm"
        startContent={<Plus className="h-4 w-4" />}
        onPress={handleNewEventClick}
        className="hidden sm:flex sm:flex-none"
      >
        New Event
      </Button>
    </>
  );

  return (
    <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
      <div className="flex gap-2 items-center">
        <div className="flex-shrink-0">
          <CountryFilter
            selectedCountries={selectedCountries}
            onCountriesChange={handleCountriesChange}
            isActive={selectedCountries.length > 0}
          />
        </div>
        <div className="flex-1 min-w-0">
          <SearchBar
            placeholder="Search by event name"
            searchTerm={inputValue}
            onSearchChange={handleSearchChange}
            onClear={handleClear}
            rightContent={newEventButton}
          />
        </div>
        <div className="flex-shrink-0">
          <EventFilters
            filters={eventFilters}
            onFiltersChange={handleFiltersChange}
            isActive={!!(eventFilters.eventTypes && eventFilters.eventTypes.length > 0)}
          />
        </div>
      </div>

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
              Displaying {events?.length} of {totalCount} results
            </p>
            <div ref={scrollContainerRef} className="overflow-visible">
              <EventsGrid events={events} isLoading={isLoading} scrollerRef={scrollerRef || undefined} />
            </div>
          </div>
        </Tab>
        <Tab key="map" title="Map">
          <div className="flex flex-col gap-1 sm:gap-2">
            <p className="text-sm">Displaying {eventLocations?.features.length || 0} events on map</p>
            <div className="rounded-lg shadow-lg overflow-hidden">
              {isLoadingLocations ? (
                <div className="h-96 bg-gray-100 rounded-lg flex items-center justify-center">
                  <p className="text-gray-500">Loading events map...</p>
                </div>
              ) : eventLocations ? (
                <EventsMap eventLocations={eventLocations} />
              ) : (
                <div className="h-96 bg-gray-50 rounded-lg flex items-center justify-center">
                  <p className="text-gray-500">No events found</p>
                </div>
              )}
            </div>
          </div>
        </Tab>
      </Tabs>

      <CreateEventModal
        isOpen={isEventModalOpen}
        onOpenChange={setIsEventModalOpen}
        onSubmit={handleEventSubmit}
        isSubmitting={createEventMutation.isPending}
      />
    </div>
  );
};

export default Events;
