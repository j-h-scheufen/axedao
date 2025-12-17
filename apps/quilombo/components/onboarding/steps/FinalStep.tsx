'use client';

import { Button, Card, CardBody } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ClockIcon, GitBranch, MapPin, Search, Users } from 'lucide-react';
import { useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * Suggestion cards for what to do next.
 */
const SUGGESTIONS = [
  {
    icon: Search,
    title: 'Search People',
    description: 'Find capoeiristas and explore the community.',
    path: `${PATHS.search}?tab=people`,
    color: 'primary' as const,
  },
  {
    icon: Users,
    title: 'Browse Groups',
    description: 'Discover capoeira groups around the world.',
    path: `${PATHS.search}?tab=groups`,
    color: 'secondary' as const,
  },
  {
    icon: MapPin,
    title: 'Find Events',
    description: 'Explore workshops, batizados, and rodas.',
    path: `${PATHS.search}?tab=events`,
    color: 'success' as const,
  },
];

interface FinalStepProps {
  /** Callback when wizard is completed */
  onComplete: () => void;
}

/**
 * Page 5: Final Step
 *
 * Shows completion message and suggestions for what to do next.
 * If user published genealogy, shows link to view their position in the graph.
 */
export function FinalStep({ onComplete }: FinalStepProps) {
  const router = useRouter();
  const { state, createdProfileId, hasTeacherRelationship, goBack, canGoBack } = useOnboarding();
  const { publishGenealogy, submittedClaim, draftProfile } = state;
  const { data: user } = useAtomValue(currentUserAtom);

  // Get apelido from draft profile or user data
  const apelido = draftProfile.nickname || user?.nickname;

  // Use the profile ID created during this wizard session, or fall back to user's profileId
  const profileId = createdProfileId || user?.profileId;

  const handleSuggestionClick = (path: string) => {
    onComplete();
    router.push(path);
  };

  const handleViewGenealogy = () => {
    onComplete();
    // If user added teacher relationships, show ancestry view with their node selected
    // Otherwise show general view
    if (hasTeacherRelationship && profileId) {
      router.push(`${PATHS.genealogy}?view=student-ancestry&node=${profileId}&showYourself=true`);
    } else if (profileId) {
      router.push(`${PATHS.genealogy}?node=${profileId}`);
    } else {
      router.push(PATHS.genealogy);
    }
  };

  const handleFinish = () => {
    onComplete();
    router.push(PATHS.profile);
  };

  return (
    <div className="space-y-6">
      {/* Success message */}
      <div className="text-center mb-8">
        <div className="text-6xl mb-4">🎉</div>
        <h2 className="text-2xl font-bold mb-2">
          Welcome {apelido ? apelido : <span className="italic">Anonymous</span>}!
        </h2>
        <p className="text-default-500">
          {submittedClaim
            ? "You're all set! Explore the community while we review your profile claim."
            : publishGenealogy
              ? "Your profile has been published to the genealogy. You're now part of the capoeira family tree!"
              : "You're all set! Explore the community and discover the capoeira world."}
        </p>
      </div>

      {/* Claim pending notice */}
      {submittedClaim && (
        <Card className="bg-warning/5 border border-warning/20">
          <CardBody className="p-3 sm:p-4">
            <div className="flex items-start gap-3 sm:gap-4">
              <div className="shrink-0 p-2 sm:p-3 rounded-lg bg-warning/10">
                <ClockIcon className="w-6 h-6 sm:w-8 sm:h-8 text-warning" />
              </div>
              <div className="flex-1">
                <h4 className="font-semibold text-default-700">Profile Claim Under Review</h4>
                <p className="text-sm text-default-500 mt-1">
                  Your claim for the profile{' '}
                  <strong className="text-default-700">{submittedClaim.profileApelido || 'Unknown'}</strong> is being
                  reviewed by an administrator. You&apos;ll receive an email notification once your request has been
                  processed.
                </p>
              </div>
            </div>
          </CardBody>
        </Card>
      )}

      {/* Genealogy link (only if published and we have a profile ID) */}
      {publishGenealogy && profileId && (
        <Card className="bg-primary/5 border border-primary/20">
          <CardBody className="p-3 sm:p-4">
            <div className="flex items-center gap-3 sm:gap-4">
              <div className="shrink-0 p-2 sm:p-3 rounded-lg bg-primary/10">
                <GitBranch className="w-6 h-6 sm:w-8 sm:h-8 text-primary" />
              </div>
              <div className="flex-1">
                <h4 className="font-semibold text-default-700">See Your Position</h4>
                <p className="text-sm text-default-500">View your place in the capoeira genealogy graph.</p>
              </div>
              <Button color="primary" variant="flat" onPress={handleViewGenealogy}>
                View Genealogy
              </Button>
            </div>
          </CardBody>
        </Card>
      )}

      {/* Suggestion cards */}
      <div>
        <h3 className="text-sm font-semibold text-default-500 uppercase tracking-wide mb-3">
          What would you like to do?
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {SUGGESTIONS.map((suggestion) => (
            <Card
              key={suggestion.title}
              isPressable
              onPress={() => handleSuggestionClick(suggestion.path)}
              className="bg-default-50 dark:bg-default-100/10 hover:bg-default-100 dark:hover:bg-default-100/20 transition-colors"
            >
              <CardBody className="flex flex-col items-center text-center gap-3 p-4 sm:p-6">
                <div className={`p-3 rounded-lg bg-${suggestion.color}/10`}>
                  <suggestion.icon className={`w-6 h-6 text-${suggestion.color}`} />
                </div>
                <div>
                  <h4 className="font-semibold text-default-700">{suggestion.title}</h4>
                  <p className="text-xs text-default-500 mt-1">{suggestion.description}</p>
                </div>
              </CardBody>
            </Card>
          ))}
        </div>
      </div>

      {/* Navigation buttons */}
      <div className="flex justify-between pt-4">
        {canGoBack ? (
          <Button variant="light" onPress={goBack}>
            Back
          </Button>
        ) : (
          <div />
        )}
        <Button color="success" size="lg" onPress={handleFinish}>
          Go to My Profile
        </Button>
      </div>
    </div>
  );
}

export default FinalStep;
