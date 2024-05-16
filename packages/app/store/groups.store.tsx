import { create } from 'zustand';

import { Group } from '@/types/model';

export type GroupsState = {
  searchResults: Group[];
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  initialized: boolean;
};

type GroupsActions = {
  initialize: () => Promise<void>;
  loadNextPage: () => Promise<void>;
};

export type SearchStore = GroupsState & { actions: GroupsActions };

const DEFAULT_PROPS: GroupsState = {
  searchResults: [],
  pageSize: 20,
  hasMoreResults: false,
  initialized: false,
};

const useSearchStore = create<SearchStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (): Promise<void> => {
      if (!get().initialized) {
        get().actions.loadNextPage();
        set(() => ({ initialized: true }));
      }
    },
    loadNextPage: async (): Promise<void> => {
      try {
        const pageSize = get().pageSize;
        const offset = get().searchResults.length;
        const response = await fetch(`/api/groups?offset=${offset}&limit=${pageSize}`);
        const results = await response.json();
        if (results.length > 0) {
          set((state) => ({
            searchResults: [...state.searchResults, ...results],
          }));
        }
        // If a full pageSize of results was retrieved, there are likely more results, so setting true.
        // The exception is if the total result size % pageSize === 0
        // in which case the user receives the correct feedback on the next invocation of this function.
        set((state) => ({
          hasMoreResults: results.length === state.pageSize,
        }));
      } catch (error) {
        console.error('Error fetching next page results: ', error);
        throw error;
      }
    },
  },
}));

export default useSearchStore;

export const useGroupsActions = (): GroupsActions => useSearchStore((state) => state.actions);

export const useGroups = (): Group[] => useSearchStore((state) => state.searchResults);

export const useHasMoreResults = (): boolean => useSearchStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useSearchStore((state) => state.pageSize);
