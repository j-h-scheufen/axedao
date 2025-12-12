'use client';

import { Avatar, Card, CardBody, CardHeader, Checkbox, Chip, Divider, Input, Spinner } from '@heroui/react';
import { useField, useFormikContext } from 'formik';
import { AlertTriangleIcon, Camera } from 'lucide-react';
import { useEffect } from 'react';

import { useApelidoCheck } from '@/hooks/genealogy';
import { getImageUrl } from '@/utils';
import type { User } from '@/types/model';
import type { GenealogyProfileForm } from '@/config/validation-schema';
import GenealogyPreviewCard from './GenealogyPreviewCard';

type ExistingGenealogyData = {
  portrait?: string | null;
  apelido?: string | null;
  apelidoContext?: string | null;
  title?: string | null;
};

type SyncSectionProps = {
  user: User;
  /** Existing genealogy profile data (for edit mode) */
  existingData?: ExistingGenealogyData | null;
  /** Profile ID to exclude from uniqueness check (for edits) */
  excludeProfileId?: string;
};

/**
 * Sync section with mobile-first responsive layout.
 * Mobile: Checklist + Preview card (stacked)
 * Desktop: User Profile | Sync checkboxes | Genealogy Preview (side-by-side)
 *
 * Detects stale data when existing genealogy values don't match current user profile.
 */
