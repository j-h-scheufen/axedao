import { User } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';
import { DEFAULT_PROFILE } from './profile.store';

export type GroupMemberRole = 'member' | 'admin' | 'founder' | 'leader';

export type GroupMember = User & { role: GroupMemberRole };

export type GroupMembersState = {
  groupId?: string;
  admins: User[];
  founder: User;
  leader: User;
  searchTerm: string;
  searchResults: GroupMember[];
  pageSize: number;
  hasMoreResults: boolean;
  isLoadingGroupMembers: boolean;
  loadGroupMembersError?: string;
  isInitializingGroupAdmins: boolean;
  adminsInitialized: boolean;
  initializeAdminError?: string;
};

type GroupMembersActions = {
  initialize: (groupId: string) => Promise<void>;
  loadNextPage: () => Promise<void>;
  initializeAdmins: () => Promise<void>;
  search: (searchTerm: string) => Promise<void>;
};

export type GroupMembersStore = GroupMembersState & { actions: GroupMembersActions };

const DEFAULT_PROPS: GroupMembersState = {
  admins: [],
  founder: DEFAULT_PROFILE,
  leader: DEFAULT_PROFILE,
  searchTerm: '',
  searchResults: [],
  pageSize: 20,
  hasMoreResults: false,
  isLoadingGroupMembers: false,
  adminsInitialized: false,
  isInitializingGroupAdmins: false,
};

const useGroupMembersStore = create<GroupMembersStore>()((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async (groupId: string): Promise<void> => {
      const {
        actions: { loadNextPage, initializeAdmins },
        groupId: isInitialized,
      } = get();
      if (!isInitialized) {
        set({ groupId });
        await initializeAdmins();
        loadNextPage();
      }
    },
    search: async (searchTerm: string): Promise<void> => {
      const { actions } = get();
      set({ searchTerm, searchResults: [] });
      actions.loadNextPage();
    },
    loadNextPage: async (): Promise<void> => {
      const { groupId } = get();
      if (!groupId) return;
      set({ isLoadingGroupMembers: true });
      const {
        pageSize,
        searchTerm,
        searchResults,
        adminsInitialized,
        actions: { initializeAdmins },
      } = get();
      // console.log({ adminsInitialized });
      if (!adminsInitialized) await initializeAdmins();
      const offset = searchResults?.length;
      try {
        // console.log({ searchTerm });
        const res = await axios.get(
          `/api/groups/${groupId}/members/?searchTerm=${searchTerm}&offset=${offset}&limit=${pageSize}`,
        );
        const data: User[] = res.data;
        if (data?.length && data.length > 0) {
          const adminIds = get().admins.map((admin) => admin.id);
          const groupMembers: GroupMember[] = data.map((user) => {
            const userId = user.id;
            let role: GroupMemberRole = 'member';
            if (userId === get().founder?.id) {
              role = 'founder';
            } else if (userId === get().leader?.id) {
              role = 'leader';
            } else if (adminIds.includes(userId)) {
              role = 'admin';
            }
            return { ...user, role };
          });
          set((state) => ({
            searchResults: [...state.searchResults, ...groupMembers],
          }));
        }
        set((state) => ({
          hasMoreResults: data.length === state.pageSize,
        }));
      } catch (error) {
        console.error(error);
        const message = generateErrorMessage(error, 'An error occured while fetching group members');
        set({ loadGroupMembersError: message });
      }
      set({ isLoadingGroupMembers: false });
    },
    initializeAdmins: async (): Promise<void> => {
      const { groupId } = get();
      if (!groupId) return;
      set({ isInitializingGroupAdmins: true });
      try {
        const {
          data: { admins, leader, founder },
        } = await axios.get(`/api/groups/${groupId}/admins`);
        set({ admins, leader, founder, adminsInitialized: true });
      } catch (error) {
        console.error(error);
        const message = generateErrorMessage(error, 'An error occured while fetching group admins');
        set({ initializeAdminError: message });
      }
      set({ isInitializingGroupAdmins: false });
    },
  },
}));

export default useGroupMembersStore;

export const useGroupMembersActions = (): GroupMembersActions => useGroupMembersStore((state) => state.actions);

export const useGroupMembers = (): GroupMember[] => useGroupMembersStore((state) => state.searchResults);

export const useGroupMembersHasMoreResults = (): boolean => useGroupMembersStore((state) => state.hasMoreResults);

export const useGroupMembersPageSize = (): number => useGroupMembersStore((state) => state.pageSize);

export const useoadGroupMembersError = (): string | undefined =>
  useGroupMembersStore((state) => state.loadGroupMembersError);

export const useInitializeGroupAdminsError = (): string | undefined =>
  useGroupMembersStore((state) => state.initializeAdminError);

export const useIsLoadingGroupMembers = (): boolean => useGroupMembersStore((state) => state.isLoadingGroupMembers);

export const useIsInitializingGroupAdmins = (): boolean =>
  useGroupMembersStore((state) => state.isInitializingGroupAdmins);

export const useGroupFounder = (): User => useGroupMembersStore((state) => state.founder);

export const useGroupLeader = (): User => useGroupMembersStore((state) => state.leader);
