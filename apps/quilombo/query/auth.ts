import { useMutation, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

import type { SignupForm } from '@/config/validation-schema';
import { QUERY_KEYS } from '.';

export type ChangePasswordParams = {
  currentPassword?: string;
  newPassword: string;
};

export type LinkWalletParams = {
  walletAddress: string;
};

export type RemoveAuthMethodParams = {
  method: 'password' | 'google' | 'wallet';
};

const changePassword = async (params: ChangePasswordParams): Promise<void> =>
  axios.post('/api/auth/change-password', params).then((response) => response.data);

const linkWallet = async (params: LinkWalletParams): Promise<void> =>
  axios.post('/api/auth/link-wallet', params).then((response) => response.data);

const removeAuthMethod = async (params: RemoveAuthMethodParams): Promise<void> =>
  axios.post('/api/auth/remove-method', params).then((response) => response.data);

const signup = async (params: SignupForm): Promise<{ message: string }> =>
  axios.post('/api/auth/signup', params).then((response) => response.data);

// HOOKS
export const useChangePasswordMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: ChangePasswordParams) => changePassword(params),
    onSuccess: () => {
      // Invalidate auth methods to reflect password change
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
    },
  });
};

export const useLinkWalletMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: LinkWalletParams) => linkWallet(params),
    onSuccess: () => {
      // Invalidate auth methods to show new wallet
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
    },
  });
};

export const useRemoveAuthMethodMutation = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params: RemoveAuthMethodParams) => removeAuthMethod(params),
    onSuccess: () => {
      // Invalidate auth methods to reflect removal
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
    },
  });
};

export const useSignupMutation = () => {
  return useMutation({
    mutationFn: (params: SignupForm) => signup(params),
  });
};
