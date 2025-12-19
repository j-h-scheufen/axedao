'use client';

import { Button } from '@heroui/react';
import { ArrowLeft, Building2, GraduationCap } from 'lucide-react';

import { useOnboarding } from '../contexts/OnboardingContext';

/**
 * Choice options for establishing connections.
 */
const CONNECTION_OPTIONS = [
  {
    key: 'group',
    icon: Building2,
    title: 'Find My Group',
    description: 'Search for and declare membership in your capoeira group.',
    step: 'find-group' as const,
  },
  {
    key: 'teacher',
    icon: GraduationCap,
    title: 'Find My Teacher',
    description: 'Declare your relationship to a mestre or teacher.',
    step: 'find-teacher' as const,
  },
];

/**
 * Page 3b: Group or Teacher Selection
 *
 * Presents the user with two options:
 * - Find their group (member_of relationship)
 * - Find their teacher (student_of, trained_under, etc.)
 */
export function GroupOrTeacherStep() {
  const { goToStep, goBack, canGoBack } = useOnboarding();

  const handleOptionSelect = (step: 'find-group' | 'find-teacher') => {
    goToStep(step);
  };

  const handleSkip = () => {
    goToStep('final');
  };

  return (
    <div className="space-y-5">
      {/* Intro */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Connect Your Lineage</h2>
        <p className="text-sm text-default-500">
          Help build the genealogy by declaring your connections to groups and teachers. You can always add more later.
        </p>
      </div>

      {/* Options */}
      <div className="space-y-3">
        {CONNECTION_OPTIONS.map((option) => (
          <button
            key={option.key}
            type="button"
            onClick={() => handleOptionSelect(option.step)}
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

      {/* Skip option */}
      <div className="pt-2 text-center">
        <Button variant="flat" color="default" onPress={handleSkip}>
          Skip for now
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

export default GroupOrTeacherStep;
