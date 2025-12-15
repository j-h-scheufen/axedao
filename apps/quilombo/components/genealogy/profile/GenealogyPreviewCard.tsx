'use client';

import { Avatar, Card, CardBody, Chip } from '@heroui/react';
import { AlertTriangleIcon, Camera } from 'lucide-react';

import { getImageUrl } from '@/utils';

type GenealogyPreviewCardProps = {
  portrait?: string | null;
  apelido?: string | null;
  title?: string | null;
  /** Label shown above the card */
  label?: string;
  /** Additional className for the card */
  className?: string;
  /** Indicates portrait is out of sync (showing stale genealogy value) */
  isPortraitStale?: boolean;
  /** Indicates apelido is out of sync (showing stale genealogy value) */
  isApelidoStale?: boolean;
  /** Indicates title is out of sync (showing stale genealogy value) */
  isTitleStale?: boolean;
};

/**
 * Preview card showing how a genealogy profile will appear.
 * Displays: Title (top), Apelido (primary), Portrait (avatar)
 * When stale flags are set, shows visual indicators that the value is from genealogy (not synced).
 */
const GenealogyPreviewCard = ({
  portrait,
  apelido,
  title,
  label,
  className = '',
  isPortraitStale,
  isApelidoStale,
  isTitleStale,
}: GenealogyPreviewCardProps) => {
  const hasAnyStale = isPortraitStale || isApelidoStale || isTitleStale;

  return (
    <div className={className}>
      {label && (
        <div className="flex items-center gap-2 mb-2">
          <div className="text-xs font-medium text-default-500 uppercase tracking-wide">{label}</div>
          {hasAnyStale && (
            <Chip size="sm" color="warning" variant="flat" startContent={<AlertTriangleIcon className="h-3 w-3" />}>
              Out of sync
            </Chip>
          )}
        </div>
      )}
      <Card className="bg-default-50 dark:bg-default-100/10">
        <CardBody className="flex flex-row gap-3 p-3">
          <div className="relative">
            <Avatar
              radius="full"
              size="lg"
              src={getImageUrl(portrait)}
              showFallback
              fallback={<Camera className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
              className={`min-w-12 ${isPortraitStale ? 'opacity-60 ring-2 ring-warning ring-offset-2' : ''}`}
            />
          </div>
          <div className="flex-1 flex flex-col items-start justify-center gap-0.5">
            {title && (
              <div
                className={`text-small capitalize ${isTitleStale ? 'text-warning-600 dark:text-warning-400' : 'text-default-500'}`}
              >
                {title}
                {isTitleStale && <span className="text-xs ml-1">(stale)</span>}
              </div>
            )}
            <span
              className={`font-semibold leading-tight ${isApelidoStale ? 'text-warning-600 dark:text-warning-400' : 'text-default-700'}`}
            >
              {apelido || <span className="text-default-400 italic">No apelido</span>}
              {isApelidoStale && apelido && <span className="text-xs font-normal ml-1">(stale)</span>}
            </span>
          </div>
        </CardBody>
      </Card>
    </div>
  );
};

export default GenealogyPreviewCard;
