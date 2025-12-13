'use client';

import { Button, Card, CardBody, CardHeader, Divider } from '@heroui/react';
import { Form, Formik, type FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { useRouter } from 'next/navigation';
import { useCallback, useMemo } from 'react';

import { PATHS } from '@/config/constants';
import { genealogyProfileFormSchema, type GenealogyProfileForm as FormType } from '@/config/validation-schema';
import { currentUserAtom } from '@/hooks/state/currentUser';
import SyncSection from './SyncSection';
import GenealogyFieldsSection from './GenealogyFieldsSection';

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
  profileId?: string | null;
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
const GenealogyProfileForm = ({ profileId, existingData }: GenealogyProfileFormProps) => {
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);
  const isEditing = !!profileId;

  const handleSubmit = useCallback(
    async (values: FormType) => {
      try {
        // TODO: Implement API call to create/update genealogy profile
        console.log('Submitting genealogy profile:', values);
        // After successful save, redirect to profile page
        router.push(PATHS.profile);
      } catch (error) {
        console.error('Error saving genealogy profile:', error);
        throw error;
      }
    },
    [router]
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

    if (isEditing && existingData) {
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
  }, [user, isEditing, existingData]);

  return (
    <Formik<FormType>
      initialValues={initialValues}
      validationSchema={genealogyProfileFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => (
        <Form className="space-y-6">
          {/* Sync Section */}
          {user && <SyncSection user={user} existingData={existingData} excludeProfileId={profileId || undefined} />}

          {/* Genealogy-Only Fields */}
          <GenealogyFieldsSection />

          {/* TODO: Relationships Section - Phase 5 */}
          <Card>
            <CardHeader>
              <div className="flex flex-col">
                <p className="text-md font-semibold">Relationships</p>
                <p className="text-small text-default-500">Declare your connections to mestres and groups</p>
              </div>
            </CardHeader>
            <Divider />
            <CardBody>
              <p className="text-default-400 text-center py-4">Relationships management coming in Phase 5</p>
            </CardBody>
          </Card>

          {/* Actions */}
          <div className="flex justify-between items-center pt-4">
            <Button variant="light" onPress={() => router.push(PATHS.profile)}>
              Cancel
            </Button>
            <div className="flex gap-2">
              {isEditing && (
                <Button color="danger" variant="light">
                  Delete Profile
                </Button>
              )}
              <Button type="submit" color="primary" isLoading={isSubmitting} isDisabled={!dirty || !isValid}>
                {isEditing ? 'Save Changes' : 'Publish to Genealogy'}
              </Button>
            </div>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default GenealogyProfileForm;
