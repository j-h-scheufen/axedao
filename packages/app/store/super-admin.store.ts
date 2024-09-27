import axios from 'axios';
import { create } from 'zustand';

type SuperAdminActions = {
  updateGroupVerification: (groupId: string, verification: boolean) => Promise<void | { success: boolean }>;
};

type SuperAdminStore = { actions: SuperAdminActions };

const useSuperAdminStore = create<SuperAdminStore>()(() => ({
  actions: {
    updateGroupVerification: async (groupId, verified) => {
      if (!groupId) return;
      const { data } = await axios.post('/api/super-admin/actions/groups/update-verification', {
        id: groupId,
        verified,
      });
      return data;
    },
  },
}));

export const useSuperAdminActions = (): SuperAdminActions => useSuperAdminStore((state) => state.actions);
