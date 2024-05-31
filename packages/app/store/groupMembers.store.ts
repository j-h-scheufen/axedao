import { create } from 'zustand';

import { User } from '@/types/model';

export type GroupMembersState = {
  searchResults: User[];
  pageSize: number;
  hasMoreResults: boolean; // flag indicating there are more search results that can be retrieved for the current filter settings
  initialized: boolean;
};

type GroupMembersActions = {
  initialize: (id: string) => Promise<void>;
  loadNextPage: (id: string) => Promise<void>;
};

export type GroupMembersStore = GroupMembersState & { actions: GroupMembersActions };

const DEFAULT_PROPS: GroupMembersState = {
  searchResults: [],
  pageSize: 20,
  hasMoreResults: false,
  initialized: false,
};

const useGroupMembersStore = create<GroupMembersStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (id: string): Promise<void> => {
      if (!get().initialized) {
        get().actions.loadNextPage(id);
        set(() => ({ initialized: true }));
      }
    },
    loadNextPage: async (id: string): Promise<void> => {
      try {
        const pageSize = get().pageSize;
        const offset = get().searchResults.length;
        const response = await fetch(`/api/groups/${id}/members/?offset=${offset}&limit=${pageSize}`);
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

export default useGroupMembersStore;

export const useGroupMembersActions = (): GroupMembersActions => useGroupMembersStore((state) => state.actions);

export const useGroupMembers = (): User[] => useGroupMembersStore((state) => state.searchResults);

export const useHasMoreResults = (): boolean => useGroupMembersStore((state) => state.hasMoreResults);

export const usePageSize = (): number => useGroupMembersStore((state) => state.pageSize);
