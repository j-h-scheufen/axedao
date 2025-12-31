'use client';

import {
  Button,
  Card,
  CardBody,
  Modal,
  ModalBody,
  ModalContent,
  ModalFooter,
  ModalHeader,
  Select,
  SelectItem,
  useDisclosure,
} from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ArrowLeft } from 'lucide-react';
import { useCallback, useEffect, useMemo, useState } from 'react';

import GenealogyPreviewCard from '@/components/genealogy/profile/GenealogyPreviewCard';
import { currentUserAtom, currentUserAvatarAtom } from '@/hooks/state/currentUser';
import { useCreateGenealogyProfile } from '@/query/genealogyProfile';

import { useOnboarding } from '../contexts/OnboardingContext';
import { SyncCheckboxes } from '../shared/SyncCheckboxes';

// Precision options for birth year
const PRECISION_OPTIONS = [
  { key: 'decade', label: 'Decade' },
  { key: 'year', label: 'Year' },
] as const;

// Generate decades from 1930 to current decade
const currentDecade = Math.floor(new Date().getFullYear() / 10) * 10;
const DECADES = Array.from({ length: (currentDecade - 1930) / 10 + 1 }, (_, i) => 1930 + i * 10);

// Generate years from 1930 to current year (descending)
const thisYear = new Date().getFullYear();
const YEARS = Array.from({ length: thisYear - 1930 + 1 }, (_, i) => thisYear - i);

interface ApelidoCheckResult {
  isAvailable: boolean;
  requiresContext: boolean;
}

/**
 * Page 3: Genealogy Profile Step
 *
 * Collects sync preferences and birth year for genealogy profile creation.
 * Handles apelido uniqueness checking with context disambiguation.
 */
