import { create } from 'zustand';

import { User } from '@/types/model';
import axios from 'axios';

export type SearchUsersQuery = { searchTerm?: string; searchBy?: string };

export type UsersState = SearchUsersQuery & {
  searchResults: User[];
  totalUsers: number | null;
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  isInitialized: boolean;
  isLoading: boolean;
};

type UsersActions = {
  initialize: () => Promise<void>;
  loadNextPage: () => Promise<void>;
  search: (query: SearchUsersQuery) => Promise<void>;
};

export type UsersStore = UsersState & { actions: UsersActions };

const DEFAULT_PROPS: UsersState = {
  searchResults: [],
  totalUsers: null,
  pageSize: 20,
  hasMoreResults: false,
  isInitialized: false,
  isLoading: false,
};

const useUsersStore = create<UsersStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (): Promise<void> => {
      if (!get().isInitialized) {
        get().actions.loadNextPage();
        set(() => ({ isInitialized: true }));
      }
    },
    search: async (query: SearchUsersQuery): Promise<void> => {
      const { actions } = get();
      set({
        ...query,
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
        const { pageSize, searchResults, searchTerm = '', searchBy } = get();
        const offset = searchResults.length;
        const params = JSON.parse(
          JSON.stringify({
            searchTerm: searchTerm || undefined,
            searchBy: searchBy || undefined,
            offset: isNaN(offset) ? offset : undefined,
            limit: isNaN(pageSize) ? pageSize : undefined,
          }),
        );

        const { data } = await axios.get('/api/users', { params });
        if (data.error) {
          throw new Error(data.message);
        }

        const { count = null, users = [] } = data || {};
        if (Array.isArray(users)) {
          set((state) => ({
            // If a full pageSize of results was retrieved, there are likely more results, so setting true.
            // The exception is if the total result size % pageSize === 0
            // in which case the user receives the correct feedback on the next invocation of this function.
            searchResults: [...state.searchResults, ...users],
            totalUsers: count,
            hasMoreResults: data.length === state.pageSize,
            isInitialized: true,
          }));
        }
      } catch (error) {
        console.error('Error fetching next page results: ', error);
        throw error;
      }
      set({ isLoading: false });
    },
  },
}));

export default useUsersStore;

export const useUsersActions = (): UsersActions => useUsersStore((state) => state.actions);

export const useUsers = (): User[] => useUsersStore((state) => state.searchResults);

export const useTotalUsers = (): number | null => useUsersStore((state) => state.totalUsers);

export const useHasMoreResults = (): boolean => useUsersStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useUsersStore((state) => state.pageSize);

export const useIsLoadingUsers = (): boolean => useUsersStore((state) => state.isLoading);

export const useUsersIsInitialized = (): boolean => useUsersStore((state) => state.isInitialized);
