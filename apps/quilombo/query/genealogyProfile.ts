/**
 * React Query hooks for genealogy profile operations.
 * Handles CRUD operations for user's genealogy profile.
 */

import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

import { QueryConfig } from '@/config/constants';
import type { GenealogyProfileForm } from '@/config/validation-schema';
import type { SelectPersonProfile } from '@/db/schema/genealogy';
import { QUERY_KEYS } from './keys';

/**
 * Note that the fetch options are exported as read-only objects in order to be used by atomWithQuery.
 * When used in useQuery hooks, the options should be wrapped into the queryOptions() function
 * in order to take advantage of the added type safety and inference.
 */

const fetchGenealogyProfile = async (profileId: string): Promise<SelectPersonProfile | null> =>
  axios
    .get(`/api/genealogy/persons/${profileId}`)
    .then((response) => response.data)
    .catch((error) => {
      if (error.response?.status === 404) return null;
      throw error;
    });

export const fetchGenealogyProfileOptions = (profileId: string | null | undefined) => {
  return {
    queryKey: QUERY_KEYS.genealogy.profile(profileId || ''),
    queryFn: async () => fetchGenealogyProfile(profileId ?? ''),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!profileId,
  } as const;
};

const createGenealogyProfile = async (
  formData: GenealogyProfileForm
): Promise<{ profileId: string; message: string }> =>
  axios.post('/api/profile/genealogy', formData).then((response) => response.data);

const updateGenealogyProfile = async (
  formData: GenealogyProfileForm
): Promise<{ profileId: string; message: string }> =>
  axios.patch('/api/profile/genealogy', formData).then((response) => response.data);

const deleteGenealogyProfile = async (): Promise<{ message: string }> =>
  axios.delete('/api/profile/genealogy').then((response) => response.data);

// HOOKS

export const useGenealogyProfile = (profileId: string | null | undefined) =>
  useQuery(queryOptions(fetchGenealogyProfileOptions(profileId)));

export const useCreateGenealogyProfile = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (formData: GenealogyProfileForm) => createGenealogyProfile(formData),
    onSuccess: (data) => {
      // Invalidate current user to get updated profileId
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getUser] });
      // Set the new profile in cache
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.profile(data.profileId) });
    },
  });
};

export const useUpdateGenealogyProfile = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (formData: GenealogyProfileForm) => updateGenealogyProfile(formData),
    onSuccess: (data) => {
      // Invalidate genealogy profile cache to refetch updated data
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.profile(data.profileId) });
    },
  });
};

export const useDeleteGenealogyProfile = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async () => deleteGenealogyProfile(),
    onSuccess: () => {
      // Invalidate current user to get updated profileId (now null)
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getUser] });
      // Invalidate all genealogy profile queries
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.all() });
    },
  });
};
