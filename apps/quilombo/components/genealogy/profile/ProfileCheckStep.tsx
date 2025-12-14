'use client';

import { Button, Card, CardBody, CardFooter, CardHeader, Divider, Spinner } from '@heroui/react';
import { AlertCircleIcon, ClockIcon, SearchIcon, UserCheckIcon } from 'lucide-react';
import Image from 'next/image';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

import { PATHS } from '@/config/constants';
import { usePendingPersonClaim, useSearchPersons } from '@/query/genealogyProfile';
import PersonSearchSelect from '../ui/PersonSearchSelect';
import ClaimProfileModal from './ClaimProfileModal';

type PersonProfile = {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
};

type ProfileCheckStepProps = {
  /** User's apelido (nickname) for auto-search */
  userApelido?: string | null;
  /** Called when user wants to proceed to create a new profile */
  onProceedToCreate: () => void;
};

/**
 * Wizard step that checks if user's profile already exists in genealogy.
 * - Auto-searches if user has an apelido
 * - Allows manual search if no apelido
 * - Shows pending claim status if user already has one
 */
const ProfileCheckStep = ({ userApelido, onProceedToCreate }: ProfileCheckStepProps) => {
  const router = useRouter();
  const [selectedProfile, setSelectedProfile] = useState<PersonProfile | null>(null);
  const [isClaimModalOpen, setIsClaimModalOpen] = useState(false);

  // Check if user already has a pending claim
  const { data: pendingClaim, isLoading: isLoadingPendingClaim } = usePendingPersonClaim();

  // Auto-search with user's apelido if available (only claimable profiles)
  const hasApelido = !!userApelido && userApelido.length > 2;
  const { data: autoSearchResults, isFetching: isAutoSearching } = useSearchPersons(userApelido || '', {
    enabled: hasApelido,
    claimableOnly: true,
  });

  // If user has a pending claim, show that status
  if (isLoadingPendingClaim) {
    return (
      <Card className="max-w-2xl mx-auto">
        <CardBody className="flex items-center justify-center py-12">
          <Spinner size="lg" />
          <p className="mt-4 text-default-500">Checking your claim status...</p>
        </CardBody>
      </Card>
    );
  }

  // User already has a pending claim - show status
  if (pendingClaim) {
    return (
      <Card className="max-w-2xl mx-auto">
        <CardHeader className="flex gap-3">
          <ClockIcon className="h-8 w-8 text-warning" />
          <div className="flex flex-col">
            <p className="text-xl font-semibold">Claim Under Review</p>
            <p className="text-small text-default-500">You have a pending profile claim</p>
          </div>
        </CardHeader>
        <Divider />
        <CardBody className="gap-4">
          <div className="p-4 bg-warning-50 dark:bg-warning-900/20 rounded-lg border border-warning-200 dark:border-warning-800">
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
          <p className="text-default-600">
            If you believe this is an error or need to update your claim, please contact support.
          </p>
        </CardBody>
        <Divider />
        <CardFooter className="justify-end">
          <Button variant="light" onPress={() => router.push(PATHS.profile)}>
            Back to Profile
          </Button>
        </CardFooter>
      </Card>
    );
  }

  const handleProfileSelect = (profile: PersonProfile) => {
    setSelectedProfile(profile);
    setIsClaimModalOpen(true);
  };

  const handleClaimSuccess = () => {
    setIsClaimModalOpen(false);
    setSelectedProfile(null);
    // Redirect to user profile after successful claim submission
    router.push(PATHS.profile);
  };

  return (
    <>
      <Card className="max-w-2xl mx-auto">
        <CardHeader className="flex gap-3">
          <SearchIcon className="h-8 w-8 text-primary" />
          <div className="flex flex-col">
            <p className="text-xl font-semibold">Check for Existing Profile</p>
            <p className="text-small text-default-500">Your profile may already exist in the genealogy</p>
          </div>
        </CardHeader>
        <Divider />
        <CardBody className="gap-4">
          <p className="text-default-600">
            Before creating a new profile, let&apos;s check if you&apos;re already in the Capoeira Genealogy. If your
            profile exists, you can claim it instead of creating a duplicate.
          </p>

          {/* Auto-search results section */}
          {hasApelido && (
            <div className="space-y-3">
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
                <div className="p-4 bg-default-50 rounded-lg border border-default-200">
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
              <span className="font-medium text-default-700">Search by different name</span>
            </div>
            <p className="text-sm text-default-500">
              If your profile uses a different apelido or civil name, search for it here:
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
          <div className="flex items-start gap-2 p-3 bg-primary-50 dark:bg-primary-900/20 rounded-lg">
            <AlertCircleIcon className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
            <p className="text-sm text-primary-700 dark:text-primary-300">
              <strong>Can&apos;t find your profile?</strong> No problem! You can create a new one in the next step.
            </p>
          </div>
        </CardBody>
        <Divider />
        <CardFooter className="justify-between">
          <Button variant="light" onPress={() => router.push(PATHS.profile)}>
            Cancel
          </Button>
          <Button color="primary" onPress={onProceedToCreate}>
            None of these are me - Create New Profile
          </Button>
        </CardFooter>
      </Card>

      {/* Claim Modal */}
      {selectedProfile && (
        <ClaimProfileModal
          isOpen={isClaimModalOpen}
          onClose={() => {
            setIsClaimModalOpen(false);
            setSelectedProfile(null);
          }}
          profile={selectedProfile}
          onSuccess={handleClaimSuccess}
        />
      )}
    </>
  );
};

export default ProfileCheckStep;
