import axios from 'axios';
import { create } from 'zustand';

import { User } from '@/types/model';
import { generateErrorMessage } from '@/utils';

/**
 * A store for loading all users and filtering them by name or nickname.
 * As long as user numbers are low, we can afford to keep all users in state
 * for simplicity and filter performance.
 */

export type UsersState = {
  users: User[];
  filteredUsers: User[];
  isInitialized: boolean;
  isInitializing: boolean;
  initializeUsersError: string;
  filter?: string;
};

type UsersActions = {
  initializeUsers: () => Promise<void>;
  setFilter: (filter: string) => void;
};

export type UsersStore = UsersState & { actions: UsersActions };

const DEFAULT_PROPS: UsersState = {
  users: [],
  filteredUsers: [],
  isInitialized: false,
  isInitializing: false,
  initializeUsersError: '',
};

const useUsersStore = create<UsersStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initializeUsers: async (): Promise<void> => {
      if (get().isInitialized || get().isInitializing) return;
      set({ isInitializing: true });
      try {
        const { data } = await axios.get('/api/users');
        if (data.error) {
          throw new Error(data.message);
        }
        const { count = null, users = [] } = data || {};
        if (Array.isArray(users)) {
          set(() => ({ users, filteredUsers: users, isInitialized: true }));
        }
      } catch (error) {
        const message = generateErrorMessage(
          error,
          'An error occured while fetching users during initialization of users.store',
        );
        console.error(message);
        set({ initializeUsersError: message });
      } finally {
        set({ isInitializing: false });
      }
    },
    setFilter: (filter: string): void => {
      if (filter === get().filter) return;
      const { users } = get();
      if (filter) set({ filter, filteredUsers: filterUsers(users, filter) });
      else set({ filter: '', filteredUsers: users });
    },
  },
}));

/**
 * Returns users containining the filter string in their name or nickname.
 * @param users
 * @param filter
 * @returns
 */
const filterUsers = (users: User[], filter: string): User[] => {
  const result = users.filter(
    (user) =>
      user.name?.toLowerCase().includes(filter.toLowerCase()) ||
      user.nickname?.toLowerCase().includes(filter.toLowerCase()),
  );
  return result;
};

export default useUsersStore;

export const useUsersActions = (): UsersActions => useUsersStore((state) => state.actions);

export const useUsers = (): User[] => useUsersStore((state) => state.users);

export const useFilteredUsers = (): User[] => useUsersStore((state) => state.filteredUsers);

export const useUsersInitStatus = () =>
  useUsersStore((state) => ({ isUsersInitializing: state.isInitializing, isUsersInitialized: state.isInitialized }));

export const useUsersErrors = () => useUsersStore((state) => ({ initializeUsersError: state.initializeUsersError }));
