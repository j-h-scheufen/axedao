'use client';

import { useState } from 'react';
import { useAtomValue } from 'jotai';

import { currentUserAtom } from '@/hooks/state/currentUser';
import { useGenealogyProfile } from '@/query/genealogyProfile';
import GenealogyExplainer from './GenealogyExplainer';
import GenealogyProfileForm from './GenealogyProfileForm';
import ProfileCheckStep from './ProfileCheckStep';

type WizardStep = 'explainer' | 'check' | 'form';

/**
 * Manager component for genealogy profile publishing.
 * Handles the flow: explainer -> check for existing profile -> form.
 *
 * Flow for new users:
 * 1. GenealogyExplainer - Educate about publishing
 * 2. ProfileCheckStep - Check if profile exists (auto-search with apelido)
 * 3. GenealogyProfileForm - Create new profile OR user claims existing
 *
 * Returning users (with profileId) skip directly to the form.
 */
const GenealogyProfileManager = () => {
  const { data: user, isFetching: isUserFetching } = useAtomValue(currentUserAtom);
  const [wizardStep, setWizardStep] = useState<WizardStep>('explainer');

  // Fetch existing genealogy profile if user has profileId
  const { data: genealogyProfile, isFetching: isProfileFetching } = useGenealogyProfile(user?.profileId);

  // Loading state
  if (!user || isUserFetching || (user.profileId && isProfileFetching)) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="animate-pulse text-default-400">Loading...</div>
      </div>
    );
  }

  const hasExistingProfile = !!user.profileId;

  // Users with existing profile skip directly to form
  if (hasExistingProfile) {
    return <GenealogyProfileForm existingData={genealogyProfile} />;
  }

  // New user wizard flow
  switch (wizardStep) {
    case 'explainer':
      return <GenealogyExplainer onContinue={() => setWizardStep('check')} />;

    case 'check':
      return <ProfileCheckStep userApelido={user.nickname} onProceedToCreate={() => setWizardStep('form')} />;

    case 'form':
      return <GenealogyProfileForm existingData={null} />;

    default:
      return <GenealogyExplainer onContinue={() => setWizardStep('check')} />;
  }
};

export default GenealogyProfileManager;
