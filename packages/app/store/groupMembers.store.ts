import { User } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';
import { DEFAULT_PROFILE } from './profile.store';

const ROLE_ORDER = ['founder', 'leader', 'admin', 'member'] as const;

export type GroupMemberRole = (typeof ROLE_ORDER)[number];

export type GroupMember = User & { role: GroupMemberRole };

export type GroupAdmin = {
  groupId: string;
  userId: string;
};

export type GroupMembersState = {
  groupId?: string;
  admins: GroupAdmin[];
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
  memberBeingPromotedToAdmin?: string | undefined; // id of member being promoted
  adminBeingDemotedToMember?: string | undefined; // id of admin being demoted
  adminBeingPromotedToLeader?: string | undefined; // id of admin being promoted
};

type GroupMembersActions = {
  initialize: (groupId: string) => Promise<void>;
  loadNextPage: () => Promise<void>;
  initializeAdmins: () => Promise<void>;
  search: (searchTerm: string) => Promise<void>;
  promoteToAdmin: (memberId: string) => Promise<void>;
  demoteToMember: (adminId: string) => Promise<void>;
  promoteToLeader: (adminId: string, onSuccess?: () => void) => Promise<void>;
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
      if (!groupId || get().isLoadingGroupMembers) return;
      set({ isLoadingGroupMembers: true });
      const {
        pageSize,
        searchTerm,
        searchResults,
        adminsInitialized,
        actions: { initializeAdmins },
      } = get();
      if (!adminsInitialized) await initializeAdmins();
      const offset = searchResults?.length;
      try {
        const res = await axios.get(
          `/api/groups/${groupId}/members/?searchTerm=${searchTerm}&offset=${offset}&limit=${pageSize}`,
        );
        const data: User[] = res.data;
        if (data?.length && data.length > 0) {
          const { admins, founder, leader } = get();
          const adminIds = admins.map((admin) => admin.userId);
          const groupMembers: GroupMember[] = data.map((user) => {
            const userId = user.id;
            let role: GroupMemberRole = 'member';
            if (userId === founder?.id) {
              role = 'founder';
            } else if (userId === leader?.id) {
              role = 'leader';
            } else if (adminIds.includes(userId)) {
              role = 'admin';
            }
            return { ...user, role };
          });
          set((state) => {
            // sort by role as shown in ROLE_ORDER
            const newSearchResults = [...state.searchResults, ...groupMembers].sort((a, b) => {
              return ROLE_ORDER.indexOf(a.role) - ROLE_ORDER.indexOf(b.role);
            });
            return {
              searchResults: newSearchResults,
            };
          });
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
    promoteToAdmin: async (memberId: string) => {
      console.log('Promoting tot admin: ', memberId);
      const { memberBeingPromotedToAdmin, groupId } = get();
      if (memberBeingPromotedToAdmin || !groupId) return;
      set({ memberBeingPromotedToAdmin: memberId });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/members/${memberId}/promote-to-admin`);
        if (data.success) {
          set(
            produce((state: GroupMembersState) => {
              const promotedMember = state.searchResults.find((member) => member.id === memberId);
              if (promotedMember) promotedMember.role = 'admin';
            }),
          );
        }
      } catch (error) {}
      set({ memberBeingPromotedToAdmin: undefined });
    },
    demoteToMember: async (adminId: string) => {
      const { adminBeingDemotedToMember, groupId } = get();
      if (adminBeingDemotedToMember || !groupId) return;
      set({ adminBeingDemotedToMember: adminId });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/admins/${adminId}/demote-to-member`);
        if (data.success) {
          set(
            produce((state: GroupMembersState) => {
              const demotedAdmin = state.searchResults.find((member) => member.id === adminId);
              if (demotedAdmin) demotedAdmin.role = 'member';
              state.admins = state.admins.filter((admin) => admin.userId !== adminId);
            }),
          );
        }
      } catch (error) {}
      set({ adminBeingDemotedToMember: undefined });
    },
    promoteToLeader: async (adminId: string, onSuccess?: () => void) => {
      const { adminBeingPromotedToLeader, groupId } = get();
      if (adminBeingPromotedToLeader || !groupId) return;
      set({ adminBeingPromotedToLeader: adminId });
      try {
        const { data } = await axios.post(`/api/groups/${groupId}/admins/${adminId}/promote-to-leader`);
        if (data.success) {
          set(
            produce((state: GroupMembersState) => {
              const demotedAdmin = state.searchResults.find((member) => member.id === adminId);
              if (demotedAdmin) demotedAdmin.role = 'leader';
              state.admins = state.admins.filter((admin) => admin.userId !== adminId);
            }),
          );
          onSuccess && onSuccess();
        }
      } catch (error) {}
      set({ adminBeingPromotedToLeader: undefined });
    },
  },
}));

export default useGroupMembersStore;

export const useGroupMembersActions = (): GroupMembersActions => useGroupMembersStore((state) => state.actions);

export const useGroupMembers = (): GroupMember[] => useGroupMembersStore((state) => state.searchResults);

export const useGroupMembersHasMoreResults = (): boolean => useGroupMembersStore((state) => state.hasMoreResults);

export const useGroupMembersPageSize = (): number => useGroupMembersStore((state) => state.pageSize);

export const useLoadGroupMembersError = (): string | undefined =>
  useGroupMembersStore((state) => state.loadGroupMembersError);

export const useInitializeGroupAdminsError = (): string | undefined =>
  useGroupMembersStore((state) => state.initializeAdminError);

export const useIsLoadingGroupMembers = (): boolean => useGroupMembersStore((state) => state.isLoadingGroupMembers);

export const useIsInitializingGroupAdmins = (): boolean =>
  useGroupMembersStore((state) => state.isInitializingGroupAdmins);

export const useGroupFounder = (): User => useGroupMembersStore((state) => state.founder);

export const useGroupLeader = (): User => useGroupMembersStore((state) => state.leader);

export const useGroupAdmins = (): GroupAdmin[] => useGroupMembersStore((state) => state.admins);

export const useMemberBeingPromotedToAdmin = (): string | undefined =>
  useGroupMembersStore((state) => state.memberBeingPromotedToAdmin);

export const useAdminBeingDemotedToMember = (): string | undefined =>
  useGroupMembersStore((state) => state.adminBeingDemotedToMember);

export const useAdminBeingPromotedToLeader = (): string | undefined =>
  useGroupMembersStore((state) => state.adminBeingPromotedToLeader);
