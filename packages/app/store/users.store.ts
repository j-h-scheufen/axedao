import { create } from 'zustand';

import { User } from '@/types/model';

export type UsersState = {
  searchResults: User[];
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  initialized: boolean;
};

type UsersActions = {
  initialize: () => Promise<void>;
  loadNextPage: () => Promise<void>;
};

export type UsersStore = UsersState & { actions: UsersActions };

const DEFAULT_PROPS: UsersState = {
  searchResults: [],
  pageSize: 20,
  hasMoreResults: false,
  initialized: false,
};

const useUsersStore = create<UsersStore>()((set, get) => ({
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
        const response = await fetch(`/api/users?offset=${offset}&limit=${pageSize}`);
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

export default useUsersStore;

export const useUsersActions = (): UsersActions => useUsersStore((state) => state.actions);

export const useUsers = (): User[] => useUsersStore((state) => state.searchResults);

export const useHasMoreResults = (): boolean => useUsersStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useUsersStore((state) => state.pageSize);