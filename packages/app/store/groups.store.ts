import axios from 'axios';
import { create } from 'zustand';

import { Group } from '@/types/model';
import { generateErrorMessage } from '@/utils';

/**
 * A store for loading all groups and filtering them by name.
 * As long as user numbers are low, we can afford to keep all users in state
 * for simplicity and filter performance.
 */

export type UsersState = {
  groups: Group[];
  filteredGroups: Group[];
  isInitialized: boolean;
  isInitializing: boolean;
  initializeGroupsError: string;
  filter?: string;
};

type UsersActions = {
  initializeGroups: () => Promise<void>;
  setFilter: (filter: string) => void;
  findGroup: ({ id }: { id?: string }) => Group | undefined;
};

export type UsersStore = UsersState & { actions: UsersActions };

const DEFAULT_PROPS: UsersState = {
  groups: [],
  filteredGroups: [],
  isInitialized: false,
  isInitializing: false,
  initializeGroupsError: '',
};

const useGroupsStore = create<UsersStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initializeGroups: async (): Promise<void> => {
      if (get().isInitialized || get().isInitializing) return;
      set({ isInitializing: true });
      try {
        const { data } = await axios.get('/api/groups');
        if (data.error) {
          throw new Error(data.message);
        }
        const { count = null, groups = [] } = data || {};
        if (Array.isArray(groups)) {
          set(() => ({ groups, filteredGroups: groups, isInitialized: true }));
        }
      } catch (error) {
        const message = generateErrorMessage(
          error,
          'An error occured while fetching groups during initialization of groups.store',
        );
        console.error(message);
        set({ initializeGroupsError: message });
      } finally {
        set({ isInitializing: false });
      }
    },
    setFilter: (filter: string): void => {
      if (filter === get().filter) return;
      const { groups } = get();
      if (filter) set({ filter, filteredGroups: filterGroups(groups, filter) });
      else set({ filter: '', filteredGroups: groups });
    },
    findGroup: ({ id }: { id?: string }): Group | undefined => {
      return get().groups.find((group) => group.id !== undefined && group.id === id);
    },
  },
}));

/**
 * Returns groups containining the filter string in their name.
 * @param groups
 * @param filter
 * @returns
 */
const filterGroups = (groups: Group[], filter: string): Group[] => {
  const result = groups.filter((group) => group.name?.toLowerCase().includes(filter.toLowerCase()));
  return result;
};

export default useGroupsStore;

export const useGroupsActions = (): UsersActions => useGroupsStore((state) => state.actions);

export const useGroups = (): Group[] => useGroupsStore((state) => state.groups);

export const useFilteredGroups = (): Group[] => useGroupsStore((state) => state.filteredGroups);

export const useGroupsInitStatus = () =>
  useGroupsStore((state) => ({ isGroupsInitializing: state.isInitializing, isGroupsInitialized: state.isInitialized }));

export const useGroupsErrors = () =>
  useGroupsStore((state) => ({ initializeGroupsError: state.initializeGroupsError }));