export function GenealogyProfileStep() {
  const { state, goToStep, goBack, canGoBack, updateGenealogyProfile, setCreatedProfileId, setError, setSubmitting } =
    useOnboarding();
  const { draftGenealogyProfile, isSubmitting, error } = state;

  const { data: user } = useAtomValue(currentUserAtom);
  const avatar = useAtomValue(currentUserAvatarAtom);

  // Use the mutation hook to ensure proper query invalidation
  const createProfileMutation = useCreateGenealogyProfile();

  // Modal for birth year confirmation
  const { isOpen: isBirthYearModalOpen, onOpen: openBirthYearModal, onClose: closeBirthYearModal } = useDisclosure();

  // Local state for form fields
  const [syncPortrait, setSyncPortrait] = useState(draftGenealogyProfile.syncPortrait);
  const [syncApelido, setSyncApelido] = useState(draftGenealogyProfile.syncApelido);
  const [syncTitle, setSyncTitle] = useState(draftGenealogyProfile.syncTitle);
  const [apelidoContext, setApelidoContext] = useState('');
  const [birthYearPrecision, setBirthYearPrecision] = useState<string>('');
  const [birthYear, setBirthYear] = useState<string>('');

  // Apelido check state
  const [apelidoCheckResult, setApelidoCheckResult] = useState<ApelidoCheckResult | null>(null);
  const [isCheckingApelido, setIsCheckingApelido] = useState(false);

  // User data for sync checkboxes
  const userData = useMemo(
    () => ({
      avatar: avatar || null,
      nickname: user?.nickname || null,
      title: user?.title || null,
    }),
    [avatar, user?.nickname, user?.title]
  );

  // Check apelido availability
  const checkApelido = useCallback(async () => {
    if (!syncApelido || !user?.nickname) {
      setApelidoCheckResult(null);
      return;
    }

    setIsCheckingApelido(true);
    try {
      const response = await fetch('/api/genealogy/persons/check-apelido', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          apelido: user.nickname,
          apelidoContext: apelidoContext || null,
        }),
      });

      if (response.ok) {
        const result = await response.json();
        setApelidoCheckResult(result);
      }
    } catch (err) {
      console.error('Error checking apelido:', err);
    } finally {
      setIsCheckingApelido(false);
    }
  }, [syncApelido, user?.nickname, apelidoContext]);

  // Check apelido when sync changes or context changes
  useEffect(() => {
    const timer = setTimeout(() => {
      checkApelido();
    }, 300); // Debounce

    return () => clearTimeout(timer);
  }, [checkApelido]);

  // Submit the genealogy profile
  const submitProfile = async () => {
    setSubmitting(true);
    setError(null);

    try {
      // Prepare the genealogy profile data (matching GenealogyProfileForm type)
      const profileData = {
        syncPortrait,
        syncApelido,
        syncTitle,
        apelido: syncApelido && user?.nickname ? user.nickname : null,
        apelidoContext: syncApelido && apelidoContext ? apelidoContext : null,
        title: syncTitle && user?.title ? user.title : null,
        portrait: syncPortrait && avatar ? avatar : null,
        style: null,
        birthYear: birthYear || null,
        birthYearPrecision: birthYearPrecision || null,
        bioEn: null,
        bioPt: null,
        publicLinks: [],
      };

      // Use the mutation to create genealogy profile (ensures query invalidation)
      const result = await createProfileMutation.mutateAsync(profileData);

      // Store the created profile ID in wizard context
      if (result.profileId) {
        setCreatedProfileId(result.profileId);
      }

      // Update context with the sync settings
      updateGenealogyProfile({
        syncPortrait,
        syncApelido,
        syncTitle,
        birthYear: birthYear ? Number.parseInt(birthYear, 10) : null,
        birthYearPrecision: birthYearPrecision || null,
      });

      // Proceed to next step (group or teacher selection)
      goToStep('group-or-teacher');
    } catch (err) {
      // Extract error message from axios response or Error object
      const errorMessage =
        (err as { response?: { data?: { error?: string } } })?.response?.data?.error ||
        (err instanceof Error ? err.message : 'Failed to create profile');
      setError(errorMessage);
    } finally {
      setSubmitting(false);
    }
  };

  // Handle form submission - validates and may show confirmation modal
  const handleNext = async () => {
    // Validate apelido availability
    if (syncApelido && apelidoCheckResult) {
      if (!apelidoCheckResult.isAvailable) {
        setError('This apelido is already taken. Please add context to distinguish yourself.');
        return;
      }
      if (apelidoCheckResult.requiresContext && !apelidoContext.trim()) {
        setError('Please add context to distinguish your apelido (e.g., your city or group name).');
        return;
      }
    }

    // Check if birth year is missing - show confirmation modal
    if (!birthYear) {
      openBirthYearModal();
      return;
    }

    // Birth year is set, proceed directly
    await submitProfile();
  };

  // Handle "Publish Anyway" from modal
  const handlePublishAnyway = async () => {
    closeBirthYearModal();
    await submitProfile();
  };

  // Determine if Next should be disabled
  // Only block if apelido is being synced but has availability issues
  const isNextDisabled =
    isSubmitting ||
    isCheckingApelido ||
    (syncApelido && apelidoCheckResult && !apelidoCheckResult.isAvailable) ||
    (syncApelido && apelidoCheckResult?.requiresContext && !apelidoContext.trim());

  return (
    <div className="space-y-6">
      {/* Intro */}
      <div className="text-center mb-6">
        <h2 className="text-xl font-semibold mb-2">Your Genealogy Profile</h2>
        <p className="text-default-500">
          Choose what to publish. We recommend at least your <strong>title</strong> and{' '}
          <strong>apelido / username</strong>
        </p>
      </div>

      {/* Sync options */}
      <Card>
        <CardBody className="p-4 sm:p-6">
          <SyncCheckboxes
            user={userData}
            syncPortrait={syncPortrait}
            syncApelido={syncApelido}
            syncTitle={syncTitle}
            apelidoContext={apelidoContext}
            apelidoCheckResult={apelidoCheckResult}
            isCheckingApelido={isCheckingApelido}
            onSyncPortraitChange={setSyncPortrait}
            onSyncApelidoChange={setSyncApelido}
            onSyncTitleChange={setSyncTitle}
            onApelidoContextChange={setApelidoContext}
            title="Sync from Profile"
          />
        </CardBody>
      </Card>

      {/* Genealogy Preview */}
      <div className="w-full sm:w-auto sm:mx-auto sm:min-w-[280px]">
        <GenealogyPreviewCard
          portrait={syncPortrait ? avatar : null}
          apelido={syncApelido ? user?.nickname : null}
          title={syncTitle ? user?.title : null}
          label="Preview"
          className="w-full"
        />
      </div>

      {/* Birth year (optional) */}
      <Card>
        <CardBody className="p-4 sm:p-6 space-y-3">
          <div className="text-sm font-medium text-default-700">Birth Year (optional)</div>
          <p className="text-xs text-default-500">
            Adding your birth decade or year helps place you on the genealogy timeline.
          </p>
          <div className="flex flex-col sm:flex-row gap-3">
            <Select
              label="Precision"
              placeholder="Select"
              selectedKeys={birthYearPrecision ? [birthYearPrecision] : []}
              onSelectionChange={(keys) => {
                const value = Array.from(keys)[0]?.toString() || '';
                setBirthYearPrecision(value);
                setBirthYear(''); // Reset year when precision changes
              }}
              className="sm:flex-1"
            >
              {PRECISION_OPTIONS.map((p) => (
                <SelectItem key={p.key}>{p.label}</SelectItem>
              ))}
            </Select>

            {birthYearPrecision && (
              <Select
                label={birthYearPrecision === 'decade' ? 'Decade' : 'Year'}
                placeholder="Select"
                selectedKeys={birthYear ? [birthYear] : []}
                onSelectionChange={(keys) => {
                  const value = Array.from(keys)[0]?.toString() || '';
                  setBirthYear(value);
                }}
                className="sm:flex-1"
              >
                {(birthYearPrecision === 'decade' ? DECADES : YEARS).map((item) => (
                  <SelectItem key={String(item)}>
                    {birthYearPrecision === 'decade' ? `${item}s` : String(item)}
                  </SelectItem>
                ))}
              </Select>
            )}
          </div>
        </CardBody>
      </Card>

      {/* Error message */}
      {error && <div className="text-danger text-sm text-center">{error}</div>}

      {/* CTA button */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button
          color="primary"
          size="lg"
          onPress={handleNext}
          isDisabled={isNextDisabled}
          isLoading={isSubmitting}
          className="min-w-[180px]"
        >
          Publish & Continue
        </Button>
      </div>

      {/* Back button - fixed on mobile */}
      {canGoBack && (
        <div className="fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 pt-3 border-t border-default-200 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0 md:pt-4 md:border-t-0">
          <Button variant="light" color="default" startContent={<ArrowLeft className="w-4 h-4" />} onPress={goBack}>
            Back
          </Button>
        </div>
      )}

      {/* Birth year confirmation modal */}
      <Modal isOpen={isBirthYearModalOpen} onClose={closeBirthYearModal} placement="center">
        <ModalContent>
          <ModalHeader>No Birth Year Specified</ModalHeader>
          <ModalBody>
            <p className="text-default-600">
              You haven&apos;t specified a birth year or decade. Without this information, your profile won&apos;t
              appear accurately on the genealogy timeline.
            </p>
            <p className="text-default-500 text-sm mt-2">You can always add this later in your genealogy profile.</p>
          </ModalBody>
          <ModalFooter>
            <Button variant="flat" onPress={closeBirthYearModal}>
              Go Back & Edit
            </Button>
            <Button color="primary" onPress={handlePublishAnyway} isLoading={isSubmitting}>
              Publish Anyway
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </div>
  );
}

export default GenealogyProfileStep;
