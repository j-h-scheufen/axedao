'use client';

import { Checkbox, Chip, Input, Spinner } from '@heroui/react';
import { AlertTriangleIcon } from 'lucide-react';

interface SyncCheckboxesProps {
  /** Current user data */
  user: {
    avatar?: string | null;
    nickname?: string | null;
    title?: string | null;
  };

  /** Current sync field values */
  syncPortrait: boolean;
  syncApelido: boolean;
  syncTitle: boolean;
  apelidoContext: string;

  /** Apelido check result */
  apelidoCheckResult?: {
    isAvailable: boolean;
    requiresContext?: boolean;
  } | null;
  isCheckingApelido?: boolean;

  /** Stale indicators (for edit mode) */
  isPortraitStale?: boolean;
  isApelidoStale?: boolean;
  isTitleStale?: boolean;

  /** Callbacks */
  onSyncPortraitChange: (checked: boolean) => void;
  onSyncApelidoChange: (checked: boolean) => void;
  onSyncTitleChange: (checked: boolean) => void;
  onApelidoContextChange: (value: string) => void;

  /** Optional title/label for the section */
  title?: string;
  /** Whether to show the title (desktop only by default) */
  showTitle?: boolean;
}

/**
 * Stale warning chip component.
 */
const StaleWarning = () => (
  <Chip size="sm" color="warning" variant="flat" startContent={<AlertTriangleIcon className="h-3 w-3" />}>
    Out of sync
  </Chip>
);

/**
 * Reusable sync checkboxes component for selecting which profile fields to publish.
 * Used in both the genealogy profile page and onboarding wizard.
 */
export function SyncCheckboxes({
  user,
  syncPortrait,
  syncApelido,
  syncTitle,
  apelidoContext,
  apelidoCheckResult,
  isCheckingApelido = false,
  isPortraitStale = false,
  isApelidoStale = false,
  isTitleStale = false,
  onSyncPortraitChange,
  onSyncApelidoChange,
  onSyncTitleChange,
  onApelidoContextChange,
  title = 'Publish to Genealogy',
  showTitle = true,
}: SyncCheckboxesProps) {
  // Check if apelido has issues
  const hasApelidoError = apelidoCheckResult && !apelidoCheckResult.isAvailable;
  const needsApelidoContext = apelidoCheckResult?.requiresContext && !apelidoContext?.trim();

  return (
    <div className="space-y-3">
      {showTitle && (
        <div className="text-xs font-medium text-default-500 uppercase tracking-wide mb-2 hidden md:block">{title}</div>
      )}

      {/* Checkboxes - horizontal layout */}
      <div className="flex flex-wrap items-center gap-x-6 gap-y-2">
        {/* Portrait sync */}
        <div className="flex items-center gap-2">
          <Checkbox isSelected={syncPortrait} onValueChange={onSyncPortraitChange} size="sm" isDisabled={!user.avatar}>
            <span className="text-sm">Portrait</span>
          </Checkbox>
          {!user.avatar && <span className="text-xs text-default-400 italic">(not set)</span>}
          {isPortraitStale && !syncPortrait && <StaleWarning />}
        </div>

        {/* Apelido sync */}
        <div className="flex items-center gap-2 flex-wrap">
          <Checkbox isSelected={syncApelido} onValueChange={onSyncApelidoChange} size="sm" isDisabled={!user.nickname}>
            <span className="text-sm">Apelido</span>
          </Checkbox>
          {!user.nickname && <span className="text-xs text-default-400 italic">(not set)</span>}
          {isCheckingApelido && <Spinner size="sm" />}
          {needsApelidoContext && syncApelido && (
            <Chip size="sm" color="warning" variant="flat">
              Context needed
            </Chip>
          )}
          {hasApelidoError && syncApelido && (
            <Chip size="sm" color="danger" variant="flat">
              Taken
            </Chip>
          )}
          {isApelidoStale && !syncApelido && <StaleWarning />}
        </div>

        {/* Title sync */}
        <div className="flex items-center gap-2">
          <Checkbox isSelected={syncTitle} onValueChange={onSyncTitleChange} size="sm" isDisabled={!user.title}>
            <span className="text-sm">Title</span>
          </Checkbox>
          {!user.title && <span className="text-xs text-default-400 italic">(not set)</span>}
          {isTitleStale && !syncTitle && <StaleWarning />}
        </div>
      </div>

      {/* Apelido context input (shown when needed) */}
      {apelidoCheckResult?.requiresContext && syncApelido && (
        <div>
          <p className="text-xs text-default-500 mb-1">This apelido exists. Add context to distinguish yourself:</p>
          <Input
            size="sm"
            value={apelidoContext || ''}
            onChange={(e) => onApelidoContextChange(e.target.value)}
            placeholder="e.g., Salvador, Grupo Senzala"
            classNames={{ input: 'text-sm' }}
          />
        </div>
      )}
    </div>
  );
}

export default SyncCheckboxes;
