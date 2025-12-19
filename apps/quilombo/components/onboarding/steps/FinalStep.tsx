'use client';

import { Button } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ArrowLeft, CheckCircle, ClockIcon, GitBranch, MapPin, Search, Users } from 'lucide-react';
import { useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * Suggestion items for what to do next.
 */
const SUGGESTIONS = [
  {
    icon: Search,
    title: 'Search People',
    description: 'Search for your friends and how to reach them.',
    path: `${PATHS.search}?tab=users`,
  },
  {
    icon: Users,
    title: 'Browse Groups',
    description: 'Find groups where you live and get in touch.',
    path: `${PATHS.search}?tab=groups`,
  },
  {
    icon: MapPin,
    title: 'Find Events',
    description: "Browse events in your area or where you're planning to go.",
    path: `${PATHS.search}?tab=events`,
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
    <div className="space-y-5">
      {/* Success message */}
      <div className="text-center">
        <div className="flex justify-center mb-3">
          <div className="p-3 rounded-full bg-success/10">
            <CheckCircle className="w-8 h-8 text-success" />
          </div>
        </div>
        <h2 className="text-xl font-semibold mb-2">Welcome{apelido ? `, ${apelido}` : ''}!</h2>
        <p className="text-sm text-default-500">
          {submittedClaim
            ? "You're all set! Explore the community while we review your profile claim."
            : publishGenealogy
              ? "Your profile has been published to the genealogy. You're now part of the capoeira family tree!"
              : "You're all set! Explore the community and discover the capoeira world."}
        </p>
      </div>

      {/* Claim pending notice */}
      {submittedClaim && (
        <div className="flex items-start gap-3 p-4 rounded-xl bg-gradient-to-r from-warning/10 to-transparent">
          <div className="shrink-0 p-2 rounded-full bg-warning/10">
            <ClockIcon className="w-5 h-5 text-warning" />
          </div>
          <div className="min-w-0">
            <p className="font-medium text-default-700 text-sm">Profile Claim Under Review</p>
            <p className="text-xs text-default-500 mt-1">
              Your claim for <strong>{submittedClaim.profileApelido || 'Unknown'}</strong> is being reviewed.
              You&apos;ll receive an email when processed.
            </p>
          </div>
        </div>
      )}

      {/* Genealogy link (only if published and we have a profile ID) */}
      {publishGenealogy && profileId && (
        <div className="flex items-center gap-3 p-4 rounded-xl bg-gradient-to-r from-primary/10 to-transparent">
          <div className="shrink-0 p-2 rounded-full bg-primary/10">
            <GitBranch className="w-5 h-5 text-primary" />
          </div>
          <div className="flex-1 min-w-0">
            <p className="font-medium text-default-700 text-sm">See Your Position</p>
            <p className="text-xs text-default-500">View your place in the capoeira genealogy.</p>
          </div>
          <Button color="primary" variant="flat" size="sm" onPress={handleViewGenealogy}>
            View
          </Button>
        </div>
      )}

      {/* Suggestions - gradient rows matching page 2 style */}
      <div className="space-y-3">
        <p className="text-sm font-medium text-default-700 text-center">What would you like to do?</p>
        {SUGGESTIONS.map((suggestion) => (
          <button
            key={suggestion.title}
            type="button"
            onClick={() => handleSuggestionClick(suggestion.path)}
            className="w-full flex items-start gap-3 p-3 rounded-xl bg-gradient-to-r from-primary/5 to-transparent hover:from-primary/10 transition-colors text-left"
          >
            <div className="shrink-0 p-2 rounded-full bg-primary/10">
              <suggestion.icon className="w-4 h-4 text-primary" />
            </div>
            <div className="min-w-0">
              <p className="font-medium text-default-700 text-sm">{suggestion.title}</p>
              <p className="text-xs text-default-500">{suggestion.description}</p>
            </div>
          </button>
        ))}
      </div>

      {/* Primary CTA */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button color="primary" size="lg" onPress={handleFinish} className="min-w-[180px]">
          Go to My Profile
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
    </div>
  );
}

export default FinalStep;
