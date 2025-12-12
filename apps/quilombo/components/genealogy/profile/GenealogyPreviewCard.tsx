'use client';

import { Avatar, Card, CardBody } from '@heroui/react';
import { Camera } from 'lucide-react';

import { getImageUrl } from '@/utils';

type GenealogyPreviewCardProps = {
  portrait?: string | null;
  apelido?: string | null;
  title?: string | null;
  /** Label shown above the card */
  label?: string;
  /** Additional className for the card */
  className?: string;
};

/**
 * Preview card showing how a genealogy profile will appear.
 * Displays: Title (top), Apelido (primary), Portrait (avatar)
 */
const GenealogyPreviewCard = ({ portrait, apelido, title, label, className = '' }: GenealogyPreviewCardProps) => {
  return (
    <div className={className}>
      {label && <div className="text-xs font-medium text-default-500 uppercase tracking-wide mb-2">{label}</div>}
      <Card className="bg-default-50 dark:bg-default-100/10">
        <CardBody className="flex flex-row gap-3 p-3">
          <Avatar
            radius="full"
            size="lg"
            src={getImageUrl(portrait)}
            showFallback
            fallback={<Camera className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-12"
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-0.5">
            {title && <div className="text-small capitalize text-default-500">{title}</div>}
            <span className="font-semibold leading-tight text-default-700">
              {apelido || <span className="text-default-400 italic">No apelido</span>}
            </span>
          </div>
        </CardBody>
      </Card>
    </div>
  );
};

export default GenealogyPreviewCard;
