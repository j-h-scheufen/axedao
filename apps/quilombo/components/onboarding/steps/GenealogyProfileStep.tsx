'use client';

import { Card, CardBody, Select, SelectItem } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useCallback, useEffect, useMemo, useState } from 'react';

import GenealogyPreviewCard from '@/components/genealogy/profile/GenealogyPreviewCard';
import { currentUserAtom, currentUserAvatarAtom } from '@/hooks/state/currentUser';

import { useOnboarding } from '../contexts/OnboardingContext';
import { SyncCheckboxes } from '../shared/SyncCheckboxes';
import { WizardNavigationFooter } from '../shared/WizardNavigationFooter';

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
  const { state, goToStep, updateGenealogyProfile, setCreatedProfileId, setError, setSubmitting } = useOnboarding();
  const { draftGenealogyProfile, isSubmitting, error } = state;

  const { data: user } = useAtomValue(currentUserAtom);
  const avatar = useAtomValue(currentUserAvatarAtom);

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

  // Handle form submission
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

    // Must have at least apelido to publish
    if (!syncApelido || !user?.nickname) {
      setError('An apelido (capoeira nickname) is required to publish your genealogy profile.');
      return;
    }

    setSubmitting(true);
    setError(null);

    try {
      // Prepare the genealogy profile data
      const profileData: Record<string, unknown> = {
        apelido: user.nickname,
        apelidoContext: apelidoContext || null,
        title: syncTitle && user?.title ? user.title : null,
        portrait: syncPortrait && avatar ? avatar : null,
        birthYear: birthYear || null,
        birthYearPrecision: birthYearPrecision || null,
      };

      // Submit to create genealogy profile
      const response = await fetch('/api/profile/genealogy', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(profileData),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to create genealogy profile');
      }

      // Extract the created profile ID from the response
      const responseData = await response.json();
      if (responseData.profileId) {
        setCreatedProfileId(responseData.profileId);
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
      setError(err instanceof Error ? err.message : 'Failed to create profile');
    } finally {
      setSubmitting(false);
    }
  };

  // Determine if Next should be disabled
  const isNextDisabled =
    isSubmitting ||
    isCheckingApelido ||
    !syncApelido ||
    !user?.nickname ||
    (apelidoCheckResult && !apelidoCheckResult.isAvailable) ||
    (apelidoCheckResult?.requiresContext && !apelidoContext.trim());

  return (
    <div className="space-y-6">
      {/* Intro */}
      <div className="text-center mb-6">
        <h2 className="text-xl font-semibold mb-2">Your Genealogy Profile</h2>
        <p className="text-default-500">Choose what to publish from your profile. Your apelido is required.</p>
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

      {/* Navigation */}
      <WizardNavigationFooter
        showBack={true}
        showSkip={false}
        isLoading={isSubmitting}
        isNextDisabled={isNextDisabled}
        onNext={handleNext}
        nextLabel="Publish & Continue"
      />
    </div>
  );
}

export default GenealogyProfileStep;
