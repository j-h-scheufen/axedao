'use client';

import { Button } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ArrowLeft, GitBranch, Globe, Heart } from 'lucide-react';
import { useState } from 'react';

import { currentUserAtom } from '@/hooks/state/currentUser';
import axios from '@/utils/axios';

import { useOnboarding, type ClaimableProfile } from '../contexts/OnboardingContext';

/**
 * Value proposition features for the genealogy (condensed to 3).
 */
const GENEALOGY_FEATURES = [
  {
    icon: GitBranch,
    title: 'Preserve Your Lineage',
    description: 'Document your training history and connections to mestres.',
  },
  {
    icon: Globe,
    title: 'Connect Worldwide',
    description: 'Discover how lineages interweave across the global capoeira family.',
  },
  {
    icon: Heart,
    title: 'Honor Your Teachers',
    description: 'Acknowledge those who shaped your journey in capoeira.',
  },
];

/**
 * Search for claimable profiles matching the user's apelido.
 * No title filter - we want to catch all potential matches and let the user confirm.
 * Claimable profiles only exist via import (Professor+ threshold), so this is safe.
 */
const searchClaimableProfiles = async (apelido: string): Promise<ClaimableProfile[]> => {
  const params = new URLSearchParams({ q: apelido, claimableOnly: 'true' });
  return axios.get(`/api/genealogy/persons/search?${params.toString()}`).then((response) => response.data);
};

/**
 * Page 2: Genealogy Explainer Step
 *
 * Explains the value proposition of joining the capoeira genealogy.
 * User can choose to "Publish Profile" or "Maybe Later".
 *
 * When user clicks "Publish", we first check if there are existing claimable
 * profiles matching their apelido. If matches exist, we show ClaimCheckStep.
 * Otherwise, we proceed directly to GenealogyProfileStep.
 */
export function GenealogyExplainerStep() {
  const { goToStep, setPublishGenealogy, setClaimableProfiles, goBack, canGoBack } = useOnboarding();
  const { data: user } = useAtomValue(currentUserAtom);
  const [isSearching, setIsSearching] = useState(false);

  const handlePublish = async () => {
    setPublishGenealogy(true);

    // Check if user has an apelido to search for
    const apelido = user?.nickname;
    if (!apelido || apelido.length < 3) {
      // No apelido or too short - skip claim check, go directly to profile creation
      goToStep('genealogy-profile');
      return;
    }

    setIsSearching(true);
    try {
      // Search for claimable profiles matching user's apelido
      const matches = await searchClaimableProfiles(apelido);

      if (matches.length > 0) {
        // Store matches in context and navigate to claim check step
        setClaimableProfiles(matches);
        goToStep('claim-check');
      } else {
        // No matches - go directly to profile creation
        goToStep('genealogy-profile');
      }
    } catch (error) {
      console.error('Error searching for claimable profiles:', error);
      // On error, proceed to profile creation (fail-safe)
      goToStep('genealogy-profile');
    } finally {
      setIsSearching(false);
    }
  };

  const handleMaybeLater = () => {
    setPublishGenealogy(false);
    goToStep('final');
  };

  return (
    <div className="space-y-5">
      {/* Intro */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Join the Capoeira Genealogy</h2>
        <p className="text-sm text-default-500">
          A collaborative project to document lineages and relationships within the global capoeira community.
        </p>
      </div>

      {/* Features - clean minimal design */}
      <div className="space-y-3">
        {GENEALOGY_FEATURES.map((feature) => (
          <div
            key={feature.title}
            className="flex items-start gap-3 p-3 rounded-xl bg-gradient-to-r from-primary/5 to-transparent"
          >
            <div className="shrink-0 p-2 rounded-full bg-primary/10">
              <feature.icon className="w-4 h-4 text-primary" />
            </div>
            <div className="min-w-0">
              <p className="font-medium text-default-700 text-sm">{feature.title}</p>
              <p className="text-xs text-default-500">{feature.description}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Privacy reassurance */}
      <div className="p-4 rounded-xl bg-default-100/50 dark:bg-default-100/10 space-y-2">
        <p className="text-sm text-default-600">
          <strong>Only your capoeira identity</strong> is published — title and apelido or username. No personal info,
          no email, no account details.
        </p>
        <p className="text-xs text-default-500">
          After joining, you can declare connections to your teachers and groups to build out your lineage.
        </p>
      </div>

      {/* CTA buttons */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button
          color="primary"
          size="lg"
          onPress={handlePublish}
          isLoading={isSearching}
          isDisabled={isSearching}
          className="min-w-[180px]"
        >
          Publish My Profile
        </Button>
        <Button
          variant="flat"
          color="default"
          size="lg"
          onPress={handleMaybeLater}
          isDisabled={isSearching}
          className="min-w-[180px]"
        >
          Maybe Later
        </Button>
      </div>

      {/* Note */}
      <p className="text-xs text-default-400 text-center">You can always publish later from your profile settings.</p>

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

export default GenealogyExplainerStep;
