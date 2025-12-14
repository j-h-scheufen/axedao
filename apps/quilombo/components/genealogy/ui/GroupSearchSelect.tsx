'use client';

import { Avatar, Chip, Input, Spinner } from '@heroui/react';
import { debounce } from 'lodash';
import { CheckCircle, Search, X } from 'lucide-react';
import { useEffect, useMemo, useState } from 'react';

import { useSearchGroups } from '@/query/genealogyProfile';

type GroupSearchResult = {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
  isActive: boolean;
};

type GroupSearchSelectProps = {
  /** Callback when a group is selected */
  onSelect: (group: GroupSearchResult) => void;
  /** Callback to clear selection */
  onClear?: () => void;
  /** Currently selected group ID (for highlighting) */
  selectedId?: string | null;
  /** Label for the search input */
  label?: string;
  /** Placeholder text */
  placeholder?: string;
  /** Group profile IDs that the user is already a member of (disabled in results) */
  memberOfGroupIds?: string[];
};

/**
 * Reusable group search component with typeahead.
 * Searches genealogy.group_profiles for groups.
 */
const GroupSearchSelect = ({
  onSelect,
  onClear,
  selectedId,
  label = 'Search Group',
  placeholder = 'Type to search by group name...',
  memberOfGroupIds = [],
}: GroupSearchSelectProps) => {
  const [inputValue, setInputValue] = useState('');
  const [debouncedSearchTerm, setDebouncedSearchTerm] = useState('');
  const [selectedGroup, setSelectedGroup] = useState<GroupSearchResult | null>(null);

  // Debounce search term updates (300ms)
  const debouncedSetSearch = useMemo(() => debounce((term: string) => setDebouncedSearchTerm(term), 300), []);

  // Cleanup debounce on unmount
  useEffect(() => {
    return () => {
      debouncedSetSearch.cancel();
    };
  }, [debouncedSetSearch]);

  // Update debounced search when input changes
  useEffect(() => {
    debouncedSetSearch(inputValue);
  }, [inputValue, debouncedSetSearch]);

  const { data: searchResults, isFetching } = useSearchGroups(debouncedSearchTerm, {
    enabled: debouncedSearchTerm.length > 2,
    activeOnly: true, // Only show active groups (exclude historical/dissolved)
  });

  const handleSelect = (group: GroupSearchResult) => {
    setSelectedGroup(group);
    setInputValue('');
    setDebouncedSearchTerm('');
    onSelect(group);
  };

  const handleClear = () => {
    setSelectedGroup(null);
    setInputValue('');
    setDebouncedSearchTerm('');
    onClear?.();
  };

  return (
    <div className="space-y-3">
      {/* Selected group display */}
      {selectedGroup && (
        <div className="flex items-center gap-3 p-3 bg-primary-50 rounded-lg border border-primary-200">
          <Avatar src={selectedGroup.logo || undefined} name={selectedGroup.name} size="md" className="flex-shrink-0" />
          <div className="flex-grow min-w-0">
            <p className="text-sm font-semibold text-primary-900 truncate">{selectedGroup.name}</p>
            {selectedGroup.style && (
              <p className="text-xs text-primary-600 truncate capitalize">{selectedGroup.style}</p>
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
      {!selectedGroup && (
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
          {debouncedSearchTerm.length > 2 && searchResults && searchResults.length > 0 && (
            <div className="max-h-64 overflow-y-auto border border-default-200 rounded-lg divide-y divide-default-100">
              {searchResults.map((group) => {
                const isAlreadyMember = memberOfGroupIds.includes(group.id);
                return (
                  <button
                    key={group.id}
                    type="button"
                    disabled={isAlreadyMember}
                    className={`w-full text-left p-3 transition-colors flex items-center gap-3 ${
                      isAlreadyMember ? 'bg-default-50 cursor-not-allowed opacity-70' : 'hover:bg-default-100'
                    } ${selectedId === group.id ? 'bg-primary-50' : ''}`}
                    onClick={() => !isAlreadyMember && handleSelect(group)}
                  >
                    <Avatar src={group.logo || undefined} name={group.name} size="sm" className="flex-shrink-0" />
                    <div className="flex-grow min-w-0">
                      <p className="text-sm font-medium truncate">{group.name}</p>
                      {group.style && <p className="text-xs text-default-400 truncate capitalize">{group.style}</p>}
                    </div>
                    {isAlreadyMember && (
                      <Chip size="sm" color="success" variant="flat" startContent={<CheckCircle className="h-3 w-3" />}>
                        Member
                      </Chip>
                    )}
                  </button>
                );
              })}
            </div>
          )}

          {/* No results message */}
          {debouncedSearchTerm.length > 2 && searchResults && searchResults.length === 0 && !isFetching && (
            <p className="text-sm text-default-400 p-3 text-center">No matching groups found</p>
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

export default GroupSearchSelect;
