// Main wizard component
export { OnboardingWizard } from './OnboardingWizard';

// Container and progress
export { OnboardingContainer } from './OnboardingContainer';
export { WizardProgress } from './WizardProgress';

// Context and types
export {
  OnboardingProvider,
  useOnboarding,
  type WizardMode,
  type WizardStep,
  type DraftProfile,
  type DraftGenealogyProfile,
  type AddedRelationship,
  type OnboardingState,
} from './contexts';

// Shared components
export {
  WizardNavigationFooter,
  SyncCheckboxes,
  UserProfileCard,
  RelationshipExplainer,
  TeacherRelationshipExplainer,
  PREDICATE_DESCRIPTIONS,
  type ExplainablePredicate,
} from './shared';
