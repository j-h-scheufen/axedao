'use client';

import { useState } from 'react';
import { useAtomValue } from 'jotai';

import { currentUserAtom } from '@/hooks/state/currentUser';
import GenealogyExplainer from './GenealogyExplainer';
import GenealogyProfileForm from './GenealogyProfileForm';

/**
 * Manager component for genealogy profile publishing.
 * Handles the flow between explainer (for new users) and form (for editing).
 */
const GenealogyProfileManager = () => {
  const { data: user, isFetching } = useAtomValue(currentUserAtom);
  const [hasAcknowledgedExplainer, setHasAcknowledgedExplainer] = useState(false);

  // Loading state
  if (!user || isFetching) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="animate-pulse text-default-400">Loading...</div>
      </div>
    );
  }

  const hasExistingProfile = !!user.profileId;

  // Show explainer for first-time users who haven't acknowledged it
  if (!hasExistingProfile && !hasAcknowledgedExplainer) {
    return <GenealogyExplainer onContinue={() => setHasAcknowledgedExplainer(true)} />;
  }

  // Show form for returning users or after acknowledging explainer
  return <GenealogyProfileForm profileId={user.profileId} />;
};

export default GenealogyProfileManager;
