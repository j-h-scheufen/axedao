import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

import { QueryConfig } from '@/config/constants';
import type { Invitation } from '@/types/model';
import { QUERY_KEYS } from '.';

export type InvitationResponse = {
  code: string;
  type: 'email_bound' | 'open';
  invitedEmail?: string;
  expiresAt: string;
  inviteLink: string;
};

export type CreateInvitationParams =
  | {
      type: 'email_bound';
      invitedEmail: string;
      sendEmail: boolean;
    }
  | {
      type: 'open';
    };

const fetchInvitations = async (): Promise<Invitation[]> =>
  axios.get('/api/invitations').then((response) => response.data);

export const fetchInvitationsOptions = () => {
  return {
    queryKey: [QUERY_KEYS.invitation.getInvitations],
    queryFn: () => fetchInvitations(),
    staleTime: QueryConfig.staleTimeDefault,
  } as const;
};

const createInvitation = async (params: CreateInvitationParams): Promise<InvitationResponse> =>
  axios.post('/api/invitations', params).then((response) => response.data);

const deleteInvitation = async (invitationId: string): Promise<void> =>
  axios.delete(`/api/invitations/${invitationId}`);

// HOOKS
export const useFetchInvitations = () => useQuery(queryOptions(fetchInvitationsOptions()));

export const useCreateInvitationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: CreateInvitationParams) => createInvitation(params),
    onSuccess: () => {
      // Invalidate invitations list to show new invitation
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.invitation.getInvitations] });
    },
  });
};

export const useDeleteInvitationMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (invitationId: string) => deleteInvitation(invitationId),
    onSuccess: () => {
      // Invalidate invitations list to remove deleted invitation
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.invitation.getInvitations] });
    },
  });
};
