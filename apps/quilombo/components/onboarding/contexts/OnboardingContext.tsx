'use client';

import { createContext, useCallback, useContext, useReducer, useState, type ReactNode } from 'react';

import type { Style } from '@/types/model';
import type { Title } from '@/config/validation-schema';

/**
 * Wizard mode determines the flow and messaging.
 * - new-user: User has no name AND no nickname - show full onboarding
 * - genealogy-only: User has profile but no genealogy profile - focus on genealogy
 */
export type WizardMode = 'new-user' | 'genealogy-only';

/**
 * Wizard step identifiers.
 */
export type WizardStep =
  | 'basic-profile'
  | 'claim-check' // Check if user might already be in genealogy (for high-ranking titles)
  | 'genealogy-explainer'
  | 'genealogy-profile'
  | 'group-or-teacher'
  | 'find-group'
  | 'find-teacher'
  | 'add-more'
  | 'final';

/**
 * High-ranking titles that warrant checking for existing profiles.
 * Users with these titles are likely already in the genealogy database.
 */
export const HIGH_RANKING_TITLES = ['mestra', 'mestre', 'contra-mestra', 'contra-mestre'] as const;

/**
 * Draft profile data collected during onboarding.
 */
export interface DraftProfile {
  avatar?: string | null;
  title?: Title | null;
  nickname?: string | null;
  style?: Style | null;
}

/**
 * Draft genealogy profile data.
 */
export interface DraftGenealogyProfile {
  syncPortrait: boolean;
  syncApelido: boolean;
  syncTitle: boolean;
  birthYear?: number | null;
  birthYearPrecision?: string | null;
}

/**
 * Relationship added during onboarding.
 */
export interface AddedRelationship {
  predicate: string;
  objectId: string;
  objectName: string;
  objectType: 'person' | 'group';
}

/**
 * Submitted claim info (when user claims an existing profile).
 */
export interface SubmittedClaim {
  profileId: string;
  profileApelido: string | null;
}

/**
 * Complete wizard state.
 */
export interface OnboardingState {
  mode: WizardMode;
  currentStep: WizardStep;
  stepHistory: WizardStep[];
  draftProfile: DraftProfile;
  publishGenealogy: boolean;
  draftGenealogyProfile: DraftGenealogyProfile;
  addedRelationships: AddedRelationship[];
  /** If user submitted a claim for an existing profile instead of creating new */
  submittedClaim: SubmittedClaim | null;
  isSubmitting: boolean;
  error: string | null;
}

/**
 * Available action types for the reducer.
 */
type OnboardingAction =
  | { type: 'SET_MODE'; mode: WizardMode }
  | { type: 'GO_TO_STEP'; step: WizardStep }
  | { type: 'GO_BACK' }
  | { type: 'UPDATE_DRAFT_PROFILE'; profile: Partial<DraftProfile> }
  | { type: 'SET_PUBLISH_GENEALOGY'; publish: boolean }
  | { type: 'UPDATE_GENEALOGY_PROFILE'; profile: Partial<DraftGenealogyProfile> }
  | { type: 'ADD_RELATIONSHIP'; relationship: AddedRelationship }
  | { type: 'REMOVE_RELATIONSHIP'; objectId: string }
  | { type: 'SET_SUBMITTED_CLAIM'; claim: SubmittedClaim | null }
  | { type: 'SET_SUBMITTING'; isSubmitting: boolean }
  | { type: 'SET_ERROR'; error: string | null }
  | { type: 'RESET' };

/**
 * Initial state for the wizard.
 */
const initialState: OnboardingState = {
  mode: 'new-user',
  currentStep: 'basic-profile',
  stepHistory: [],
  draftProfile: {},
  publishGenealogy: false,
  draftGenealogyProfile: {
    syncPortrait: true,
    syncApelido: true,
    syncTitle: true,
  },
  addedRelationships: [],
  submittedClaim: null,
  isSubmitting: false,
  error: null,
};

/**
 * Reducer for managing wizard state.
 */
function onboardingReducer(state: OnboardingState, action: OnboardingAction): OnboardingState {
  switch (action.type) {
    case 'SET_MODE':
      return { ...state, mode: action.mode };

    case 'GO_TO_STEP':
      return {
        ...state,
        stepHistory: [...state.stepHistory, state.currentStep],
        currentStep: action.step,
        error: null,
      };

    case 'GO_BACK': {
      const newHistory = [...state.stepHistory];
      const previousStep = newHistory.pop();
      if (!previousStep) return state;
      return {
        ...state,
        stepHistory: newHistory,
        currentStep: previousStep,
        error: null,
      };
    }

    case 'UPDATE_DRAFT_PROFILE':
      return {
        ...state,
        draftProfile: { ...state.draftProfile, ...action.profile },
      };

    case 'SET_PUBLISH_GENEALOGY':
      return { ...state, publishGenealogy: action.publish };

    case 'UPDATE_GENEALOGY_PROFILE':
      return {
        ...state,
        draftGenealogyProfile: { ...state.draftGenealogyProfile, ...action.profile },
      };

    case 'ADD_RELATIONSHIP':
      return {
        ...state,
        addedRelationships: [...state.addedRelationships, action.relationship],
      };

    case 'REMOVE_RELATIONSHIP':
      return {
        ...state,
        addedRelationships: state.addedRelationships.filter((r) => r.objectId !== action.objectId),
      };

    case 'SET_SUBMITTED_CLAIM':
      return { ...state, submittedClaim: action.claim };

    case 'SET_SUBMITTING':
      return { ...state, isSubmitting: action.isSubmitting };

    case 'SET_ERROR':
      return { ...state, error: action.error };

    case 'RESET':
      return initialState;

    default:
      return state;
  }
}

