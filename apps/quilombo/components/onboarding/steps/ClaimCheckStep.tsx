'use client';

import {
  Avatar,
  Button,
  Card,
  CardBody,
  CardHeader,
  Divider,
  Modal,
  ModalBody,
  ModalContent,
  ModalFooter,
  ModalHeader,
  Spinner,
  addToast,
} from '@heroui/react';
import { Field, Form, Formik, type FormikHelpers } from 'formik';
import { AlertCircleIcon, ClockIcon, SearchIcon, UserCheckIcon } from 'lucide-react';
import Image from 'next/image';
import { useState } from 'react';

import FieldTextarea from '@/components/forms/FieldTextarea';
import PersonSearchSelect from '@/components/genealogy/ui/PersonSearchSelect';
import { claimPersonFormSchema } from '@/config/validation-schema';
import { useClaimPersonMutation, usePendingPersonClaim, useSearchPersons } from '@/query/genealogyProfile';

import { HIGH_RANKING_TITLES, useOnboarding } from '../contexts/OnboardingContext';
import { WizardNavigationFooter } from '../shared/WizardNavigationFooter';

type PersonProfile = {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
};

type ClaimFormValues = {
  userMessage: string;
};

/**
 * Onboarding step that checks if user might already exist in the genealogy.
 * Shown for users with high-ranking titles (mestre/mestra, contra-mestre/contra-mestra).
 *
 * - Auto-searches if user entered an apelido
 * - Allows manual search
 * - Shows pending claim status if user already has one
 * - If user claims a profile, skips to final step (no new genealogy profile created)
 * - If no match, proceeds to normal genealogy-explainer flow
 */
