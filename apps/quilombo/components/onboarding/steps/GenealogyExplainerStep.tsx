'use client';

import { Button, Card, CardBody } from '@heroui/react';
import { GitBranch, Globe, Search, Users } from 'lucide-react';

import { useOnboarding } from '../contexts/OnboardingContext';
import { WizardNavigationFooter } from '../shared/WizardNavigationFooter';

/**
 * Value proposition features for the genealogy.
 */
const GENEALOGY_FEATURES = [
  {
    icon: GitBranch,
    title: 'Preserve Your Lineage',
    description: 'Document your training history and connections to mestres throughout capoeira history.',
  },
  {
    icon: Globe,
    title: 'Global Community',
    description: 'Connect with capoeiristas worldwide and discover how lineages interweave across continents.',
  },
  {
    icon: Search,
    title: 'Discover Connections',
    description: 'Find unexpected connections between groups and practitioners in the global capoeira family.',
  },
  {
    icon: Users,
    title: 'Honor Your Teachers',
    description: 'Acknowledge the mestres and teachers who shaped your journey in capoeira.',
  },
];

/**
 * Page 2: Genealogy Explainer Step
 *
 * Explains the value proposition of joining the capoeira genealogy.
 * User can choose to "Publish Profile" or "Maybe Later".
 */
export function GenealogyExplainerStep() {
  const { goToStep, setPublishGenealogy, canGoBack } = useOnboarding();

  const handlePublish = () => {
    setPublishGenealogy(true);
    goToStep('genealogy-profile');
  };

  const handleMaybeLater = () => {
    setPublishGenealogy(false);
    goToStep('final');
  };

  return (
    <div className="space-y-6">
      {/* Intro */}
      <div className="text-center mb-6">
        <h2 className="text-xl font-semibold mb-2">Join the Capoeira Genealogy</h2>
        <p className="text-default-500">
          The Quilombo Genealogy is a collaborative project to document the lineages and relationships within the global
          capoeira community.
        </p>
      </div>

      {/* Feature cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {GENEALOGY_FEATURES.map((feature) => (
          <Card key={feature.title} className="bg-default-50 dark:bg-default-100/10">
            <CardBody className="flex flex-row gap-4 p-3 sm:p-4">
              <div className="shrink-0 p-2 rounded-lg bg-primary/10">
                <feature.icon className="w-6 h-6 text-primary" />
              </div>
              <div>
                <h4 className="font-semibold text-default-700">{feature.title}</h4>
                <p className="text-sm text-default-500 mt-1">{feature.description}</p>
              </div>
            </CardBody>
          </Card>
        ))}
      </div>

      {/* What gets published */}
      <Card>
        <CardBody className="p-3 sm:p-4">
          <h4 className="font-semibold text-default-700 mb-2">What gets published?</h4>
          <ul className="space-y-2 text-sm text-default-500">
            <li className="flex items-start gap-2">
              <span className="text-primary">•</span>
              <span>Your capoeira nickname (apelido) and title</span>
            </li>
            <li className="flex items-start gap-2">
              <span className="text-primary">•</span>
              <span>Connections to your teachers and groups</span>
            </li>
            <li className="flex items-start gap-2">
              <span className="text-primary">•</span>
              <span>Your profile photo (optional)</span>
            </li>
          </ul>
          <p className="text-xs text-default-400 mt-3">Your personal email and login details are never published.</p>
        </CardBody>
      </Card>

      {/* CTA buttons */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center">
        <Button color="primary" size="lg" onPress={handlePublish} className="min-w-[180px]">
          Publish My Profile
        </Button>
        <Button variant="light" color="default" size="lg" onPress={handleMaybeLater} className="min-w-[180px]">
          Maybe Later
        </Button>
      </div>

      {/* Note */}
      <p className="text-small text-default-400 text-center">
        You can always publish your genealogy profile later from your profile settings.
      </p>

      {/* Back button only */}
      {canGoBack && (
        <div className="border-t border-default-200 pt-4">
          <WizardNavigationFooter
            showBack={true}
            showSkip={false}
            nextLabel=""
            isNextDisabled={true}
            onNext={() => {}}
          />
        </div>
      )}
    </div>
  );
}

export default GenealogyExplainerStep;
