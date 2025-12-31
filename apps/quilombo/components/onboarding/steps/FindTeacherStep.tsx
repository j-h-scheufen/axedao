'use client';

import { Avatar, Button, Input, Radio, RadioGroup, Spinner } from '@heroui/react';
import { ArrowLeft, Check, GraduationCap, Search, Sparkles, Users } from 'lucide-react';
import { useCallback, useEffect, useState } from 'react';

import { useDebouncedSearch } from '@/hooks/useDebouncedSearch';
import { useAddRelationship, useSearchPersons } from '@/query/genealogyProfile';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * Type-ahead search result for person profiles.
 */
interface PersonSearchResult {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
}

/**
 * Teacher relationship predicates with descriptions.
 */
const TEACHER_PREDICATES = [
  {
    value: 'student_of',
    label: 'Student of',
    description: 'Your primary mestre or teacher who formally trained you.',
    icon: GraduationCap,
  },
  {
    value: 'trained_under',
    label: 'Trained under',
    description: 'Someone you trained with but is not your primary teacher.',
    icon: Users,
  },
  {
    value: 'influenced_by',
    label: 'Influenced by',
    description: 'A mestre who influenced your journey without formal training.',
    icon: Sparkles,
  },
] as const;

type TeacherPredicate = (typeof TEACHER_PREDICATES)[number]['value'];

/**
 * Page 4b: Find Teacher Step
 *
 * Allows user to search for and select a teacher,
 * choose the relationship type, and create the relationship.
 */
