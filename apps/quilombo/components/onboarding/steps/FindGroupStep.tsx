'use client';

import { Avatar, Button, Input, Spinner } from '@heroui/react';
import { ArrowLeft, Building2, Check, Search } from 'lucide-react';
import { useCallback, useEffect, useState } from 'react';

import { useDebouncedSearch } from '@/hooks/useDebouncedSearch';
import { useAddRelationship, useSearchGroups } from '@/query/genealogyProfile';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * Type-ahead search result for group profiles.
 */
interface GroupSearchResult {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
  isActive: boolean;
}

/**
 * Page 4a: Find Group Step
 *
 * Allows user to search for and select their capoeira group,
 * then creates a member_of relationship.
 */
export function FindGroupStep() {
  const { goToStep, goBack, canGoBack, addRelationship, setError, state } = useOnboarding();
  const { error } = state;

  // Search state using existing hook
  const { inputValue, setInputValue, debouncedSearchTerm } = useDebouncedSearch();
  const [selectedGroup, setSelectedGroup] = useState<GroupSearchResult | null>(null);

  // Use react-query for search (activeOnly=true to exclude historical groups)
  const { data: searchResults = [], isFetching: isSearching } = useSearchGroups(debouncedSearchTerm, {
    activeOnly: true,
    enabled: debouncedSearchTerm.length >= 3 && !selectedGroup,
  });

  // Use react-query mutation for adding relationship
  const addRelationshipMutation = useAddRelationship();

  // Clear search results when selection is made
  const [displayResults, setDisplayResults] = useState<GroupSearchResult[]>([]);

  useEffect(() => {
    if (!selectedGroup && debouncedSearchTerm.length >= 3) {
      setDisplayResults(searchResults);
    } else if (selectedGroup || debouncedSearchTerm.length < 3) {
      setDisplayResults([]);
    }
  }, [searchResults, selectedGroup, debouncedSearchTerm]);

  // Handle search input change
  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSelectedGroup(null);
  };

  // Handle group selection
  const handleSelectGroup = (group: GroupSearchResult) => {
    setSelectedGroup(group);
    setInputValue(group.name);
    setDisplayResults([]);
  };

  // Handle adding the relationship
  const handleConfirm = useCallback(async () => {
    if (!selectedGroup) return;

    setError(null);

    try {
      await addRelationshipMutation.mutateAsync({
        predicate: 'member_of',
        objectType: 'group',
        objectId: selectedGroup.id,
      });

      // Add to context for tracking
      addRelationship({
        predicate: 'member_of',
        objectId: selectedGroup.id,
        objectName: selectedGroup.name,
        objectType: 'group',
      });

      // Go to add more step
      goToStep('add-more');
    } catch (err) {
      const errorMessage =
        (err as { response?: { data?: { error?: string } } })?.response?.data?.error ||
        (err instanceof Error ? err.message : 'Failed to add group membership');
      setError(errorMessage);
    }
  }, [selectedGroup, setError, addRelationship, goToStep, addRelationshipMutation]);

  const isSubmitting = addRelationshipMutation.isPending;

  return (
    <div className="space-y-5">
      {/* Intro */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Find Your Group</h2>
        <p className="text-sm text-default-500">
          Search for your capoeira group in the genealogy database. Start typing to search.
        </p>
      </div>

      {/* Search input */}
      <div className="relative">
        <Input
          value={inputValue}
          onValueChange={handleSearchChange}
          placeholder="Search for a group (min. 3 characters)..."
          startContent={<Search className="w-4 h-4 text-default-400" />}
          endContent={isSearching && <Spinner size="sm" />}
          size="lg"
          classNames={{
            inputWrapper: 'shadow-sm',
          }}
        />

        {/* Search results dropdown */}
        {displayResults.length > 0 && !selectedGroup && (
          <div className="absolute top-full left-0 right-0 z-50 mt-1 bg-background border border-default-200 rounded-lg shadow-lg max-h-64 overflow-y-auto">
            {displayResults.map((group) => (
              <button
                key={group.id}
                type="button"
                onClick={() => handleSelectGroup(group)}
                className="w-full flex items-center gap-3 p-3 hover:bg-default-100 transition-colors text-left"
              >
                <Avatar
                  src={group.logo || undefined}
                  name={group.name}
                  icon={<Building2 className="w-5 h-5" />}
                  size="sm"
                  classNames={{
                    base: 'bg-primary/10',
                    icon: 'text-primary',
                  }}
                />
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-default-700 truncate">{group.name}</p>
                  {group.style && <p className="text-xs text-default-500 capitalize">{group.style}</p>}
                </div>
                {!group.isActive && <span className="text-xs text-default-400 italic">Inactive</span>}
              </button>
            ))}
          </div>
        )}
      </div>

      {/* Selected group preview */}
      {selectedGroup && (
        <div className="p-4 rounded-xl bg-success/5 border border-success/20">
          <div className="flex items-center gap-3">
            <div className="shrink-0 p-2 rounded-full bg-success/10">
              <Check className="w-5 h-5 text-success" />
            </div>
            <div className="flex-1 min-w-0">
              <p className="font-medium text-default-700">{selectedGroup.name}</p>
              {selectedGroup.style && <p className="text-xs text-default-500 capitalize">{selectedGroup.style}</p>}
            </div>
          </div>
        </div>
      )}

      {/* No results message */}
      {inputValue.length >= 3 && !isSearching && displayResults.length === 0 && !selectedGroup && (
        <p className="text-sm text-default-400 text-center py-2">No groups found. Try a different search term.</p>
      )}

      {/* Error message */}
      {error && <div className="text-danger text-sm text-center">{error}</div>}

      {/* CTA button */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button
          color="primary"
          size="lg"
          onPress={handleConfirm}
          isDisabled={!selectedGroup || isSubmitting}
          isLoading={isSubmitting}
          className="min-w-[180px]"
        >
          Add Group
        </Button>
      </div>

      {/* Back button - fixed on mobile */}
      {canGoBack && (
        <div className="fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 pt-3 border-t border-default-200 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0 md:pt-4 md:border-t-0">
          <Button variant="light" color="default" startContent={<ArrowLeft className="w-4 h-4" />} onPress={goBack}>
            Back
          </Button>
        </div>
      )}
    </div>
  );
}

export default FindGroupStep;
