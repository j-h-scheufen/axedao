import { Group } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

export type GroupsState = {
  searchResults: Group[];
  totalGroups: number | null;
  searchTerm?: string;
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  isInitialized: boolean;
  isLoading: boolean;
  loadGroupsError?: string;
};

type GroupsActions = {
  initialize: () => Promise<void>;
  loadNextPage: () => Promise<void>;
  search: (searchTerm: string) => Promise<void>;
};

export type SearchStore = GroupsState & { actions: GroupsActions };

const DEFAULT_PROPS: GroupsState = {
  searchResults: [],
  totalGroups: null,
  pageSize: 20,
  hasMoreResults: false,
  isInitialized: false,
  isLoading: false,
};

const useSearchStore = create<SearchStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (): Promise<void> => {
      const { isInitialized, actions } = get();
      if (!isInitialized) {
        actions.loadNextPage();
      }
    },
    search: async (searchTerm: string): Promise<void> => {
      const { actions } = get();
      set({
        searchTerm,
        searchResults: [],
        isLoading: false, // Ensures the search goes through
      });
      actions.loadNextPage();
    },
    loadNextPage: async (): Promise<void> => {
      const { isLoading } = get();
      if (isLoading) return;
      set({ isLoading: true });
      try {
        const { pageSize, searchResults, searchTerm = '' } = get();
        const offset = searchResults.length;
        const params = JSON.parse(
          JSON.stringify({
            searchTerm: searchTerm || undefined,
            offset: isNaN(offset) ? offset : undefined,
            limit: isNaN(pageSize) ? pageSize : undefined,
          }),
        );

        const { data } = await axios.get('/api/groups', { params });
        if (data?.error) {
          throw new Error(data?.message);
        }

        if (Array.isArray(data?.groups)) {
          // If a full pageSize of results was retrieved, there are likely more results, so setting true.
          // The exception is if the total result size % pageSize === 0
          // in which case the user receives the correct feedback on the next invocation of this function.
          set((state) => ({
            searchResults: [...state.searchResults, ...data.groups],
            totalGroups: data.count,
            hasMoreResults: data.length === state.pageSize,
            isInitialized: true,
          }));
        }
      } catch (error) {
        const message = generateErrorMessage(error, 'An error occured while fetching groups');
        set({ loadGroupsError: message });
      }
      set({ isLoading: false });
    },
  },
}));

export default useSearchStore;

export const useGroupsActions = (): GroupsActions => useSearchStore((state) => state.actions);

export const useGroups = (): Group[] => useSearchStore((state) => state.searchResults);

export const useTotalGroups = (): number | null => useSearchStore((state) => state.totalGroups);

export const useGroupsHasMoreResults = (): boolean => useSearchStore((state) => state.hasMoreResults);

export const useGroupsPageSize = (): number => useSearchStore((state) => state.pageSize);

export const useGroupsSearchTerm = (): string | undefined => useSearchStore((state) => state.searchTerm);

export const useGroupsIsInitialized = (): boolean => useSearchStore((state) => state.isInitialized);

export const useIsLoadingGroups = (): boolean => useSearchStore((state) => state.isLoading);

export const useLoadGroupsError = (): string | undefined => useSearchStore((state) => state.loadGroupsError);
