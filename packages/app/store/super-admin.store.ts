import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';
import useGroupsStore, { GroupsState } from './groups.store';

type SuperAdminState = {};

type SuperAdminActions = {
  updateGroupVerification: (groupId: string, verification: boolean) => Promise<void | { success: boolean }>;
};

type SuperAdminStore = SuperAdminState & { actions: SuperAdminActions };

const useSuperAdminStore = create<SuperAdminStore>()((set, get) => ({
  actions: {
    updateGroupVerification: async (groupId, verified) => {
      if (!groupId) return;
      console.log(groupId, verified);
      const { data } = await axios.post('/api/super-admin/actions/groups/update-verification', {
        id: groupId,
        verified,
      });
      console.log(data);
      if (data.success) {
        useGroupsStore.setState(
          produce((state: GroupsState) => {
            const staleGroup = state.searchResults.find((group) => group.id === groupId);
            console.log(staleGroup);
            if (staleGroup) Object.assign(staleGroup, { id: groupId, verified });
          }),
        );
      }
      return data;
    },
  },
}));

export const useSuperAdminActions = (): SuperAdminActions => useSuperAdminStore((state) => state.actions);
