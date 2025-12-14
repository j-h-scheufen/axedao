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

type SearchPersonsOptions = {
  claimableOnly?: boolean;
};

const searchPersons = async (searchTerm: string, options?: SearchPersonsOptions): Promise<PersonSearchResult[]> => {
  const params = new URLSearchParams({ q: searchTerm });
  if (options?.claimableOnly) {
    params.set('claimableOnly', 'true');
  }
  return axios.get(`/api/genealogy/persons/search?${params.toString()}`).then((response) => response.data);
};

const searchGroups = async (searchTerm: string, options?: { activeOnly?: boolean }): Promise<GroupSearchResult[]> => {
  const params = new URLSearchParams({ q: searchTerm });
  if (options?.activeOnly) {
    params.set('activeOnly', 'true');
  }
  return axios.get(`/api/genealogy/groups/search?${params.toString()}`).then((response) => response.data);
};

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
    onSuccess: (_data, variables) => {
      // Invalidate relationships to refetch the list
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.relationships() });
      // If adding a member_of relationship, also invalidate user groups query
      if (variables.predicate === 'member_of') {
        queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getGroups] });
      }
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

export const useSearchPersons = (searchTerm: string, options?: { enabled?: boolean; claimableOnly?: boolean }) =>
  useQuery({
    queryKey: ['genealogy', 'search', 'persons', searchTerm, options?.claimableOnly ?? false],
    queryFn: () => searchPersons(searchTerm, { claimableOnly: options?.claimableOnly }),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: options?.enabled ?? searchTerm.length > 2,
  });

export const useSearchGroups = (searchTerm: string, options?: { enabled?: boolean; activeOnly?: boolean }) =>
  useQuery({
    queryKey: ['genealogy', 'search', 'groups', searchTerm, options?.activeOnly ?? false],
    queryFn: () => searchGroups(searchTerm, { activeOnly: options?.activeOnly }),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: options?.enabled ?? searchTerm.length > 2,
  });

// ============================================================================
// PERSON PROFILE CLAIMING
// ============================================================================

type ClaimStatus = {
  isClaimable: boolean;
  reason: 'not_found' | 'deceased' | 'already_claimed' | 'claimable';
};

type PendingClaim = {
  id: string;
  personProfileId: string;
  profileApelido: string | null;
  profileName: string | null;
  profileTitle: string | null;
  profilePortrait: string | null;
  requestedAt: string;
  status: 'pending';
};

type ClaimPersonRequest = {
  personProfileId: string;
  userMessage: string;
};

type ClaimPersonResponse = {
  claimId: string;
  message: string;
};

const fetchClaimStatus = async (profileId: string): Promise<ClaimStatus> =>
  axios.get(`/api/genealogy/persons/${profileId}/claim-status`).then((response) => response.data);

const fetchPendingClaim = async (): Promise<PendingClaim | null> =>
  axios.get('/api/profile/person-claim').then((response) => response.data);

const claimPerson = async ({ personProfileId, userMessage }: ClaimPersonRequest): Promise<ClaimPersonResponse> =>
  axios.post(`/api/genealogy/persons/${personProfileId}/claim`, { userMessage }).then((response) => response.data);

/**
 * Fetch the claim status of a person profile.
 * Returns whether the profile is claimable and the reason if not.
 */
export const usePersonClaimStatus = (profileId: string | null | undefined) =>
  useQuery({
    queryKey: QUERY_KEYS.genealogy.claimStatus(profileId || ''),
    queryFn: () => fetchClaimStatus(profileId as string),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!profileId,
  });

/**
 * Fetch the current user's pending person profile claim (if any).
 */
export const usePendingPersonClaim = () =>
  useQuery({
    queryKey: [QUERY_KEYS.genealogy.pendingClaim],
    queryFn: fetchPendingClaim,
    staleTime: QueryConfig.staleTimeDefault,
  });

/**
 * Mutation to claim a person profile.
 */
export const useClaimPersonMutation = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (data: ClaimPersonRequest) => claimPerson(data),
    onSuccess: (_, variables) => {
      // Invalidate pending claim to show the new pending status
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.genealogy.pendingClaim] });
      // Invalidate claim status for the specific profile
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.genealogy.claimStatus(variables.personProfileId) });
    },
  });
};

// ============================================================================
// GROUP PROFILE QUERIES
// ============================================================================

import type { SelectGroupProfile } from '@/db/schema/genealogy';
import type { GenealogyGroupProfileUpdate } from '@/config/validation-schema';

const fetchGenealogyGroupProfile = async (profileId: string): Promise<SelectGroupProfile | null> =>
  axios
    .get(`/api/genealogy/groups/${profileId}`)
    .then((response) => response.data.data)
    .catch((error) => {
      if (error.response?.status === 404) return null;
      throw error;
    });

export const fetchGenealogyGroupProfileOptions = (profileId: string | null | undefined) => {
  return {
    queryKey: QUERY_KEYS.genealogy.groupProfile(profileId || ''),
    queryFn: async () => fetchGenealogyGroupProfile(profileId ?? ''),
    staleTime: QueryConfig.staleTimeDefault,
    enabled: !!profileId,
  } as const;
};

const updateGenealogyGroupProfile = async (
  profileId: string,
  formData: GenealogyGroupProfileUpdate
): Promise<SelectGroupProfile> => axios.patch(`/api/genealogy/groups/${profileId}`, formData).then((r) => r.data);

/**
 * Hook to fetch a group genealogy profile by ID.
 */
export const useGenealogyGroupProfile = (profileId: string | null | undefined) =>
  useQuery(queryOptions(fetchGenealogyGroupProfileOptions(profileId)));

/**
 * Mutation to update a group's genealogy profile.
 * User must be an admin of the public.groups entry that references this profile.
 */
export const useUpdateGenealogyGroupProfile = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ profileId, data }: { profileId: string; data: GenealogyGroupProfileUpdate }) =>
      updateGenealogyGroupProfile(profileId, data),
    onSuccess: (data, variables) => {
      // Update the cache with the new data
      queryClient.setQueryData(QUERY_KEYS.genealogy.groupProfile(variables.profileId), data);
      // Invalidate group query since name/style may have changed
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.group.getGroup] });
    },
  });
};
