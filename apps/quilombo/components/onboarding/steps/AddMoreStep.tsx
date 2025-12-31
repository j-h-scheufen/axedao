'use client';

import { Button, Chip } from '@heroui/react';
import { ArrowLeft, Building2, CheckCircle, GraduationCap } from 'lucide-react';

import { useOnboarding, type AddedRelationship } from '../contexts/OnboardingContext';
import { PREDICATE_DESCRIPTIONS, type ExplainablePredicate } from '../shared/RelationshipExplainer';

/**
 * Get a human-readable label for a predicate.
 */
function getPredicateLabel(predicate: string): string {
  if (predicate in PREDICATE_DESCRIPTIONS) {
    return PREDICATE_DESCRIPTIONS[predicate as ExplainablePredicate].shortLabel;
  }
  return predicate.replace(/_/g, ' ');
}

/**
 * Render a relationship chip/badge.
 */
function RelationshipBadge({ relationship }: { relationship: AddedRelationship }) {
  const Icon = relationship.objectType === 'group' ? Building2 : GraduationCap;

  return (
    <Chip
      variant="flat"
      color="success"
      startContent={<Icon className="w-3 h-3" />}
      classNames={{
        base: 'h-auto py-1 px-2',
        content: 'text-xs',
      }}
    >
      <span className="capitalize">{getPredicateLabel(relationship.predicate)}</span>
      <span className="mx-1">→</span>
      <span className="font-medium">{relationship.objectName}</span>
    </Chip>
  );
}

/**
 * Options for adding more connections.
 */
const ADD_MORE_OPTIONS = [
  {
    key: 'group',
    icon: Building2,
    title: 'Add Another Group',
    description: 'Declare membership in another group.',
    step: 'find-group' as const,
  },
  {
    key: 'teacher',
    icon: GraduationCap,
    title: 'Add Another Teacher',
    description: 'Add another mestre or teacher to your lineage.',
    step: 'find-teacher' as const,
  },
];

/**
 * Add More Step
 *
 * Shows after a relationship is added, allowing the user to:
 * - See what they've added
 * - Add more relationships
 * - Continue to finish
 */
export function AddMoreStep() {
  const { goToStep, goBack, canGoBack, state } = useOnboarding();
  const { addedRelationships } = state;

  const handleAddMore = (step: 'find-group' | 'find-teacher') => {
    goToStep(step);
  };

  const handleContinue = () => {
    goToStep('final');
  };

  return (
    <div className="space-y-5">
      {/* Success message */}
      <div className="text-center">
        <div className="flex justify-center mb-3">
          <div className="p-3 rounded-full bg-success/10">
            <CheckCircle className="w-8 h-8 text-success" />
          </div>
        </div>
        <h2 className="text-xl font-semibold mb-2">Connection Added!</h2>
        <p className="text-sm text-default-500">Would you like to add more connections to your lineage?</p>
      </div>

      {/* Show all added relationships */}
      {addedRelationships.length > 0 && (
        <div className="p-4 rounded-xl bg-default-100/50 dark:bg-default-100/10">
          <p className="text-xs text-default-500 mb-2">Your connections:</p>
          <div className="flex flex-wrap gap-2">
            {addedRelationships.map((rel, index) => (
              <RelationshipBadge key={`${rel.objectId}-${index}`} relationship={rel} />
            ))}
          </div>
        </div>
      )}

      {/* Add more options */}
      <div className="space-y-3">
        {ADD_MORE_OPTIONS.map((option) => (
          <button
            key={option.key}
            type="button"
            onClick={() => handleAddMore(option.step)}
            className="w-full flex items-start gap-4 p-4 rounded-xl bg-gradient-to-r from-primary/5 to-transparent hover:from-primary/10 transition-colors text-left"
          >
            <div className="shrink-0 p-3 rounded-full bg-primary/10">
              <option.icon className="w-5 h-5 text-primary" />
            </div>
            <div className="min-w-0 pt-1">
              <p className="font-semibold text-default-700">{option.title}</p>
              <p className="text-sm text-default-500 mt-1">{option.description}</p>
            </div>
          </button>
        ))}
      </div>

      {/* Helper text */}
      <p className="text-xs text-default-400 text-center">
        You can always add more connections later in your Genealogy Profile settings.
      </p>

      {/* Continue button */}
      <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
        <Button color="primary" size="lg" onPress={handleContinue} className="min-w-[180px]">
          Continue to Finish
        </Button>
      </div>

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

export default AddMoreStep;
