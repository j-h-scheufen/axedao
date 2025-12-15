'use client';

import { Button, Card, CardBody } from '@heroui/react';
import { Form, Formik, type FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { useRouter } from 'next/navigation';
import { useCallback, useMemo, useState } from 'react';

import { PATHS } from '@/config/constants';
import { genealogyProfileFormSchema, type GenealogyProfileForm as FormType } from '@/config/validation-schema';
import { currentUserAtom } from '@/hooks/state/currentUser';
import {
  useCreateGenealogyProfile,
  useUpdateGenealogyProfile,
  useRelationships,
  useDeleteRelationship,
} from '@/query/genealogyProfile';
import DeleteProfileModal from './DeleteProfileModal';
import SyncSection from './SyncSection';
import GenealogyFieldsSection from './GenealogyFieldsSection';
import RelationshipsSection from './RelationshipsSection';

type ExistingGenealogyData = {
  portrait?: string | null;
  apelido?: string | null;
  apelidoContext?: string | null;
  title?: string | null;
  style?: string | null;
  birthYear?: number | null; // From DB as number
  birthYearPrecision?: string | null;
  bioEn?: string | null;
  bioPt?: string | null;
  publicLinks?: string[] | null;
};

type GenealogyProfileFormProps = {
  /** Existing genealogy profile data (for edit mode) */
  existingData?: ExistingGenealogyData | null;
};

/**
 * Form for creating/editing genealogy profile.
 * Includes sync section and genealogy-only fields.
 *
 * Sync logic:
 * - New profile: All syncs OFF by default (user opts in to publish each field)
 * - Existing profile: Sync ON if genealogy value matches current user profile value
 *   (indicates they're in sync), OFF if stale (values differ)
 */
const GenealogyProfileForm = ({ existingData }: GenealogyProfileFormProps) => {
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const [showDeleteModal, setShowDeleteModal] = useState(false);

  const createMutation = useCreateGenealogyProfile();
  const updateMutation = useUpdateGenealogyProfile();

  // Fetch relationships if user has a profile
  const { data: relationships = [], isLoading: relationshipsLoading } = useRelationships(user?.profileId || undefined);
  const deleteRelationshipMutation = useDeleteRelationship();

  const handleSubmit = useCallback(
    async (values: FormType) => {
      try {
        setErrorMessage(null);
        // Use user.profileId to determine if creating or updating
        if (user?.profileId) {
          await updateMutation.mutateAsync(values);
        } else {
          await createMutation.mutateAsync(values);
        }
        router.push(PATHS.profile);
      } catch (error) {
        console.error('Error saving genealogy profile:', error);
        setErrorMessage(error instanceof Error ? error.message : 'Failed to save profile');
      }
    },
    [router, user?.profileId, createMutation, updateMutation]
  );

  // Compute initial values with sync state based on existing data match
  const initialValues = useMemo<FormType>(() => {
    if (!user) {
      return {
        syncPortrait: false,
        syncApelido: false,
        syncTitle: false,
        portrait: '',
        apelido: '',
        apelidoContext: '',
        title: '',
        style: '',
        birthYear: '',
        birthYearPrecision: '',
        bioEn: '',
        bioPt: '',
        publicLinks: [],
      };
    }

    if (user.profileId && existingData) {
      // Edit mode: Sync is ON if genealogy value matches current user value
      const portraitMatches = existingData.portrait === user.avatar;
      const apelidoMatches = existingData.apelido === user.nickname;
      const titleMatches = existingData.title === user.title;

      return {
        // Sync toggles based on whether values match
        syncPortrait: !!existingData.portrait && portraitMatches,
        syncApelido: !!existingData.apelido && apelidoMatches,
        syncTitle: !!existingData.title && titleMatches,

        // Syncable fields from user data (will be used if sync is on)
        portrait: user.avatar || '',
        apelido: user.nickname || '',
        apelidoContext: existingData.apelidoContext || '',
        title: user.title || '',

        // Genealogy-only fields from existing data
        style: existingData.style || '',
        birthYear: existingData.birthYear ? String(existingData.birthYear) : '',
        birthYearPrecision: existingData.birthYearPrecision || '',
        bioEn: existingData.bioEn || '',
        bioPt: existingData.bioPt || '',
        publicLinks: existingData.publicLinks || [],
      };
    }

    // New profile: All syncs OFF, fields empty (user must opt in)
    return {
      syncPortrait: false,
      syncApelido: false,
      syncTitle: false,
      portrait: '',
      apelido: '',
      apelidoContext: '',
      title: '',
      style: '',
      birthYear: '',
      birthYearPrecision: '',
      bioEn: '',
      bioPt: '',
      publicLinks: [],
    };
  }, [user, existingData]);

  return (
    <>
      <Formik<FormType>
        initialValues={initialValues}
        validationSchema={genealogyProfileFormSchema}
        onSubmit={handleSubmit}
        enableReinitialize
      >
        {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => (
          <Form className="space-y-6">
            {/* Error Message */}
            {errorMessage && (
              <Card className="bg-danger-50 border border-danger-200">
                <CardBody>
                  <p className="text-danger-700 text-sm">{errorMessage}</p>
                </CardBody>
              </Card>
            )}

            {/* Sync Section */}
            {user && (
              <SyncSection user={user} existingData={existingData} excludeProfileId={user.profileId || undefined} />
            )}

            {/* Genealogy-Only Fields */}
            <GenealogyFieldsSection />

            {/* Relationships Section */}
            <RelationshipsSection
              profileId={user?.profileId || undefined}
              relationships={relationships}
              isLoading={relationshipsLoading}
              onDelete={(statementId) => {
                deleteRelationshipMutation.mutate(statementId);
              }}
            />

            {/* Actions */}
            <div className="flex justify-between items-center pt-4">
              <Button variant="light" onPress={() => router.push(PATHS.profile)}>
                Cancel
              </Button>
              <div className="flex gap-2">
                {user?.profileId && (
                  <Button color="danger" variant="light" onPress={() => setShowDeleteModal(true)}>
                    Delete Profile
                  </Button>
                )}
                <Button type="submit" color="primary" isLoading={isSubmitting} isDisabled={!dirty || !isValid}>
                  {user?.profileId ? 'Save Changes' : 'Publish to Genealogy'}
                </Button>
              </div>
            </div>
          </Form>
        )}
      </Formik>
      {user?.profileId && <DeleteProfileModal isOpen={showDeleteModal} onClose={() => setShowDeleteModal(false)} />}
    </>
  );
};

export default GenealogyProfileForm;
