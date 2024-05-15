import { create } from 'zustand';

import { Group } from '@/types/model';
import { fetchGroups } from '@/db/db';

export type GroupsState = {
  searchResults: Group[];
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  pageSize: number;
  initialized: boolean;
};

type SearchActions = {
  loadMoreSearchResults: (offset: number) => Promise<void>;
  initialize: () => Promise<void>;
};

export type SearchStore = GroupsState & { actions: SearchActions };

const DEFAULT_PROPS: GroupsState = {
  searchResults: [],
  hasMoreResults: false,
  pageSize: 20,
  initialized: false,
};

const useSearchStore = create<SearchStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    loadMoreSearchResults: async (offset: number): Promise<void> => {
      try {
        const results = await fetchGroups();
        if (results.length > 0) {
          set((state) => ({
            searchResults: [...state.searchResults, ...results],
          }));
        }
        // If a full pageSize was retrieved, there are likely more results, so returning true.
        // The only edge case is if the total result size % pageSize === 0
        // in which case the user receives the correct feedback on the next invocation of loadMore...
        set((state) => ({
          hasMoreResults: results.length === state.pageSize,
        }));
      } catch (error) {
        console.error('Error fetching more search results: ', error);
        throw error;
      }
    },
    initialize: async () => {
      await get().actions.loadMoreSearchResults(0);
    },
  },
}));

export default useSearchStore;

export const useGroupsActions = (): SearchActions => useSearchStore((state) => state.actions);

export const useGroups = (): Group[] => useSearchStore((state) => state.searchResults);

export const useHasMoreResults = (): boolean => useSearchStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useSearchStore((state) => state.pageSize);

export const useInitialized = (): boolean => useSearchStore((state) => state.initialized);
