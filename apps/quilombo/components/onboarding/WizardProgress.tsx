'use client';

import { Progress } from '@heroui/react';

import { useOnboarding, type WizardStep } from './contexts/OnboardingContext';

/**
 * Step definitions with their display order and labels.
 * Not all steps are shown in the progress bar (sub-steps are grouped).
 */
const PROGRESS_STEPS: { step: WizardStep; label: string; group?: WizardStep[] }[] = [
  { step: 'basic-profile', label: 'Profile' },
  { step: 'genealogy-explainer', label: 'Genealogy' },
  {
    step: 'genealogy-profile',
    label: 'Publish',
    group: ['genealogy-profile', 'group-or-teacher', 'find-group', 'find-teacher', 'add-more'],
  },
  { step: 'final', label: 'Finish' },
];

/**
 * Maps a step to its progress index (0-based).
 */
function getStepProgressIndex(currentStep: WizardStep, mode: 'new-user' | 'genealogy-only'): number {
  // In genealogy-only mode, we skip the basic profile step
  const startIndex = mode === 'genealogy-only' ? 1 : 0;

  for (let i = startIndex; i < PROGRESS_STEPS.length; i++) {
    const progressStep = PROGRESS_STEPS[i];
    if (progressStep.step === currentStep) return i - startIndex;
    if (progressStep.group?.includes(currentStep)) return i - startIndex;
  }

  return 0;
}

/**
 * Displays the current step progress as a visual indicator.
 * Shows a progress bar and step labels.
 */
export function WizardProgress() {
  const { state } = useOnboarding();
  const { currentStep, mode } = state;

  // Filter steps based on mode
  const visibleSteps = mode === 'genealogy-only' ? PROGRESS_STEPS.slice(1) : PROGRESS_STEPS;
  const totalSteps = visibleSteps.length;
  const currentIndex = getStepProgressIndex(currentStep, mode);

  // Calculate progress percentage (0 at first step, 100 at last)
  const progressValue = totalSteps > 1 ? (currentIndex / (totalSteps - 1)) * 100 : 0;

  return (
    <div className="w-full">
      {/* Progress bar */}
      <Progress aria-label="Wizard progress" value={progressValue} className="mb-3" size="sm" color="primary" />

      {/* Step labels */}
      <div className="flex justify-between">
        {visibleSteps.map((progressStep, index) => {
          const isActive = index === currentIndex;
          const isPast = index < currentIndex;

          return (
            <div
              key={progressStep.step}
              className={`transition-colors ${
                isActive
                  ? 'text-sm text-primary font-semibold'
                  : isPast
                    ? 'text-xs text-default-500'
                    : 'text-xs text-default-400'
              }`}
            >
              {progressStep.label}
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default WizardProgress;
