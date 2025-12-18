'use client';

import { Button } from '@heroui/react';
import { ArrowLeft, GitBranch, Globe, Heart } from 'lucide-react';

import { useOnboarding } from '../contexts/OnboardingContext';

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
 * Page 2: Genealogy Explainer Step
 *
 * Explains the value proposition of joining the capoeira genealogy.
 * User can choose to "Publish Profile" or "Maybe Later".
 */
export function GenealogyExplainerStep() {
  const { goToStep, setPublishGenealogy, goBack, canGoBack } = useOnboarding();

  const handlePublish = () => {
    setPublishGenealogy(true);
    goToStep('genealogy-profile');
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
          <strong>Only your capoeira identity</strong> is published — title and apelido if you have one. No personal
          info, no email, no account details.
        </p>
        <p className="text-xs text-default-500">
          After joining, you can declare connections to your teachers and groups to build out your lineage.
        </p>
      </div>

      {/* CTA buttons */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button color="primary" size="lg" onPress={handlePublish} className="min-w-[180px]">
          Publish My Profile
        </Button>
        <Button variant="flat" color="default" size="lg" onPress={handleMaybeLater} className="min-w-[180px]">
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
