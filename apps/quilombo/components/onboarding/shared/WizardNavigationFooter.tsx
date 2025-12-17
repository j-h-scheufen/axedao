'use client';

import { Button } from '@heroui/react';
import { ArrowLeft, ArrowRight, SkipForward } from 'lucide-react';

import { useOnboarding } from '../contexts/OnboardingContext';

interface WizardNavigationFooterProps {
  /** Whether to show the back button */
  showBack?: boolean;
  /** Custom label for the next button */
  nextLabel?: string;
  /** Whether to show a skip option */
  showSkip?: boolean;
  /** Custom label for the skip button */
  skipLabel?: string;
  /** Whether the next button is disabled */
  isNextDisabled?: boolean;
  /** Whether the action is currently in progress */
  isLoading?: boolean;
  /** Callback when next is clicked */
  onNext?: () => void | Promise<void>;
  /** Callback when skip is clicked */
  onSkip?: () => void | Promise<void>;
  /** Callback when back is clicked (overrides default behavior) */
  onBack?: () => void;
  /** Whether this is the final step (changes button styling) */
  isFinalStep?: boolean;
}

/**
 * Navigation footer for wizard steps.
 * Provides Back, Next, and optional Skip buttons.
 */
export function WizardNavigationFooter({
  showBack = true,
  nextLabel = 'Next',
  showSkip = false,
  skipLabel = 'Skip',
  isNextDisabled = false,
  isLoading = false,
  onNext,
  onSkip,
  onBack,
  isFinalStep = false,
}: WizardNavigationFooterProps) {
  const { goBack, canGoBack, state } = useOnboarding();
  const { isSubmitting } = state;

  const handleBack = () => {
    if (onBack) {
      onBack();
    } else {
      goBack();
    }
  };

  const handleNext = async () => {
    if (onNext) {
      await onNext();
    }
  };

  const handleSkip = async () => {
    if (onSkip) {
      await onSkip();
    }
  };

  const loading = isLoading || isSubmitting;

  return (
    <div className="flex items-center justify-between gap-4 pt-4 border-t border-default-200 fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0">
      {/* Left side: Back button */}
      <div className="flex-1">
        {showBack && canGoBack && (
          <Button
            variant="light"
            color="default"
            startContent={<ArrowLeft className="w-4 h-4" />}
            onPress={handleBack}
            isDisabled={loading}
          >
            Back
          </Button>
        )}
      </div>

      {/* Right side: Skip and Next buttons */}
      <div className="flex items-center gap-3">
        {showSkip && (
          <Button
            variant="light"
            color="default"
            endContent={<SkipForward className="w-4 h-4" />}
            onPress={handleSkip}
            isDisabled={loading}
          >
            {skipLabel}
          </Button>
        )}
        <Button
          color={isFinalStep ? 'success' : 'primary'}
          endContent={!isFinalStep && <ArrowRight className="w-4 h-4" />}
          onPress={handleNext}
          isDisabled={isNextDisabled || loading}
          isLoading={loading}
        >
          {nextLabel}
        </Button>
      </div>
    </div>
  );
}

export default WizardNavigationFooter;