/**
 * Context type for the onboarding wizard.
 */
interface OnboardingContextType {
  state: OnboardingState;
  dispatch: React.Dispatch<OnboardingAction>;
  // Convenience action creators
  goToStep: (step: WizardStep) => void;
  goBack: () => void;
  canGoBack: boolean;
  updateProfile: (profile: Partial<DraftProfile>) => void;
  setPublishGenealogy: (publish: boolean) => void;
  updateGenealogyProfile: (profile: Partial<DraftGenealogyProfile>) => void;
  addRelationship: (relationship: AddedRelationship) => void;
  removeRelationship: (objectId: string) => void;
  setSubmittedClaim: (claim: SubmittedClaim | null) => void;
  setSubmitting: (isSubmitting: boolean) => void;
  setError: (error: string | null) => void;
  reset: () => void;
  // Profile ID created during genealogy publish (useState, not reducer)
  createdProfileId: string | null;
  setCreatedProfileId: (id: string | null) => void;
  // Computed values
  hasTeacherRelationship: boolean;
  /** Whether the user's title warrants checking for existing profile */
  shouldCheckForExistingProfile: boolean;
}

const OnboardingContext = createContext<OnboardingContextType | null>(null);

/**
 * Provider component for the onboarding wizard context.
 */
export function OnboardingProvider({
  children,
  initialMode = 'new-user',
}: {
  children: ReactNode;
  initialMode?: WizardMode;
}) {
  const [state, dispatch] = useReducer(onboardingReducer, {
    ...initialState,
    mode: initialMode,
    // In genealogy-only mode, skip to genealogy explainer
    currentStep: initialMode === 'genealogy-only' ? 'genealogy-explainer' : 'basic-profile',
  });

  // Simple useState for profile ID created during genealogy publish
  // (not part of reducer - cleaner for single value that doesn't need action dispatch)
  const [createdProfileId, setCreatedProfileId] = useState<string | null>(null);

  const goToStep = useCallback((step: WizardStep) => {
    dispatch({ type: 'GO_TO_STEP', step });
  }, []);

  const goBack = useCallback(() => {
    dispatch({ type: 'GO_BACK' });
  }, []);

  const updateProfile = useCallback((profile: Partial<DraftProfile>) => {
    dispatch({ type: 'UPDATE_DRAFT_PROFILE', profile });
  }, []);

  const setPublishGenealogy = useCallback((publish: boolean) => {
    dispatch({ type: 'SET_PUBLISH_GENEALOGY', publish });
  }, []);

  const updateGenealogyProfile = useCallback((profile: Partial<DraftGenealogyProfile>) => {
    dispatch({ type: 'UPDATE_GENEALOGY_PROFILE', profile });
  }, []);

  const addRelationship = useCallback((relationship: AddedRelationship) => {
    dispatch({ type: 'ADD_RELATIONSHIP', relationship });
  }, []);

  const removeRelationship = useCallback((objectId: string) => {
    dispatch({ type: 'REMOVE_RELATIONSHIP', objectId });
  }, []);

  const setSubmittedClaim = useCallback((claim: SubmittedClaim | null) => {
    dispatch({ type: 'SET_SUBMITTED_CLAIM', claim });
  }, []);

  const setSubmitting = useCallback((isSubmitting: boolean) => {
    dispatch({ type: 'SET_SUBMITTING', isSubmitting });
  }, []);

  const setError = useCallback((error: string | null) => {
    dispatch({ type: 'SET_ERROR', error });
  }, []);

  const reset = useCallback(() => {
    dispatch({ type: 'RESET' });
  }, []);

  // Check if user added any teacher relationship (student_of or trained_under)
  const hasTeacherRelationship = state.addedRelationships.some(
    (r) => r.predicate === 'student_of' || r.predicate === 'trained_under'
  );

  // Check if user's title warrants checking for existing profile
  const shouldCheckForExistingProfile =
    !!state.draftProfile.title &&
    HIGH_RANKING_TITLES.includes(state.draftProfile.title as (typeof HIGH_RANKING_TITLES)[number]);

  const value: OnboardingContextType = {
    state,
    dispatch,
    goToStep,
    goBack,
    canGoBack: state.stepHistory.length > 0,
    updateProfile,
    setPublishGenealogy,
    updateGenealogyProfile,
    addRelationship,
    removeRelationship,
    setSubmittedClaim,
    setSubmitting,
    setError,
    reset,
    createdProfileId,
    setCreatedProfileId,
    hasTeacherRelationship,
    shouldCheckForExistingProfile,
  };

  return <OnboardingContext.Provider value={value}>{children}</OnboardingContext.Provider>;
}

/**
 * Hook to access the onboarding wizard context.
 * @throws Error if used outside OnboardingProvider
 */
export function useOnboarding(): OnboardingContextType {
  const context = useContext(OnboardingContext);
  if (!context) {
    throw new Error('useOnboarding must be used within an OnboardingProvider');
  }
  return context;
}

export default OnboardingContext;
