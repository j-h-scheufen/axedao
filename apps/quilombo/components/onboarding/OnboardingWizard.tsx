'use client';

import { useAtomValue } from 'jotai';
import { useCallback, useEffect, useState } from 'react';
import { usePathname } from 'next/navigation';
import { getCookie, setCookie } from 'cookies-next';

import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';

import { OnboardingContainer } from './OnboardingContainer';
import { OnboardingProvider, useOnboarding, type WizardMode, type WizardStep } from './contexts/OnboardingContext';

// Step components
import { BasicProfileStep } from './steps/BasicProfileStep';
import { ClaimCheckStep } from './steps/ClaimCheckStep';
import { GenealogyExplainerStep } from './steps/GenealogyExplainerStep';
import { GenealogyProfileStep } from './steps/GenealogyProfileStep';
import { FinalStep } from './steps/FinalStep';
import { PlaceholderStep } from './steps/PlaceholderStep';

// Pages where it's appropriate to show the onboarding wizard
const ONBOARDING_ALLOWED_PATHS = [PATHS.profile, PATHS.search];

// Cookie name for onboarding completion
const WIZARD_COMPLETED_COOKIE = 'quilombo.wizardCompleted';

/**
 * Internal wizard content component that uses the onboarding context.
 */
function WizardContent({ onComplete }: { onComplete: () => void }) {
  const { state } = useOnboarding();
  const { currentStep } = state;

  // Render the appropriate step component based on current step
  const renderStep = () => {
    switch (currentStep) {
      case 'basic-profile':
        return <BasicProfileStep />;
      case 'claim-check':
        return <ClaimCheckStep />;
      case 'genealogy-explainer':
        return <GenealogyExplainerStep />;
      case 'genealogy-profile':
        return <GenealogyProfileStep />;
      case 'group-or-teacher':
        return <PlaceholderStep stepName="Group or Teacher Selection" />;
      case 'find-group':
        return <PlaceholderStep stepName="Find Your Group" />;
      case 'find-teacher':
        return <PlaceholderStep stepName="Find Your Teacher" />;
      case 'add-more':
        return <PlaceholderStep stepName="Add More Relations" />;
      case 'final':
        return <FinalStep onComplete={onComplete} />;
      default:
        return <PlaceholderStep stepName="Unknown Step" />;
    }
  };

  return renderStep();
}

/**
 * Gets the step title for display in the container header.
 */
function getStepTitle(step: WizardStep, mode: WizardMode): string {
  switch (step) {
    case 'basic-profile':
      return mode === 'new-user' ? 'Welcome to Quilombo!' : 'Update Your Profile';
    case 'claim-check':
      return 'Check for Existing Profile';
    case 'genealogy-explainer':
      return 'Join the Genealogy';
    case 'genealogy-profile':
      return 'Your Genealogy Profile';
    case 'group-or-teacher':
      return 'Connect Your Lineage';
    case 'find-group':
      return 'Find Your Group';
    case 'find-teacher':
      return 'Find Your Teacher';
    case 'add-more':
      return 'Add More Connections';
    case 'final':
      return 'Welcome to the Community!';
    default:
      return 'Onboarding';
  }
}

/**
 * Inner component that manages wizard display logic.
 */
function OnboardingWizardInner() {
  const pathname = usePathname();
  const { data: user } = useAtomValue(currentUserAtom);
  const [isOpen, setIsOpen] = useState(false);
  const [mode, setMode] = useState<WizardMode>('new-user');

  // Check if wizard should be shown
  useEffect(() => {
    if (!user) return;

    // Check if wizard was already completed
    const wizardCompleted = getCookie(WIZARD_COMPLETED_COOKIE);
    if (wizardCompleted === 'true') return;

    // Only show on allowed pages
    const isAllowedPath = ONBOARDING_ALLOWED_PATHS.includes(pathname);
    if (!isAllowedPath) return;

    // Determine if wizard is needed and in which mode
    const hasBasicProfile = !!(user.name || user.nickname);
    const hasGenealogyProfile = !!user.profileId;

    if (!hasBasicProfile) {
      // New user - show full wizard
      setMode('new-user');
      setIsOpen(true);
    } else if (!hasGenealogyProfile) {
      // Has profile but no genealogy - show genealogy-focused wizard
      setMode('genealogy-only');
      setIsOpen(true);
    }
  }, [user, pathname]);

  // Handle wizard completion
  const handleComplete = useCallback(() => {
    // Set permanent completion cookie (1 year expiry)
    setCookie(WIZARD_COMPLETED_COOKIE, 'true', {
      expires: new Date(Date.now() + 1000 * 60 * 60 * 24 * 365),
    });
    setIsOpen(false);
  }, []);

  if (!isOpen) return null;

  return (
    <OnboardingProvider initialMode={mode}>
      <WizardContentWrapper onComplete={handleComplete} />
    </OnboardingProvider>
  );
}

/**
 * Wrapper component that connects to the context.
 */
function WizardContentWrapper({ onComplete }: { onComplete: () => void }) {
  const { state } = useOnboarding();
  const title = getStepTitle(state.currentStep, state.mode);

  return (
    <OnboardingContainer isOpen={true} title={title}>
      <WizardContent onComplete={onComplete} />
    </OnboardingContainer>
  );
}

/**
 * Main onboarding wizard component.
 * Automatically shows when the user needs onboarding.
 *
 * Trigger conditions:
 * - User has no name AND no nickname → 'new-user' mode
 * - User has profile but no genealogy profile → 'genealogy-only' mode
 *
 * Suppression:
 * - quilombo.wizardCompleted cookie (permanent) - user completed the wizard
 */
export function OnboardingWizard() {
  return <OnboardingWizardInner />;
}

export default OnboardingWizard;