export function FindTeacherStep() {
  const { goToStep, goBack, canGoBack, addRelationship, setError, state } = useOnboarding();
  const { error } = state;

  // Search state using existing hook
  const { inputValue, setInputValue, debouncedSearchTerm } = useDebouncedSearch();
  const [selectedPerson, setSelectedPerson] = useState<PersonSearchResult | null>(null);
  const [selectedPredicate, setSelectedPredicate] = useState<TeacherPredicate>('student_of');

  // Use react-query for search (historical persons excluded by default)
  const { data: searchResults = [], isFetching: isSearching } = useSearchPersons(debouncedSearchTerm, {
    enabled: debouncedSearchTerm.length >= 3 && !selectedPerson,
  });

  // Use react-query mutation for adding relationship
  const addRelationshipMutation = useAddRelationship();

  // Clear search results when selection is made
  const [displayResults, setDisplayResults] = useState<PersonSearchResult[]>([]);

  useEffect(() => {
    if (!selectedPerson && debouncedSearchTerm.length >= 3) {
      setDisplayResults(searchResults);
    } else if (selectedPerson || debouncedSearchTerm.length < 3) {
      setDisplayResults([]);
    }
  }, [searchResults, selectedPerson, debouncedSearchTerm]);

  // Handle search input change
  const handleSearchChange = (value: string) => {
    setInputValue(value);
    setSelectedPerson(null);
  };

  // Handle person selection
  const handleSelectPerson = (person: PersonSearchResult) => {
    setSelectedPerson(person);
    setInputValue(person.apelido || person.name || 'Unknown');
    setDisplayResults([]);
  };

  // Get display name for a person
  const getDisplayName = (person: PersonSearchResult) => {
    if (person.apelido && person.name) {
      return `${person.apelido} (${person.name})`;
    }
    return person.apelido || person.name || 'Unknown';
  };

  // Handle adding the relationship
  const handleConfirm = useCallback(async () => {
    if (!selectedPerson) return;

    setError(null);

    try {
      await addRelationshipMutation.mutateAsync({
        predicate: selectedPredicate,
        objectType: 'person',
        objectId: selectedPerson.id,
      });

      // Add to context for tracking
      addRelationship({
        predicate: selectedPredicate,
        objectId: selectedPerson.id,
        objectName: selectedPerson.apelido || selectedPerson.name || 'Unknown',
        objectType: 'person',
      });

      // Go to add more step
      goToStep('add-more');
    } catch (err) {
      const errorMessage =
        (err as { response?: { data?: { error?: string } } })?.response?.data?.error ||
        (err instanceof Error ? err.message : 'Failed to add teacher relationship');
      setError(errorMessage);
    }
  }, [selectedPerson, selectedPredicate, setError, addRelationship, goToStep, addRelationshipMutation]);

  const isSubmitting = addRelationshipMutation.isPending;

  return (
    <div className="space-y-5">
      {/* Intro */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Find Your Teacher</h2>
        <p className="text-sm text-default-500">Search for your mestre or teacher in the genealogy database.</p>
      </div>

      {/* Search input */}
      <div className="relative">
        <Input
          value={inputValue}
          onValueChange={handleSearchChange}
          placeholder="Search by name or apelido (min. 3 characters)..."
          startContent={<Search className="w-4 h-4 text-default-400" />}
          endContent={isSearching && <Spinner size="sm" />}
          size="lg"
          classNames={{
            inputWrapper: 'shadow-sm',
          }}
        />

        {/* Search results dropdown */}
        {displayResults.length > 0 && !selectedPerson && (
          <div className="absolute top-full left-0 right-0 z-50 mt-1 bg-background border border-default-200 rounded-lg shadow-lg max-h-64 overflow-y-auto">
            {displayResults.map((person) => (
              <button
                key={person.id}
                type="button"
                onClick={() => handleSelectPerson(person)}
                className="w-full flex items-center gap-3 p-3 hover:bg-default-100 transition-colors text-left"
              >
                <Avatar
                  src={person.portrait || undefined}
                  name={person.apelido || person.name || '?'}
                  size="sm"
                  classNames={{
                    base: 'bg-primary/10',
                  }}
                />
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-default-700 truncate">{getDisplayName(person)}</p>
                  {person.title && <p className="text-xs text-default-500 capitalize">{person.title}</p>}
                </div>
              </button>
            ))}
          </div>
        )}
      </div>

      {/* Selected person preview */}
      {selectedPerson && (
        <div className="p-4 rounded-xl bg-success/5 border border-success/20">
          <div className="flex items-center gap-3">
            <div className="shrink-0 p-2 rounded-full bg-success/10">
              <Check className="w-5 h-5 text-success" />
            </div>
            <div className="flex-1 min-w-0">
              <p className="font-medium text-default-700">{getDisplayName(selectedPerson)}</p>
              {selectedPerson.title && <p className="text-xs text-default-500 capitalize">{selectedPerson.title}</p>}
            </div>
          </div>
        </div>
      )}

      {/* No results message */}
      {inputValue.length >= 3 && !isSearching && displayResults.length === 0 && !selectedPerson && (
        <p className="text-sm text-default-400 text-center py-2">No teachers found. Try a different search term.</p>
      )}

      {/* Relationship type selection */}
      {selectedPerson && (
        <div className="space-y-3">
          <p className="text-sm font-medium text-default-700">How do you know this person?</p>
          <RadioGroup value={selectedPredicate} onValueChange={(val) => setSelectedPredicate(val as TeacherPredicate)}>
            {TEACHER_PREDICATES.map((pred) => (
              <Radio
                key={pred.value}
                value={pred.value}
                classNames={{
                  base: 'max-w-full m-0 p-3 rounded-xl bg-default-50 dark:bg-default-100/10 hover:bg-default-100 dark:hover:bg-default-100/20 cursor-pointer data-[selected=true]:bg-primary/5',
                  label: 'w-full',
                }}
              >
                <div className="flex items-start gap-3">
                  <pred.icon className="w-4 h-4 text-primary mt-0.5 shrink-0" />
                  <div>
                    <p className="font-medium text-default-700 text-sm">{pred.label}</p>
                    <p className="text-xs text-default-500">{pred.description}</p>
                  </div>
                </div>
              </Radio>
            ))}
          </RadioGroup>
        </div>
      )}

      {/* Error message */}
      {error && <div className="text-danger text-sm text-center">{error}</div>}

      {/* CTA button */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button
          color="primary"
          size="lg"
          onPress={handleConfirm}
          isDisabled={!selectedPerson || isSubmitting}
          isLoading={isSubmitting}
          className="min-w-[180px]"
        >
          Add Teacher
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

export default FindTeacherStep;
