import { debounce } from 'lodash';
import { useEffect, useMemo, useState } from 'react';

/**
 * Custom hook for managing debounced search input.
 * Provides input value state, debounced search term, and handlers for clearing.
 *
 * @param options.initialValue - Initial input value (default: '')
 * @param options.initialSearch - Initial debounced search term (for auto-search scenarios)
 * @param options.delay - Debounce delay in milliseconds (default: 300)
 * @returns Object containing input value, debounced term, setters, and clear function
 *
 * @example
 * ```typescript
 * const { inputValue, debouncedSearchTerm, setInputValue, clearSearch } = useDebouncedSearch({
 *   initialValue: user?.apelido,
 *   initialSearch: autoSearch ? user?.apelido : '',
 *   delay: 300
 * });
 * ```
 */
export function useDebouncedSearch(options: { initialValue?: string; initialSearch?: string; delay?: number } = {}) {
  const { initialValue = '', initialSearch = '', delay = 300 } = options;

  const [inputValue, setInputValue] = useState(initialValue);
  const [debouncedSearchTerm, setDebouncedSearchTerm] = useState(initialSearch);

  // Debounce search term updates
  const debouncedSetSearch = useMemo(() => debounce((term: string) => setDebouncedSearchTerm(term), delay), [delay]);

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

  /**
   * Clears both input value and debounced search term
   */
  const clearSearch = () => {
    setInputValue('');
    setDebouncedSearchTerm('');
  };

  return {
    inputValue,
    setInputValue,
    debouncedSearchTerm,
    setDebouncedSearchTerm,
    clearSearch,
  };
}
