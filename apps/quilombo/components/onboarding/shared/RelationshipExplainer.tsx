'use client';

import { Card, CardBody } from '@heroui/react';
import { GraduationCap, Users, Sparkles, Building2 } from 'lucide-react';

/**
 * Predicate descriptions for the onboarding wizard.
 */
export const PREDICATE_DESCRIPTIONS = {
  student_of: {
    label: 'Student of',
    shortLabel: 'Primary Teacher',
    description:
      'Your primary mestre or teacher - the person who formally trained you and from whom you received your title/apelido.',
    icon: GraduationCap,
    color: 'primary' as const,
  },
  trained_under: {
    label: 'Trained under',
    shortLabel: 'Training',
    description:
      'Someone you trained with regularly but who is not your primary teacher. This could be senior students, assistant instructors, or teachers at workshops.',
    icon: Users,
    color: 'secondary' as const,
  },
  influenced_by: {
    label: 'Influenced by',
    shortLabel: 'Influence',
    description:
      'A mestre or teacher who significantly influenced your capoeira journey without formal training. This could be through workshops, videos, philosophy, or style.',
    icon: Sparkles,
    color: 'warning' as const,
  },
  member_of: {
    label: 'Member of',
    shortLabel: 'Group',
    description: 'The group you currently belong to or train with.',
    icon: Building2,
    color: 'success' as const,
  },
} as const;

export type ExplainablePredicate = keyof typeof PREDICATE_DESCRIPTIONS;

interface RelationshipExplainerProps {
  /** The predicate to explain */
  predicate: ExplainablePredicate;
  /** Whether to show as a full card or inline */
  variant?: 'card' | 'inline';
}

/**
 * Displays an explanation for a relationship predicate.
 * Used in the onboarding wizard to help users understand relationship types.
 */
export function RelationshipExplainer({ predicate, variant = 'card' }: RelationshipExplainerProps) {
  const info = PREDICATE_DESCRIPTIONS[predicate];
  const Icon = info.icon;

  if (variant === 'inline') {
    return (
      <div className="flex items-start gap-2 text-sm">
        <Icon className={`w-4 h-4 text-${info.color} mt-0.5 shrink-0`} />
        <div>
          <span className="font-medium">{info.label}:</span>{' '}
          <span className="text-default-500">{info.description}</span>
        </div>
      </div>
    );
  }

  return (
    <Card className="bg-default-50 dark:bg-default-100/10">
      <CardBody className="p-3 sm:p-4">
        <div className="flex items-start gap-3">
          <div className={`p-2 rounded-lg bg-${info.color}/10`}>
            <Icon className={`w-5 h-5 text-${info.color}`} />
          </div>
          <div>
            <h4 className="font-semibold text-default-700">{info.label}</h4>
            <p className="text-sm text-default-500 mt-1">{info.description}</p>
          </div>
        </div>
      </CardBody>
    </Card>
  );
}

/**
 * Displays explanations for all teacher predicates.
 * Used when the user is choosing how they know their teacher.
 */
export function TeacherRelationshipExplainer() {
  return (
    <div className="space-y-3">
      <p className="text-sm text-default-500 mb-4">
        How do you know this person? Select the relationship that best describes your connection:
      </p>
      <RelationshipExplainer predicate="student_of" />
      <RelationshipExplainer predicate="trained_under" />
      <RelationshipExplainer predicate="influenced_by" />
    </div>
  );
}

export default RelationshipExplainer;