export function ClaimCheckStep() {
  const { state, goToStep, goBack, canGoBack, setSubmittedClaim } = useOnboarding();
  const { draftProfile } = state;
  const [selectedProfile, setSelectedProfile] = useState<PersonProfile | null>(null);
  const [isClaimModalOpen, setIsClaimModalOpen] = useState(false);

  const claimMutation = useClaimPersonMutation();

  // Check if user already has a pending claim
  const { data: pendingClaim, isLoading: isLoadingPendingClaim } = usePendingPersonClaim();

  // Auto-search with user's apelido if available (only claimable profiles)
  const userApelido = draftProfile.nickname || '';
  const hasApelido = userApelido.length > 2;
  const { data: autoSearchResults, isFetching: isAutoSearching } = useSearchPersons(userApelido, {
    enabled: hasApelido,
    claimableOnly: true,
  });

  // Get display title for intro message
  const titleDisplay = draftProfile.title
    ? HIGH_RANKING_TITLES.includes(draftProfile.title as (typeof HIGH_RANKING_TITLES)[number])
      ? draftProfile.title
      : null
    : null;

  const handleProfileSelect = (profile: PersonProfile) => {
    setSelectedProfile(profile);
    setIsClaimModalOpen(true);
  };

  const handleClaimSubmit = async (values: ClaimFormValues, helpers: FormikHelpers<ClaimFormValues>) => {
    if (!selectedProfile) return;

    try {
      await claimMutation.mutateAsync({
        personProfileId: selectedProfile.id,
        userMessage: values.userMessage.trim(),
      });

      addToast({
        title: 'Claim submitted',
        description: 'Your request to claim this profile has been submitted for review.',
        color: 'success',
      });

      // Save claim info to context for final step messaging
      setSubmittedClaim({
        profileId: selectedProfile.id,
        profileApelido: selectedProfile.apelido,
      });

      helpers.resetForm();
      setIsClaimModalOpen(false);
      setSelectedProfile(null);

      // Skip genealogy creation, go directly to final step
      goToStep('final');
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Failed to submit claim';
      addToast({
        title: 'Error',
        description: message,
        color: 'danger',
      });
    }
  };

  const handleNotMe = () => {
    // Proceed to normal genealogy flow
    goToStep('genealogy-explainer');
  };

  const getDisplayName = (profile: PersonProfile) => {
    return profile.apelido || profile.name || 'this profile';
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
        <WizardNavigationFooter
          showBack={canGoBack}
          showSkip={false}
          nextLabel="Continue"
          onBack={goBack}
          onNext={() => {
            setSubmittedClaim({
              profileId: pendingClaim.personProfileId,
              profileApelido: pendingClaim.profileApelido,
            });
            goToStep('final');
          }}
        />
      </div>
    );
  }

  return (
    <>
      <div className="space-y-6">
        {/* Intro message */}
        <div className="text-center mb-4">
          <h2 className="text-xl font-semibold mb-2">Are You Already in the Genealogy?</h2>
          <p className="text-default-500">
            {titleDisplay ? (
              <>
                As a <span className="font-medium capitalize">{titleDisplay}</span>, there&apos;s a good chance
                you&apos;re already in our Capoeira Genealogy database.
              </>
            ) : (
              <>Check if your profile already exists in our Capoeira Genealogy database.</>
            )}
          </p>
        </div>

        <Card>
          <CardBody className="gap-4 p-3 sm:p-4">
            <p className="text-default-600">
              If you find yourself in the list below, you can <strong>claim your profile</strong> instead of creating a
              new one. This helps us avoid duplicates and preserves your lineage connections.
            </p>

            <div className="p-3 bg-primary-50 dark:bg-primary-900/20 rounded-lg border border-primary-200 dark:border-primary-800">
              <p className="text-sm text-primary-700 dark:text-primary-300">
                <strong>Note:</strong> Profile claims require admin approval. This is an asynchronous process -
                you&apos;ll receive an email when your claim is reviewed.
              </p>
            </div>

            {/* Auto-search results section */}
            {hasApelido && (
              <div className="space-y-3 mt-4">
                <div className="flex items-center gap-2">
                  <UserCheckIcon className="h-5 w-5 text-primary" />
                  <span className="font-medium">Profiles matching &quot;{userApelido}&quot;</span>
                </div>

                {isAutoSearching ? (
                  <div className="flex items-center justify-center py-6">
                    <Spinner size="sm" />
                    <span className="ml-2 text-default-500">Searching...</span>
                  </div>
                ) : autoSearchResults && autoSearchResults.length > 0 ? (
                  <div className="space-y-2">
                    <p className="text-sm text-default-500">
                      We found profiles that might be you. Click to claim if one is yours:
                    </p>
                    <div className="max-h-64 overflow-y-auto border border-default-200 rounded-lg divide-y divide-default-100">
                      {autoSearchResults.map((person) => (
                        <button
                          key={person.id}
                          type="button"
                          className="w-full text-left p-3 hover:bg-default-100 transition-colors flex items-center gap-3"
                          onClick={() => handleProfileSelect(person)}
                        >
                          <div className="h-10 w-10 rounded-full bg-default-200 flex items-center justify-center overflow-hidden flex-shrink-0 relative">
                            {person.portrait ? (
                              <Image
                                src={person.portrait}
                                alt={person.apelido || person.name || 'Profile'}
                                fill
                                className="object-cover"
                                sizes="40px"
                              />
                            ) : (
                              <span className="text-default-500 text-lg">
                                {(person.apelido || person.name || '?')[0].toUpperCase()}
                              </span>
                            )}
                          </div>
                          <div className="flex-grow min-w-0">
                            {person.title && (
                              <p className="text-xs text-default-500 uppercase tracking-wide">{person.title}</p>
                            )}
                            <p className="text-sm font-medium truncate">{person.apelido || person.name || 'Unknown'}</p>
                            {person.name && person.apelido && (
                              <p className="text-xs text-default-400 truncate">{person.name}</p>
                            )}
                          </div>
                        </button>
                      ))}
                    </div>
                  </div>
                ) : (
                  <div className="p-3 sm:p-4 bg-default-50 rounded-lg border border-default-200">
                    <p className="text-sm text-default-500">
                      No profiles found matching your apelido. You can search by a different name below, or proceed to
                      create a new profile.
                    </p>
                  </div>
                )}
              </div>
            )}

            {/* Manual search section */}
            <div className="space-y-3">
              <Divider className="my-2" />
              <div className="flex items-center gap-2">
                <SearchIcon className="h-5 w-5 text-default-500" />
                <span className="font-medium text-default-700">
                  {hasApelido ? 'Search by different name' : 'Search for your profile'}
                </span>
              </div>
              <p className="text-sm text-default-500">
                {hasApelido
                  ? 'If your profile uses a different apelido or civil name, search for it here:'
                  : 'Search by your apelido or civil name:'}
              </p>
              <PersonSearchSelect
                label="Search genealogy profiles"
                placeholder="Type at least 3 characters..."
                onSelect={handleProfileSelect}
                onClear={() => setSelectedProfile(null)}
                claimableOnly
              />
            </div>

            {/* Not found info */}
            <div className="flex items-start gap-2 p-3 bg-default-50 dark:bg-default-100/10 rounded-lg mt-2">
              <AlertCircleIcon className="h-5 w-5 text-default-500 flex-shrink-0 mt-0.5" />
              <p className="text-sm text-default-600">
                <strong>Can&apos;t find your profile?</strong> No problem! You can create a new genealogy profile in the
                next steps.
              </p>
            </div>
          </CardBody>
        </Card>

        {/* Navigation */}
        <WizardNavigationFooter
          showBack={canGoBack}
          showSkip={false}
          nextLabel="None of these are me"
          onBack={goBack}
          onNext={handleNotMe}
        />
      </div>

      {/* Claim Modal */}
      {selectedProfile && (
        <Modal isOpen={isClaimModalOpen} onClose={() => setIsClaimModalOpen(false)} size="lg">
          <ModalContent>
            <Formik<ClaimFormValues>
              initialValues={{ userMessage: '' }}
              validationSchema={claimPersonFormSchema}
              onSubmit={handleClaimSubmit}
            >
              {({ isSubmitting }) => (
                <Form>
                  <ModalHeader className="flex flex-col gap-1">
                    <h3 className="text-lg font-semibold">Claim This Profile</h3>
                    <p className="text-sm text-default-500 font-normal">
                      Request to link this genealogy profile to your account
                    </p>
                  </ModalHeader>

                  <ModalBody className="gap-4">
                    {/* Profile preview */}
                    <div className="flex items-center gap-3 sm:gap-4 p-3 sm:p-4 bg-default-100 rounded-lg">
                      <Avatar
                        src={selectedProfile.portrait || undefined}
                        name={getDisplayName(selectedProfile)}
                        size="lg"
                        className="flex-shrink-0"
                      />
                      <div className="flex-grow min-w-0">
                        {selectedProfile.title && (
                          <p className="text-xs text-default-500 uppercase tracking-wide">{selectedProfile.title}</p>
                        )}
                        <p className="text-lg font-semibold truncate">{getDisplayName(selectedProfile)}</p>
                        {selectedProfile.name && selectedProfile.apelido && (
                          <p className="text-sm text-default-500 truncate">{selectedProfile.name}</p>
                        )}
                      </div>
                    </div>

                    {/* Explanation */}
                    <p className="text-sm text-default-600">
                      To claim this profile, please explain how you can verify that this is your profile. An
                      administrator will review your request.
                    </p>

                    {/* Message field */}
                    <Field
                      as={FieldTextarea}
                      name="userMessage"
                      label="Verification message"
                      placeholder="E.g., I was batizado by Mestre X in 2010 at event Y. My group is Z and I can provide..."
                      minRows={4}
                      description="Minimum 20 characters. Provide details that help verify your identity."
                    />
                  </ModalBody>

                  <ModalFooter>
                    <Button
                      variant="light"
                      onPress={() => {
                        setIsClaimModalOpen(false);
                        setSelectedProfile(null);
                      }}
                      isDisabled={isSubmitting}
                    >
                      Cancel
                    </Button>
                    <Button color="primary" type="submit" isLoading={isSubmitting}>
                      Submit Claim Request
                    </Button>
                  </ModalFooter>
                </Form>
              )}
            </Formik>
          </ModalContent>
        </Modal>
      )}
    </>
  );
}

export default ClaimCheckStep;
