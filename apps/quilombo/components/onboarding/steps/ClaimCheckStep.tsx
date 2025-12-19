'use client';

import { Button, Card, CardBody, CardHeader, Divider, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ArrowLeft, ClockIcon, UserCheckIcon } from 'lucide-react';
import Image from 'next/image';

import { currentUserAtom } from '@/hooks/state/currentUser';
import { usePendingPersonClaim } from '@/query/genealogyProfile';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * ClaimCheckStep - Shows matching claimable profiles
 *
 * Displays pre-fetched claimable profiles from context (set by GenealogyExplainerStep).
 * User can select a profile to claim or proceed to create a new profile.
 *
 * Flow:
 * - If user has a pending claim: show status and allow continuing
 * - Otherwise: show matching profiles from context
 * - Click on profile → store selection → goToStep('claim-form')
 * - "None of these are me" → goToStep('genealogy-profile')
 */
export function ClaimCheckStep() {
  const { state, goToStep, goBack, canGoBack, setSelectedClaimProfile, setSubmittedClaim } = useOnboarding();
  const { claimableProfiles } = state;
  const { data: user } = useAtomValue(currentUserAtom);

  // Check if user already has a pending claim
  const { data: pendingClaim, isLoading: isLoadingPendingClaim } = usePendingPersonClaim();

  const handleProfileSelect = (profile: (typeof claimableProfiles)[0]) => {
    setSelectedClaimProfile(profile);
    goToStep('claim-form');
  };

  const handleNotMe = () => {
    // Clear any previously selected profile and proceed to create new
    setSelectedClaimProfile(null);
    goToStep('genealogy-profile');
  };

  // Loading state while checking for pending claims
  if (isLoadingPendingClaim) {
    return (
      <div className="space-y-6">
        <div className="flex flex-col items-center justify-center py-12">
          <Spinner size="lg" />
          <p className="mt-4 text-default-500">Checking your claim status...</p>
        </div>
      </div>
    );
  }

  // User already has a pending claim - show status and allow continuing
  if (pendingClaim) {
    return (
      <div className="space-y-6">
        <Card>
          <CardHeader className="flex gap-3">
            <ClockIcon className="h-8 w-8 text-warning" />
            <div className="flex flex-col">
              <p className="text-xl font-semibold">Claim Under Review</p>
              <p className="text-small text-default-500">You have a pending profile claim</p>
            </div>
          </CardHeader>
          <Divider />
          <CardBody className="gap-4 p-3 sm:p-4">
            <div className="p-3 sm:p-4 bg-warning-50 dark:bg-warning-900/20 rounded-lg border border-warning-200 dark:border-warning-800">
              <p className="text-warning-700 dark:text-warning-300">
                You have already submitted a claim for the profile{' '}
                <strong>{pendingClaim.profileApelido || pendingClaim.profileName || 'Unknown'}</strong>.
              </p>
              <p className="text-sm text-warning-600 dark:text-warning-400 mt-2">
                Submitted on {new Date(pendingClaim.requestedAt).toLocaleDateString()}
              </p>
            </div>
            <p className="text-default-600">
              An administrator will review your claim. You&apos;ll receive an email notification once your request has
              been processed.
            </p>
            <p className="text-default-600">In the meantime, feel free to explore the community!</p>
          </CardBody>
        </Card>

        {/* Store claim info and proceed to final */}
        <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
          <Button
            color="primary"
            size="lg"
            onPress={() => {
              setSubmittedClaim({
                profileId: pendingClaim.personProfileId,
                profileApelido: pendingClaim.profileApelido,
              });
              goToStep('final');
            }}
            className="min-w-[180px]"
          >
            Continue
          </Button>
        </div>

        {/* Back button */}
        {canGoBack && (
          <div className="fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 pt-3 border-t border-default-200 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0 md:pt-4 md:border-t-0">
            <Button variant="light" color="default" startContent={<ArrowLeft className="w-4 h-4" />} onPress={goBack}>
              Back
            </Button>
          </div>
        )}
      </div>
    );
  }

  // Show matching claimable profiles
  return (
    <div className="space-y-5">
      {/* Intro message */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Is This You?</h2>
        <p className="text-sm text-default-500">
          We found {claimableProfiles.length === 1 ? 'a profile' : 'profiles'} matching &quot;
          {user?.nickname}&quot; in our genealogy database.
        </p>
      </div>

      {/* Info card */}
      <div className="p-4 rounded-xl bg-gradient-to-r from-primary/10 to-transparent">
        <p className="text-sm text-default-600">
          If one of these is you, you can <strong>claim your profile</strong> instead of creating a new one. This
          preserves your existing lineage connections.
        </p>
        <p className="text-xs text-default-500 mt-2">
          Profile claims require admin approval. You&apos;ll receive an email when your claim is reviewed.
        </p>
      </div>

      {/* Matching profiles list */}
      <Card>
        <CardHeader className="flex gap-2 px-3 sm:px-4 py-3">
          <UserCheckIcon className="h-5 w-5 text-primary" />
          <span className="font-medium text-default-700">Select your profile</span>
        </CardHeader>
        <Divider />
        <CardBody className="p-0">
          <div className="divide-y divide-default-100">
            {claimableProfiles.map((profile) => (
              <div key={profile.id} className="w-full p-3 sm:p-4 flex items-center gap-3">
                <div className="h-12 w-12 rounded-full bg-default-200 flex items-center justify-center overflow-hidden flex-shrink-0 relative">
                  {profile.portrait ? (
                    <Image
                      src={profile.portrait}
                      alt={profile.apelido || profile.name || 'Profile'}
                      fill
                      className="object-cover"
                      sizes="48px"
                    />
                  ) : (
                    <span className="text-default-500 text-xl">
                      {(profile.apelido || profile.name || '?')[0].toUpperCase()}
                    </span>
                  )}
                </div>
                <div className="flex-grow min-w-0">
                  {profile.title && <p className="text-xs text-default-500 uppercase tracking-wide">{profile.title}</p>}
                  <p className="text-base font-medium truncate">{profile.apelido || profile.name || 'Unknown'}</p>
                  {profile.name && profile.apelido && (
                    <p className="text-sm text-default-400 truncate">{profile.name}</p>
                  )}
                </div>
                <Button color="primary" variant="flat" size="sm" onPress={() => handleProfileSelect(profile)}>
                  Claim
                </Button>
              </div>
            ))}
          </div>
        </CardBody>
      </Card>

      {/* CTA buttons */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button color="primary" variant="flat" size="lg" onPress={handleNotMe} className="min-w-[180px]">
          None of These Are Me
        </Button>
      </div>

      {/* Note */}
      <p className="text-xs text-default-400 text-center">
        You&apos;ll be able to create a new genealogy profile in the next step.
      </p>

      {/* Back button */}
      {canGoBack && (
        <div className="fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 pt-3 border-t border-default-200 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0 md:pt-4 md:border-t-0">
          <Button variant="light" color="default" startContent={<ArrowLeft className="w-4 h-4" />} onPress={goBack}>
            Back
          </Button>
        </div>
      )}
    </div>
  );
}

export default ClaimCheckStep;
