/**
 * React Query hooks for genealogy profile operations.
 * Handles CRUD operations for user's genealogy profile.
 */

import { queryOptions, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from '@/utils/axios';

import { QueryConfig } from '@/config/constants';
import type { GenealogyProfileForm } from '@/config/validation-schema';
import type {
  SelectPersonProfile,
  SelectStatement,
  EntityType,
  Predicate,
  StatementProperties,
} from '@/db/schema/genealogy';
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

// ============================================================================
// RELATIONSHIPS
// ============================================================================

type RelationshipWithDetails = SelectStatement & {
  objectName?: string;
};

type AddRelationshipRequest = {
  predicate: Predicate;
  objectType: EntityType;
  objectId: string;
  startedAt?: string;
  endedAt?: string;
  properties?: StatementProperties;
};

const fetchRelationships = async (): Promise<RelationshipWithDetails[]> =>
  axios.get('/api/profile/genealogy/relationships').then((response) => response.data);

const addRelationship = async (data: AddRelationshipRequest): Promise<{ id: string; message: string }> =>
  axios.post('/api/profile/genealogy/relationships', data).then((response) => response.data);

const deleteRelationship = async (statementId: string): Promise<{ message: string }> =>
  axios.delete(`/api/profile/genealogy/relationships/${statementId}`).then((response) => response.data);

// ============================================================================
// SEARCH (for AddRelationshipModal)
// ============================================================================

type PersonSearchResult = {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
};

type GroupSearchResult = {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
  isActive: boolean;
};

const searchPersons = async (searchTerm: string): Promise<PersonSearchResult[]> =>
  axios.get(`/api/genealogy/persons/search?q=${encodeURIComponent(searchTerm)}`).then((response) => response.data);

const searchGroups = async (searchTerm: string): Promise<GroupSearchResult[]> =>
  axios.get(`/api/genealogy/groups/search?q=${encodeURIComponent(searchTerm)}`).then((response) => response.data);

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

// ============================================================================
// RELATIONSHIPS HOOKS
// ============================================================================

export const useRelationships = (profileId?: string) =>
  useQuery({
    queryKey: QUERY_KEYS.genealogy.relationships(profileId || ''),
    queryFn: fetchRelationships,
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!profileId,
  });

export const useAddRelationship = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (data: AddRelationshipRequest) => addRelationship(data),
    onSuccess: () => {
      // Invalidate relationships to refetch the list
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.relationships() });
    },
  });
};

export const useDeleteRelationship = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (statementId: string) => deleteRelationship(statementId),
    onSuccess: () => {
      // Invalidate relationships to refetch the list
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.relationships() });
    },
  });
};

// ============================================================================
// SEARCH HOOKS
// ============================================================================

export const useSearchPersons = (searchTerm: string, options?: { enabled?: boolean }) =>
  useQuery({
    queryKey: ['genealogy', 'search', 'persons', searchTerm],
    queryFn: () => searchPersons(searchTerm),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: options?.enabled ?? searchTerm.length > 2,
  });

export const useSearchGroups = (searchTerm: string, options?: { enabled?: boolean }) =>
  useQuery({
    queryKey: ['genealogy', 'search', 'groups', searchTerm],
    queryFn: () => searchGroups(searchTerm),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: options?.enabled ?? searchTerm.length > 2,
  });
