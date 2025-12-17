'use client';

import { Card, CardBody, Input, Select, SelectItem } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useCallback } from 'react';

import ImageUpload from '@/components/forms/ImageUpload';
import { titles } from '@/config/constants';
import { currentUserAtom, currentUserAvatarAtom } from '@/hooks/state/currentUser';
import { useUpdateAvatarMutation } from '@/query/currentUser';

import { HIGH_RANKING_TITLES, useOnboarding } from '../contexts/OnboardingContext';
import { WizardNavigationFooter } from '../shared/WizardNavigationFooter';

/**
 * Page 1: Basic Profile Step
 *
 * Collects optional profile fields:
 * - Avatar (profile photo)
 * - Title (mestre, contra-mestre, etc.)
 * - Apelido (capoeira nickname)
 *
 * Note: Style is part of the genealogy profile, not the user profile.
 * Context-aware intro message based on wizard mode.
 */
export function BasicProfileStep() {
  const { state, goToStep, updateProfile, setError, setSubmitting } = useOnboarding();
  const { mode, draftProfile, isSubmitting, error } = state;
  const { data: user } = useAtomValue(currentUserAtom);
  const avatar = useAtomValue(currentUserAvatarAtom);

  // Initialize draft from user data if not already set
  // Default to 'iniciante' if no title is set
  const title = draftProfile.title ?? user?.title ?? 'iniciante';
  const nickname = draftProfile.nickname ?? user?.nickname ?? '';

  const handleTitleChange = useCallback(
    (value: string) => {
      updateProfile({ title: value === '' ? null : (value as typeof draftProfile.title) });
    },
    [updateProfile]
  );

  const handleNicknameChange = useCallback(
    (value: string) => {
      updateProfile({ nickname: value });
    },
    [updateProfile]
  );

  const handleNext = async () => {
    setSubmitting(true);
    setError(null);

    try {
      // Auto-save profile to DB
      const response = await fetch('/api/profile', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          title,
          nickname: nickname || null,
        }),
      });

      if (!response.ok) {
        const data = await response.json();
        throw new Error(data.error || 'Failed to save profile');
      }

      // Check if title is high-ranking - if so, offer to check for existing profile
      const isHighRanking = title && HIGH_RANKING_TITLES.includes(title as (typeof HIGH_RANKING_TITLES)[number]);

      if (isHighRanking) {
        // Route to claim-check step for mestres/contra-mestres
        goToStep('claim-check');
      } else {
        // Proceed to normal genealogy flow
        goToStep('genealogy-explainer');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save profile');
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="space-y-6">
      {/* Intro message */}
      <div className="text-center mb-6">
        {mode === 'new-user' ? (
          <>
            <h2 className="text-xl font-semibold mb-2">Que bom te ver!</h2>
            <p className="text-default-500">
              Let&apos;s set up your profile so the community knows who you are. All fields are optional - add as much
              or as little as you like.
            </p>
          </>
        ) : (
          <>
            <h2 className="text-xl font-semibold mb-2">Complete Your Profile</h2>
            <p className="text-default-500">Add some details to help others recognize you in the community.</p>
          </>
        )}
      </div>

      {/* Profile form */}
      <Card>
        <CardBody className="space-y-6 p-4 sm:p-6">
          {/* Avatar */}
          <div className="flex justify-center">
            <ImageUpload
              value={avatar}
              ownerId=""
              useFileUploadMutation={useUpdateAvatarMutation}
              cropAspect={1}
              cropTitle="Crop Avatar"
            />
          </div>

          {/* Title */}
          <div className="space-y-2">
            <p className="text-sm text-default-600">
              <span className="font-medium">What is your title?</span> If you&apos;re a beginner, choose
              &quot;Iniciante&quot;
            </p>
            <Select
              label="Title"
              placeholder="Select your title"
              selectedKeys={title ? [title] : []}
              onChange={(e) => handleTitleChange(e.target.value)}
              classNames={{ value: 'capitalize' }}
            >
              {titles.map((t) => (
                <SelectItem key={t} className="capitalize">
                  {t}
                </SelectItem>
              ))}
            </Select>
          </div>

          {/* Nickname/Apelido */}
          <div className="space-y-2">
            <p className="text-sm text-default-600">
              <span className="font-medium">Do you have a Capoeira name (apelido)?</span>
            </p>
            <Input
              label="Apelido"
              placeholder="Your capoeira nickname"
              value={nickname}
              onChange={(e) => handleNicknameChange(e.target.value)}
              description="You can add this later if you haven't received one yet"
            />
          </div>
        </CardBody>
      </Card>

      {/* Error message */}
      {error && <div className="text-danger text-sm text-center">{error}</div>}

      {/* Navigation */}
      <WizardNavigationFooter showBack={false} showSkip={false} isLoading={isSubmitting} onNext={handleNext} />
    </div>
  );
}

export default BasicProfileStep;
