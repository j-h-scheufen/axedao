import { useMutation, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { Group } from '@/types/model';
import { QUERY_KEYS } from '.';

export type GroupVerificationParams = { groupId: string; verified: boolean };

const setGroupVerification = ({ groupId, verified }: GroupVerificationParams): Promise<Group> => {
  if (verified) {
    return axios.put(`/admin/group/${groupId}/verification`).then((response) => response.data);
  } else {
    return axios.delete(`/admin/group/${groupId}/verification`).then((response) => response.data);
  }
};

export const useGroupVerificationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: GroupVerificationParams) => setGroupVerification(params),
    onSuccess: (data, variables) => {
      queryClient.setQueryData([QUERY_KEYS.group.getGroup, variables.groupId], data);
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroupProfile, variables.groupId] });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.searchGroups] });
    },
  });
};
