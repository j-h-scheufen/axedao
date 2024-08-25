import { ProfileState } from '@/app/dashboard/profile/types';
import { useProfileStore } from '@/store/profile.store';
import axios from 'axios';
import { produce } from 'immer';
import { create } from 'zustand';
import useGroupProfileStore, {
  GroupProfileState,
} from '../app/dashboard/overview/groups/[groupId]/store/groupProfile.store';
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
