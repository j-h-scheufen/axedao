'use client';

import { Card, CardBody } from '@heroui/react';

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
    <div className="space-y-6">
      <Card>
        <CardBody className="text-center py-12">
          <div className="text-6xl mb-4">🚧</div>
          <h2 className="text-xl font-semibold mb-2">{stepName}</h2>
          <p className="text-default-500">This step will be implemented soon.</p>
          <p className="text-small text-default-400 mt-2">
            Current step: <code className="bg-default-100 px-2 py-0.5 rounded">{currentStep}</code>
          </p>
        </CardBody>
      </Card>

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
