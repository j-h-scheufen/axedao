import { create } from 'zustand';

import { User } from '@/types/model';

export type UsersState = {
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
    loadNextPage: async (): Promise<void> => {
      const { isInitialized } = get();
      set({ isLoading: true });
      try {
        const pageSize = get().pageSize;
        const offset = get().searchResults.length;
        const response = await fetch(`/api/users?offset=${offset}&limit=${pageSize}`);
        const { count = null, users = [] } = (await response.json()) || {};
        if (Array.isArray(users)) {
          set((state) => ({
            searchResults: [...state.searchResults, ...users],
            totalUsers: count,
          }));
        }
        // If a full pageSize of results was retrieved, there are likely more results, so setting true.
        // The exception is if the total result size % pageSize === 0
        // in which case the user receives the correct feedback on the next invocation of this function.
        set((state) => ({
          hasMoreResults: users.length === state.pageSize,
        }));
        if (!isInitialized) {
          set({ isInitialized: true });
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
