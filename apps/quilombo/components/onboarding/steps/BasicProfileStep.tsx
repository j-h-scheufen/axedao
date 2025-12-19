'use client';

import { Card, CardBody, Input, Select, SelectItem } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useCallback } from 'react';

import ImageUpload from '@/components/forms/ImageUpload';
import { titles } from '@/config/constants';
import { currentUserAtom, currentUserAvatarAtom } from '@/hooks/state/currentUser';
import { useUpdateAvatarMutation } from '@/query/currentUser';

import { useOnboarding } from '../contexts/OnboardingContext';
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
  // Default to 'iniciante' only for new users (title is undefined, not null)
  const title =
    draftProfile.title !== undefined ? draftProfile.title : user?.title !== undefined ? user.title : 'iniciante';
  const nickname = draftProfile.nickname ?? user?.nickname ?? '';

  // Special key for null title selection
  const NONE_KEY = 'none';

  const handleTitleChange = useCallback(
    (value: string) => {
      updateProfile({ title: value === NONE_KEY ? null : (value as typeof draftProfile.title) });
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
    // Validate nickname is required
    if (!nickname.trim()) {
      setError('Apelido or username is required');
      return;
    }

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

      // Proceed to genealogy explainer (claim check happens there if user chooses to publish)
      goToStep('genealogy-explainer');
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
            <p className="text-default-500">Let&apos;s set up your profile so the community knows who you are.</p>
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
          <div className="space-y-2">
            <p className="text-sm text-default-600 text-center">
              <span className="font-medium sm:hidden">Take or upload a picture</span>
              <span className="font-medium hidden sm:inline">Upload a picture</span>
            </p>
            <div className="flex justify-center">
              <ImageUpload
                value={avatar}
                ownerId=""
                useFileUploadMutation={useUpdateAvatarMutation}
                cropAspect={1}
                cropTitle="Crop Avatar"
              />
            </div>
          </div>

          {/* Nickname/Apelido */}
          <div className="space-y-2">
            <p className="text-sm text-default-600">
              <span className="font-medium">
                Do you have an apelido (nickname)? Otherwise, enter a username by which you want to be known.
              </span>
            </p>
            <Input
              label="Apelido / Username"
              placeholder="Your capoeira nickname or username"
              value={nickname}
              onChange={(e) => handleNicknameChange(e.target.value)}
              isRequired
            />
          </div>

          {/* Title */}
          <div className="space-y-2">
            <p className="text-sm text-default-600">
              <span className="font-medium">Do you have a title?</span>
            </p>
            <Select
              label="Title"
              placeholder="Select your title"
              selectedKeys={[title === null ? NONE_KEY : title]}
              onChange={(e) => handleTitleChange(e.target.value)}
              classNames={{ value: 'capitalize' }}
              description="If you're a beginner, choose 'Iniciante'"
            >
              {[
                ...titles.map((t) => (
                  <SelectItem key={t} className="capitalize">
                    {t}
                  </SelectItem>
                )),
                <SelectItem key={NONE_KEY}>None</SelectItem>,
              ]}
            </Select>
          </div>
        </CardBody>
      </Card>

      {/* Error message */}
      {error && <div className="text-danger text-sm text-center">{error}</div>}

      {/* Navigation */}
      <WizardNavigationFooter
        showBack={false}
        showSkip={false}
        isLoading={isSubmitting}
        isNextDisabled={!nickname.trim()}
        onNext={handleNext}
      />
    </div>
  );
}

export default BasicProfileStep;
