import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

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

const fetchClaims = async (): Promise<GroupClaim[]> =>
  axios.get('/api/admin/claims/groups').then((response) => response.data);

export const fetchClaimsOptions = () => {
  return {
    queryKey: [QUERY_KEYS.admin.getClaims],
    queryFn: () => fetchClaims(),
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

const approveClaim = async ({ claimId, notes }: ApproveClaimParams): Promise<void> =>
  axios.put(`/api/admin/claims/groups/${claimId}/approve`, { notes }).then((response) => response.data);

const rejectClaim = async ({ claimId, notes }: RejectClaimParams): Promise<void> =>
  axios.put(`/api/admin/claims/groups/${claimId}/reject`, { notes }).then((response) => response.data);

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

// ============================================================================
// PERSON PROFILE CLAIMS
// ============================================================================

export type PersonClaim = {
  id: string;
  personProfileId: string;
  profileApelido: string | null;
  profileName: string | null;
  profileTitle: string | null;
  profilePortrait: string | null;
  userId: string;
  userName: string;
  userEmail: string;
  requestedAt: string;
  userMessage: string;
  status: 'pending' | 'approved' | 'rejected';
};

const fetchPersonClaims = async (): Promise<PersonClaim[]> =>
  axios.get('/api/admin/claims/persons').then((response) => response.data);

export const fetchPersonClaimsOptions = () => {
  return {
    queryKey: [QUERY_KEYS.admin.getPersonClaims],
    queryFn: () => fetchPersonClaims(),
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

const approvePersonClaim = async ({ claimId }: { claimId: string }): Promise<void> =>
  axios.put(`/api/admin/claims/persons/${claimId}/approve`).then((response) => response.data);

const rejectPersonClaim = async ({ claimId, notes }: RejectClaimParams): Promise<void> =>
  axios.put(`/api/admin/claims/persons/${claimId}/reject`, { notes }).then((response) => response.data);

export const useFetchPersonClaims = () => useQuery(queryOptions(fetchPersonClaimsOptions()));

export const useApprovePersonClaimMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: { claimId: string }) => approvePersonClaim(params),
    onSuccess: () => {
      // Invalidate person claims list to refresh after approval
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.admin.getPersonClaims] });
      // Invalidate genealogy data since profile might now be claimed
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.all() });
    },
  });
};

export const useRejectPersonClaimMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: RejectClaimParams) => rejectPersonClaim(params),
    onSuccess: () => {
      // Invalidate person claims list to refresh after rejection
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.admin.getPersonClaims] });
    },
  });
};
