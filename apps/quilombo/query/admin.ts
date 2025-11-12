import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

import { QueryConfig } from '@/config/constants';
import { QUERY_KEYS } from '.';

export type GroupClaim = {
  id: string;
  groupId: string;
  groupName: string;
  userId: string;
  userName: string;
  userEmail: string;
  requestedAt: string;
  userMessage: string;
  status: 'pending' | 'approved' | 'rejected';
};

export type ApproveClaimParams = {
  claimId: string;
  notes?: string;
};

export type RejectClaimParams = {
  claimId: string;
  notes: string;
};

const fetchClaims = async (): Promise<GroupClaim[]> => axios.get('/api/admin/claims').then((response) => response.data);

export const fetchClaimsOptions = () => {
  return {
    queryKey: [QUERY_KEYS.admin.getClaims],
    queryFn: () => fetchClaims(),
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

const approveClaim = async ({ claimId, notes }: ApproveClaimParams): Promise<void> =>
  axios.put(`/api/admin/claims/${claimId}/approve`, { notes }).then((response) => response.data);

const rejectClaim = async ({ claimId, notes }: RejectClaimParams): Promise<void> =>
  axios.put(`/api/admin/claims/${claimId}/reject`, { notes }).then((response) => response.data);

// HOOKS
export const useFetchClaims = () => useQuery(queryOptions(fetchClaimsOptions()));

export const useApproveClaimMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: ApproveClaimParams) => approveClaim(params),
    onSuccess: () => {
      // Invalidate claims list to refresh after approval
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.admin.getClaims] });
      // Invalidate group data since claimedBy might have changed
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup] });
    },
  });
};

export const useRejectClaimMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: RejectClaimParams) => rejectClaim(params),
    onSuccess: () => {
      // Invalidate claims list to refresh after rejection
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.admin.getClaims] });
    },
  });
};
