import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';

import { ProfileState, useProfileStore } from '@/store/profile.store';
import useGroupProfileStore, {
  GroupProfileState,
} from '../app/dashboard/overview/groups/[groupId]/store/groupProfile.store';
import useGroupsStore, { GroupsState } from './groups.store';

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
      if (data.success) {
        useGroupsStore.setState(
          produce((state: GroupsState) => {
            const staleGroup = state.searchResults.find((group) => group.id === groupId);
            if (staleGroup) Object.assign(staleGroup, { verified });
          }),
        );
        const { groupProfile } = useGroupProfileStore.getState();
        if (groupProfile?.id === groupId) {
          useGroupProfileStore.setState(
            produce((state: GroupProfileState) => {
              Object.assign(state.groupProfile, { verified });
            }),
          );
        }
        const { profile } = useProfileStore.getState();
        if (profile.group && profile.group.id === groupId) {
          useProfileStore.setState(
            produce((state: ProfileState) => {
              if (state.profile.group) Object.assign(state.profile.group, { verified });
            }),
          );
        }
      }
      return data;
    },
  },
}));

export const useSuperAdminActions = (): SuperAdminActions => useSuperAdminStore((state) => state.actions);
