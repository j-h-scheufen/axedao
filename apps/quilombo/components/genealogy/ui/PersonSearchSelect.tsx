'use client';

import { Avatar, Input, Spinner } from '@heroui/react';
import { Search, X } from 'lucide-react';
import { useState } from 'react';

import { useDebouncedSearch } from '@/hooks/useDebouncedSearch';
import { useSearchPersons } from '@/query/genealogyProfile';

type PersonSearchResult = {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
};

type PersonSearchSelectProps = {
  /** Optional pre-filled search term (e.g., user's apelido) */
  initialSearchTerm?: string;
  /** Callback when a person is selected */
  onSelect: (person: PersonSearchResult) => void;
  /** Callback to clear selection */
  onClear?: () => void;
  /** Currently selected person ID (for highlighting) */
  selectedId?: string | null;
  /** Label for the search input */
  label?: string;
  /** Placeholder text */
  placeholder?: string;
  /** Whether to auto-search on mount if initialSearchTerm is provided */
  autoSearch?: boolean;
  /** Optional filter function to exclude certain profiles from results */
  filterResults?: (person: PersonSearchResult) => boolean;
  /** Only show claimable profiles (excludes deceased and already-claimed) */
  claimableOnly?: boolean;
  /** Profile ID to exclude from results (e.g., current user's profile) */
  excludeProfileId?: string | null;
};

/**
 * Reusable person search component with typeahead.
 * Displays portrait, title, apelido, and name in results.
 */
const PersonSearchSelect = ({
  initialSearchTerm = '',
  onSelect,
  onClear,
  selectedId,
  label = 'Search Person',
  placeholder = 'Type to search by apelido or name...',
  autoSearch = false,
  filterResults,
  claimableOnly = false,
  excludeProfileId,
}: PersonSearchSelectProps) => {
  const { inputValue, setInputValue, debouncedSearchTerm, clearSearch } = useDebouncedSearch({
    initialValue: initialSearchTerm,
    initialSearch: autoSearch ? initialSearchTerm : '',
  });
  const [selectedPerson, setSelectedPerson] = useState<PersonSearchResult | null>(null);

  const { data: searchResults, isFetching } = useSearchPersons(debouncedSearchTerm, {
    enabled: debouncedSearchTerm.length > 2,
    claimableOnly,
  });

  // Filter results: exclude specified profile ID and apply custom filter if provided
  const filteredResults = searchResults?.filter((person) => {
    if (excludeProfileId && person.id === excludeProfileId) return false;
    if (filterResults && !filterResults(person)) return false;
    return true;
  });

  const getDisplayName = (person: PersonSearchResult) => {
    return person.apelido || person.name || 'Unknown';
  };

  const handleSelect = (person: PersonSearchResult) => {
    setSelectedPerson(person);
    clearSearch();
    onSelect(person);
  };

  const handleClear = () => {
    setSelectedPerson(null);
    clearSearch();
    onClear?.();
  };

  return (
    <div className="space-y-3">
      {/* Selected person display */}
      {selectedPerson && (
        <div className="flex items-center gap-3 p-3 bg-primary-50 rounded-lg border border-primary-200">
          <Avatar
            src={selectedPerson.portrait || undefined}
            name={getDisplayName(selectedPerson)}
            size="md"
            className="flex-shrink-0"
          />
          <div className="flex-grow min-w-0">
            {selectedPerson.title && (
              <p className="text-xs text-primary-600 capitalize tracking-wide">{selectedPerson.title}</p>
            )}
            <p className="text-sm font-semibold text-primary-900 truncate">{getDisplayName(selectedPerson)}</p>
            {selectedPerson.name && selectedPerson.apelido && (
              <p className="text-xs text-primary-600 truncate">{selectedPerson.name}</p>
            )}
          </div>
          <button
            type="button"
            onClick={handleClear}
            className="p-1 hover:bg-primary-100 rounded-full transition-colors"
            aria-label="Clear selection"
          >
            <X className="h-4 w-4 text-primary-600" />
          </button>
        </div>
      )}

      {/* Search input */}
      {!selectedPerson && (
        <>
          <Input
            label={label}
            placeholder={placeholder}
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            startContent={<Search className="h-4 w-4 text-default-400" />}
            endContent={isFetching && <Spinner size="sm" />}
          />

          {/* Search results */}
          {debouncedSearchTerm.length > 2 && filteredResults && filteredResults.length > 0 && (
            <div className="max-h-64 overflow-y-auto border border-default-200 rounded-lg divide-y divide-default-100">
              {filteredResults.map((person) => (
                <button
                  key={person.id}
                  type="button"
                  className={`w-full text-left p-3 hover:bg-default-100 transition-colors flex items-center gap-3 ${
                    selectedId === person.id ? 'bg-primary-50' : ''
                  }`}
                  onClick={() => handleSelect(person)}
                >
                  <Avatar
                    src={person.portrait || undefined}
                    name={getDisplayName(person)}
                    size="sm"
                    className="flex-shrink-0"
                  />
                  <div className="flex-grow min-w-0">
                    {person.title && (
                      <p className="text-xs text-default-500 capitalize tracking-wide">{person.title}</p>
                    )}
                    <p className="text-sm font-medium truncate">{getDisplayName(person)}</p>
                    {person.name && person.apelido && (
                      <p className="text-xs text-default-400 truncate">{person.name}</p>
                    )}
                  </div>
                </button>
              ))}
            </div>
          )}

          {/* No results message */}
          {debouncedSearchTerm.length > 2 && filteredResults && filteredResults.length === 0 && !isFetching && (
            <p className="text-sm text-default-400 p-3 text-center">No matching profiles found</p>
          )}

          {/* Minimum characters hint */}
          {inputValue.length > 0 && inputValue.length <= 2 && (
            <p className="text-xs text-default-400 px-1">Type at least 3 characters to search</p>
          )}
        </>
      )}
    </div>
  );
};

export default PersonSearchSelect;
