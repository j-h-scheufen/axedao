'use client';

import { Construction } from 'lucide-react';

import { useOnboarding, type WizardStep } from '../contexts/OnboardingContext';
import { WizardNavigationFooter } from '../shared/WizardNavigationFooter';

interface PlaceholderStepProps {
  stepName: string;
  onComplete?: () => void;
}

/**
 * Temporary placeholder component for wizard steps.
 * Will be replaced with actual step implementations.
 */
export function PlaceholderStep({ stepName, onComplete }: PlaceholderStepProps) {
  const { state, goToStep } = useOnboarding();
  const { currentStep } = state;

  // Map to next step (simplified for placeholder)
  const getNextStep = (): WizardStep | null => {
    switch (currentStep) {
      case 'basic-profile':
        return 'genealogy-explainer';
      case 'genealogy-explainer':
        return 'genealogy-profile';
      case 'genealogy-profile':
        return 'group-or-teacher';
      case 'group-or-teacher':
        return 'final';
      case 'find-group':
        return 'add-more';
      case 'find-teacher':
        return 'add-more';
      case 'add-more':
        return 'final';
      case 'final':
        return null;
      default:
        return 'final';
    }
  };

  const handleNext = () => {
    const nextStep = getNextStep();
    if (nextStep) {
      goToStep(nextStep);
    } else if (onComplete) {
      onComplete();
    }
  };

  const handleSkip = () => {
    // Skip to final step
    goToStep('final');
  };

  const isFinal = currentStep === 'final';

  return (
    <div className="space-y-5">
      {/* Placeholder message */}
      <div className="text-center">
        <div className="flex justify-center mb-3">
          <div className="p-3 rounded-full bg-default-100">
            <Construction className="w-8 h-8 text-default-500" />
          </div>
        </div>
        <h2 className="text-xl font-semibold mb-2">{stepName}</h2>
        <p className="text-sm text-default-500">This step will be implemented soon.</p>
      </div>

      {/* Current step info */}
      <div className="p-4 rounded-xl bg-default-100/50 dark:bg-default-100/10">
        <p className="text-xs text-default-400 text-center">
          Current step: <code className="bg-default-200 dark:bg-default-100 px-2 py-0.5 rounded">{currentStep}</code>
        </p>
      </div>

      <WizardNavigationFooter
        showBack={currentStep !== 'basic-profile'}
        showSkip={!isFinal && currentStep !== 'basic-profile' && currentStep !== 'group-or-teacher'}
        nextLabel={isFinal ? 'Finish' : 'Next'}
        isFinalStep={isFinal}
        onNext={handleNext}
        onSkip={handleSkip}
      />
    </div>
  );
}

export default PlaceholderStep;