const SyncSection = ({ user, existingData, excludeProfileId }: SyncSectionProps) => {
  const { setFieldValue } = useFormikContext<GenealogyProfileForm>();
  const [syncPortraitField] = useField('syncPortrait');
  const [syncApelidoField] = useField('syncApelido');
  const [syncTitleField] = useField('syncTitle');
  const [apelidoContextField] = useField('apelidoContext');

  // Apelido uniqueness check - only when sync is enabled and user has nickname
  const {
    result: apelidoCheckResult,
    isChecking: isCheckingApelido,
    checkApelido,
  } = useApelidoCheck({
    excludeProfileId,
    enabled: syncApelidoField.value && !!user.nickname,
  });

  // Check apelido when sync is enabled or context changes
  useEffect(() => {
    if (syncApelidoField.value && user.nickname) {
      checkApelido(user.nickname, apelidoContextField.value);
    }
  }, [syncApelidoField.value, user.nickname, apelidoContextField.value, checkApelido]);

  // Detect stale data (existing genealogy doesn't match current user profile)
  const isPortraitStale = existingData?.portrait && existingData.portrait !== user.avatar;
  const isApelidoStale = existingData?.apelido && existingData.apelido !== user.nickname;
  const isTitleStale = existingData?.title && existingData.title !== user.title;

  // Compute what will be published based on sync toggles
  const publishedPortrait = syncPortraitField.value ? user.avatar : null;
  const publishedApelido = syncApelidoField.value ? user.nickname : null;
  const publishedTitle = syncTitleField.value ? user.title : null;

  // Update form values when sync toggles change
  useEffect(() => {
    setFieldValue('portrait', publishedPortrait || '');
  }, [publishedPortrait, setFieldValue]);

  useEffect(() => {
    setFieldValue('apelido', publishedApelido || '');
    if (!syncApelidoField.value) {
      setFieldValue('apelidoContext', '');
    }
  }, [publishedApelido, syncApelidoField.value, setFieldValue]);

  useEffect(() => {
    setFieldValue('title', publishedTitle || '');
  }, [publishedTitle, setFieldValue]);

  const handleSyncChange = (field: 'syncPortrait' | 'syncApelido' | 'syncTitle', checked: boolean) => {
    setFieldValue(field, checked);
  };

  // Check if apelido has issues
  const hasApelidoError = apelidoCheckResult && !apelidoCheckResult.isAvailable;
  const needsApelidoContext = apelidoCheckResult?.requiresContext && !apelidoContextField.value?.trim();

  // Render stale warning chip
  const StaleWarning = () => (
    <Chip size="sm" color="warning" variant="flat" startContent={<AlertTriangleIcon className="h-3 w-3" />}>
      Out of sync
    </Chip>
  );

  // User profile preview card (left side on desktop)
  const UserProfileCard = () => (
    <div>
      <div className="text-xs font-medium text-default-500 uppercase tracking-wide mb-2">Your Profile</div>
      <Card className="bg-default-50 dark:bg-default-100/10">
        <CardBody className="flex flex-row gap-3 p-3">
          <Avatar
            radius="full"
            size="lg"
            src={getImageUrl(user.avatar)}
            showFallback
            fallback={<Camera className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-12"
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-0.5">
            {user.title && <div className="text-small capitalize text-default-500">{user.title}</div>}
            <span className="font-semibold leading-tight text-default-700">
              {user.nickname || <span className="text-default-400 italic">No nickname</span>}
            </span>
          </div>
        </CardBody>
      </Card>
    </div>
  );

  // Sync checkboxes (center on desktop, list on mobile)
  const SyncCheckboxes = () => (
    <div className="space-y-3">
      <div className="text-xs font-medium text-default-500 uppercase tracking-wide mb-2 hidden md:block">
        Publish to Genealogy
      </div>

      {/* Portrait sync */}
      <div className="flex items-center justify-between gap-2">
        <div className="flex items-center gap-2">
          <Checkbox
            isSelected={syncPortraitField.value}
            onValueChange={(checked) => handleSyncChange('syncPortrait', checked)}
            size="sm"
            isDisabled={!user.avatar}
          >
            <span className="text-sm">Portrait</span>
          </Checkbox>
          {!user.avatar && <span className="text-xs text-default-400 italic">(not set)</span>}
        </div>
        {isPortraitStale && !syncPortraitField.value && <StaleWarning />}
      </div>

      {/* Apelido sync */}
      <div className="space-y-2">
        <div className="flex items-center justify-between gap-2">
          <div className="flex items-center gap-2 flex-wrap">
            <Checkbox
              isSelected={syncApelidoField.value}
              onValueChange={(checked) => handleSyncChange('syncApelido', checked)}
              size="sm"
              isDisabled={!user.nickname}
            >
              <span className="text-sm">Apelido</span>
            </Checkbox>
            {!user.nickname && <span className="text-xs text-default-400 italic">(not set)</span>}
            {isCheckingApelido && <Spinner size="sm" />}
            {needsApelidoContext && syncApelidoField.value && (
              <Chip size="sm" color="warning" variant="flat">
                Context needed
              </Chip>
            )}
            {hasApelidoError && syncApelidoField.value && (
              <Chip size="sm" color="danger" variant="flat">
                Taken
              </Chip>
            )}
          </div>
          {isApelidoStale && !syncApelidoField.value && <StaleWarning />}
        </div>

        {/* Apelido context input (shown when needed) */}
        {apelidoCheckResult?.requiresContext && syncApelidoField.value && (
          <div className="ml-6">
            <p className="text-xs text-default-500 mb-1">This apelido exists. Add context to distinguish yourself:</p>
            <Input
              size="sm"
              value={apelidoContextField.value || ''}
              onChange={(e) => setFieldValue('apelidoContext', e.target.value)}
              placeholder="e.g., Salvador, Grupo Senzala"
              classNames={{ input: 'text-sm' }}
            />
          </div>
        )}
      </div>

      {/* Title sync */}
      <div className="flex items-center justify-between gap-2">
        <div className="flex items-center gap-2">
          <Checkbox
            isSelected={syncTitleField.value}
            onValueChange={(checked) => handleSyncChange('syncTitle', checked)}
            size="sm"
            isDisabled={!user.title}
          >
            <span className="text-sm">Title</span>
          </Checkbox>
          {!user.title && <span className="text-xs text-default-400 italic">(not set)</span>}
        </div>
        {isTitleStale && !syncTitleField.value && <StaleWarning />}
      </div>
    </div>
  );

  return (
    <Card>
      <CardHeader className="flex gap-3">
        <div className="flex flex-col">
          <p className="text-md font-semibold">Profile Data</p>
          <p className="text-small text-default-500">Select which fields to publish from your profile</p>
        </div>
      </CardHeader>
      <Divider />
      <CardBody>
        {/* Mobile Layout: Stacked */}
        <div className="md:hidden space-y-4">
          <SyncCheckboxes />
          <Divider />
          <GenealogyPreviewCard
            portrait={publishedPortrait}
            apelido={publishedApelido}
            title={publishedTitle}
            label="Preview"
          />
        </div>

        {/* Desktop Layout: Side-by-side */}
        <div className="hidden md:grid md:grid-cols-3 gap-6">
          <UserProfileCard />
          <SyncCheckboxes />
          <GenealogyPreviewCard
            portrait={publishedPortrait}
            apelido={publishedApelido}
            title={publishedTitle}
            label="Genealogy Preview"
          />
        </div>
      </CardBody>
    </Card>
  );
};

export default SyncSection;
