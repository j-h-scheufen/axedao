import { create } from 'zustand';

import { User } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { isNil, omitBy } from 'lodash';

export type SearchUsersQuery = { searchTerm?: string; searchBy?: string };

export type UserSearchState = {
  searchResults: User[];
  totalUsers: number | null;
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  isInitialized: boolean;
  isLoading: boolean;
  loadUsersError?: string;
  query?: SearchUsersQuery;
};

type UserSearchActions = {
  initialize: () => Promise<void>;
  loadNextPage: () => Promise<void>;
  search: (query: SearchUsersQuery) => Promise<void>;
};

export type UserSearchStore = UserSearchState & { actions: UserSearchActions };

const DEFAULT_PROPS: UserSearchState = {
  searchResults: [],
  totalUsers: null,
  pageSize: 20,
  hasMoreResults: false,
  isInitialized: false,
  isLoading: false,
};

const useUserSearchStore = create<UserSearchStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (): Promise<void> => {
      if (!get().isInitialized) {
        get().actions.loadNextPage();
        set(() => ({ isInitialized: true }));
      }
    },
    search: async (query: SearchUsersQuery): Promise<void> => {
      const { actions, isLoading } = get();
      if (isLoading) return;
      set({
        ...DEFAULT_PROPS,
        query,
      });
      actions.loadNextPage();
    },
    loadNextPage: async (): Promise<void> => {
      const { isLoading } = get();
      if (isLoading) return;
      set({ isLoading: true });
      try {
        const { pageSize, searchResults, query } = get();
        const offset = searchResults.length;
        const params = omitBy({ limit: pageSize || 20, offset, ...query }, isNil);
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
        const message = generateErrorMessage(error, 'An error occured while fetching users');
        set({ loadUsersError: message });
      }
      set({ isLoading: false });
    },
  },
}));

export default useUserSearchStore;

export const useUserSearchActions = (): UserSearchActions => useUserSearchStore((state) => state.actions);

export const useSearchResults = (): User[] => useUserSearchStore((state) => state.searchResults);

export const useTotalUsers = (): number | null => useUserSearchStore((state) => state.totalUsers);

export const useHasMoreUsers = (): boolean => useUserSearchStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useUserSearchStore((state) => state.pageSize);

export const useIsLoadingUsers = (): boolean => useUserSearchStore((state) => state.isLoading);

export const useIsInitialized = (): boolean => useUserSearchStore((state) => state.isInitialized);

export const useLoadUsersError = () => useUserSearchStore((state) => state.loadUsersError);
